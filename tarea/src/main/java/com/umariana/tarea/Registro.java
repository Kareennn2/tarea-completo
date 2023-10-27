package com.umariana.tarea;
import java.io.Serializable;

/**
 *
 * @author Asus
 */
public class Registro implements Serializable{
   //declarar variables 
    private String nombre;
    private String cedula;
    private String contrasenia;

    public Registro() {
    }
    
    

public Registro(String nombre, String cedula, String contrasenia){
        this.nombre = nombre;
        this.cedula = cedula;
        this.contrasenia = contrasenia;
    
    
}

//get para acceder a lo atributos

    public String getNombre() {
        return nombre;
    }

    public String getCedula() {
        return cedula;
    }
    

    public String getContrasenia() {
        return contrasenia;
    }
   
    
    
    
    //set para acceder a los atributoss

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    
    
}
