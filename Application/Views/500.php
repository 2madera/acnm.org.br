<div class="container">
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <h1>Ops...</h1>

            <h1>
                <small>Ocorreu um erro ao processar esta página</small>
            </h1>
            <p>Estamos felizes que você tenha tentado acessar outras páginas, comece pela nossa <a
                    href="<?php echo $url->make('') ?>">Página Inicial</a></p>
            <hr/>
            <pre><?php echo $message; ?></pre>
        </div>
    </div>
</div>