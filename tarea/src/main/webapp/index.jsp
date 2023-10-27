<%@page import="com.umariana.tarea.metodos"%>
<%@page import="com.umariana.tarea.Registro" %>
<%@include file="templates/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso o Registro</title>
    </head>
    <body>
       <section class="background-radial-gradient overflow-hidden">
            
            <style>
    .background-radial-gradient {
      background-color: hsl(218, 41%, 15%);
      background-image: radial-gradient(650px circle at 0% 0%,
          hsl(218, 41%, 35%) 15%,
          hsl(218, 41%, 30%) 35%,
          hsl(218, 41%, 20%) 75%,
          hsl(218, 41%, 19%) 80%,
          transparent 100%),
        radial-gradient(1250px circle at 100% 100%,
          hsl(218, 41%, 45%) 15%,
          hsl(218, 41%, 30%) 35%,
          hsl(218, 41%, 20%) 75%,
          hsl(218, 41%, 19%) 80%,
          transparent 100%);
    }

    #radius-shape-1 {
      height: 220px;
      width: 220px;
      top: -60px;
      left: -130px;
      background: radial-gradient(#44006b, #ad1fff);
      overflow: hidden;
    }

    #radius-shape-2 {
      border-radius: 38% 62% 63% 37% / 70% 33% 67% 30%;
      bottom: -60px;
      right: -110px;
      width: 300px;
      height: 300px;
      background: radial-gradient(#44006b, #ad1fff);
      overflow: hidden;
    }

    .bg-glass {
      background-color: hsla(0, 0%, 100%, 0.9) !important;
      backdrop-filter: saturate(200%) blur(25px);
    }
  </style>
  
  <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
    <div class="row gx-lg-5 align-items-center mb-5">
      <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
        <h1 class="my-5 display-5 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">
           <br />¡Bienvenido a 
          <span style="color: hsl(218, 81%, 75%)">Innovatronix Corp!</span>
        </h1>
        <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
          Somos una empresa dedicada a la innovación y la creatividad. Nuestro compromiso es ofrecer soluciones imaginativas para un mundo lleno de posibilidades. Desde el desarrollo de tecnología de vanguardia hasta la creación de productos innovadores, estamos aquí para inspirar tu imaginación. Esta es nuestra pagina de inicio, ingresa si ya eres parte de nuestra empresa, pero si de lo contrario eres un nuevo empleado, por favor ¡Registrate!. Estamos mejorando cada vez mas por tu buen servicio .
        </p>
      </div>

      <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
        <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
        <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

        <div class="card bg-glass">
          <div class="card-body px-4 py-5 px-md-5 " style="background-color: hsl(218, 41%, 15%); color: hsl(218, 81%, 75);">
            <form id="loginForm" action="SvEntrar" method="POST">
                <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;" id="errorAlert">
                     Datos incorrectos o usuario no existente. Vuelva a intentarlo.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-success alert-dismissible fade show" role="alert" style="display: none;" id="registroSuccessAlert">
                    ¡Registro exitoso! El usuario se añadio al sistema.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>


                <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;" id="registroErrorAlert">
                    La cedula ingresada ya esta registrada a un usuario existente. Vuelva a intentarlo con otro numero de cedula.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div style="text-align: center; " >
                    <h2  style="color: hsl(218, 81%, 75%)">Inicia Sesión</h2>
                </div>
                <!-- Usuario input -->
                <div class="form-outline mb-4">
                    <label for="cedula" class="form-label"  style="color: hsl(218, 81%, 75%)">Cedula: </label>
                    <input type="text" class="form-control" name="cedula" required><br>
                </div>
                <!-- Password input -->
                <div class="form-outline mb-4">
                    <label for="contrasenia" class="form-label"  style="color: hsl(218, 81%, 75%)">Contraseña: </label>
                    <input type="password" class="form-control" name="contrasenia" required><br>
                </div>
                <div class="text-center">
                    <br><button type="submit" class="btn btn-success" style="background-color: hsl(218, 81%, 75%); color: white; border: white ">Iniciar sesión</button><!-- Submit button -->
                    <p style="color: white;">O</P><!-- comment -->
                    <button id="openRegistrationModalBtn" class="btn btn-primary" type="button">Registrarse</button>
                </div>
