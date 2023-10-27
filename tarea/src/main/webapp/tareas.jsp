<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.umariana.tarea.Listas"%>
<%@page import="com.umariana.tarea.metodos" %>
<%@page import="com.umariana.tarea.Registro" %>

<%@include file="templates/header.jsp" %>
<%@include file="templates/navbar.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>Tareas</title>
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
        .white-table {
    background-color: white;
}
    </style>
</head>

<body class="background-radial-gradient bg-glass">
<p> Bienvenido <%= session.getAttribute("usuario")%> / <a href="index.jsp">Cerrar sesion</a></p>
 <div class="container p-4"> <!-- clase contenedora -->
     
    <div class="row">
        <div class="col-md-4">  <!-- clase division por 4 columnas -->
            <div class="card card-body"> 
                <!-- tarjeta de trabajo -->
                <h3>Inserta tu tarea</h3>
                <form action="SvTareas" method="POST">     
                    
                    <!-- Input para el id-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="id">Id:</label>
                        <input type="text" name ="id" class="form-control">
                    </div>                                            
                    <!-- Input para el titulo-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="titulo">Titulo:</label>
                        <input type="text" name="titulo" class="form-control">
                    </div>
                    <!-- Input para la descripcion-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="descripcion">Descripcion:</label>
                        <Textarea type="text" name="descripcion" class="form-control"  ></textarea>
                    </div>
                      <!-- Input para la fecha-->                   
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="fecha">Fecha:</label>
                        <input type="date" name="fecha" class="form-control">
                    </div>
                      
                    <!-- Radio buttons -->
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="posicion" id="primeroRadio" value="primero">
                            <label class="form-check-label" for="primeroRadio">
                                Primero en la lista
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="posicion" id="ultimoRadio" value="ultimo">
                            <label class="form-check-label" for="ultimoRadio">
                                Ultimo en la lista
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="posicion" id="antesDeRadio" value="antesDe">
                            <label class="form-check-label" for="antesDeRadio">
                                Antes de Tarea con ID:
                            </label>
                            <input type="text" name="idAntesDe" id="idAntesDe" placeholder="ID">
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="posicion" id="despuesDeRadio" value="despuesDe">
                            <label class="form-check-label" for="despuesDeRadio">
                                Después de Tarea con ID:
                            </label>
                            <input type="text" name="idDespuesDe" id="idDespuesDe" placeholder="ID">
                        </div>


                     <button type="submit" class="btn btn-primary">Agregar Tarea</button>
                </form><br>
            </div>    
        </div> 
        
        <!-- Tabla de datos -->
        <div class="col-md-8">
            <table class="table white-table table-bordered table-dark">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Titulo</th>
                        <th>Descripcion</th>
                        <th>Fecha</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Listas listaT = (Listas) session.getAttribute("listaTareas");

                        if (listaT != null) {
                            Listas.Nodo current = listaT.inicio;
                            while (current != null) {
                    %>
                        <tr>
                            <td><%= current.tarea.getId()%></td>
                            <td><%= current.tarea.getTitulo()%></td>
                            <td><%= current.tarea.getDescripcion()%></td>
                            <td><%= new SimpleDateFormat("yyyy-MM-dd").format(current.tarea.getFechaV())%></td>
                            <td>
                            <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editarModal"
                               data-id="<%= current.tarea.getId()%>"
                               data-titulo="<%= current.tarea.getTitulo()%>"
                               data-descripcion="<%= current.tarea.getDescripcion()%>"
                               data-fecha="<%= new SimpleDateFormat("yyyy-MM-dd").format(current.tarea.getFechaV())%>">
                                <i class="fas fa-pencil-alt"></i>
                            </a>

                            <a href="#" class="btn btn-danger" onclick="eliminarTarea(<%= current.tarea.getId()%>)"><i class="fas fa-trash-alt"></i></a>

                        </td>
                        </tr>
                    <%
                                current = current.siguiente;
                            }
                        } else {
                            out.println("No hay tareas disponibles.");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>  
</div>  
</body>
<%@include file="templates/footer.jsp" %>
<!-- Funcion que oculta los radio button mientras la lista este vacia -->
<script>
    // Obtén los elementos relevantes del documento HTML
    var antesDeRadio = document.getElementById("antesDeRadio");
    var despuesDeRadio = document.getElementById("despuesDeRadio");
    var idModal = new bootstrap.Modal(document.getElementById("idModal"), {
        keyboard: false,
        backdrop: "static"
    });
    var idIngresada = document.getElementById("idIngresada");
    var confirmarBtn = document.getElementById("confirmarBtn");

// Agrega un evento de cambio al radio button "Después de Tarea con ID"
    antesDeRadio.addEventListener("change", function () {
        if (this.checked) {
            // Cuando se selecciona esta opción, se muestra el cuadro de diálogo modal
            // y se limpia el campo de entrada de ID (idIngresada)
            idIngresada.value = "";
            idModal.show();

            // Configura un evento de clic para el botón "Confirmar" en el cuadro de diálogo
            confirmarBtn.onclick = function () {
                // Cuando se hace clic en "Confirmar", la ID ingresada se asigna al campo "idAntesDe"
                document.getElementById("idAntesDe").value = idIngresada.value;
                idModal.hide(); // Se oculta el cuadro de diálogo
            };
        }
    });

// Agrega un evento de cambio al radio button "Antes de Tarea con ID"
    despuesDeRadio.addEventListener("change", function () {
        if (this.checked) {
            // Cuando se selecciona esta opción, se muestra el cuadro de diálogo modal
            // y se limpia el campo de entrada de ID (idIngresada)
            idIngresada.value = "";
            idModal.show();

            // Configura un evento de clic para el botón "Confirmar" en el cuadro de diálogo
            confirmarBtn.onclick = function () {
                // Cuando se hace clic en "Confirmar", la ID ingresada se asigna al campo "idDespuesDe"
                document.getElementById("idDespuesDe").value = idIngresada.value;
                idModal.hide(); // Se oculta el cuadro de diálogo
            };
        }
    });
</script>
<script>
    function showTareaDetails(id, titulo, descripcion, fecha) {
        var modal = $('#tareaModal');
        modal.find('#tarea-id').text(id);
        modal.find('#tarea-titulo').text(titulo);
        modal.find('#tarea-descripcion').text(descripcion);
        modal.find('#tarea-fecha').text(fecha);
    }
</script>
<!-- Ventana Modal para Editar Tarea -->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editarModalLabel">Editar Tarea</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="SvEditar" method="POST">
                    <!-- Campo oculto para almacenar el ID de la tarea -->
                    <input type="hidden" name="id" id="editar-tarea-id" value="">
                    <!-- Input para editar el título -->
                    <div class="mb-3">
                        <label for="titulo" class="form-label">Título</label>
                        <input type="text" class="form-control" id="editar-tarea-titulo" name="titulo">
                    </div>
                    <!-- Input para editar la descripción -->
                    <div class="mb-3">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <textarea class="form-control" id="editar-tarea-descripcion" name="descripcion"></textarea>
                    </div>
                    <!-- Input para editar la fecha -->
                    <div class="mb-3">
                        <label for="fecha" class="form-label">Fecha</label>
                        <input type="date" class="form-control" id="editar-tarea-fecha" name="fecha">
                    </div>
                    <!-- Botón para guardar cambios -->
                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<script>
    $('#editarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que desencadenó el evento
        var id = button.data('id'); // Obtén el ID de la tarea
        var titulo = button.data('titulo'); // Obtén el título de la tarea
        var descripcion = button.data('descripcion'); // Obtén la descripción de la tarea
        var fecha = button.data('fecha'); // Obtén la fecha de la tarea

        // Rellena los campos del formulario de edición con los datos de la tarea
        $('#editar-tarea-id').val(id);
        $('#editar-tarea-titulo').val(titulo);
        $('#editar-tarea-descripcion').val(descripcion);
        $('#editar-tarea-fecha').val(fecha);
    });
