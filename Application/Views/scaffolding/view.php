<div class="container">
    <div class="row">
        <div class="col-sm-2">
            <?php echo $navigation ?>
        </div>
        <div class="col-sm-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title"><?php echo $model_description['name'] ?></h2>
                </div>
                <div class="panel-body">
                    <?php echo $form; ?>


                    <div class="btn-group">
                        <a class="btn btn-default" href="<?php echo $url->make($url->controller) ?>">
                            Voltar
                        </a>
                        <a class="btn btn-default"
                           href="<?php echo $url->make($url->controller . '/edit/' . $url->index) ?>">
                            Editar <?php echo $model_description['name'] ?>
                        </a>

                        <a data-toggle="modal" class="btn btn-danger" href="#deletar">
                            Excluir <?php echo $model_description['name'] ?>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="deletar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    Confirmar exclusão
                </h4>
            </div>
            <div class="modal-body">
                Realmente deseja excluir <?php echo $model_description['name'] ?>?
            </div>
            <form method="POST" action="<?php echo $url->make($url->controller . '/delete/' . $url->index) ?>"
                  class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    Cancelar
                </button>

                <input type="submit" class="btn btn-primary" value="Excluir"/>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>