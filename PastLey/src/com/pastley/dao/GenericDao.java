package com.pastley.dao;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pastley.util.Conexion;

/**
 * Implementation GenericDao.
 * 
 * @author DeveUp.
 * @phone 3118398189.
 * @email deveup@gmail.com.
 * @version 1.0.0.0.
 */
public class GenericDao implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	protected Conexion conexion;
	protected PreparedStatement ps;
	protected ResultSet rs;
	protected String sql;

	///////////////////////////////////////////////////////
	// Init
	///////////////////////////////////////////////////////
	/**
	 * Metodo que inicializa los parametros.
	 */
	public void init(String sql) {
		this.conexion = new Conexion();
		this.ps = null;
		this.rs = null;
		this.sql = sql;
	}
	
	///////////////////////////////////////////////////////
	// Getter and Setters
	///////////////////////////////////////////////////////
	public Conexion getConexion() {
		return conexion;
	}

	public void setConexion(Conexion conexion) {
		this.conexion = conexion;
	}

	public PreparedStatement getPs() {
		return ps;
	}

	public void setPs(PreparedStatement ps) {
		this.ps = ps;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
