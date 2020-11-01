package com.pastley.entity;

import java.io.Serializable;

public class Empresa implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String nit;
	private String nombre;
	private byte[] logo;
	private byte[] portada;
	private String descripcion;
	private boolean estado;
	private String fecha_registro;
	
	public Empresa() {	
	}
	
	public String getNit() {
		return nit;
	}
	public void setNit(String nit) {
		this.nit = nit;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public byte[] getLogo() {
		return logo;
	}
	public void setLogo(byte[] logo) {
		this.logo = logo;
	}
	public byte[] getPortada() {
		return portada;
	}
	public void setPortada(byte[] portada) {
		this.portada = portada;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
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
