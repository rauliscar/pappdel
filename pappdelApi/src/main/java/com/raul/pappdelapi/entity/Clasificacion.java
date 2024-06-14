package com.raul.pappdelapi.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //Genera los getter y setter sin ocupar código
@AllArgsConstructor //Genera un constructor con todos los parámetros sin ocupar código
@NoArgsConstructor //Genera un constructor sin parámetros sin ocupar código
@Entity
public class Clasificacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_clasificacion;
    private Integer puntos;
    private Integer partidos_jugados;
    private Integer partidos_ganados;
    private Integer partidos_perdidos;
    private Integer sets_ganados;
    private Integer sets_perdidos;
    private Integer juegos_ganados;
    private Integer juegos_perdidos;
    private Integer id_equipo;
    private Integer id_grupo;

    /*
    @ManyToOne
    @JoinColumn(name = "id_grupo")
    private Grupo grupo;

    @ManyToOne
    @JoinColumn(name = "id_equipo")
    private Equipo equipo;
     */

}

