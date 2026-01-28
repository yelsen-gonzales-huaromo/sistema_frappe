<?php

require_once __DIR__ . '/DatabaseSetup.php';

$config = require __DIR__ . '/DatabaseConfig.php';
$setup = new DatabaseSetup($config);

echo "Iniciando instalación del sistema...\n";
$setup->install();
echo "Instalación completada correctamente.\n";
