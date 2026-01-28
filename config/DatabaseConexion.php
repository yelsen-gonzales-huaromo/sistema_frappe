<?php

$config = require __DIR__ . '/DatabaseConfig.php';

try {
    $conexion = new mysqli(
        $config['host'], 
        $config['username'], 
        $config['password'], 
        $config['database'],
        $config['port'] ?? 3306
    );

    if ($conexion->connect_error) {
        throw new Exception("Error de conexión: " . $conexion->connect_error);
    }

    $conexion->set_charset($config['charset'] ?? 'utf8');

} catch (Exception $e) {
    die("Error crítico de base de datos: " . $e->getMessage());
}
?>
