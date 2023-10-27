package com.umariana.tarea;

import java.util.Date;

/**
 *
 * @author Asus
 */
public class Tareas {
    
    private int id;
    private String titulo;
    private String descripcion;
    private Date fechaV;
    
    public Tareas(){
        
    }
    
    public Tareas(int id, String titulo, String descripcion, Date fechaV){
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fechaV = fechaV;
    }

    public int getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }


    public Date getFechaV() {
        return fechaV;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


    public void setFechaV(Date fechaV) {
        this.fechaV = fechaV;
    }
    
    
}
