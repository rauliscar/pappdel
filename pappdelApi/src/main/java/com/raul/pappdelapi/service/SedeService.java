package com.raul.pappdelapi.service;

import com.raul.pappdelapi.entity.Sede;
import java.util.List;

public interface SedeService {
    List<Sede> findAll();
    Sede findById(int id);
    void save(Sede sede);
    void deleteById(int id);
}
