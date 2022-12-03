<%
  String opcion = request.getParameter("opcion");
%>    
<ul class="nav nav-tabs">
  <li class="nav-item">
      <a class="nav-link <%= (opcion.equals("venta")? "active" : "") %>" href="VentaController">Ventas</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <%= (opcion.equals("cliente")? "active" : "") %>" href="ClienteController">Clientes</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <%= (opcion.equals("categoria")? "active" : "") %>" href="CategoriaController">Categoria</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <%= (opcion.equals("marca")? "active" : "") %>" href="MarcaController">Marca</a>
  </li>
  <li class="nav-item">
      <a class="nav-link <%= (opcion.equals("vendedor")? "active" : "") %>" href="VendedorController">Vendedor</a>
  </li>
  <li class="nav-item">
      <a class="nav-link <%= (opcion.equals("producto")? "active" : "") %>" href="ProductoController">Productos</a>
  </li>
  <li class="nav-item">
      <a class="nav-link <%= (opcion.equals("tienda")? "active" : "") %>" href="TiendaController">Tiendas</a>
  </li>
  <li class="nav-item">
      <a class="nav-link <%= (opcion.equals("orden")? "active" : "") %>" href="OrdenController">Ordenes</a>
  </li>
</ul>