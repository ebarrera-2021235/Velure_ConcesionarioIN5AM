    <%-- Document : Clientes 
    Created on : 
    13/08/2025, 22:41:42 
    Author : ANTONY TUN --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Concesionario - ${titulo}</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- Google Fonts Montserrat -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
    <link href="styles/principal.css" rel="stylesheet">
</head>
<body>
<header>
    <!-- Grupo hamburguesa + Menú -->
    <div style="display: flex; align-items: center; position: relative; z-index: 3;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menuEntidades" aria-controls="menuEntidades" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon">
                <span></span>
                <span></span>
                <span></span>
            </span>
        </button>
        <span id="textoMenu" style="color:white; font-size:1.2rem; margin-left:8px;">Menú</span>
    </div>
    <!-- Menú de Entidades mejor ordenado y horizontal -->
    <div class="collapse navbar-collapse" id="menuEntidades" style="flex: 1;">
        <ul class="navbar-nav mr-auto" style="flex-direction: row; gap: 20px;">
            <!-- Link a Home/Principal -->
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="showHome()">Home</a>
            </li>
            <!-- Menú desplegable de entidades -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="entidadesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gestion</a>
                <div class="dropdown-menu" aria-labelledby="entidadesDropdown">
                    <a class="dropdown-item" href="Controlador?menu=Empleado&accion=Listar" target="contenido" onclick="showIframe()">Empleados</a>
                    <a class="dropdown-item" href="Controlador?menu=Clientes&accion=Listar" target="contenido" onclick="showIframe()">Clientes</a>
                    <a class="dropdown-item" href="Controlador?menu=Venta&accion=Listar" target="contenido" onclick="showIframe()">Venta</a>
                    <a class="dropdown-item" href="Controlador?menu=Vehiculo&accion=Listar" target="contenido" onclick="showIframe()">Vehiculos</a>
                    <a class="dropdown-item" href="Controlador?menu=Proveedor&accion=Listar" target="contenido" onclick="showIframe()">Proveedores</a>
                    <a class="dropdown-item" href="Controlador?menu=Compras&accion=Listar" target="contenido" onclick="showIframe()">Compras</a>
                    <a class="dropdown-item" href="Controlador?menu=Servicios&accion=Listar" target="contenido" onclick="showIframe()">Servicios </a>
                    <a class="dropdown-item" href="Controlador?menu=Seguro&accion=Listar" target="contenido" onclick="showIframe()">Seguros</a>
                    <a class="dropdown-item" href="Controlador?menu=DetalleCompra&accion=Listar" target="contenido" onclick="showIframe()">Detalles de Compras</a>
                    <a class="dropdown-item" href="Controlador?menu=DetalleVenta&accion=Listar" target="contenido" onclick="showIframe()">Detalles de Ventas</a>
                </div>
            </li>
            
        </ul>
    </div>
    <!-- Logo centrado y más grande -->
    <a class="logo-center" href="#" onclick="showHome()">
        <img src="img/V.png" alt="Logo">
    </a>
    <!-- Usuario a la derecha -->
    <div class="dropdown">
         <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownUser" data-toggle="dropdown">
        ${usuario.nombresUsuario}
    </button>
    <div class="dropdown-menu dropdown-menu-right text-center" aria-labelledby="dropdow nUser" style="min-width: 180px; padding: 10px;">
        <img src="${usuario.imagen}" width="60" height="60" alt="Usuario" class="mb-2 rounded-circle"/>
        <div>${usuario.nombresUsuario}</div>
        <div class="">${usuario.correoUsuario}</div>
        <div class="dropdown-divider"></div>
        <form action="Validar" method="POST">
            <button name="accion" value="Salir" class="dropdown-item btn btn-sm">Salir</button>
        </form>
    </div>
</div>
</header>

<!-- Contenedor para alternar entre contenido principal e iframe -->
<div class="content-wrapper" id="contentWrapper">
    <!-- Contenido principal (Home) -->
    <div class="main-content" id="mainContent">
        <div class="buttons">
            <a href="Catalogo.jsp" target="contenido" onclick="showIframe()">CATÁLOGO</a>
            <a href="#" onclick="scrollToSection('galeria')">GALERÍA</a>
            <a href="#" onclick="scrollToSection('empresa')">CONOCE VELURE</a>
        </div>

        <section class="info-section">
            <div class="info-card">
                <img src="img/concesionario.png" alt="Misión" />
                <div class="info-text">
                    <h2>MISIÓN</h2>
                    <p>En Velure, nuestra misión es consolidarnos como un referente en el sector automotriz de alta gama, ofreciendo a cada cliente una experiencia de atención única y exclusiva. Nuestro compromiso se fundamenta en la excelencia, la confianza y la personalización, pilares que guían cada interacción y cada proceso dentro de nuestra organización.

Nos dedicamos a poner a disposición de nuestros clientes una amplia gama de vehículos premium, caracterizados por su innovación, diseño y rendimiento. Cada adquisición va acompañada de un servicio excepcional, respaldado por un equipo de asesores altamente capacitados, quienes se enfocan en comprender y atender las necesidades particulares de cada cliente, garantizando un acompañamiento cercano y profesional durante todo el proceso.

Además, implementamos procesos transparentes y eficientes, apoyados en herramientas tecnológicas y un entorno digital sofisticado, que refleja el nivel de lujo, modernidad y distinción que nuestros clientes merecen.

En Velure creemos que la experiencia de compra no termina en la adquisición del vehículo, sino que se extiende a una relación a largo plazo, basada en la confianza, la innovación constante y el compromiso de superar las expectativas en cada servicio brindado.</p>
                </div>
            </div>

            <div class="info-card reverse">
                <img src="img/Img2.png" alt="Visión" />
                <div class="info-text">
                    <h2>VISIÓN</h2>
                    <p>En Velure, aspiramos a ser reconocidos como el concesionario digital líder en vehículos exclusivos en América Latina, marcando la diferencia en el sector automotriz a través de la innovación, la excelencia en el servicio y el uso estratégico de la tecnología.

