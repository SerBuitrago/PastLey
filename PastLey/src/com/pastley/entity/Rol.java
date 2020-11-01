package com.pastley.entity;

import java.io.Serializable;

/**
 * Implementation Rol.
 * 
 * @author DeveUp.
 * @phone 3118398189.
 * @email deveup@gmail.com.
 * @version 1.0.0.0.
 */
public class Rol implements Serializable {

	private static final long serialVersionUID = 1L;

	private String nombre;
	private boolean estado;

	///////////////////////////////////////////////////////
	// Builders
	///////////////////////////////////////////////////////
	public Rol() {

	}

	public Rol(String nombre,boolean estado) {
		super();
		this.nombre = nombre;;
		this.estado = estado;
	}

	///////////////////////////////////////////////////////
	// Method
	///////////////////////////////////////////////////////
	@Override
	public String toString() {
		return "Rol [ nombre=" + nombre + ", estado=" + estado + "]";
	}

	///////////////////////////////////////////////////////
	// Getter and Setters
	///////////////////////////////////////////////////////
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
}
