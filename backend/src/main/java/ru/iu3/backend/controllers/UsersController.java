package ru.iu3.backend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.codec.Hex;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import ru.iu3.backend.models.Museum;
import ru.iu3.backend.models.Users;
import ru.iu3.backend.repositories.MuseumRepository;
import ru.iu3.backend.repositories.UsersRepository;
import ru.iu3.backend.tools.DataValidationException;
import ru.iu3.backend.tools.Utils;

import java.util.*;

/**
 * Класс - контроллер пользователя
 * @author artem
 */
@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("api/v1")
public class UsersController {
    // По аналогии здесь используется два репозитория
    @Autowired
    UsersRepository usersRepository;

    @Autowired
    MuseumRepository museumRepository;

    /**
     * Метод, который возвращает список юзеров (не артистов), которые есть в данной БД
     * @return - список пользователей в виде JSON
     */
    @GetMapping("/users")
    public Page<Users> getAllUsers(@RequestParam("page") int page, @RequestParam("limit") int limit) {
        return usersRepository.findAll(PageRequest.of(page, limit, Sort.by(Sort.Direction.ASC, "login")));
    }

    @GetMapping("/users/{id}")
    public ResponseEntity<Users> getUser(@PathVariable(value = "id") Long userID)
            throws DataValidationException {
        Users user = usersRepository.findById(userID).
                orElseThrow(() -> new DataValidationException("User not founding"));

        return ResponseEntity.ok(user);
    }

    /**
     * Добавляем пользователя
     * @param users - JSON, который приходит из postman
     * @return - заголовок (JSON): 200, если ОК, в противном случае, будет ошибка с каким-либо описанием
     * @throws Exception - обязательное требование
     */
    @PostMapping("/users")
    public ResponseEntity<Object> createUsers(@RequestBody Users users) throws DataValidationException {
        try {
            Users nc = usersRepository.save(users);
            return new ResponseEntity<Object>(nc, HttpStatus.OK);
        } catch (Exception exception) {
            // Указываем тип ошибки
            String error;
            if (exception.getMessage().contains("ConstraintViolationException")) {
                throw new DataValidationException("Этот пользователь есть в БД");
            } else {
                throw new DataValidationException("Неизвестная ошибка");
            }
        }
    }

    /**
     * NEW!!! Добавляем музеи для конкретного пользователя. Но добавление осуществляется из-под пользователя
     * @param userID - ID пользователя, к которому необходимо обратиться
     * @param museums - список музеев для данного пользователя
     * @return - Поле cnt возвратит просто, где будет отображено 0, если не добавлено, 1 если добавлено
     */
    @PostMapping("/users/{id}/addmuseums")
    public ResponseEntity<Object> addMuseums(@PathVariable(value = "id") Long userID,
                                             @Validated @RequestBody Set<Museum> museums) {
        // Извлекаем пользователя по конкретному ID-шнику
        Optional<Users> uu = usersRepository.findById(userID);
        int cnt = 0;

        if (uu.isPresent()) {
            Users u = uu.get();

            // Если музеев несколько (а такое может быть вполне, то тогда добавляем их поочерёдно)
            for(Museum m: museums) {
                // Если есть музей, то мы, конечно, добавим его. Защита от дурака
                Optional<Museum> mm = museumRepository.findById(m.id);
                if (mm.isPresent()) {
                    u.addMuseum(mm.get());
                    ++cnt;
                }
            }

            // Сохраняем
            usersRepository.save(u);
        }

        // Формируем
        Map<String, String> response = new HashMap<>();
        response.put("added", String.valueOf(cnt));

        return ResponseEntity.ok(response);
    }

    /**
     * NEW!!! Метод, который удаляет музей из-под класса пользователя
     * @param userId - ID по которому собственно должен быть найден
     * @param museums - Список удаляемых музеев
     * @return - ответ, который содержит количество удалённых музеев
     */
    @PostMapping("/users/{id}/removemuseums")
    public ResponseEntity<Object> removeMuseums(@PathVariable(value = "id") Long userId,
                                                @Validated @RequestBody Set<Museum> museums) {
        Optional<Users> uu = usersRepository.findById(userId);
        int cnt = 0;

        if (uu.isPresent()) {
            Users u = uu.get();
            for (Museum m: museums) {
                u.removeMuseum(m);
                ++cnt;
            }

            usersRepository.save(u);
        }

        // Формируем ответ
        Map<String, String> response = new HashMap<>();
        response.put("count", String.valueOf(cnt));

        return ResponseEntity.ok(response);
    }

    /**
     * Обновляем пользователя
     * @param userId - ID пользователя
     * @param userDetails - подробные сведения по пользователю
     * @return - хедер, где будет содержаться ответ по данному пользователю
     */
    @PutMapping("/users/{id}")
    public ResponseEntity<Users> updateUsers(@PathVariable(value = "id") Long userId,
                                             @RequestBody Users userDetails) throws DataValidationException {
        try {
            Users user = usersRepository.findById(userId)
                    .orElseThrow(() -> new DataValidationException("Пользователь с таким индексом не найден"));

            // Заполняем пользовательские данные
            user.login = userDetails.login;
            user.email = userDetails.email;

            String np = userDetails.np;
            System.out.println("Новый пароль (если вдруг забудешь): " + np);
            if (np != null && !np.isEmpty()) {
                byte[] b = new byte[32];
                new Random().nextBytes(b);
                String salt = new String(Hex.encode(b));
                user.password = Utils.ComputeHash(np, salt);
                user.salt = salt;
            }

            usersRepository.save(user);
            return ResponseEntity.ok(user);
        } catch (Exception exception) {
            if (exception.getMessage().contains("ConstraintViolationException")) {
                throw new DataValidationException("Этот пользователь уже есть в базе");
                //throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Эта страна уже есть в базе");
            } else {
                //throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Неизвестная ошибка");
                throw new DataValidationException("Неизвестная ошибка");
            }
        }
    }

    @PostMapping("/deleteusers")
    public ResponseEntity deleteUsers(@Validated @RequestBody List<Users> users) {
        usersRepository.deleteAll(users);
        return new ResponseEntity(HttpStatus.OK);
    }

    /**
     * Удаляем пользователя
     * @param userId - ID пользователя
     * @return - удалено/не удалено
     */
    @DeleteMapping("/users/{id}")
    public ResponseEntity<Object> deleteUsers(@PathVariable(value = "id") Long userId) {
        Optional<Users> users = usersRepository.findById(userId);
        Map<String, Boolean> resp = new HashMap<>();

        // Возвратит true, если объект существует (не пустой)
        if (users.isPresent()) {
            usersRepository.delete(users.get());
            resp.put("deleted", Boolean.TRUE);
        } else {
            resp.put("deleted", Boolean.FALSE);
        }

        return ResponseEntity.ok(resp);
    }
}