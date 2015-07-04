<?php

namespace Application\Controllers;

use Application\HtmlHelpers\Form;
use Application\HtmlHelpers\Grid;
use Application\HtmlHelpers\Pagination;
use Application\HtmlHelpers\Plate;
use Application\Descriptors\Descriptor;
use Application\Core\Url;

class Scaffolding_controller extends Controller_base {

    function __construct($url) {
        parent::__construct($url);
    }

    /**
     * @param Url $url
     */
    function index($url) {

        $model_class = "\\Application\\Models\\" . ucfirst($url->controller);

        $per_page = 7;
        $current_page = $url->index ? $url->index : 1;
        $offset = ($current_page - 1) * $per_page;
        $total_pages = $model_class::count_all();

        $model_description = Descriptor::get($url->controller);

        $grid_actions['view'] = 'Abrir';
        $grid_actions['edit'] = 'Editar';

        $pagination = new Pagination($url->make($url->controller . '/index/'), $total_pages, $current_page, $per_page);
        $grid = new Grid($model_description['grid'], $grid_actions, $model_class::get_all($per_page, $offset), $url->make($url->controller));

        $data['pagination'] = $pagination->get_html();
        $data['grid'] = $grid->get_html();

        parent::render_scaffolding_view($url, $data, $model_description);
    }

    /**
     * @param Url $url
     */
    function search($url) {

        $model_class = "\\Application\\Models\\" . ucfirst($url->controller);

        $model_description = Descriptor::get($url->controller);

        $grid_actions['view'] = 'Abrir';

        $search = $url->get_param("search");

        if (!$search) {
            $url->redirect("book");
        }

        $grid = new Grid($model_description['grid'], $grid_actions, $model_class::search($search), $url->make($url->controller));

        $data['grid'] = $grid->get_html();

        parent::render_scaffolding_view($url, $data, $model_description);
    }

    /**
     * @param Url $url
     */
    function view($url) {
        $model_class = "\\Application\\Models\\" . ucfirst($url->controller);
        $model_description = Descriptor::get($url->controller);
        $model_instance = $model_class::get($url->index);
        if (!$model_instance) {
            $model_instance = new $model_class();
        }
        $data['model_instance'] = $model_instance;
        $data['form'] = Plate::get_html($model_instance, $url->controller . '/edit');
        parent::render_scaffolding_view($url, $data, $model_description);
    }

    /**
     * @param Url $url
     */
    function edit($url) {
        $model_class = "\\Application\\Models\\" . ucfirst($url->controller);
        $model_description = Descriptor::get($url->controller);
        $model_instance = $model_class::get($url->index);
        if (!$model_instance) {
            $model_instance = new $model_class();
        }
        $data['form'] = Form::get_html($model_instance, $url->controller . '/save');
        parent::render_scaffolding_view($url, $data, $model_description);
    }

    /**
     * @param Url $url
     */
    function save($url) {
        $model_class = "\\Application\\Models\\" . ucfirst($url->controller);
        $model_description = Descriptor::get($url->controller);
        $model_instance = new $model_class();
        if ($url->get_param("id")) {
            $model_instance = $model_class::get($url->get_param("id"));
        }
        if ($model_instance) {
            $model_instance->bind_params($url->post_params);
            $model_instance->save();
            $url->redirect($url->controller . "/view/" . $model_instance->id);
        } else {
            $url->redirect($url->controller);
        }
    }

    /**
     * @param Url $url
     */
    function delete($url) {
        $static_class = "\\Application\\Models\\" . ucfirst($url->controller);
        $static_class::get($url->index)->delete();
        $url->redirect($url->controller);
    }
}