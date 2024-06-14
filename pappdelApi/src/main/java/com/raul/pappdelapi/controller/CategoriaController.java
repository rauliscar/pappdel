package com.raul.pappdelapi.controller;

import com.raul.pappdelapi.entity.Categoria;
import com.raul.pappdelapi.service.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pappdel/categoria")
public class CategoriaController {

    private final CategoriaService categoriaService;

    @Autowired
    public CategoriaController(CategoriaService categoriaService) {
        this.categoriaService = categoriaService;
    }

    @GetMapping("")
    public List<Categoria> findAll() {
        return categoriaService.findAll();
    }

    @GetMapping("/{categoriaId}")
    public Categoria getCategoriaById(@PathVariable int categoriaId) {
        Categoria categoria = categoriaService.findById(categoriaId);

        if (categoria == null) {
            throw new RuntimeException("Categoria id not found - " + categoriaId);
        }

        return categoria;
    }

    @PostMapping("")
    public Categoria addCategoria(@RequestBody Categoria categoria) {
        categoria.setId_categoria(0);
        categoriaService.save(categoria);
        return categoria;
    }

    @PutMapping("")
    public Categoria updateCategoria(@RequestBody Categoria categoria) {
        categoriaService.save(categoria);
        return categoria;
    }

    @DeleteMapping("/{categoriaId}")
    public String deleteCategoria(@PathVariable int categoriaId) {
        Categoria categoria = categoriaService.findById(categoriaId);
        if (categoria == null) {
            throw new RuntimeException("Categoria id not found - " + categoriaId);
        }
        categoriaService.deleteById(categoriaId);
        return "Deleted categoria id - " + categoriaId;
    }
}
