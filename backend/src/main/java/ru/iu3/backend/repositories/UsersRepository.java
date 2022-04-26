package ru.iu3.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.iu3.backend.models.Users;

import java.util.Optional;

public interface UsersRepository extends JpaRepository<Users, Long> {

    // Методы можно плодить таким образом: нет никакой реализации, но при этом на уровне определения JAVA понимает
    // что нужно обращаться к конкретному полю
    Optional<Users> findByToken(String token);
    Optional<Users> findByLogin(String login);
}