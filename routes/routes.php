<?php

$request = $_SERVER['REQUEST_URI'];

/** SET ROUTES HERE */
// insert routes alphabetically
$routes = array(
    "homepage" => array(
        'class_name' => 'Homepage',
        'has_detail' => 0
    ),
    "sales" => array(
        'class_name' => 'Sales',
        'has_detail' => 1
    ),
    "customers" => array(
        'class_name' => 'Customers',
        'has_detail' => 0
    ),
    "suppliers" => array(
        'class_name' => 'Suppliers',
        'has_detail' => 0
    ),
    "expense-category" => array(
        'class_name' => 'ExpenseCategories',
        'has_detail' => 0
    ),
    "products" => array(
        'class_name' => 'Products',
        'has_detail' => 0
    ),
    "product-categories" => array(
        'class_name' => 'ProductCategories',
        'has_detail' => 0
    ),
    "purchase-order" => array(
        'class_name' => 'PurchaseOrder',
        'has_detail' => 1
    ),
    "expense" => array(
        'class_name' => 'Expense',
        'has_detail' => 1
    ),
    "inventory-report" => array(
        'class_name' => 'InventoryReport',
        'has_detail' => 0
    ),
    "formulation" => array(
        'class_name' => 'Formulation',
        'has_detail' => 1
    ),
    "job-order" => array(
        'class_name' => 'JobOrder',
        'has_detail' => 1
    ),
    "sales-report" => array(
        'class_name' => 'SalesReport',
        'has_detail' => 1
    ),
    "users" => array(
        'class_name' => 'Users',
        'has_detail' => 0
    ),
    "queuing" => array(
        'class_name' => 'Queuing',
        'has_detail' => 0
    ),
    "profile" => array(
        'class_name' => 'Profile',
        'has_detail' => 0
    ),
    "stock-card" => array(
        'class_name' => 'StockCard',
        'has_detail' => 0
    ),
    

);
/** END SET ROUTES */


$base_folder = "pages/";
$page = str_replace("/obis/", "", $request);

// chec if has parameters
if (substr_count($page, "?") > 0) {
    $url_params = explode("?", $page);
    $dir = $base_folder . $url_params[0] . '/index.php';
    //$param = $url_params[1];
    $page = $url_params[0];
} else {

    if ($page == "" || $page == null) {
        $page = "homepage";
    }
    $dir = $base_folder . $page . '/index.php';
}

if (array_key_exists($page, $routes)) {
    require_once $dir;
    $route_settings = json_encode($routes[$page]);
} else {
    require_once 'error-404.html';
    $route_settings = json_encode([]);
}
