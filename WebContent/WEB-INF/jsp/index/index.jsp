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
                var elem = $('#' + showHideDiv);
                var text = $('#' + switchTextDiv);
                var count = $("#numClientes").val();
                var countCaixasAtivos = $("#numCaixasAtivos").val();
                if (count > 0 && countCaixasAtivos > 0) {
                    if (elem.css("display") === "block") {
                        removeCampos();
                        $("#numClientes").val("");
                        $("#numCaixasAtivos").val("");
                        elem.css("display", "none");
                        text.text("Inserir Horários");
                    } else {
                        for (var i = 1; i < count; i++) {
                            clonarLinha();
                        }
                        elem.css("display", "block");
                        //elem.attr("id", elem.attr("id") + i);
                        text.text("Apagar Horários");
                    }
                } else {
                    alert("O número de caixas ativos e de clientes deve ser maior que zero");
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
            function FIFO() {
                this.data = new Array();
                this.push = function(element) {
                    this.data.push(element);
                };
                this.pop = function() {
                    return this.data.shift();
                };
                this.empty = function() {
                    return this.data.length === 0;
                };
                this.enqueue = this.push;
                this.dequeue = this.pop;
            }
            ;
            function calcularNumClientesEsperando(c, n, t, d) {
                var caixa, count;
                var count = 0;
                var fila = new FIFO();
                for (var i = 0; i < c; i++) {
                    fila.enqueue(0);
                }

                for (var i = 0; i < n; i++) {
                    caixa = fila.dequeue();
                    alert(caixa);
                    if (caixa > t[i] + 20) {
                        count++;
                    }
                    fila.enqueue(Math.max(t[i], caixa) + d[i]);
                }

                return count;
            }
            ;

            function preparaCalc() {
                var c, n, t, d;
                t = new Array();
                d = new Array();
                c = $("#numCaixasAtivos").val();
                n = $("#numClientes").val();
                $(".linhas").each(function() {
                    var linhas = $(this);
                    
                    t.push(horaDeChegada2Number(linhas.find("#horaChegada").val()));
                    d.push(tempoDeAtendimento2Number(linhas.find("#tempAtendimento").val()));

                });
                var result = calcularNumClientesEsperando(c, n, t, d);
                alert(result);

                $("#resultado").val(result);



            }
            ;
            
            function horaDeChegada2Number(horaChegada){
                //supondo que o horário comece as 9
                var num;
                var str_horaChegada = horaChegada.split(":");
                var horas = str_horaChegada[0]-9;
                var minutos = str_horaChegada[1];
                if(horas>0){
                    horas = horas*60;
                }
                num = parseInt(minutos)+parseInt(horas);
                return num;
                
            }
            
            function tempoDeAtendimento2Number(tempAtendimento){
                var str_tempAtendimento = tempAtendimento.split(":");
                return str_tempAtendimento[1];
            }



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
                                <div class="well col-md-4" id="resultado"><p></p></div>
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
                            <td><input type="time" id="horaChegada" name="horaChegada" class="form-control" placeholder="Hora de chegada"></td>
                            <td width="40"></td>
                            <td><input type="time" id="tempAtendimento" name="tempoAtend" class="form-control" placeholder="Tempo de Atendimento"></td>
                        </tr>

                    </table>

                    <a href="javascript:preparaCalc();" class="btn btn-default" id="processbtn" >Processar</a>
                </div>
            </div>

        </div>
        <script type="text/javascript" src='<c:url value="/js/jquery-1.10.2.js"/>'></script>
        <script type="text/javascript" src='<c:url value="/js/bootstrap.js"/>'></script>

    </body>

</html>
