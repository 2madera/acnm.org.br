<?php

namespace Application\HtmlHelpers;


class Pagination {

    public $base;
    public $total_pages;
    public $current_page = 1;
    public $per_page;

    /**
     * Gera um componente de paginação
     * @param String $base
     * @param Integer $total_pages
     * @param Integer $current_page
     * @param Integer $per_page
     */
    function __construct($base, $total_pages, $current_page, $per_page) {
        $this->base = $base;
        $this->total_pages = $total_pages;
        $this->current_page = $current_page;
        $this->per_page = $per_page;
    }

    public function get_html() {
        $page_index = 1;
        $output = '<nav><ul class="pagination">';
        $output .= '<li><a href="' . $this->base . $page_index . '" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
        for ($i = 1; $i <= $this->total_pages; $i += $this->per_page) {
            $low_limit = ($this->current_page - 3) > 0 ? ($this->current_page - 3) : 1;
            $upp_limit = ($this->current_page + 3) < $this->total_pages ? ($this->current_page + 3) : $this->total_pages;
            if ($page_index >= $low_limit && $page_index < $upp_limit) {
                $output .= '<li><a href="' . $this->base . $page_index . '">' . $page_index . '</a></li>';
            }
            $page_index++;
        }
        $output .= '<li><a href="' . $this->base . ($page_index - 1) . '" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
        $output .= '</ul>';
        $output .= '</nav>';
        return $output;
    }

}