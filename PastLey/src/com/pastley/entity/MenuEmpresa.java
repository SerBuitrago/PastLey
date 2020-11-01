package com.pastley.entity;

import java.io.Serializable;

public class MenuEmpresa implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Menu menu;
	private Empresa empresa;
	
	public MenuEmpresa() {
		
	}
	
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public Empresa getEmpresa() {
		return empresa;
	}
	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
