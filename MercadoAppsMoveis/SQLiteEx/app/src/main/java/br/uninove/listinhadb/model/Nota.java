package br.uninove.listinhadb.model;


import java.io.Serializable;

public class Nota implements Serializable {
    private int id;
    private String titulo;
    private String texto;

    public Nota(int id, String titulo, String texto){
        this.id = id;
        this.titulo = titulo;
        this.texto = texto;
    }

    public Nota(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    @Override
    public String toString(){
        return this.titulo;
    }


}
