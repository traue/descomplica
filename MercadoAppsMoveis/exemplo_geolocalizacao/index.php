<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Geolocalização por IP</title>
</head>
<body>
    <div id="wrapper">
    <?php
        $ip = $_SERVER['REMOTE_ADDR'];
        echo 'Seu ip externo é '.$ip;
        echo '<br>';
        $details = json_decode(file_get_contents("http://ipinfo.io/{$ip}/json"));
        echo '<br>';
        echo 'Você está próximo a: '.$details->city; 
        echo '<br>';
        echo 'Região: '.$details->region; 
        echo '<br>';
        echo 'País: '.$details->country; 
        echo '<br>';
        $lang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
        echo 'Seu browser está configurado na lingua: '.$lang; 
    ?>
    </div>
    <br>
    <hr>
    <a href="index2.html">Localização mais precisa com JavaScript...</a>
</body>
</html>