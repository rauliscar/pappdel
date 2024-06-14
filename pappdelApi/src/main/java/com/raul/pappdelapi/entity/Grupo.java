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
public class Grupo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_grupo;

    private String nombre_grupo;

    private Integer id_categoria;
    /*
    @ManyToOne
    @JoinColumn(name = "id_categoria")
    private Categoria categoria;


    @OneToMany(mappedBy = "grupo")
    private List<Equipo> equipos;

    @OneToMany(mappedBy = "grupo")
    private List<Enfrentamiento> enfrentamientos;

    @OneToMany(mappedBy = "grupo")
    private List<Clasificacion> clasificaciones;

     */
}
