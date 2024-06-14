package com.raul.pappdelapi.controller;

import com.raul.pappdelapi.entity.Clasificacion;
import com.raul.pappdelapi.service.ClasificacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pappdel/clasificacion")
public class ClasificacionController {

    private final ClasificacionService clasificacionService;

    @Autowired
    public ClasificacionController(ClasificacionService clasificacionService) {
        this.clasificacionService = clasificacionService;
    }

    @GetMapping("")
    public List<Clasificacion> findAll() {
        return clasificacionService.findAll();
    }

    @GetMapping("/{clasificacionId}")
    public Clasificacion getClasificacionById(@PathVariable int clasificacionId) {
        Clasificacion clasificacion = clasificacionService.findById(clasificacionId);

        if (clasificacion == null) {
            throw new RuntimeException("Clasificacion id not found - " + clasificacionId);
        }

        return clasificacion;
    }

    @PostMapping("")
    public Clasificacion addClasificacion(@RequestBody Clasificacion clasificacion) {
        clasificacion.setId_clasificacion(0);
        clasificacionService.save(clasificacion);
        return clasificacion;
    }

    @PutMapping("")
    public Clasificacion updateClasificacion(@RequestBody Clasificacion clasificacion) {
        clasificacionService.save(clasificacion);
        return clasificacion;
    }

    @DeleteMapping("/{clasificacionId}")
    public String deleteClasificacion(@PathVariable int clasificacionId) {
        Clasificacion clasificacion = clasificacionService.findById(clasificacionId);
        if (clasificacion == null) {
            throw new RuntimeException("Clasificacion id not found - " + clasificacionId);
        }
        clasificacionService.deleteById(clasificacionId);
        return "Deleted clasificacion id - " + clasificacionId;
    }
}
