<div class="container">
    <div class="row">
        <div class="col-sm-2">
            <?php echo $navigation ?>
        </div>
        <div class="col-sm-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">Pesquisa de <?php echo $model_description['name'] ?></h2>
                </div>
                <div class="panel-body">
                    <form method="post" action="<?php echo $url->make($url->controller . '/search') ?>">
                        <div class="input-group">
                            <input name="search" type="text" class="form-control" placeholder="Nome do livro"/>
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-default" type="button">
                                    Buscar <?php echo $model_description['name'] ?>
                                </button>
                            </span>
                        </div>
                    </form>
                    <hr/>
                    <div class="list-group">
                        <?php
                        echo $grid;
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

