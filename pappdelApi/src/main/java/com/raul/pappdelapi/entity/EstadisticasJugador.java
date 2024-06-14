package com.raul.pappdelapi.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //Genera los getter y setter sin ocupar código
@AllArgsConstructor //Genera un constructor con todos los parámetros sin ocupar código
@NoArgsConstructor //Genera un constructor sin parámetros sin ocupar código
@Entity
@Table(name = "estadisticas_jugador")
public class EstadisticasJugador {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_estadistica;

    @OneToOne
    @JoinColumn(name = "id_usuario")
    private Usuario usuario;

    private Integer partidos_jugados;
    private Integer partidos_ganados;
    private Integer partidos_perdidos;
    private Integer sets_ganados;
    private Integer sets_perdidos;
    private Integer juegos_ganados;
    private Integer juegos_perdidos;
    private Integer partidos_ganados_2_set;
    private Integer partidos_ganados_3_set;
    private Integer partidos_perdidos_2_set;
    private Integer partidos_perdidos_3_set;
}

