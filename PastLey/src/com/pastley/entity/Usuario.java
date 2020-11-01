package com.pastley.entity;

import java.io.Serializable;

/**
 * Implementation Usuario.
 * 
 * @author DeveUp.
 * @phone 3118398189.
 * @email deveup@gmail.com.
 * @version 1.0.0.0.
 */
public class Usuario implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Persona persona;
	private Rol rol;
	private String clave;
	private String ultima_clave;
	private String fecha_sesion;
	private String fecha_ultima_sesion;
	private String ip;
	private boolean estado;
	private int cantidad;
	
	
	///////////////////////////////////////////////////////
	// Builders
	///////////////////////////////////////////////////////
	public Usuario() {
	}
	
	///////////////////////////////////////////////////////
	// Getter and Setters
	///////////////////////////////////////////////////////
	public Persona getPersona() {
		return persona;
	}
	
	public void setPersona(Persona persona) {
		this.persona = persona;
	}
	public Rol getRol() {
		return rol;
	}
	public void setRol(Rol rol) {
		this.rol = rol;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	public String getUltima_clave() {
		return ultima_clave;
	}
	public void setUltima_clave(String ultima_clave) {
		this.ultima_clave = ultima_clave;
	}
	public String getFecha_sesion() {
		return fecha_sesion;
	}
	public void setFecha_sesion(String fecha_sesion) {
		this.fecha_sesion = fecha_sesion;
	}
	public String getFecha_ultima_sesion() {
		return fecha_ultima_sesion;
	}
	public void setFecha_ultima_sesion(String fecha_ultima_sesion) {
		this.fecha_ultima_sesion = fecha_ultima_sesion;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
}
