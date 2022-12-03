<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Producto_InnerJoin"%>
<%@page import="java.util.ArrayList"%>
<%
  if(session.getAttribute("carrito") == null) {
    ArrayList<Producto_InnerJoin> carritoaux = new ArrayList<>();
    
    session.setAttribute("carrito", carritoaux);
  }
  
  ArrayList<Producto_InnerJoin> carrito = (ArrayList<Producto_InnerJoin>)
          session.getAttribute("carrito");
%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- BOOTSTRAP CSS-->
    <link rel="stylesheet" href="./libs/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./assets/css/home.css" />
  </head>
  <body>
    <!-- CABEZERA -->
    <header class="container mt-3">
      <!-- Barra de navegacion -->
      <nav class="row justify-content-between align-content-center">
        <!-- Logo -->
        <img class="img-logo" src="./assets/img/logo.png" alt="logo" />
        <span class="font-serif text-light col-3 mt-2 fs-2 text-center"
          >GUCCI</span
        >
        <!-- Enlaces -->
        <div id="nav-enlaces" class="mt-2 pt-2">
          <a href="./index.jsp" class="me-3">
            <img src="./assets/img/home.svg" alt="home" />
          </a>
          <a href="./login.jsp">
            <img src="./assets/img/user.svg" alt="usuario" />
          </a>
        </div>
      </nav>
    </header>

    <!-- IMAGEN -->
    <div id="carritoImg">
      <img src="./assets/img/bg-carrito.jpg" alt="carrito" />
    </div>

    <div class="container-lg bg-light d-flex flex-row flex-wrap py-4">
      <!-- PRODUCTOS -->
      <div
        class="col-8 d-flex flex-column flex-nowrap justify-content-center px-3"
      >
        <div class="d-flex flex-row flex-nowrap justify-content-between mb-2">
          <a href="./MarcaServlet?marca=Puma" class="btn btn-dark">Seguir comprando</a>
          <p class="pt-2">Lista de productos</p>
        </div>

        <c:forEach var="item" items="${carrito}">
          <div class="card mb-3">
            <div class="row g-0">
              <div class="col-md-3">
                <img
                  src="./assets/img/db/ropa.jpg"
                  class="img-fluid rounded-start"
                  alt="producto"
                />
              </div>
              <div class="col-md-9">
                <div class="card-body">
                  <h5 class="card-title">${item.nombre_prod}</h5>
                  <h4>Bs. ${item.precio}</h4>
                  <!--<p class="card-text">
                    <small class="text-muted">Cantidad: 2</small>
                  </p>-->
                  <button type="button" class="btn btn-danger">Eliminar</button>
                </div>
              </div>
            </div>
          </div>          
        </c:forEach>
      </div>

      <!-- MENU LATERAL -->
      <div class="col-4 rounded border border-3 p-4 h-50">
        <p class="fs-3">TOTAL CARRITO</p>
        <hr />
        <p class="d-flex flex-row flex-nowrap justify-content-between">
          SUBTOTAL <span class="fw-bold">Bs. 22250</span>
        </p>
        <hr />
        <p class="d-flex flex-row flex-nowrap justify-content-between">
          ENVIO <span class="fw-bold text-end">Bs. 250</span>
        </p>
        <hr />
        <p class="d-flex flex-row flex-nowrap justify-content-between">
          TOTAL <span class="fw-bold">Bs. 22500</span>
        </p>
        <button type="button" class="btn btn-success w-100">
          Finalizar Compra
        </button>
      </div>
    </div>

    <!-- BOOTSTRAP JS -->
    <script src="./libs/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
