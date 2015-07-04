/**
 * Desenvolvido por Marcelo Madeira
 */

$('#bt-newCategory')
		.on(
				'click',
				function() {

					var categoryName = $('#categoryName').val();

					var inputData = {
						method : 'create',
						name : categoryName
					};

					if (categoryName != "") {
						$
								.post(
										"../category/add/",
										inputData,
										function(outputData) {
											if (outputData.error) {
												alert('Não é possível criar a categoria: '
														+ outputData.message);
											} else {

												var listItems = '';
												var dropDownItems = '<option value="1">Sem categoria</option>';

												$
														.each(
																outputData,
																function(index,
																		obj) {

																	listItems += '<li data-index="'
																			+ obj.categoryId
																			+ '" class="list-group-item"><a class="btn btn-default btn-sm">Excluir</a>&nbsp;'
																			+ obj.categoryName
																			+ '</li>';

																	dropDownItems += '<option value="'
																			+ obj.categoryId
																			+ '">'
																			+ obj.categoryName
																			+ '</option>';

																});

												$('#categoryList').html(
														listItems);

												$('#categoria').html(
														dropDownItems);

											}
										});
					}

				});



$('#bt-newPublisher')
.on(
		'click',
		function() {

			var publisherName = $('#publisherName').val();

			var inputData = {
				method : 'create',
				name : publisherName
			};

			if (publisherName != "") {
				$
						.post(
								"../publisher/add/",
								inputData,
								function(outputData) {
									if (outputData.error) {
										alert('Não é possível criar a editora: '
												+ outputData.message);
									} else {

										var listItems = '';
										var dropDownItems = '<option value="1">Sem editora</option>';

										$
												.each(
														outputData,
														function(index,
																obj) {

															listItems += '<li data-index="'
																	+ obj.publisherId
																	+ '" class="list-group-item"><a class="btn btn-default btn-sm">Excluir</a>&nbsp;'
																	+ obj.publisherName
																	+ '</li>';

															dropDownItems += '<option value="'
																	+ obj.publisherId
																	+ '">'
																	+ obj.publisherName
																	+ '</option>';

														});

										$('#publisherList').html(
												listItems);

										$('#publisher').html(
												dropDownItems);

									}
								});
			}

		});
