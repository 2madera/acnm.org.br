<div class="container">
	<div class="row">
		<div class="col-md-3">
			<h2>Editando um livro</h2>
			<p>Preencha os dados ao lado e use o botão Alterar</p>
            <?php
            if (validation_errors() != '') {
                echo '<div class="alert alert-danger">';
                echo validation_errors();
                echo '</div>';
            }
            ?>
        </div>
		<div class="col-md-9">
			<form class="form-horizontal" method="post"
				action="<?php echo site_url('book/edit/'.$book[0]['bookId']) ?>">

				<input type="hidden" name="method" value="update">
				<div class="form-group">
					<label for="nome" class="col-lg-2 control-label"> Nome </label>
					<div class="col-lg-10">
						<input class="form-control" id="nome" name="nome" type="text"
							value="<?php echo $book[0]['bookName']; ?>"
							placeholder="Título do livro" />
					</div>
				</div>
				<div class="form-group">
					<label for="author" class="col-lg-2 control-label"> Autor </label>
					<div class="col-lg-10">
						<input class="form-control" id="author" name="author" type="text"
							value="<?php echo $book[0]['bookAutor']; ?>"
							placeholder="Autores separados por vírgula" />
					</div>
				</div>
				<div class="form-group">
					<label for="categoria" class="col-lg-2 control-label"> Categoria </label>
					<div class="col-lg-6">
                        <?php
                        echo form_dropdown('categoria', $categories, $book[0]['CATEGORY_categoryId'], 'id="categoria" class="form-control"');
                        ?>
                    </div>
					<div class="col-lg-4">
						<button class="btn btn-primary btn-block" data-toggle="modal"
							data-target="#addCategory">Adicionar Categoria</button>
					</div>
				</div>
				<div class="form-group">
					<label for="publisher" class="col-lg-2 control-label"> Editora </label>
					<div class="col-lg-6">
                        <?php
                        echo form_dropdown('publisher', $publishers, $book[0]['PUBLISHER_publisherId'], 'id="publisher" class="form-control"');
                        ?>
                    </div>
					<div class="col-lg-4">
						<button class="btn btn-primary btn-block" data-toggle="modal"
							data-target="#addPublisher">Adicionar Editora</button>
					</div>
				</div>
				<div class="form-group">
					<label for="edition" class="col-lg-2 control-label"> Edição </label>
					<div class="col-lg-10">
						<input class="form-control" id="edition" name="edition"
							type="text" value="<?php echo $book[0]['bookEdition']; ?>"
							placeholder="Edição" />
					</div>
				</div>
				<div class="form-group">
					<label for="volume" class="col-lg-2 control-label"> Volume </label>
					<div class="col-lg-10">
						<input class="form-control" id="volume" name="volume" type="text"
							value="<?php echo $book[0]['bookVolume']; ?>"
							placeholder="Número do volume" />
					</div>
				</div>
				<div class="form-group">
					<label for="summary" class="col-lg-2 control-label"> Resumo </label>
					<div class="col-lg-10">
						<textarea class="form-control" id="summary" name="summary"><?php echo $book[0]['bookSummary']; ?></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="copies" class="col-lg-2 control-label"> Exemplares </label>
					<div class="col-lg-10">
						<input class="form-control" id="copies" name="copies" type="text"
							value="<?php echo $book[0]['bookCopies']; ?>"
							placeholder="Número de exemplares adquiridos" />
					</div>
				</div>
				<div class="form-group">
					<label for="shelf" class="col-lg-2 control-label"> Prateleira </label>
					<div class="col-lg-10">
						<input class="form-control" id="shelf" name="shelf" type="text"
							value="<?php echo $book[0]['bookShelf']; ?>"
							placeholder="Número da prateleira onde fica" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" name="submit" value="Alterar"
							class="btn btn-primary" /> <a class="btn btn-default"
							href="<?php echo site_url('book/') ?>"> Voltar </a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Modal Categories -->
<div class="modal fade" id="addCategory" tabindex="-1" role="dialog"
	aria-labelledby="addCategory" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Categorias</h4>
			</div>
			<div class="modal-body">
				<form class="form-inline">
					<input type="text" class="form-control" id="categoryName"
						placeholder="Nome da nova categoria"> <a id="bt-newCategory"
						class="btn btn-default">Criar</a>
				</form>
				<hr />
				<div style="height: 300px; overflow: hidden; overflow-y: auto;">
					<ul id="categoryList" class="list-group">
<?php
foreach ($categories as $index => $category) {
    echo '<li data-index="' . $index . '" class="list-group-item">' . $category . '</li>';
}
?>
</ul>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal categories -->



<!-- Modal Publisher -->
<div class="modal fade" id="addPublisher" tabindex="-1" role="dialog"
	aria-labelledby="addPublisher" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Editoras</h4>
			</div>
			<div class="modal-body">
				<form class="form-inline">
					<input type="text" class="form-control" id="publisherName"
						placeholder="Nome da nova categoria"> <a id="bt-newPublisher"
						class="btn btn-default">Criar</a>
				</form>
				<hr />
				<div style="height: 300px; overflow: hidden; overflow-y: auto;">
					<ul id="publisherList" class="list-group">
<?php
foreach ($publishers as $index => $publisher) {
    echo '<li data-index="' . $index . '" class="list-group-item">' . $publisher . '</li>';
}
?>
</ul>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal Publisher -->
