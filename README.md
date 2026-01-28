# <p align="center">🥤 Frappe Ice Baby - Professional Management System</p>

<p align="center">
  <img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP" />
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JS" />
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white" alt="CSS" />
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML" />
</p>

<p align="center">
  <strong>Un sistema integral diseñado para elevar la gestión de negocios de repostería y bebidas frías.</strong>
  <br />
  Desarrollado específicamente para <i>Frappe Ice Baby - Huaraz</i>, optimizando cada proceso desde el insumo hasta la sonrisa del cliente.
</p>

---

## 🌟 Visual Showcase

<div align="center">
  <table>
    <tr>
      <td width="50%">
        <p align="center"><strong>🔐 Acceso Seguro</strong></p>
        <img src="herramienta/img/login_frappe.png" alt="Login Screen" width="100%" style="border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);" />
      </td>
      <td width="50%">
        <p align="center"><strong>📊 Panel de Control</strong></p>
        <img src="herramienta/img/panel_frappe.png" alt="Main Dashboard" width="100%" style="border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);" />
      </td>
    </tr>
  </table>
</div>

---

## 🚀 Key Modules & Capabilities

### 💰 Core Business Logic
- **Smart Sales Engine:** Gestión de transacciones con cálculo automático de IGV, control de vueltos y emisión de comprobantes dinámicos.
- **Financial Control:** Seguimiento de ingresos y egresos para mantener la rentabilidad bajo control.

### 📦 Inventory & Operations
- **Inventory Tracking:** Monitoreo en tiempo real de insumos y stock de productos finales.
- **Smart Alerts:** Prevención de mermas mediante el control riguroso de fechas de vencimiento.
- **Supplier Hub:** Directorio de proveedores integrado con historial de compras.

### 👥 Human Resources & Security
- **RBAC (Role-Based Access Control):** Diferenciación clara entre Administrador, Cajero y Personal Técnico.
- **Detailed Audit:** Trazabilidad de cada acción realizada en el sistema.

---

## 🛠️ Tech Stack & Architecture

Este proyecto implementa una arquitectura **MVC (Modelo-Vista-Controlador)** sólida para garantizar escalabilidad y mantenimiento limpio.

- **Frontend Core:** Vanilla JavaScript, CSS3 con variables modernas y HTML5 Semántico.
- **Backend Engine:** PHP 8+ enfocado en seguridad y eficiencia.
- **Data Architecture:** MySQL con procedimientos almacenados, triggers y funciones para máxima integridad referencial.
- **UI/UX Assets:** Font Awesome Premium icons y tipografía Google Fonts (Poppins/Outfit).

---

## 📂 Project Ecosystem

```bash
📦 sistema_frappe
 ┣ 📂 config          # Middlewares de seguridad y controladores de conexión
 ┣ 📂 controlador     # El cerebro del sistema (Lógica de negocio e interacción)
 ┣ 📂 databases       # Arquitectura SQL (Tablas, Triggers, Functions)
 ┣ 📂 imagenes        # Assets visuales y recursos de marca
 ┣ 📂 modelo          # Abstracción de datos (DAOs y Clases Entidad)
 ┣ 📂 vista           # UI Components (Interfases limpias y responsivas)
 ┣ 📄 bdfrappe.sql    # Blueprint completo de la base de datos
 ┗ 📄 index.php       # Gateway principal del sistema
```

---

## ⚡ Quick Start

1. **Environment:** Clona este repo dentro de tu directorio `htdocs` (XAMPP).
2. **Auto-Install:** Navega a `http://localhost/sistema_frappe/config/Install.php`. El sistema se auto-instalará configurando la BD por ti.
3. **Customize:** Si necesitas cambios manuales, ajusta `config/DatabaseConfig.php`.
4. **Enjoy:** Accede a `http://localhost/sistema_frappe` y empieza a gestionar.

---

<p align="center">
  Developed by <strong>Yelsen Gonzales Huaromo</strong><br />
  Huaraz, Perú 🇵🇪
</p>
