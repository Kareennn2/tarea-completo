package servlets;
import com.umariana.tarea.Registro;
import com.umariana.tarea.metodos;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvIngresar", urlPatterns = {"/SvIngresar"})
public class SvIngresar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre  = request.getParameter("nombre");
        String cedula = request.getParameter("cedula");
        String contrasenia = request.getParameter("contrasenia");
        
        ArrayList<Registro> mUsuario = metodos.cargarUsuarios(getServletContext());
       
        
        boolean cedulaCreada = false;
        for(Registro usuario : mUsuario){
            if(usuario.getCedula().equals(cedula)){
                cedulaCreada = true;
                break;
            }
        }
        if (cedulaCreada){
            response.sendRedirect("index.jsp?alert=registro-error");
        }else{
            Registro nuevoRegistro = new Registro();
            nuevoRegistro.setNombre(nombre);
            nuevoRegistro.setCedula(cedula);
            nuevoRegistro.setContrasenia(contrasenia);
            
            mUsuario.add(nuevoRegistro);
            
            metodos.guardarUsuarios(mUsuario, getServletContext());
            
            response.sendRedirect("index.jsp?alert=registro-success");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
