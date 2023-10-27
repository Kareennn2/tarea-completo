package com.umariana.tarea;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author Asus
 */
public class metodos {

    private static ArrayList<Registro> registros = new ArrayList<>();
    
    
    public static void guardarUsuarios( ArrayList<Registro> registra, ServletContext contexto)throws IOException{
        String relativePath = "/data/usuarios.txt";
        String absPath = contexto.getRealPath(relativePath);

        try (BufferedWriter write = new BufferedWriter(new FileWriter(absPath, true))) {
            for(Registro regis : registra){
                String linea = regis.getNombre() + ","
                        + regis.getCedula()+ ","
                        + regis.getContrasenia();
                write.write(linea);
                write.newLine();
            }
            System.out.println("Datos de usuarios guardados exitosamente en: usuarios.txt");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al guardar los datos de usuarios: " + e.getMessage());
        }
    }
    public static ArrayList<Registro> cargarUsuarios(ServletContext contexto)throws IOException{
        ArrayList<Registro> darUsuarios = new ArrayList<>();
        
        String relativePath = "/data/usuarios.txt";
        String absPath = contexto.getRealPath(relativePath);
        
        try (BufferedReader read = new BufferedReader (new FileReader(absPath))){
            String linea = read.readLine(); 
            while (linea !=null){
                String [] data = linea.split(",");
                if(data.length == 3) {
                    String nombre = data[0];
                    String cedula = data[1];
                    String contrasenia = data[2];
                    
                    Registro nuevoRegistro = new Registro();
                    nuevoRegistro.setNombre(nombre);
                    nuevoRegistro.setCedula(cedula);
                    nuevoRegistro.setContrasenia(contrasenia);
                    
                    darUsuarios.add(nuevoRegistro);
                } else {
                    System.out.println("No contiene datos: "+ linea);
                }
                linea=read.readLine();
            }
            System.out.println("Datos de usuarios cargados exitosamente desde: usuarios.txt");
        }catch (IOException e){
            e.printStackTrace();
            System.out.println("Error al cargar los datos : " + e.getMessage());

        }
        return darUsuarios;
    }

    
public static String LoginUser(String cedula, String contrasenia, ServletContext contexto)throws IOException{
 
    ArrayList<Registro> users = cargarUsuarios(contexto);
    
    for (Registro usuario : users ){
        if (usuario.getCedula().equals(cedula) && usuario.getContrasenia().equals(contrasenia)){
            return usuario.getNombre();
        }
    }
        return null;
}
}
    

