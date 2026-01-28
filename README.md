# 🥤 Frappe Ice Baby - Sistema de Gestión

¡Bienvenido al repositorio de **Frappe Ice Baby**! Este es un sistema de gestión integral desarrollado para optimizar los procesos de una tienda de frappes, helados y postres en Huaraz. El sistema permite controlar desde el inventario de insumos hasta la facturación y ventas finales.

---

## 🚀 Funcionalidades Principales

Este sistema ha sido diseñado con una arquitectura modular para cubrir todas las necesidades operativas:

- **Gestión de Ventas:** Registro de transacciones, cálculo de IGV, vuelto y generación de comprobantes.
- **Control de Inventarios:** Seguimiento detallado de insumos, stock de productos y fechas de vencimiento.
- **Módulo de Compras:** Gestión de adquisiciones a proveedores, registro de facturas y control de costos.
- **Catálogo de Productos:** Personalización de sabores, presentaciones y categorías de frappes.
- **Administración de Personal:** Control de roles (Admin, Cajero, etc.) y acceso de usuarios.
- **Base de Datos Robusta:** Implementación de procedimientos almacenados y funciones para la integridad de los datos.

---

## 🛠️ Tecnologías Utilizadas

El proyecto utiliza un stack clásico y eficiente para aplicaciones web de gestión:

- **Backend:** PHP (Arquitectura MVC: Modelo-Vista-Controlador)
- **Frontend:** HTML5, CSS3 (Diseño moderno y responsivo) y JavaScript.
- **Base de Datos:** MySQL (Relacional, con triggers y procedimientos).
- **Herramientas:** Font Awesome (Iconografía), Google Fonts (Tipografía Poppins).

---

## 📂 Estructura del Proyecto

```bash
📦 sistema_frappe
 ┣ 📂 config          # Configuración de conexión y setup de BD
 ┣ 📂 controlador     # Lógica de negocio e interacción Modelo-Vista
 ┣ 📂 databases       # Respaldos y scripts adicionales de BD
 ┣ 📂 imagenes        # Recursos visuales del sistema
 ┣ 📂 modelo          # Clases y DAOs para acceso a datos
 ┣ 📂 vista           # Interfaces de usuario (UI)
 ┣ 📄 bdfrappe.sql    # Script completo de la base de datos
 ┗ 📄 index.php       # Punto de entrada (Redirección al login)
```

---

## ⚙️ Instalación y Configuración

Sigue estos pasos para poner en marcha el proyecto localmente:

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/tu-usuario/sistema_frappe.git
   ```

2. **Configurar la base de datos:**
   - Importa el archivo `bdfrappe.sql` en tu gestor de base de datos (phpMyAdmin o MySQL Workbench).
   - El sistema crea automáticamente la base de datos `bdfrappe`.

3. **Ajustar la conexión:**
   - Dirígete a `config/DatabaseConfig.php` (o similar) y actualiza las credenciales de tu servidor local (host, usuario, contraseña).

4. **Ejecutar:**
   - Coloca la carpeta en tu servidor local (XAMPP/WAMP) y accede vía `http://localhost/sistema_frappe`.

---

## 📸 Capturas de Pantalla

*(Próximamente se añadirán imágenes del sistema en funcionamiento)*

<!-- 
Ejemplo de cómo añadir imágenes una vez las tengas:
![Login Screen](imagenes/screenshot_login.png)
![Dashboard](imagenes/screenshot_dashboard.png)
-->

---

## 👤 Autor

Desarrollado con ❤️ para **Frappe Ice Baby - Huaraz**.

---
*Este proyecto fue creado para demostrar habilidades en desarrollo web Full-Stack y gestión de bases de datos relacionales.*
