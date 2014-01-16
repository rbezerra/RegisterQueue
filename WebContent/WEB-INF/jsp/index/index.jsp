<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>
            RegisterQueue
        </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="./css/bootstrap.css" rel="stylesheet" media="screen">
        
        
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                    </div>
                    <form>
                        <div class="form-group">
                            <label>
                                Número de Caixas Ativos
                            </label>
                            <input type="number" class="form-control" id="numCaixasAtivos">
                            <label>
                                Número de Clientes do Dia
                                <br>
                            </label>
                            <input type="number" class="form-control" id="numClientes">
                        </div>
                    </form>
                    <p>
                    </p>
                </div>
                <div class="col-md-4">
                    <h3 id="atendHash">
                        HashMap AQUI
                    </h3>
                    <a href="#" class="btn btn-default pull-right" id="processbtn">Processar</a>
                </div>
                <div class="col-md-4">
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <label>
                        Quantidade de clientes com mais de 20 min. de espera
                    </label>
                    <input type="number" class="form-control" disabled="true">
                    <a href="#" class="btn btn-default pull-right" id="salvarbtn">Salvar</a>
                </div>
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                </div>
            </div>
        </div>
        <script type="text/javascript" src='<c:url value="/js/jquery-1.10.2.js"/>'></script>
        <script type="text/javascript" src='<c:url value="/js/bootstrap.js"/>'></script>
    </body>

</html>