package com.emergentes.DAO;

import com.emergentes.modelo.Producto;
import java.util.List;

public interface ProductoDAO {

    public void insert(Producto producto)throws Exception;
    public void update(Producto producto)throws Exception;
    public void delete(int producto_id)throws Exception;
    public List<Producto> getAll() throws Exception;
    public Producto getByCi(int ci)throws Exception;
}