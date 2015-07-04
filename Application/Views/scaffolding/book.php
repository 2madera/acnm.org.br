<div class="container">
    <div class="row">
        <div class="col-sm-2">
            <?php echo $navigation ?>
        </div>
        <div class="col-sm-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">Livro</h2>
                </div>
                <div class="panel-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <h1>
                                    <?php echo $book->name ?>
                                </h1>

                                <h3>
                                    <small>Autor:<?php echo $book->author ?></small>
                                </h3>
                                <?php
                                if ($book->summary != '')
                                    echo '<p>' . $book->summary . '</p>';

                                ?>
                                <hr/>

                                <table class="table table-bordered">
                                    <tbody>
                                    <tr>
                                        <td>
                                            Edição
                                        </td>
                                        <td>
                                            <?php echo $book->edition ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Volume
                                        </td>
                                        <td>
                                            <?php echo $book->volume ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Cópias
                                        </td>
                                        <td>
                                            <?php echo $book->quantity ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Prateleira
                                        </td>
                                        <td>
                                            <?php echo $book->shelf ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Editora
                                        </td>
                                        <td>
                                            <?php echo $book->publisher->name ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Categoria
                                        </td>
                                        <td>
                                            <?php echo $book->category->name ?>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>


                                <p><em>
                                        Registrado em
                                        <?php echo $str->format_date($book->created_at) ?>
                                        por
                                        <?php echo $book->user->name ?></em>
                                </p>
                            </div>
                            <div class="col-sm-6">
                                <div class="center-block">
                                    <img src="<?php echo $url->make("assets/img/no_cover.png"); ?>" alt=""
                                         class="img-responsive img-thumbnail"/>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="btn-group">
                        <a class="btn btn-default" href="<?php echo $url->make('book/edit/' . $book->id) ?>">
                            Editar Livro
                        </a>
                        <a class="btn btn-default" href="<?php echo $url->make('book/') ?>">
                            Voltar
                        </a>
                        <a data-toggle="modal" class="btn btn-danger" href="#deletar">
                            Excluir Livro
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
                Realmente deseja excluir este livro da biblioteca?
            </div>
            <form method="POST" action="<?php echo $url->make('book/delete/' . $book->id) ?>" class="modal-footer">
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