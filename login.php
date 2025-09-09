<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login no sistema</title>
</head>
<body>
    <p>Digite os dados</p>
    <form name="formlogin" method="post"
    action="validarlogin.php">
    <label>Usuário</label><br>
    <input type="text" name="usuario"
    value="" placeholder="Digite o usuário"
    maxlength="20" size="22" required><br>
    
    <label>Senha</label><br>
    <input type="password" name="senha"
    value="" placeholder="Digite a senha"
    maxlength="20" size="22" required><br>

    <input type="submit" value="Acessar">
    <input type="reset" value="Limpar">
    </form>
</body>
</html>