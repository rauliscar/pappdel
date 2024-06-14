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
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_usuario;

    private String nombre_usuario;
    private String password;
    private String nombre;
    private String apellidos;
    private String email;
    private String genero;
    private Integer telefono;
    private String dni;
    @Temporal(TemporalType.DATE)
    private Date fecha_nacimiento;
    @Lob
    private String foto_perfil;
    private Integer id_equipo;

    /*
    @ManyToOne
    @JoinColumn(name = "id_equipo")
    private Equipo equipo;

    @OneToMany(mappedBy = "jugador_local1")
    private List<Partido> partidos_local1;

    @OneToMany(mappedBy = "jugador_local2")
    private List<Partido> partidos_local2;

    @OneToMany(mappedBy = "jugador_visitante1")
    private List<Partido> partidos_visitante1;

    @OneToMany(mappedBy = "jugador_visitante2")
    private List<Partido> partidos_visitante2;

    @OneToOne(mappedBy = "usuario")
    private EstadisticasJugador estadisticasJugador;

     */
}
