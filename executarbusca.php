<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Buscas</title>
</head>
<body>
    <?php
    try {
            require_once "conexao/conexao.php";
            // Configuração da busca
            $termoBusca = isset($_POST['pesquisa']) ? $_POST['pesquisa'] : '';
            $condicaoBusca = '';
            //echo $termoBusca;

            //verifica se existe o termo a ser buscado na tabela
            if (!empty($termoBusca)) {
                $condicaoBuscaSalas = " WHERE descricao LIKE :termo ";
                $condicaoBuscaMoveis = " WHERE descricao LIKE :termo ";
            }
            
            // Consulta para contar o total de registros --> Salas
            $sqlCountSalas = "SELECT COUNT(*) as total FROM tbsalas" . $condicaoBuscaSalas;
            $stmtCountSalas = $conn->prepare($sqlCountSalas);
            
            if (!empty($termoBusca)) {
                $termoParam = '%' . $termoBusca . '%';
                $stmtCountSalas->bindParam(':termo', $termoParam, PDO::PARAM_STR);
            }
            
            $stmtCountSalas->execute();
            $totalRegistros = $stmtCountSalas->fetch(PDO::FETCH_ASSOC)['total'];
            echo "<p>=====>  Salas encontradas:". $totalRegistros . "</p>";
            
            // Consulta para buscar os registros da página atual
            $sqlSalas = "SELECT *
                    FROM tbsalas" . $condicaoBuscaSalas;
            
            $selectSalas = $conn->prepare($sqlSalas);
            
            if (!empty($termoBusca)) {
                $termoParam = '%' . $termoBusca . '%';
                $selectSalas->bindParam(':termo', $termoParam, PDO::PARAM_STR);
            }
            
            $selectSalas->execute();
            
            $salasEncontradas = $selectSalas->fetchAll(PDO::FETCH_ASSOC);
            echo "<p>=====>  Listagem</p>";
            echo var_dump($salasEncontradas);

            //móveis
            // Consulta para contar o total de registros --> Salas
            $sqlCountMoveis = "SELECT COUNT(*) as total FROM tbmoveis" . $condicaoBuscaMoveis;
            $stmtCountMoveis = $conn->prepare($sqlCountMoveis);
            
            if (!empty($termoBusca)) {
                $termoParam = '%' . $termoBusca . '%';
                $stmtCountMoveis->bindParam(':termo', $termoParam, PDO::PARAM_STR);
            }
            
            $stmtCountMoveis->execute();
            $totalRegistros = $stmtCountMoveis->fetch(PDO::FETCH_ASSOC)['total'];
            echo "<p>=====>  Moveis encontradas:". $totalRegistros . "</p>";
            
            // Consulta para buscar os registros da página atual
            $sqlMoveis = "SELECT *
                    FROM tbmoveis" . $condicaoBuscaMoveis;
            
            $selectMoveis = $conn->prepare($sqlMoveis);
            
            if (!empty($termoBusca)) {
                $termoParam = '%' . $termoBusca . '%';
                $selectMoveis->bindParam(':termo', $termoParam, PDO::PARAM_STR);
            }
            
            $selectMoveis->execute();
            
            $MoveisEncontradas = $selectMoveis->fetchAll(PDO::FETCH_ASSOC);
            echo "<p>=====>  Listagem</p>";
            echo var_dump($MoveisEncontradas);
            
        } catch(PDOException $e) {
            echo "<div class='alert alert-danger'>Erro: " . $e->getMessage() . "</div>";
        }
    ?>
</body>
</html>