</form>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    </body>
<section class="background-radial-gradient overflow-hidden">
  <style>
  /* Estilo del botón de "Registrarse" */
  #openRegistrationModalBtn {
    background-color: hsl(218, 81%, 75%);
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-family: 'Segoe UI', sans-serif;
    font-size: 16px;
  }

  /* Estilo del modal */
  #registrationModal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 1000;
    text-align: center;
  }


  .modal-content {
    background-color: hsl(218, 41%, 15%);
    margin: 10% auto;
    padding: 20px;
    border-radius: 10px;
    width: 70%;
    max-width: 400px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
  }

  .modal-content h2 {
    color: hsl(218, 81%, 75%);
  }

  /* Estilo del botón "Cerrar" en el modal */
  .close {
     position: absolute;
    top: 10px;
    right: 10px;
    font-size: 24px;
    color: hsl(218, 41%, 35%);
    cursor: pointer;
  }
</style>


  <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
    <!-- ... Contenido existente ... -->

    <!-- Modal de Registro -->
    <div id="registrationModal" class="modal">
      <div class="modal-content" style="background-color: hsl(218, 41%, 15%); color: hsl(218, 81%, 75);">
        <span class="close" id="closeModalBtn" style="color: hsl(218, 41%, 35);">&times;</span>
        <h2 style="color: hsl(218, 81%, 75);">Registro</h2>
                <h1 style="color: hsl(218, 81%, 75);">Ingrese sus datos</h1>

        <form id="registrationForm" action="SvIngresar" method="POST">
          <label for="nombre"  class="form-label" style="color: white;">Nombre:</label>
          <input type="text" class="form-control"  name="nombre" aria-describedby="basic-addon1" required><br>
          <div id="nombre" class="form-text" ></div>
          
          <label for="cedula" class="form-label"style="color: white;">Cedula:</label>
          <input type="text" class="form-control" name="cedula" required><br>
          <div id="cedula" class="campo-input"></div>

          <label for="contrasenia" class="form-label" style="color: white;">Contraseña:</label>
          <input type="password" class="form-control" name="contrasenia" required><br>
      
          <input type="submit" value="Registrar"style="background-color: hsl(218, 41%, 15%); color: hsl(218, 81%, 75%)">
        </form>
      </div>
       
    </div>
    
    <!-- Fin del Modal de Registro -->
  </div>
</section>
    
<%@include file="templates/footer.jsp" %>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    // Obtén referencias a los elementos HTML
    const openRegistrationModalBtn = document.getElementById('openRegistrationModalBtn');
    const registrationModal = document.getElementById('registrationModal');
    const closeModalBtn = document.getElementById('closeModalBtn');
    // Abre el modal de registro cuando se hace clic en el botón "Registrarse"
    openRegistrationModalBtn.addEventListener('click', () => {
      registrationModal.style.display = 'block';
    });
      // Cierra el modal cuando se hace clic en la "x"
    closeModalBtn.addEventListener('click', () => {
    registrationModal.style.display = 'none';
  });
  });
</script>
<script>
// se agrega un botón "Registro" para abrir el modal:
  const openModalBtn = document.createElement('button');
  openModalBtn.textContent = 'Registro';
  openModalBtn.addEventListener('click', () => {
    registrationModal.style.display = 'block';
  });

  // Agrega el botón "Registro" donde desees en tu página
  const registrationButtonContainer = document.getElementById('registrationButtonContainer');
  registrationButtonContainer.appendChild(openModalBtn);
</script>
<!-- JavaScript para mostrar la alerta cuando falle el proceso de Ingresar -->
<script>
    // JavaScript para mostrar la alerta cuando sea necesario
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const errorAlert = document.getElementById('errorAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=error')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'error') {
            // Muestra la alerta si el parámetro de alerta es 'error'
            errorAlert.style.display = 'block';
        }
    });
</script>

<!-- JavaScript para mostrar la alerta de registro cuando exista una cedula previamente registrada -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const registroErrorAlert = document.getElementById('registroErrorAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=registro-error')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'registro-error') {
            // Muestra la alerta de registro si el parámetro de alerta es 'registro-error'
            registroErrorAlert.style.display = 'block';
        }
    });
</script>

<!-- JavaScript para mostrar la alerta de registro exitoso cuando sea necesario -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const registroSuccessAlert = document.getElementById('registroSuccessAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=registro-success')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'registro-success') {
            // Muestra la alerta de registro exitoso si el parámetro de alerta es 'registro-success'
            registroSuccessAlert.style.display = 'block';
        }
    });
</script>