<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">
              
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <title>TIENDA DE ROPAS</title>
    </head>
    <body>
        <div class="container">
            <h1>Clientes</h1>
            <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="orden"/>
            </jsp:include>
            <br>
            <a href="OrdenController?action=add" class="btn btn-primary btn-sm"><i class="fa-regular fa-square-plus"></i> Nuevo</a>
            <table class="table table-striped">
                <tr>
                    <th>ID Orden</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                    <th>Descuento</th> 
                    <th>Fecha Orden</th>
                    <th>Producto ID</th>
                    <th>ID venta</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${ordenes}">
                    <tr>
                        <td>${item.orden_id}</td>
                        <td>${item.cantidad}</td>
                        <td>${item.total}</td>
                        <td>${item.descuento}</td>
                        <td>${item.fecha_orden}</td>
                        <td>${item.producto_id}</td>
                        <td>${item.id_venta}</td>
                        <td>
                            <a href="OrdenController?action=edit&orden_id=${item.orden_id}"><i class="fa-solid fa-pen-to-square"></i>Editar</a>
                        </td>
                        <!--<td>
                            <a href="OrdenController?action=delete&orden_id=${item.orden_id}" onclick="return(confirm('Esta seguro de eliminar???'))"><i class="fa-solid fa-trash"></i>Eliminar</a>
                        </td>-->
                    </tr>  
                </c:forEach>
            </table>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        
    </body>
</html>

