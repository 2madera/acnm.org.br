<?php

namespace Application\HtmlHelpers;


use Application\Core\Security;
use Application\Core\Url;

class Navigation {

    public static function get_html(){

        $pages['admin'] = 'Início';
        $pages['book'] = 'Livros';
        $pages['category'] = 'Categorias';
        $pages['publisher'] = 'Editoras';
        $pages['rent'] = 'Empréstimos';
        $pages['people'] = 'Pessoas';

        if(Security::is_admin()){
            $pages['user'] = 'Usuários';
        }

        $pages['user/logout'] = 'Sair';

        $url = new Url();

        $output = '<div class="list-group">';
        foreach ($pages as $page => $name) {
            $url_address = $url->make($page);
            $output .= "<a class='list-group-item' href='$url_address'>$name</a>";
        }
        $output .= '</div>';
        return $output;
    }

}