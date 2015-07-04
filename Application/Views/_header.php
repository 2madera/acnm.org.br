<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>ACNM - Associação Cultural Nino Miraldi</title>
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <!--Styles-->
    <link href='//fonts.googleapis.com/css?family=Muli:400,400italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="<?php echo $url->make('assets/css/main.css') ?>">
    <link rel="stylesheet" href="<?php echo $url->make('assets/css/bootstrap.css') ?>">
    <link rel="stylesheet" href="<?php echo $url->make('assets/css/bootstrap-datepicker3.min.css') ?>">
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-61071609-1', 'auto');
        ga('send', 'pageview');
    </script>
</head>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">Você está utilizando um navegador <strong>ultrapassado</strong>.
    Por favor, <a href="//browsehappy.com/">atualize seu navegador</a> para melhorar a experiência com este site.
</p>
<![endif]-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="<?php echo $url->make(); ?>">ACNM</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <!--<ul class="nav navbar-nav">
            <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Link</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                    <li class="divider"></li>
                    <li><a href="#">One more separated link</a></li>
                </ul>
            </li>
        </ul>
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>-->
        <ul class="nav navbar-nav navbar-right">
            <li><a href="<?php echo $url->make('home/historia') ?>">Nossa História</a></li>
            <li><a href="<?php echo $url->make('home/sobre') ?>">Quem Somos</a></li>
            <li><a href="<?php echo $url->make('home/contato') ?>">Contato</a></li>
            <?php if ($security->is_logged()): ?>
                <li><a href="<?php echo $url->make('admin') ?>">Sistema</a></li>
                <li><a href="<?php echo $url->make('login/logout') ?>">Sair</a></li>
            <?php else: ?>
                <li><a href="<?php echo $url->make('login/login') ?>">Entrar</a></li>
            <?php endif; ?>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
    <!-- /.container-fluid -->
    </div>
</nav>