</script>
<script>
    function eliminarTarea(id) {
        if (confirm("¿Desea eliminar la tarea?")) {
            // Si se confirma la eliminación, redirige al servlet para eliminar la tarea
            location.href = "SvTareas?tipo=delete&id=" + id;
        }
    }
</script>

<%
    Listas lista = (Listas) session.getAttribute("listaTareas");
    boolean listaVacia = (lista == null) || lista.verificarContenido();
%>
<script>
    var listaVacia = <%= listaVacia %>;
    var radios = document.querySelectorAll(".form-check-input");
    var labels = document.querySelectorAll(".form-check-label");
    var idAntesDeInput = document.getElementById("idAntesDe");
    var idDespuesDeInput = document.getElementById("idDespuesDe");

    if (listaVacia) {
        radios.forEach(function(radio) {
            radio.style.display = "none";
        });
        labels.forEach(function(label) {
            label.style.display = "none";
        });
        idAntesDeInput.style.display = "none";
        idDespuesDeInput.style.display = "none";
    } else {
        radios.forEach(function(radio) {
            radio.style.display = "block";
        });
        labels.forEach(function(label) {
            label.style.display = "block";
        });
        idAntesDeInput.style.display = "block";
        idDespuesDeInput.style.display = "block";
    }
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var form = document.querySelector("form"); // Selecciona el formulario

        form.addEventListener("submit", function (event) {
            var radios = document.querySelectorAll(".form-check-input");
            var idAntesDeInput = document.getElementById("idAntesDe");
            var idDespuesDeInput = document.getElementById("idDespuesDe");

            if (radios[0].checked) {
                // Si "Primero en la lista" está seleccionado, establece el valor "primero" en el formulario
                form.action = "SvTareas?method=agregarTareaAlComienzo";
            } else if (radios[1].checked) {
                // Si "Ultimo en la lista" está seleccionado, establece el valor "ultimo" en el formulario
                form.action = "SvTareas?method=agregarTareaAlFinal";
            } else if (radios[2].checked) {
                // Si "Antes de" está seleccionado, establece el valor "antesDe" en el formulario
                form.action = "SvTareas?method=agregarTareaAntesDe&id=" + idAntesDeInput.value;
            } else if (radios[3].checked) {
                // Si "Después de" está seleccionado, establece el valor "despuesDe" en el formulario
                form.action = "SvTareas?method=agregarTareaDespuesDe&id=" + idDespuesDeInput.value;
            } else {
                // Si ninguno de los radio buttons está seleccionado, se agrega al comienzo por defecto
                form.action = "SvTareas?method=agregarTareaAlComienzo";
            }
        });
    });
</script>