package com.example.LaEsperanza.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;

import com.example.LaEsperanza.models.Usuariomodels;

public interface UsuarioRepository extends CrudRepository<Usuariomodels, Long> {
    public abstract ArrayList<Usuariomodels> findByPrioridad(Integer prioridad);

    public abstract ArrayList<Usuariomodels> findBytelefono(String telefono);

    public abstract ArrayList<Usuariomodels> findByemail(String email);

    public abstract ArrayList<Usuariomodels> findBynombre(String nombre);
    
}
