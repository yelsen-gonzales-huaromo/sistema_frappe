<?php
$current_page = basename($_SERVER['PHP_SELF']);
?>
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Menu Principal</span>
                </li>
                <li class="<?php echo ($current_page == 'menu.php') ? 'active' : ''; ?>">
                    <a href="menu.php"><i class="fas fa-th-large"></i><span> Inicio</span></a>
                </li>
                <li class="<?php echo ($current_page == 'ventas.php') ? 'active' : ''; ?>">
                    <a href="ventas.php"><i class="fas fa-cash-register"></i><span> Ventas</span></a>
                </li>
                <li class="<?php echo ($current_page == 'compras.php') ? 'active' : ''; ?>">
                    <a href="compras.php"><i class="fas fa-shopping-cart"></i><span> Compras</span></a>
                </li>
                <li class="<?php echo ($current_page == 'utilidades.php') ? 'active' : ''; ?>">
                    <a href="utilidades.php"><i class="fas fa-calculator"></i><span> Utilidades</span></a>
                </li>
                
                <li class="menu-title">
                    <span>Reportes</span>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fas fa-file-invoice-dollar"></i><span> Reporte Financiero</span><span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="#">Rentabilidad</a></li>
                        <li><a href="#">Ingresos</a></li>
                        <li><a href="#">Egresos</a></li>
                        <li><a href="#">Planilla</a></li>
                    </ul>
                </li>

                <li class="menu-title">
                    <span>Productos</span>
                </li>
                <li class="<?php echo ($current_page == 'catalogos.php') ? 'active' : ''; ?>">
                    <a href="catalogos.php"><i class="fas fa-clipboard-list"></i><span> Catálogos</span></a>
                </li>
                <li class="<?php echo ($current_page == 'detalle_insumos.php') ? 'active' : ''; ?>">
                    <a href="detalle_insumos.php"><i class="fas fa-blender"></i><span> Recetas / Insumos</span></a>
                </li>

                <li class="menu-title">
                    <span>Almacén</span>
                </li>
                <li class="submenu <?php echo in_array($current_page, ['insumos.php', 'categorias.php', 'sabores.php', 'presentaciones.php']) ? 'active' : ''; ?>">
                    <a href="#"><i class="fas fa-boxes"></i><span> Inventarios</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a class="<?php echo ($current_page == 'insumos.php') ? 'active' : ''; ?>" href="insumos.php">Insumos</a></li>
                        <li><a class="<?php echo ($current_page == 'categorias.php') ? 'active' : ''; ?>" href="categorias.php">Categorías</a></li>
                        <li><a class="<?php echo ($current_page == 'sabores.php') ? 'active' : ''; ?>" href="sabores.php">Sabores</a></li>
                        <li><a class="<?php echo ($current_page == 'presentaciones.php') ? 'active' : ''; ?>" href="presentaciones.php">Presentaciones</a></li>
                    </ul>
                </li>
                <li class="submenu <?php echo in_array($current_page, ['proveedores.php', 'empresas.php']) ? 'active' : ''; ?>">
                    <a href="#"><i class="fas fa-truck-loading"></i><span> Proveedores</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a class="<?php echo ($current_page == 'proveedores.php') ? 'active' : ''; ?>" href="proveedores.php">Proveedores</a></li>
                        <li><a class="<?php echo ($current_page == 'empresas.php') ? 'active' : ''; ?>" href="empresas.php">Empresas</a></li>
                    </ul>
                </li>

                <li class="menu-title">
                    <span>Recursos Humanos</span>
                </li>
                <li class="<?php echo ($current_page == 'personal.php') ? 'active' : ''; ?>">
                    <a href="personal.php"><i class="fas fa-user-tie"></i><span> Personal</span></a>
                </li>

                <li class="menu-title">
                    <span>Configuración</span>
                </li>
                <li class="submenu <?php echo in_array($current_page, ['usuarios.php', 'roles.php', 'tipo_comprobante.php']) ? 'active' : ''; ?>">
                    <a href="#"><i class="fas fa-cog"></i><span> Administración</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a class="<?php echo ($current_page == 'usuarios.php') ? 'active' : ''; ?>" href="usuarios.php">Usuarios</a></li>
                        <li><a class="<?php echo ($current_page == 'roles.php') ? 'active' : ''; ?>" href="roles.php">Roles</a></li>
                        <li><a class="<?php echo ($current_page == 'tipo_comprobante.php') ? 'active' : ''; ?>" href="tipo_comprobante.php">Tipos de Comprobantes</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>