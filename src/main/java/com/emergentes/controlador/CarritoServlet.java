package com.emergentes.controlador;

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
    String servlet = request.getParameter("servlet");
    String sitio = request.getParameter("sitio");
    String op = request.getParameter("op");

    HttpSession ses = request.getSession();
    ArrayList<Producto_InnerJoin> carrito = (ArrayList<Producto_InnerJoin>) 
            ses.getAttribute("carrito");
    
    switch (op) {
      case "add":
        ArrayList<Producto_InnerJoin> productos = (ArrayList<Producto_InnerJoin>) 
            ses.getAttribute("lista");
        
        // agregar un producto al carrito
        Producto_InnerJoin buscado = productos.stream().filter(item -> {
          return item.getProducto_id() == Integer.parseInt(id);
        }).findFirst().get();
        
        carrito.add(buscado);
        if(servlet.equals("marcas")) {
          response.sendRedirect("MarcaServlet?marca=" + sitio);
        }
        if(servlet.equals("categorias")) {
          response.sendRedirect("CategoriaServlet?cat=" + sitio);
        }
        break;
      case "minus":
        Producto_InnerJoin producto = carrito.stream().filter(item -> {
          return item.getProducto_id() == Integer.parseInt(id);
        }).findFirst().get();
        
        carrito.remove(producto);
        response.sendRedirect("carrito.jsp");
        break;
      default:
        response.sendRedirect("index.jsp");
    }
  }
}
