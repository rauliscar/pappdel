package com.raul.pappdelapi.controller;

import com.raul.pappdelapi.entity.Usuario;
import com.raul.pappdelapi.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pappdel/usuario")
public class UsuarioController {

    private final UsuarioService usuarioService;

    @Autowired
    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @GetMapping("")
    public List<Usuario> findAll() {
        return usuarioService.findAll();
    }

    @GetMapping("/{usuarioId}")
    public Usuario getUsuarioById(@PathVariable int usuarioId) {
        Usuario usuario = usuarioService.findById(usuarioId);

        if (usuario == null) {
            throw new RuntimeException("Usuario id not found - " + usuarioId);
        }

        return usuario;
    }

    @PostMapping("")
    public Usuario addUsuario(@RequestBody Usuario usuario) {
        usuario.setId_usuario(0);
        usuarioService.save(usuario);
        return usuario;
    }

    @PutMapping("")
    public Usuario updateUsuario(@RequestBody Usuario usuario) {
        usuarioService.save(usuario);
        return usuario;
    }

    @DeleteMapping("/{usuarioId}")
    public String deleteUsuario(@PathVariable int usuarioId) {
        Usuario usuario = usuarioService.findById(usuarioId);
        if (usuario == null) {
            throw new RuntimeException("Usuario id not found - " + usuarioId);
        }
        usuarioService.deleteById(usuarioId);
        return "Deleted usuario id - " + usuarioId;
    }
}
