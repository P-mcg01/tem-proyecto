package com.emergentes.controlador;

import com.emergentes.modelo.Producto_InnerJoin;
import com.emergentes.utiles.conexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CategoriaServlet", urlPatterns = {"/CategoriaServlet"})
public class CategoriaServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String categoria = request.getParameter("cat");
    conexionBD bd = new conexionBD();
    List<Producto_InnerJoin> lista = null;    
    
    try {
      Connection con = bd.conectar();
      String sql = "SELECT p.producto_id, p.nombre_prod, p.precio, s.cantidad, c.categoria, m.marca"
              + " FROM producto AS p"
              + " INNER JOIN stock AS s ON p.stock_id = s.stock_id"
              + " INNER JOIN categoria AS c ON p.categoria_id = c.categoria_id"
              + " INNER JOIN marca AS m ON p.marca_id = m.marca_id;";
      PreparedStatement ps = con.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();

      lista = new ArrayList<Producto_InnerJoin>();

      while (rs.next()) {
        Producto_InnerJoin prod = new Producto_InnerJoin();
        prod.setProducto_id(rs.getInt("producto_id"));
        prod.setNombre_prod(rs.getString("nombre_prod"));
        prod.setPrecio(rs.getInt("precio"));
        prod.setStock(rs.getInt("cantidad"));
        prod.setCategoria(rs.getString("categoria"));
        prod.setMarca(rs.getString("marca"));

        lista.add(prod);
      }
      rs.close();
      ps.close();
    } catch (Exception e) {
      System.out.println("error CategoriaServlet: " + e.getMessage());
    }
    
    switch (categoria) {
      case "sombreros":
        ArrayList<Producto_InnerJoin> sombreros
                = lista.stream().filter(producto -> {
                  return producto.getCategoria().equals("Sombreros");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", sombreros);
        request.setAttribute("servlet", "categorias");
        request.setAttribute("site", categoria);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
        break;
      case "chaquetas":
        ArrayList<Producto_InnerJoin> chaquetas
                = lista.stream().filter(producto -> {
                  return producto.getCategoria().equals("Chaquetas");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", chaquetas);
        request.setAttribute("servlet", "categorias");
        request.setAttribute("site", categoria);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

        break;
      case "camisetas":
        ArrayList<Producto_InnerJoin> camisetas
                = lista.stream().filter(producto -> {
                  return producto.getCategoria().equals("Camisetas");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", camisetas);
        request.setAttribute("servlet", "categorias");
        request.setAttribute("site", categoria);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
        break;
      case "pantalones":
        ArrayList<Producto_InnerJoin> pantalones
                = lista.stream().filter(producto -> {
                  return producto.getCategoria().equals("Pantalones");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", pantalones);
        request.setAttribute("servlet", "categorias");
        request.setAttribute("site", categoria);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

        break;
      case "vestidos":
        ArrayList<Producto_InnerJoin> Vestidos
                = lista.stream().filter(producto -> {
                  return producto.getCategoria().equals("Vestidos");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", Vestidos);
        request.setAttribute("servlet", "categorias");
        request.setAttribute("site", categoria);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

        break;
      case "zapatos":
        ArrayList<Producto_InnerJoin> zapatos
                = lista.stream().filter(producto -> {
                  return producto.getCategoria().equals("Zapatos");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", zapatos);
        request.setAttribute("servlet", "categorias");
        request.setAttribute("site", categoria);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

        break;
    }
  }
}
