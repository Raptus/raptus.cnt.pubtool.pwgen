<?php
$lang = htmlspecialchars($_GET["lang"] ?? false);
$dict = "";
$listNonAlpha = ",;:!?$/*-_+&@";

switch ($lang) {
    case "fr":
        $dict = "fr-freelang";
        $title = "Mots de passe sécurisés mémorables";
        break;
    case "en":
        $dict = "eff-long";
        $title = "Rememberable secure passwords";
        break;
    default:
        $dict = "ger-anlx";
        $title = "Einprägsame sichere Passwörter";
        break;
}
$xkcdcmd = "xkcdpass -w " . $dict . " --min 3 --max 10 --numwords 3 --delimiter='' --valid-chars='[a-z]' --case='first' --count 30";
$pwlist = shell_exec($xkcdcmd);
?>

<!DOCTYPE html>
<html>
    <head>
        <title><?= $title ?></title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open%20Sans">
        <style type="text/css">
        h1,a { 
            font-family: "Open Sans";
        }
        </style>

        <script async src="https://www.googletagmanager.com/gtag/js?id=G-WY96FKFLEW"></script>
        <script>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
          gtag('config', 'UA-1857734-8');
        </script>

    </head>

<body>
    <h1><?= $title ?></h1>
    <hr>
        <a href="?lang=de">Deutsch<a/> | <a href="?lang=fr">Français<a/> | <a href="?lang=en">English<a/>
    <hr>
<?php
    $pws = explode("\n", $pwlist);
    $pws = array_filter($pws, 'trim');
//    $idx = 0;
    foreach($pws as $pw) {
        $rNum = rand(0, 99);
//        if($idx == 15)
//            print "<br>\n";

//        if($idx < 15) {
            $rNAl = $listNonAlpha[rand(0, strlen($listNonAlpha)-1)];
            print $pw . $rNAl . $rNum . "<br>\n";
//        }
//        else
//            print $pw . $rNum . "<br>\n";
//        $idx++;
    } 
?>
    <hr>
</body>
</html>

