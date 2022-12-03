package com.emergentes.controlador;

import com.emergentes.DAO.ProductoDAOimple;
import com.emergentes.modelo.Producto_InnerJoin;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CarritoServlet", urlPatterns = {"/CarritoServlet"})
public class CarritoServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    final String id = request.getParameter("producto_id");
    String marca = request.getParameter("marca");

    HttpSession ses = request.getSession();
    ArrayList<Producto_InnerJoin> productos = (ArrayList<Producto_InnerJoin>) 
            ses.getAttribute("lista");
    
    ArrayList<Producto_InnerJoin> carrito = (ArrayList<Producto_InnerJoin>) 
            ses.getAttribute("carrito");

    // agregar un producto al carrito
    Producto_InnerJoin buscado = productos.stream().filter(item -> {
      return item.getProducto_id() == Integer.parseInt(id);
    }).findFirst().get();
    System.out.println("buscado " + buscado);

    carrito.add(buscado);
    response.sendRedirect("MarcaServlet?marca=" + marca);
  }
}
