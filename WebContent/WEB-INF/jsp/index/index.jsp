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
        <link href="./css/simple-sidebar.css" rel="stylesheet" media="screen">
        <script language="javascript">
            function toggle(showHideDiv, switchTextDiv) {
                var elem = $('#'+showHideDiv);
                var text = $('#'+switchTextDiv);
                var count = $("#numClientes").val();
                if (elem.css("display") === "block") {
                    removeCampos();
                    $("#numClientes").val("");
                    elem.css("display","none");
                    text.text("Inserir Horários");
                    
                } else {
                    for (var i = 1; i < count; i++) {
                        clonarLinha();
                    }
                    elem.css("display","block");
                    text.text("Apagar Horários");
                }


            }
            ;

            function removeCampos() {
                while ($(".linhas").length > 1) {
                   $("tr.linhas:last").remove();
                }

            }
            ;

            function clonarLinha() {
                novoCampo = $("tr.linhas:first").clone();
                novoCampo.find("input").val("");
                novoCampo.insertAfter("tr.linhas:last");
            }
            ;

        </script>


    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <form>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>
                                    Número de Caixas Ativos
                                    <br>
                                </label>
                                <div class="row">
                                    <div class="col-md-2">
                                        <input type="number" class="form-control" id="numCaixasAtivos">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <label>
                                    Número de Clientes do Dia
                                    <br>
                                </label>
                                <div class="row">
                                    <div class="col-md-2">
                                        <input type="number" class="form-control" id="numClientes">
                                    </div>
                                </div>
                            </div>
                            <br><br>
                            <div class="col-md-12">
                                <a href="javascript:toggle('hashDiv','showHash');"  class="btn btn-default" id="showHash" >Inserir Horários</a>                                
                            </div>


                            <br><br><br>

                            <div class="col-md-12">

                                <label>
                                    Quantidade de clientes com mais de 20 min. de espera
                                </label>
                                <div class="well col-md-4"><p></p></div>
                                <br>
                                <div class="col-md-2">
                                    <a href="#" class="btn btn-default pull-right" id="salvarbtn">Salvar</a>
                                </div>

                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6" id="hashDiv" style="display: none;">
                    <table border="0" cellpadding="2" cellspacing="4">
                        <tr>
                            <td><label>Hora de chegada</label></td>
                            <td width="40"></td>
                            <td><label>Tempo de Atendimento</label></td>
                        </tr>

                        <tr class="linhas">
                            <td><input type="text" name="horaChegada[]" class="form-control" placeholder="Hora de chegada"></td>
                            <td width="40"></td>
                            <td><input type="text" name="tempoAtend[]" class="form-control" placeholder="Tempo de Atendimento"></td>
                        </tr>

                    </table>

                    <a href="#" class="btn btn-default" id="processbtn">Processar</a>
                </div>
            </div>

        </div>
        <script type="text/javascript" src='<c:url value="/js/jquery-1.10.2.js"/>'></script>
        <script type="text/javascript" src='<c:url value="/js/bootstrap.js"/>'></script>
    </body>

</html>
