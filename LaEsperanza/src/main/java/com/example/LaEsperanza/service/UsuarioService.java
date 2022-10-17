package com.example.LaEsperanza.service;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.LaEsperanza.models.Usuariomodels;
import com.example.LaEsperanza.repositories.UsuarioRepository;

@Service

public class UsuarioService {
    @Autowired
    UsuarioRepository usuarioRepository;

    public UsuarioModels guardarUsuario(Usuariomodels usuario) {
        return usuarioRepository.save(usuario);
    }

    // buscar dato por id
    public Optional<Usuariomodels> obtenerusuarioId(Long Id) {
        return usuarioRepository.findById(Id);

    }

    // buscar datos por prioridad
    public ArrayList<Usuariomodels> obtenerusuarioprioridad(Integer prioridad) {
        return usuarioRepository.findByPrioridad(prioridad);

    }

    // buscar datos por telefono
    public ArrayList<Usuariomodels> obtenerusuariotelefono(String telefono) {
        return usuarioRepository.findBytelefono(telefono);

    }

    // buscar datos por email
    public ArrayList<Usuariomodels> obtenerusuarioemail(String email) {
        return usuarioRepository.findByemail(email);
    }

    // buscar datos por nombre
    public ArrayList<Usuariomodels> obtenerusuarionombre(String nombre) {
        return usuarioRepository.findBynombre(nombre);
    }

    // listar usuarios
    public ArrayList<Usuariomodels> obtenerusuarios() {
        return (ArrayList<Usuariomodels>) usuarioRepository.findAll();
    }

    // eliminar persona
    public boolean Eliminar(Long id) {
        try {
            usuarioRepository.deleteById(id);
            return true;
        } catch (Exception er) {
            return false;
        }

    }
}
