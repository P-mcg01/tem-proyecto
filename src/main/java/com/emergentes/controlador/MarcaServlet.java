package com.emergentes.controlador;

import com.emergentes.modelo.Producto_InnerJoin;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.emergentes.utiles.conexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "MarcaServlet", urlPatterns = {"/MarcaServlet"})
public class MarcaServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String marca = request.getParameter("marca");
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
      System.out.println("error MarcaServlet: " + e.getMessage());
    }

    switch (marca) {
      case "Adidas":
        ArrayList<Producto_InnerJoin> productosAdidas
                = lista.stream().filter(producto -> {
                  return producto.getMarca().equals("Adidas");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", productosAdidas);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
        break;
      case "Nike":
        ArrayList<Producto_InnerJoin> productosNike
                = lista.stream().filter(producto -> {
                  return producto.getMarca().equals("Nike");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", productosNike);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

        break;
      case "Asics":
        ArrayList<Producto_InnerJoin> productosAsics
                = lista.stream().filter(producto -> {
                  return producto.getMarca().equals("Asics");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", productosAsics);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
        break;
      case "Columbia":
        ArrayList<Producto_InnerJoin> productosColumbia
                = lista.stream().filter(producto -> {
                  return producto.getMarca().equals("Columbia");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", productosColumbia);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

        break;
      case "Converse":
        ArrayList<Producto_InnerJoin> productosConverse
                = lista.stream().filter(producto -> {
                  return producto.getMarca().equals("Converse");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", productosConverse);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

        break;
      case "Puma":
        ArrayList<Producto_InnerJoin> productosPuma
                = lista.stream().filter(producto -> {
                  return producto.getMarca().equals("Puma");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", productosPuma);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

        break;
      case "Reebook":

        break;
      case "Under_armor":
        ArrayList<Producto_InnerJoin> productosReebook
                = lista.stream().filter(producto -> {
                  return producto.getMarca().equals("Under armor");
                }).collect(
                        Collectors.toCollection(ArrayList::new)
                );

        request.setAttribute("productos", productosReebook);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

        break;
    }
  }
}
