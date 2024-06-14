package com.raul.pappdelapi.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //Genera los getter y setter sin ocupar código
@AllArgsConstructor //Genera un constructor con todos los parámetros sin ocupar código
@NoArgsConstructor //Genera un constructor sin parámetros sin ocupar código
@Entity
public class Partido {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_partido;
    private Integer nivel_partido;
    private Integer sets_local;
    private Integer sets_visitante;
    private Integer juegos_set1_local;
    private Integer juegos_set1_visitante;
    private Integer juegos_set2_local;
    private Integer juegos_set2_visitante;
    private Integer juegos_set3_local;
    private Integer juegos_set3_visitante;

    private Integer id_enfrentamiento;
    private Integer id_jugador_local1;
    private Integer id_jugador_local2;
    private Integer id_jugador_visitante1;
    private Integer id_jugador_visitante2;

    /*
    @ManyToOne
    @JoinColumn(name = "id_enfrentamiento")
    private Enfrentamiento enfrentamiento;

    @ManyToOne
    @JoinColumn(name = "id_jugador_local1")
    private Usuario jugador_local1;

    @ManyToOne
    @JoinColumn(name = "id_jugador_local2")
    private Usuario jugador_local2;

    @ManyToOne
    @JoinColumn(name = "id_jugador_visitante1")
    private Usuario jugador_visitante1;

    @ManyToOne
    @JoinColumn(name = "id_jugador_visitante2")
    private Usuario jugador_visitante2;

     */


}

