package com.pastley.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pastley.entity.*;
import com.pastley.util.*;

public class UsuarioDao {
	private Conexion conexion;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;

	///////////////////////////////////////////////////////
	// Builders
	///////////////////////////////////////////////////////
	public UsuarioDao() {
	}
	
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
	// Method
	///////////////////////////////////////////////////////
	/**
	 * 
	 * @return
	 */
	@SuppressWarnings("static-access")
	public List<Rol> roles() {
		List<Rol> roles = new ArrayList<Rol>();
		init("SELECT * FROM rol ORDER BY id");
		try {
			ps = conexion.getConexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Rol rol = new Rol(rs.getString(1), rs.getBoolean(2));
				roles.add(rol);
			}
		} catch (SQLException ex) {
			System.out.println("Error {Metodo: roles, Error: " + ex.getMessage() + "}");
		} catch (Exception ex) {
			System.out.println("Error {Metodo: roles, Error: " + ex.getMessage() + "}");
		} finally {
			try {
				ps.close();
				rs.close();
				conexion.close();
			} catch (Exception ex) {
				System.out.println("Error {Metodo: roles, Error: " + ex.getMessage() + "}");
			}
		}
		return roles;
	} 
	

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
}
