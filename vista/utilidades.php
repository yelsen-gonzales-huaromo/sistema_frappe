<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Principal</title>
    <?php include '../controlador/link.php'; ?>
</head>

<body>
    <div class="main-wrapper">
        <?php include '../controlador/header.php'; ?>
        <?php include '../controlador/slider.php'; ?>








        <div class="page-wrapper">
            <div class="content container-fluid">
                <!-- grafica -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-body">

                                <div class="page-header ">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <h3 class="page-title">Reporte de Utilidades</h3>

                                        </div>

                                        <div class="col-auto text-end float-end ms-auto download-grp">
                                            <button type="button" id="btnExportar" class="btn btn-primary">Exportar Registro</button>
                                            <button type="button" id="btnBuscar" class="btn btn-primary">Buscar Registro</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label"><strong>Desde</strong></label>
                                            <input type="date" id="txtFecha1" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label"><strong>Hasta</strong></label>
                                            <input type="date" id="txtFecha2" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <!-- notificacion -->
                                <div id="miAlerta" class="alert alert-dismissible fade show" role="alert" style="display: none;">
                                    <strong id="alertTitulo"></strong> <span id="alertMensaje"></span>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="mb-3">
                                            <h5 class="page-title">Utilidad:</h5>
                                        </div>
                                    </div>
                                    <div class="col-md-10">
                                        <div class="mb-3">
                                            <input type="text" id="txtUtilidad" class="form-control" placeholder="0.00" readonly>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">

                                            <div class="row align-items-center">
                                                <div class="col">
                                                    <h5 class="page-title">Ingresos</h5>
                                                </div>
                                                <div class="col-auto text-end float-end ms-auto download-grp">
                                                    <input type="text" id="txtIngreso" class="form-control" placeholder="0.00" readonly>
                                                </div>
                                            </div>

                                            <!-- tabla con datos -->
                                            <div id="tabla1"></div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <div class="row align-items-center">
                                                <div class="col">
                                                    <h5 class="page-title">Egresos</h5>
                                                </div>
                                                <div class="col-auto text-end float-end ms-auto download-grp">
                                                    <input type="text" id="txtEgreso" class="form-control" placeholder="0.00" readonly>
                                                </div>
                                            </div>
                                            <!-- tabla con datos -->
                                            <div id="tabla2"></div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>

    </div>

    <?php include '../controlador/scrips.php'; ?>

    <script src="../controlador/JSutilidades.js"></script>

</html>