/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.umariana.tarea.Listas;
import com.umariana.tarea.Tareas;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet(name = "SvTareas", urlPatterns = {"/SvTareas"})
public class SvTareas extends HttpServlet {

    private Listas listaTareas;
    
        @Override
    public void init() throws ServletException {
        // Inicializa la lista de tareas al cargar el servlet
        listaTareas = Listas.leerLista(getServletContext());
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        if (tipo != null && tipo.equals("delete")) {
            String idToDelete = request.getParameter("id");
            if (idToDelete != null && !idToDelete.isEmpty()) {
                HttpSession session = request.getSession();
                Listas listaTareas = (Listas) session.getAttribute("listaTareas");

                if (listaTareas != null) {
                    try {
                        int id = Integer.parseInt(idToDelete);
                        listaTareas.eliminarTarea(id);
                        // Guarda la lista actualizada en el archivo
                        Listas.guardarLista(listaTareas, getServletContext());

                        // Agrega un atributo para indicar la eliminación exitosa
                        session.setAttribute("tareaEliminada", true);
                    } catch (NumberFormatException e) {
                        // Maneja la excepción si no se proporciona un ID válido
                        e.printStackTrace();
                    }
                }
            }
        }
        // Después de eliminar una tarea con éxito en tu servlet
        response.sendRedirect("tareas.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    String id = request.getParameter("id");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String fecha = request.getParameter("fecha");
        String posicion = request.getParameter("posicion"); 
        String idAntesDe = request.getParameter("idAntesDe");
        String idDespuesDe = request.getParameter("idDespuesDe"); 

        // Realizar el cast de la fecha
        Date fechaVencimiento = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            fechaVencimiento = dateFormat.parse(fecha);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Tareas nuevaTarea = new Tareas(Integer.parseInt(id), titulo, descripcion, fechaVencimiento);

        HttpSession session = request.getSession();
        Listas listaTareas = (Listas) session.getAttribute("listaTareas");

        if (listaTareas == null) {
            listaTareas = new Listas();
            // Guárdala en la sesión
            session.setAttribute("listaTareas", listaTareas);
        }

        if ("ultimo".equals(posicion)) {
            listaTareas.agregarTareaAlFinal(nuevaTarea);
        } else if ("antesDe".equals(posicion)) {
            if (idAntesDe != null && !idAntesDe.isEmpty()) {
                listaTareas.agregarTareaAntesDe(Integer.parseInt(idAntesDe), nuevaTarea);
            } else {
                listaTareas.agregarTareaAlComienzo(nuevaTarea);
            }
        } else if ("despuesDe".equals(posicion)) {
            if (idDespuesDe != null && !idDespuesDe.isEmpty()) {
                listaTareas.agregarTareaDespuesDe(Integer.parseInt(idDespuesDe), nuevaTarea);
            } else {
                listaTareas.agregarTareaAlFinal(nuevaTarea);
            }
        } else {
            listaTareas.agregarTareaAlComienzo(nuevaTarea);
        }

        Listas.guardarLista(listaTareas, getServletContext());

        response.sendRedirect("tareas.jsp");
    }


    }

