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

    <!-- MAIN CARROUSEL -->
    <div
      id="carouselExampleIndicators"
      class="carousel slide"
      data-bs-ride="true"
    >
      <div
        id="hero-title"
        class="position-absolute top-50 start-50 translate-middle"
      >
        <p class="text-white text-center h1 fw-light">Lorem Ipsum Dolor Sit</p>
        <p class="text-light fs-5">Lorem ipsum dolor sit amet</p>
      </div>
      <div class="carousel-indicators">
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="0"
          class="active"
          aria-current="true"
          aria-label="Slide 1"
        ></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="1"
          aria-label="Slide 2"
        ></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="2"
          aria-label="Slide 3"
        ></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="3"
          aria-label="Slide 4"
        ></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item">
          <img
            src="./assets/img/bg-1.jpg"
            class="d-block w-100 heroImg"
            alt="carrousel-img"
          />
        </div>
        <div class="carousel-item active">
          <img
            src="./assets/img/bg-2.jpg"
            class="d-block w-100 heroImg"
            alt="carrousel-img"
          />
        </div>
        <div class="carousel-item">
          <img
            src="./assets/img/bg-3.jpg"
            class="d-block w-100 heroImg"
            alt="carrousel-img"
          />
        </div>
        <div class="carousel-item">
          <img
            src="./assets/img/bg-4.jpg"
            class="d-block w-100 heroImg"
            alt="carrousel-img"
          />
        </div>
      </div>
      <button
        class="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button
        class="carousel-control-next"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

    <!-- MARCAS -->
    <div class="container-sm bg-light my-5 p-5 rounded-3">
      <h2 class="text-dark text-center mb-3">ENCUENTRA TU MARCA FAVORITA</h2>
      <div class="row d-flex flex-row flex-wrap gap-2 justify-content-center">
        <a href="MarcaServlet?marca=Adidas" class="w-25">
          <img
            src="./assets/img/adidas1.png"
            class="img-thumbnail rounded-4"
            alt="logo"
          />          
        </a>
        <a href="MarcaServlet?marca=Nike" class="w-25">
          <img
            src="./assets/img/nike1.png"
            class="img-thumbnail rounded-4"
            alt="logo"
          />        
        </a>
        <a href="MarcaServlet?marca=Asics" class="w-25">
          <img
            src="./assets/img/asics1.png"
            class="img-thumbnail rounded-4"
            alt="logo"
          />        
        </a>
        <a href="MarcaServlet?marca=Columbia" class="w-25">
          <img
            src="./assets/img/columbia1.png"
            class="img-thumbnail rounded-4"
            alt="logo"
          />        
        </a>
        <a href="MarcaServlet?marca=Converse" class="w-25">
          <img
            src="./assets/img/converse1.png"
            class="img-thumbnail rounded-4"
            alt="logo"
          />        
        </a>
        <a href="MarcaServlet?marca=Puma" class="w-25">
          <img
            src="./assets/img/puma1.png"
            class="img-thumbnail rounded-4"
            alt="logo"
          />        
        </a>
        <a href="MarcaServlet?marca=Reebok" class="w-25">
          <img
            src="./assets/img/reebok1.png"
            class="img-thumbnail rounded-4"
            alt="logo"
          />        
        </a>
        <a href="MarcaServlet?marca=Under_armor" class="w-25">
          <img
            src="./assets/img/under-armour1.png"
            class="img-thumbnail rounded-4"
            alt="logo"
          />        
        </a>
      </div>
    </div>

    <!-- PUBLICIDAD -->
    <div
      id="carouselExampleControls"
      class="carousel slide"
      data-bs-ride="carousel"
    >
      <div class="carousel-inner">
        <div class="carousel-item">
          <img
            src="./assets/img/adds-1.png"
            class="d-block w-100 addImg"
            alt="adds"
          />
        </div>
        <div class="carousel-item">
          <img
            src="./assets/img/adds-2.png"
            class="d-block w-100 addImg"
            alt="adds"
          />
        </div>
        <div class="carousel-item">
          <img
            src="./assets/img/adds-3.png"
            class="d-block w-100 addImg"
            alt="adds"
          />
        </div>
        <div class="carousel-item active">
          <img
            src="./assets/img/adds-4.png"
            class="d-block w-100 addImg"
            alt="adds"
          />
        </div>
      </div>
      <button
        class="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExampleControls"
        data-bs-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button
        class="carousel-control-next"
        type="button"
        data-bs-target="#carouselExampleControls"
        data-bs-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
    <!-- BOOTSTRAP JS -->
    <script src="./libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
      const $nav = document.getElementsByClassName("navegacion");

      $nav[0].style.backgroundColor = "rgba(0, 0, 0, 0.25)";
    </script>
  </body>
</html>
