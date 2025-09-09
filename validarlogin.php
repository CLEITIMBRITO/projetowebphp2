<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Validação</title>
</head>
<body>
    <?php
    try {
        require_once ("conexao/conexao.php");
        //code...
        // se temos algo que foi enviado pelo formulário
        $calculo = 10/0;
        echo $calculo;
        //se a informação veio por post
        //pegar a informação
        //conectar com o banco de dados
        //executar o comando SQL (Select)
        //mostrar o resultado (login ok ou login com falha)
    } catch (\Throwable $th) {
        // echo "<h2 style='color:red;'>".$th->getMessage()."</h2>"; 
        echo "<h3 style='color:red;'>Ocorreu um erro, 
        entre em contato com o suporte.</h3>";
        $agora = new DateTime();
        $mensagem_log = "\nDATA-->".$agora->format('d/m/Y H:i:s') 
        . "|IP-->".$_SERVER['REMOTE_ADDR']
        . "|NAVEGADOR-->".$_SERVER['HTTP_USER_AGENT']
        . "|ERRO-->".$th->getMessage();
        $caminho_log = "log/arquivodemensagem.log"; // Caminho para o arquivo de log
        // Use o terceiro argumento '3' para anexar ao arquivo
        error_log($mensagem_log, 3, $caminho_log);
    }
    echo "Passou aqui";  
    ?>
</body>
</html>