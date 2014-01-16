<!DOCTYPE html>
<html lang="en">
  
  <head>
    <meta charset="utf-8">
    <title>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
    rel="stylesheet">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"
    rel="stylesheet">
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
    </script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js">
    </script>
  </body>

</html>