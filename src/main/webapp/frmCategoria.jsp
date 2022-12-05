<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">
        <title>TIENDA DE ROPAS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


    </head>
    <body>
        <jsp:include page="WEB-INF/menu.jsp">
            <jsp:param name="opcion" value="categoria"/>
        </jsp:include>
        <div class="container">
            <h1>Formulario Categoria</h1>
            <br>
            <h2>
            <c:if test="${categorias.categoria_id == 0}">Nuevo</c:if>
            <c:if test="${categorias.categoria_id != 0}">Editar</c:if>
            </h2> 
            <br>
            <form action="CategoriaController" method="post">
                <input type="hidden" name="categoria_id" value="${categorias.categoria_id}"/>
                <div class="mb-3">
                    <label for="" class="form-label">Categoria</label>
                    <input type="text" class="form-control" name="categoria" value="${categorias.categoria}" placeholder="Escriba aqui">
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
