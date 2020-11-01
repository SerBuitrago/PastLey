package com.pastley.entity;

import java.io.Serializable;
import java.util.List;

public class ItemMenu implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String nombre;
	private Menu menu;
	private String icono;
	private String accion;
	private String postaccion;
	private String data;
	private String fecha_registro;
	private boolean estado;
	
	private byte [] foto;
	
	private List<ItemMenu> items;	
	
	
	
	@Override
	public String toString() {
		return "ItemMenu [nombre=" + nombre + ", accion=" + accion + ", postaccion=" + postaccion + ", data=" + data
				+ ", fecha_registro=" + fecha_registro + ", estado=" + estado + "]";
	}

	public ItemMenu() {	
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public String getIcono() {
		return icono;
	}

	public void setIcono(String icono) {
		this.icono = icono;
	}

	public String getAccion() {
		return accion;
	}

	public void setAccion(String accion) {
		this.accion = accion;
	}

	public String getPostaccion() {
		return postaccion;
	}

	public void setPostaccion(String postaccion) {
		this.postaccion = postaccion;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getFecha_registro() {
		return fecha_registro;
	}

	public void setFecha_registro(String fecha_registro) {
		this.fecha_registro = fecha_registro;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public List<ItemMenu> getItems() {
		return items;
	}

	public void setItems(List<ItemMenu> items) {
		this.items = items;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
