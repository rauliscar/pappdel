package com.raul.pappdelapi.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data //Genera los getter y setter sin ocupar código
@AllArgsConstructor //Genera un constructor con todos los parámetros sin ocupar código
@NoArgsConstructor //Genera un constructor sin parámetros sin ocupar código
@Entity
public class Equipo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_equipo;

    private String nombre_equipo;
    @Lob
    private String logo;
    private Integer id_sede;
    private int id_grupo;
    private int id_capitan;

    /*

    @ManyToOne
    @JoinColumn(name = "id_sede")
    private Sede sede;

    @ManyToOne
    @JoinColumn(name = "id_grupo")
    private Grupo grupo;


    @ManyToOne
    @JoinColumn(name = "id_capitan")
    private Usuario capitan;


    @OneToMany(mappedBy = "equipo")
    private List<Usuario> usuarios;

    */
}

