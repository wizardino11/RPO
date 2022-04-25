package ru.iu3.backend.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "paintings")
@Access(AccessType.FIELD)
public class Painting {
    // Поле ID - является первичным ключом
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    // Поле - имя
    @Column(name = "name")
    public String name;

    // Устанавливаем обратную связь: один ко многим от таблицы картин к таблице артистов. Обратная связь есть у артистов
    @ManyToOne
    @JoinColumn(name = "artistid")
    public Artists artistid;

    // Здесь тоже нужно сделать связь: один ко многим от таблицы картин к таблице музея
    @ManyToOne
    @JoinColumn(name = "museumid")
    public Museum museumid;

    // Это поле - возраст картины
    @Column(name = "year")
    public Long year;
}