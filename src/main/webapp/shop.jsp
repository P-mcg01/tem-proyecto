<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.emergentes.modelo.Producto_InnerJoin"%>
<%@page import="java.util.ArrayList"%>
<%
  ArrayList<Producto_InnerJoin> productos = (ArrayList<Producto_InnerJoin>) 
          request.getAttribute("productos");

  request.getSession().setAttribute("lista", productos);
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
          <a href="./carrito.jsp" class="me-3">
            <img src="./assets/img/shopping-cart.svg" alt="carrito" />
          </a>
          <a href="./login.jsp">
            <img src="./assets/img/user.svg" alt="usuario" />
          </a>
        </div>
      </nav>
    </header>

    <!-- MENU -->
    <ul class="navegacion nav justify-content-center position-sticky top-0">
      <li class="nav-item">
        <a class="nav-link" aria-current="page" href="shop.html">Hombre</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Mujer</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Niño</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Niña</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Marcas</a>
      </li>
    </ul>

    <div class="container-fluid bg-light d-flex flex-row flex-wrap py-4">
      <!-- MENU LATERAL -->
      <div class="col-3">
        <div class="accordion" id="accordionPanelsStayOpenExample">
          <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
              <button
                class="accordion-button"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#panelsStayOpen-collapseOne"
                aria-expanded="true"
                aria-controls="panelsStayOpen-collapseOne"
                >
                CATEGORIAS
              </button>
            </h2>
            <div
              id="panelsStayOpen-collapseOne"
              class="accordion-collapse collapse show"
              aria-labelledby="panelsStayOpen-headingOne"
              >
              <div class="accordion-body">
                <ul class="nav flex-column">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#"
                       >ACCESORIOS</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">INDUMENTARIA</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">ZAPATILLA</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
              <button
                class="accordion-button collapsed"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#panelsStayOpen-collapseTwo"
                aria-expanded="false"
                aria-controls="panelsStayOpen-collapseTwo"
                >
                COLOR
              </button>
            </h2>
            <div
              id="panelsStayOpen-collapseTwo"
              class="accordion-collapse collapse show"
              aria-labelledby="panelsStayOpen-headingTwo"
              >
              <div
                class="accordion-body d-flex flex-row justify-content-center flex-wrap gap-3"
                >
                <div class="m-color"></div>
                <div class="m-color"></div>
                <div class="m-color"></div>
                <div class="m-color"></div>
                <div class="m-color"></div>
                <div class="m-color"></div>
                <div class="m-color"></div>
                <div class="m-color"></div>
                <div class="m-color"></div>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
              <button
                class="accordion-button collapsed"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#panelsStayOpen-collapseThree"
                aria-expanded="false"
                aria-controls="panelsStayOpen-collapseThree"
                >
                TALLAS
              </button>
            </h2>
            <div
              id="panelsStayOpen-collapseThree"
              class="accordion-collapse collapse show"
              aria-labelledby="panelsStayOpen-headingThree"
              >
              <div
                class="accordion-body d-flex flex-row justify-content-center flex-wrap gap-3"
                >
                <div class="circulo">XS</div>
                <div class="circulo">S</div>
                <div class="circulo">M</div>
                <div class="circulo">SM</div>
                <div class="circulo">L</div>
                <div class="circulo">LG</div>
                <div class="circulo">MD</div>
                <div class="circulo">XL</div>
                <div class="circulo">XXL</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- PRODUCTOS -->
      <div class="col-9 d-flex flex-row flex-wrap justify-content-center gap-3">
        <c:forEach var="item" items="${productos}">
          <div class="card" style="width: 20rem">
            <img src="./assets/img/db/ropa.jpg" class="card-img-top" alt="imagen_ropa" />
            <div class="card-body">
              <h6 class="card-title">${item.nombre_prod}</h6>
              <p class="card-text fs-6">Marca: ${item.marca}</p>
              <p class="card-text fs-6">Stock: ${item.stock}</p>
              <p class="card-text fs-3">Bs. ${item.precio}</p>
              <a
                href="CarritoServlet?producto_id=${item.producto_id}&marca=${item.marca}"
                class="btn btn-primary w-100"
                id="liveToastBtn"
                >
                Agregar al carrito
              </a>
            </div>
          </div>       
        </c:forEach>
        <div class="toast align-items-center text-bg-primary border-0" 
             role="alert" aria-live="assertive" aria-atomic="true">
          <div class="d-flex">
            <div class="toast-body">
              Hello, world! This is a toast message.
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" 
                    data-bs-dismiss="toast" aria-label="Close"></button>
          </div>
        </div>

      </div>
    </div>

    <!-- BOOTSTRAP JS -->
    <script src="./libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
      function generarNuevoColor() {
        let simbolos, color;
        simbolos = "0123456789ABCDEF";
        color = "#";

        for (var i = 0; i < 6; i++) {
          color = color + simbolos[Math.floor(Math.random() * 16)];
        }

        return color;
      }

      const circulos = document.getElementsByClassName("m-color");

      for (let circle of circulos) {
        circle.style.backgroundColor = generarNuevoColor();
      }
    </script>
  </body>
</html>
