package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Sede;
import java.util.List;

public interface SedeDAO {
    List<Sede> findAll();
    Sede findById(int id);
    void save(Sede sede);
    void deleteById(int id);
}
