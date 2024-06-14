package com.raul.pappdelapi.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data //Genera los getter y setter sin ocupar código
@AllArgsConstructor //Genera un constructor con todos los parámetros sin ocupar código
@NoArgsConstructor //Genera un constructor sin parámetros sin ocupar código
@Entity
public class Enfrentamiento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_enfrentamiento;



    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    private Integer id_equipo_local;
    private Integer id_equipo_visitante;
    private Boolean jugado;
    private Boolean aplazado;
    private Boolean confirmado_local;
    private Boolean confirmado_visitante;
    private Integer id_grupo;
    private Integer partidos_ganados_local;
    private Integer partidos_ganados_visitante;


    @OneToMany(mappedBy = "id_enfrentamiento")
    private List<Partido> partidos;

    /*
    @ManyToOne
    @JoinColumn(name = "id_grupo")
    private Grupo grupo;

    @ManyToOne
    @JoinColumn(name = "id_equipo_local")
    private Equipo equipo_local;

    @ManyToOne
    @JoinColumn(name = "id_equipo_visitante")
    private Equipo equipo_visitante;

     */
}

