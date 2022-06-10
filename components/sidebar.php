<?php
$request = $_SERVER['REQUEST_URI'];
$page = str_replace("/obis/", "", $request);
?>
<div class="sidebar-menu">
    <ul class="menu">
        <li class="sidebar-title">Menu</li>
        
        <li
            class="sidebar-item <?= $page == "" || $page == "homepage" || $page == null ? 'active' : '' ?> ">
            <a href="./homepage" class='sidebar-link'>
                <i class="bi bi-grid-fill"></i>
                <span>Dashboard</span>
            </a>
        </li>
        

        <li class="sidebar-title">Master Data</li>
        
        <li class="sidebar-item <?= $page == 'customers' ? 'active' : '' ?>">
            <a href="./customers" class='sidebar-link'>
                <i class="bi bi-person-lines-fill"></i>
                <span>Customers</span>
            </a>
        </li>
       
        <li class="sidebar-item <?= $page == 'expense-category' ? 'active' : '' ?>">
            <a href="./expense-category" class='sidebar-link'>
                <i class="bi bi-card-list"></i>
                <span>Expense Category</span>
            </a>
        </li>

        <li class="sidebar-item <?= $page == 'suppliers' ? 'active' : '' ?>">
            <a href="./suppliers" class='sidebar-link'>
                <i class="bi bi-people-fill"></i>
                <span>Suppliers</span>
            </a>
        </li>

        
        <li class="sidebar-item <?= $page == 'products' || $page == 'product-categories' ? 'active' : '' ?>  has-sub">
            <a href="#" class='sidebar-link'>
                <i class="bi bi-bag-fill"></i>
                <span>Product Entry</span>
            </a>
            <ul class="submenu ">
                <li class="submenu-item ">
                    <a href="./products">Products</a>
                </li>
                <li class="submenu-item ">
                    <a href="./product-categories">Category</a>
                </li>
            </ul>
        </li>
        
        
        <li class="sidebar-title">Transactions</li>

        <li class="sidebar-item <?= $page == 'expense' ? 'active' : '' ?>">
            <a href="./expense" class='sidebar-link'>
                <i class="bi bi-clipboard2-pulse-fill"></i>
                <span>Expenses</span>
            </a>
        </li>

        <li class="sidebar-item <?= $page == 'sales' ? 'active' : '' ?>">
            <a href="./sales" class='sidebar-link'>
                <i class="bi bi-basket-fill"></i>
                <span>Sales</span>
            </a>
        </li>

        <li class="sidebar-item <?= $page == 'purchase-order' ? 'active' : '' ?>">
            <a href="./purchase-order" class='sidebar-link'>
                <i class="bi bi-box2-fill"></i>
                <span>Purchase Order</span>
            </a>
        </li>


        <li class="sidebar-title">Reports</li>
        
        <li class="sidebar-item  ">
            <a href="form-layout.html" class='sidebar-link'>
                <i class="bi bi-bar-chart-steps"></i>
                <span>Inventory Report</span>
            </a>
        </li>

        <li class="sidebar-item  ">
            <a href="form-layout.html" class='sidebar-link'>
                <i class="bi bi-bar-chart-line-fill"></i>
                <span>Sales Report</span>
            </a>
        </li>

        
    </ul>
</div>