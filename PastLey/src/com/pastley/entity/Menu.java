package com.pastley.entity;

import java.io.Serializable;

public class Menu implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id;
	private boolean estado;
	private String descripcion;
	private String fecha_registro;
	
	public Menu() {
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getFecha_registro() {
		return fecha_registro;
	}
	public void setFecha_registro(String fecha_registro) {
		this.fecha_registro = fecha_registro;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
