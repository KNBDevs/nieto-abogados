document.addEventListener('DOMContentLoaded', function() {
    const menuBtn = document.getElementById('hamburger-menu');
    const navMenu = document.getElementById('nav-menu');
    const headerMenu = document.querySelector('.headermenu');

    // Evento de click para alternar la clase 'active' en el contenedor del menú
    menuBtn.addEventListener('click', function() {
        headerMenu.classList.toggle('active');
    });

    // Función para cerrar el menú desplegable cuando se redimensiona la ventana
    function closeMenuOnResize() {
        if (window.innerWidth > 768 && headerMenu.classList.contains('active')) {
            headerMenu.classList.remove('active');
        }
    }

    // Evento de redimensionamiento de la ventana
    window.addEventListener('resize', closeMenuOnResize);

    // Función para validar los datos antes de enviar el formulario
    function validarDatosCita() {
        const nombre = document.getElementById('nombre').value;
        const apellido = document.getElementById('apellido').value;
        const email = document.getElementById('email').value;
        const telefono = document.getElementById('telefono').value;
        const fechaCita = document.getElementById('fecha-cita').value;
        const horaCita = document.getElementById('hora-cita').value;

        // Validación de campos obligatorios
        if (!nombre || !apellido || !email || !telefono || !fechaCita || !horaCita) {
            alert('Todos los campos son obligatorios');
            return false; 
        }

        // Validación de formato de correo electrónico
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert('Por favor, ingresa un correo electrónico válido');
            return false; 
        }

        // Validación de formato de número de teléfono
        const telefonoRegex = /^[0-9]+$/;
        if (!telefonoRegex.test(telefono)) {
            alert('Por favor, ingresa un número de teléfono válido');
            return false; 
        }

        // Si pasa todas las validaciones, devuelve true para permitir el envío del formulario
        return true;
    }

});    
    


