<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Geolocalização por IP</title>
</head>
<body>
    <div id="wrapper">
    <?php
        function getRealIpAddr(){
            if ( !empty($_SERVER['HTTP_CLIENT_IP']) ) {
             // Check IP from internet.
             $ip = $_SERVER['HTTP_CLIENT_IP'];
            } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']) ) {
             // Check IP is passed from proxy.
             $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
            } else {
             // Get IP address from remote address.
             $ip = $_SERVER['REMOTE_ADDR'];
            }
            return $ip;
           }
           
        $ip = getRealIpAddr();
        echo 'Seu ip externo é '.$ip;
        echo '<br>';
        $ip = $_SERVER['REMOTE_ADDR'];
        $details = json_decode(file_get_contents("http://ipinfo.io/{$ip}/json"));
        echo '<br>';
        echo 'Você está próximo a: '.$details->city; 
        echo '<br>';
        echo 'Região: '.$details->region; 
        echo '<br>';
        echo 'País: '.$details->country; 
    ?>
    </div>


    <hr>
    <a href="index2.html">Localização mais precisa com JavaScript...</a>
</body>
</html>