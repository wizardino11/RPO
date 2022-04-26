package ru.iu3.backend.controllers;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import ru.iu3.backend.tools.Utils;
import ru.iu3.backend.models.Users;
import ru.iu3.backend.repositories.UsersRepository;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/auth")
public class LoginController {
    @Autowired
    private UsersRepository usersRepository;

    @PostMapping("/login")
    public ResponseEntity<Object> login(@Validated @RequestBody Map<String, String> credentials) {
        String login = credentials.get("login");
        String pwd = credentials.get("password");
        if (!pwd.isEmpty() && !login.isEmpty()) {
            Optional<Users> uu = usersRepository.findByLogin(login);
            if (uu.isPresent()) {
                Users u2 = uu.get();
                String hash1 = u2.password;
                String salt = u2.salt;
                String hash2 = Utils.ComputeHash(pwd, salt);
                if (hash1.equals(hash2)) {
                    u2.token = UUID.randomUUID().toString();
                    u2.activity = LocalDateTime.now();
                    Users u3 = usersRepository.saveAndFlush(u2);
                    return new ResponseEntity<Object>(u3, HttpStatus.OK);
                }
            }
        }
        return new ResponseEntity<Object>(HttpStatus.UNAUTHORIZED);
    }

    @GetMapping("/logout")
    public ResponseEntity logout(@RequestHeader ("Authorization") String token) {
        if (token != null && !token.isEmpty()) {
            token = StringUtils.removeStart(token, "Bearer").trim();
            Optional<Users> uu = usersRepository.findByToken(token);
            if (uu.isPresent()) {
                Users u = uu.get();
                u.token = null;
                usersRepository.save(u);
            }
        }
        return new ResponseEntity(HttpStatus.OK);
    }
}