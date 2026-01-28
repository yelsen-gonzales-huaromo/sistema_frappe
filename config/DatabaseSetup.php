<?php

class DatabaseSetup
{
    private $pdo;
    private $config;
    private $basePath;

    public function __construct(array $config)
    {
        $this->config = $config;
        $this->basePath = dirname(__DIR__) . '/databases';
    }

    public function install()
    {
        try {
            $this->createDatabase();
            $this->connectToDatabase();
            $this->pdo->exec("SET FOREIGN_KEY_CHECKS=0");
            $this->executeSqlFiles('migrations', 'Tablas');
            $this->executeSqlFiles('seeders', 'Datos Iniciales');
            $this->executeSqlFiles('functions', 'Funciones', true);
            $this->executeSqlFiles('triggers', 'Triggers', true);
            $this->executeSqlFiles('views', 'Vistas');
            $this->pdo->exec("SET FOREIGN_KEY_CHECKS=1");
        } catch (PDOException $e) {
            die("Error crítico durante la instalación: " . $e->getMessage() . "\n");
        }
    }

    private function createDatabase()
    {
        echo "Verificando base de datos...\n";
        $dsn = "mysql:host={$this->config['host']};port={$this->config['port']};charset={$this->config['charset']}";
        $pdo = new PDO($dsn, $this->config['username'], $this->config['password']);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $pdo->exec("DROP DATABASE IF EXISTS `{$this->config['database']}`");
        $pdo->exec("CREATE DATABASE IF NOT EXISTS `{$this->config['database']}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
        echo "- Base de datos '{$this->config['database']}' verificada/creada.\n";
    }

    private function connectToDatabase()
    {
        $dsn = "mysql:host={$this->config['host']};port={$this->config['port']};dbname={$this->config['database']};charset={$this->config['charset']}";
        $this->pdo = new PDO($dsn, $this->config['username'], $this->config['password']);
        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    private function executeSqlFiles($folder, $label, $isAdvanced = false)
    {
        $path = $this->basePath . '/' . $folder;
        if (!is_dir($path)) {
            echo "Directorio $folder no encontrado, saltando...\n";
            return;
        }

        echo "Procesando $label...\n";
        $files = glob($path . '/*.sql');
        
        foreach ($files as $file) {
            $filename = basename($file);
            echo "  > Ejecutando $filename...";
            
            $sql = file_get_contents($file);
            
            if ($isAdvanced) {
                $this->executeAdvancedSql($sql);
            } else {
                $this->pdo->exec($sql);
            }
            echo " OK\n";
        }
    }

    private function executeAdvancedSql($sql)
    {
        // Limpiamos los comandos DELIMITER iniciales y finales
        $sql = preg_replace('/^DELIMITER\s*\S+\s*/mi', '', $sql);
        
        // Dividimos por el delimitador $$
        $statements = explode('$$', $sql);
        
        foreach ($statements as $statement) {
            $statement = trim($statement);
            // Ignorar bloques vacíos o comandos DELIMITER residuales
            if (empty($statement) || preg_match('/^DELIMITER/i', $statement) || $statement === ';') {
                continue;
            }
            
            try {
                $this->pdo->exec($statement);
            } catch (PDOException $e) {
                // Mostrar error pero permitir continuar (útil si hay triggers que dependen de otras cosas, aunque idealmente no debería fallar)
                echo "\n    [WARN] Error ejecutando bloque SQL avanzado: " . $e->getMessage() . "\n";
            }
        }
    }
}
