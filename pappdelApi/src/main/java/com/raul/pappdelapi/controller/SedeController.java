package com.raul.pappdelapi.controller;

import com.raul.pappdelapi.entity.Sede;
import com.raul.pappdelapi.service.SedeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pappdel/sede")
public class SedeController {

    private final SedeService sedeService;

    @Autowired
    public SedeController(SedeService sedeService) {
        this.sedeService = sedeService;
    }

    @GetMapping("")
    public List<Sede> findAll() {
        return sedeService.findAll();
    }

    @GetMapping("/{sedeId}")
    public Sede getSedeById(@PathVariable int sedeId) {
        Sede sede = sedeService.findById(sedeId);

        if (sede == null) {
            throw new RuntimeException("Sede id not found - " + sedeId);
        }

        return sede;
    }

    @PostMapping("")
    public Sede addSede(@RequestBody Sede sede) {
        sede.setId_sede(0);
        sedeService.save(sede);
        return sede;
    }

    @PutMapping("")
    public Sede updateSede(@RequestBody Sede sede) {
        sedeService.save(sede);
        return sede;
    }

    @DeleteMapping("/{sedeId}")
    public String deleteSede(@PathVariable int sedeId) {
        Sede sede = sedeService.findById(sedeId);
        if (sede == null) {
            throw new RuntimeException("Sede id not found - " + sedeId);
        }
        sedeService.deleteById(sedeId);
        return "Deleted sede id - " + sedeId;
    }
}
