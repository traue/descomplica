<!-- Pega os dados do usuário vindo do formulário de contato e insere no banco -->


<?php
    echo '<pre>';

    //Pega os dados oriundos do formulário e armazena em variáveis locais:
    $nome = $_POST['nomeUsuario'];
    $sobrenome = $_POST['sobrenomeUsuario'];
    $email = $_POST['email'];
    $senha = $_POST['password'];
    $senhaHash = sha1($senha);
    $newsletter = isset($_POST['newsletter']) ? 1 : 0; //if ternário

    //testes:
    echo $nome .'<br>';
    echo $sobrenome .'<br>';
    echo $email .'<br>';
    echo $senha .'<br>';
    echo $senhaHash .'<br>';
    echo $newsletter .'<br>';

    echo '</pre>';

    $server = "localhost";
    $db = "aula_php_temp";
    $user = "root";
    $pass = "";
    //Cria a conexão:
    $conn = mysqli_connect($server, $user, $pass, $db);

    // Verifica a conexão:
    if (!$conn) {
        die("Falha de conexão: " . mysqli_connect_error());
    } else {
        echo 'Conectado!';
    }

    $sql = "INSERT INTO tb_usuarios
    (nome, sobrenome, email, senha, newsletter)
    VALUES
    ('{$nome}', '${sobrenome}', '{$email}', '${senhaHash}', $newsletter)";
    
    if (mysqli_query($conn, $sql)) {
        echo "Registro inserido com sucesso!<br>";
        header('Location: sucesso.html'); //redireciona para a página de sucesso
    } else {
        echo "<br>Erro: " . $sql . "<br>" . mysqli_error($conn);
    }
    mysqli_close($conn);
?>