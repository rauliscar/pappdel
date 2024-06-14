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
public class Sede {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_sede;

    private String nombre_sede;
    private String localidad;
    private String provincia;
    private String calle;
    private Integer numero;
    private Integer codigo_postal;

    /*@OneToMany(mappedBy = "sede")
    private List<Equipo> equipos;*/
}

