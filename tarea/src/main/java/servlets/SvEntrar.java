/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.umariana.tarea.metodos;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Asus
 */
@WebServlet(name = "SvEntrar", urlPatterns = {"/SvEntrar"})
public class SvEntrar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cedula = request.getParameter("cedula");
        String contrasenia = request.getParameter("contrasenia");
        
        String nombreUsuarioV = metodos.LoginUser(cedula, contrasenia, getServletContext());

        if(nombreUsuarioV !=null){
            request.getSession().setAttribute("usuario", nombreUsuarioV);
            response.sendRedirect("tareas.jsp");
        }else{
            response.sendRedirect("index.jsp?alert=error");
        }
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
