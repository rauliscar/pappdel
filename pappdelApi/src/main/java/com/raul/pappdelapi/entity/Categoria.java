package com.raul.pappdelapi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

import java.util.List;

@Data //Genera los getter y setter sin ocupar código
@AllArgsConstructor //Genera un constructor con todos los parámetros sin ocupar código
@NoArgsConstructor //Genera un constructor sin parámetros sin ocupar código
@Entity
@Table(name = "Categoria")
public class Categoria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_categoria")
    private Integer id_categoria;

    //@OneToMany(mappedBy = "categoria")
    //private List<Grupo> grupos;
}

