package com.raul.pappdelapi.controller;

import com.raul.pappdelapi.entity.Grupo;
import com.raul.pappdelapi.service.GrupoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pappdel/grupo")
public class GrupoController {

    private final GrupoService grupoService;

    @Autowired
    public GrupoController(GrupoService grupoService) {
        this.grupoService = grupoService;
    }

    @GetMapping("")
    public List<Grupo> findAll() {
        return grupoService.findAll();
    }

    @GetMapping("/{grupoId}")
    public Grupo getGrupoById(@PathVariable int grupoId) {
        Grupo grupo = grupoService.findById(grupoId);

        if (grupo == null) {
            throw new RuntimeException("Grupo id not found - " + grupoId);
        }

        return grupo;
    }

    @PostMapping("")
    public Grupo addGrupo(@RequestBody Grupo grupo) {
        grupo.setId_grupo(0);
        grupoService.save(grupo);
        return grupo;
    }

    @PutMapping("")
    public Grupo updateGrupo(@RequestBody Grupo grupo) {
        grupoService.save(grupo);
        return grupo;
    }

    @DeleteMapping("/{grupoId}")
    public String deleteGrupo(@PathVariable int grupoId) {
        Grupo grupo = grupoService.findById(grupoId);
        if (grupo == null) {
            throw new RuntimeException("Grupo id not found - " + grupoId);
        }
        grupoService.deleteById(grupoId);
        return "Deleted grupo id - " + grupoId;
    }
}