Nuestra visión es revolucionar la manera en que se adquieren, disfrutan y experimentan los automóviles de alta gama, ofreciendo a los clientes un entorno digital de vanguardia que combine comodidad, transparencia y lujo.

Nos proyectamos como una organización que trasciende las fronteras físicas, posicionándose en el mercado latinoamericano mediante una plataforma digital sólida, accesible y confiable, que permita a nuestros clientes explorar, seleccionar y adquirir vehículos exclusivos desde cualquier lugar, con la misma confianza y garantía que en una experiencia presencial.

Queremos ser reconocidos no solo por la calidad de nuestra oferta automotriz, sino también por el impacto positivo en la experiencia del cliente, brindando soluciones innovadoras y creando un ecosistema digital que redefina los estándares de sofisticación, atención personalizada y confianza en el mercado automotriz premium.</p>
                </div>
            </div>

            <div class="info-card">
                <img src="img/Img4.jpg" class="img4" alt="Historia" />
                <div class="info-text">
                    <h2>NUESTRA HISTORIA</h2>
                    <p>Fundada en julio de 2025, Velure nace del deseo de transformar la forma en que se vive el mundo automotriz de alta gama. Más que un concesionario, Velure fue concebida como una experiencia: una marca que combina tecnología, atención personalizada y una selección exclusiva de vehículos, pensada para un público que exige lo mejor en cada detalle. Impulsada por un grupo de emprendedores apasionados por el diseño, la innovación y el lujo, Velure surge con una misión clara: ofrecer un espacio donde el cliente no solo encuentre el automóvil ideal, sino también una experiencia que refleje elegancia, confianza y excelencia. Desde sus inicios, la empresa ha establecido alianzas estratégicas con marcas de renombre internacional, lo que le ha permitido posicionarse rápidamente como un referente en el mercado de vehículos exclusivos. Su propuesta digital, apoyada por un equipo de asesores altamente calificados, ha hecho posible que cada cliente viva una experiencia de compra segura, guiada y completamente personalizada.</p>
                </div>
            </div>
        </section>

        <section id="galeria" class="gallery-section">
            <h2>GALERÍA</h2>
            <div class="gallery-grid">
                <img src="img/Img4.jpg" alt="Auto 1" />
                <img src="img/Img2.png" alt="Auto 2" />
                <img src="img/Img3.webp" alt="Auto 3" />
                <img src="img/Img5.jpg" alt="Auto 4" />
                <img src="img/Img7.jpg" alt="Auto 5" />
                <img src="img/Img8.jpg" alt="Auto 6" />
                <img src="img/Img6.jpg" alt="Auto 7">
                <img src="img/Img9.jpg" alt="Auto 8">
                <img src="img/img10.webp" alt="Auto 9">
            </div>
        </section>

        <section id="empresa" class="info-section">
            <div class="info-card">
                <img src="img/V.png" alt="Logo Velure" />
                <div class="info-text">
                    <h2>VELURE</h2>
                    <p>"Suavidad, poder, presencia."</p>
                    <p>Velure nació en julio de 2025 con una idea clara: transformar la forma de vivir el lujo automotriz. Desde el primer día, apostamos por una experiencia 100% digital, sofisticada y personalizada, pensada para quienes buscan más que un vehículo. Nuestra especialidad son los autos de alta gama, seleccionados bajo criterios estrictos de calidad, diseño y prestigio internacional. No trabajamos con grandes volúmenes, sino con una colección exclusiva que refleja lo mejor del mundo automotor. Lo que nos diferencia es cómo entendemos a cada cliente: no como un comprador más, sino como parte de un círculo selecto. En Velure, cada detalle, desde la atención hasta la entrega, está pensado para ofrecer elegancia, eficiencia y un servicio impecable. Somos la puerta de entrada a una categoría superior, para quienes ya superaron el estándar y buscan no solo una marca, sino un verdadero símbolo de distinción.</p>
                </div>
            </div>
        </section>

        <footer class="main-footer">
            <img src="img/V.png" alt="Velure Logo" class="footer-logo" />
            <p>Copyright © 2025 Automobili Velure.</p>
            <p>
                <a href="#">Velure</a> | 
                <a href="#">Proyecto de Unidad</a> | 
            </p>
        </footer>
    </div>

    <!-- Iframe para contenido dinámico -->
    <iframe name="contenido" id="iframeContent"></iframe>
</div>

<!-- Scripts Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<script>
    var textoMenu = document.getElementById('textoMenu');
    var menuEntidades = document.getElementById('menuEntidades');
    var contentWrapper = document.getElementById('contentWrapper');

    $('#menuEntidades').on('show.bs.collapse', function () {
        textoMenu.style.display = 'none';
    });
    $('#menuEntidades').on('hide.bs.collapse', function () {
        textoMenu.style.display = '';
    });

    // Función para mostrar el contenido principal (Home)
    function showHome() {
        contentWrapper.classList.remove('iframe-active');
    }

    // Función para mostrar el iframe cuando se navega a otras secciones
    function showIframe() {
        contentWrapper.classList.add('iframe-active');
    }

    // Función para hacer scroll a secciones específicas en el contenido principal
    function scrollToSection(sectionId) {
        const element = document.getElementById(sectionId);
        if (element) {
            element.scrollIntoView({ behavior: 'smooth' });
        }
    }

    // Detectar cuando se carga contenido en el iframe
    document.getElementsByName('contenido')[0].onload = function() {
        showIframe();
    }
</script>
</body>
</html>