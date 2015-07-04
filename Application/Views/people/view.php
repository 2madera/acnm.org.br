<div class="container">
    <div class="row">
        <div class="col-sm-2">
            <?php echo $navigation ?>
        </div>
        <div class="col-sm-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">Pessoa</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-7">
                            <h2><?php echo $model_instance->name ?></h2>
                            <h4>Dados de contato</h4>
                            <hr/>
                            <dl class="dl-horizontal">
                                <dt>Telefone Celular:</dt>
                                <dd><?php echo $model_instance->cell ?></dd>
                                <dt>Telefone Fixo:</dt>
                                <dd><?php echo $model_instance->phone ?></dd>
                                <dt>Endereço:</dt>
                                <dd><?php echo $model_instance->address ?></dd>
                                <dt>CPF:</dt>
                                <dd><?php echo $model_instance->cpf ?></dd>

                            </dl>
                            <h4>Outros dados</h4>
                            <hr/>
                            <dl class="dl-horizontal">
                                <dt>Cadastrado em:</dt>
                                <dd><?php echo $str->format_date($model_instance->created_at) ?></dd>
                                <dt>Como nos conheceu:</dt>
                                <dd><?php echo $model_instance->how_knows ?></dd>
                            </dl>
                        </div>
                        <div class="col-sm-5">
                            <div class="well well-sm">
                                <img class="img-thumbnail" width="140" src="<?php echo $url->make("uploads/" . $model_instance->photo) ?>" alt=""/>
                                <h3>Educacional</h3>
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <th>
                                            Escola
                                        </th>
                                        <td>
                                            <?php echo $model_instance->scholl_name ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Série/Ano
                                        </th>
                                        <td>
                                            <?php echo $model_instance->graduation ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Turno
                                        </th>
                                        <td>
                                            <?php echo $model_instance->school_period ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Projetos escolares
                                        </th>
                                        <td>
                                            <?php echo $model_instance->school_projects ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Cursos Extras
                                        </th>
                                        <td>
                                            <?php echo $model_instance->extra_courses ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Atividades na ACNM
                                        </th>
                                        <td>
                                            <?php echo $model_instance->acnm_projects ?>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <h3>Família</h3>
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <th>
                                            Nascimento
                                        </th>
                                        <td>
                                            <?php echo $str->format_date($model_instance->birth, 'd-m-Y') ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Nome da Mãe
                                        </th>
                                        <td>
                                            <?php echo $model_instance->mother_name ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Irmãos
                                        </th>
                                        <td>
                                            <?php echo $model_instance->brother_count ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Emergência, falar com
                                        </th>
                                        <td>
                                            <?php echo $model_instance->emergency_call ?>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <?php foreach ($model_instance->get_children("rent") as $rent) {
                                    echo $str->format_date($rent->created_at);
                                }; ?>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <hr/>
                            <div class="btn-group">
                                <a class="btn btn-default" href="<?php echo $url->make($url->controller) ?>">
                                    Voltar
                                </a>
                                <a class="btn btn-default"
                                   href="<?php echo $url->make($url->controller . '/edit/' . $url->index) ?>">
                                    Editar registro
                                </a>

                                <a data-toggle="modal" class="btn btn-danger" href="#deletar">
                                    Excluir registro
                                </a>
                            </div>
                        </div>
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
                Realmente deseja excluir esse registro?
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