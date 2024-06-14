package com.raul.pappdelapi.service;

import com.raul.pappdelapi.dao.SedeDAO;
import com.raul.pappdelapi.entity.Sede;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SedeServiceImpl implements SedeService {

    private final SedeDAO sedeDAO;

    @Autowired
    public SedeServiceImpl(SedeDAO sedeDAO) {
        this.sedeDAO = sedeDAO;
    }

    @Override
    public List<Sede> findAll() {
        return sedeDAO.findAll();
    }

    @Override
    public Sede findById(int id) {
        return sedeDAO.findById(id);
    }

    @Override
    public void save(Sede sede) {
        sedeDAO.save(sede);
    }

    @Override
    public void deleteById(int id) {
        sedeDAO.deleteById(id);
    }
}
