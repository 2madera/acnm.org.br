<div class="container">
    <div class="row">
        <div class="col-sm-2">
            <?php echo $navigation ?>
        </div>
        <div class="col-sm-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">Administração</h2>
                </div>
                <div class="panel-body">
                        <h1>Bem-vindo</h1>
                    <p><strong>Esta é a página de administração de nossa biblioteca.</strong></p>
                    <hr/>
                    <h3>Atualmente estamos com <?php echo $book_total ?> livros.</h3>
                    <h4>Com <?php echo $publisher_total ?> editoras.</h4>
                    <h4>Divididos em <?php echo $category_total ?> categorias.</h4>
                    <hr/>
                    <h4>Somos um total de <?php echo $user_total ?> usuários cadastrados.</h4>
                </div>
            </div>
        </div>
    </div>
</div>