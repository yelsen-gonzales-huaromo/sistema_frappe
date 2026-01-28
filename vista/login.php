<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Frappe Ice Baby - Huaraz</title>

    <?php include '../controlador/link.php'; ?>
    <style>
        :root {
            --primary: #334155; /* Slate 700 */
            --primary-hover: #1e293b; /* Slate 800 */
            --secondary: #64748b; /* Slate 500 */
            --dark: #0f172a; /* Slate 900 */
            --bg-gradient: linear-gradient(135deg, #e2e8f0 0%, #94a3b8 100%); /* Blue Gray palette */
        }

        body {
            background: var(--bg-gradient);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            overflow: hidden;
        }

        .login-container {
            position: relative;
            width: 100%;
            max-width: 1000px;
            padding: 20px;
            display: flex;
            justify-content: center;
        }

        .login-box {
            display: flex;
            width: 100%;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 24px;
            box-shadow: 0 25px 50px -12px rgba(15, 23, 42, 0.15);
            overflow: hidden;
            backdrop-filter: blur(10px);
            min-height: 600px;
        }

        .login-left {
            flex: 1;
            background: url('../imagenes/img.jpeg') center center/cover no-repeat;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-left::after {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: linear-gradient(to bottom, rgba(15, 23, 42, 0.4), rgba(51, 65, 85, 0.6));
        }

        .login-left-content {
            position: relative;
            z-index: 10;
            text-align: center;
            color: white;
            padding: 40px;
        }

        .login-right {
            flex: 1;
            padding: 60px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: #ffffff;
        }

        .header-text h1 {
            font-weight: 800;
            font-size: 2.5rem;
            color: var(--dark);
            margin: 0;
            letter-spacing: -1px;
        }

        .header-text p {
            color: #64748b;
            font-size: 1.1rem;
            margin-bottom: 40px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--dark);
            font-size: 0.9rem;
        }

        .custom-input {
            width: 100%;
            height: 55px;
            background: #f1f5f9;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 0 20px;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .custom-input:focus {
            border-color: var(--primary);
            background: #fff;
            outline: none;
            box-shadow: 0 0 0 4px rgba(51, 65, 85, 0.1);
        }

        .input-icon {
            position: absolute;
            right: 20px;
            top: 45px;
            color: #94a3b8;
            cursor: pointer;
        }

        .btn-login {
            width: 100%;
            height: 55px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
            box-shadow: 0 10px 20px -5px rgba(51, 65, 85, 0.3);
        }

        .btn-login:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 15px 25px -5px rgba(51, 65, 85, 0.4);
        }

        .login-danger {
            color: #ef4444;
        }

        @media (max-width: 900px) {
            .login-left { display: none; }
            .login-box { max-width: 500px; }
        }
    </style>
</head>

<body>
    <div class="login-container">
        <div class="login-box">
            <div class="login-left">
                <div class="login-left-content">
                    <img src="../imagenes/logo_frase.png" alt="Logo" style="width: 200px; margin-bottom: 20px; filter: brightness(0) invert(1);">
                    <h2 style="font-size: 1.5rem; font-weight: 300;">La mejor experiencia en Frappes</h2>
                </div>
            </div>
            <div class="login-right">
                <div class="header-text">
                    <h1>Frappe Ice Baby</h1>
                    <p>No esperes tenerlo todo para disfrutar de la vida, prueba los deliciosos frappes, helados y postres.</p>
                </div>

                <form action="../modelo/DAOlogin.php" method="POST">
                    <div class="form-group">
                        <label>Usuario <span class="login-danger">*</span></label>
                        <input class="custom-input" type="text" name="usuario" placeholder="Ej: admin" required autocomplete="off">
                        <span class="input-icon"><i class="fas fa-user-circle"></i></span>
                    </div>

                    <div class="form-group">
                        <label>Contraseña <span class="login-danger">*</span></label>
                        <input class="custom-input pass-input" type="password" name="psswrd" placeholder="••••••••" required autocomplete="off">
                        <span class="input-icon feather-eye toggle-password"></span>
                    </div>

                    <div class="form-group">
                        <button class="btn-login" type="submit">ACCEDER AL PANEL</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <?php include '../controlador/scrips.php'; ?>
</body>

</html>