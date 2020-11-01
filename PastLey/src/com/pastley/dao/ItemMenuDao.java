package com.pastley.dao;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pastley.entity.*;
import com.pastley.util.Conexion;

/**
 * Implementation ItemMenuDao.
 * 
 * @author DeveUp.
 * @phone 3118398189.
 * @email deveup@gmail.com.
 * @version 1.0.0.0.
 */
public class ItemMenuDao extends GenericDao implements Serializable {

	private static final long serialVersionUID = 1L;

	private List<ItemMenu> items;

	///////////////////////////////////////////////////////
	// Builders
	///////////////////////////////////////////////////////
	public ItemMenuDao() {
		super();
	}

	///////////////////////////////////////////////////////
	// Method
	///////////////////////////////////////////////////////
	/**
	 * 
	 * @param menu
	 * @return
	 */
	@SuppressWarnings("static-access")
	public List<ItemMenu> list(int menu) {
		this.items = new ArrayList<ItemMenu>();
		init("SELECT * FROM item_menu WHERE menu = " + menu + " ORDER BY fecha_registro");
		try {
			ps = conexion.getConexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ItemMenu item = new ItemMenu();
				item.setNombre(rs.getString(1));
				item.setMenu(new Menu());
				item.getMenu().setId(rs.getInt(2));
				item.setIcono(rs.getString(4));
				item.setItems(listItems(item.getNombre()));
				item.setAccion(rs.getString(5));
				item.setPostaccion(rs.getString(6));
				item.setData(rs.getString(7));
				item.setFecha_registro(rs.getString(8));
				item.setEstado(rs.getBoolean(9));
				item.setFoto(rs.getBytes(10));
				this.items.add(item);
			}
		} catch (SQLException ex) {
			System.out.println("Error ItemMenuDao {Metodo 1: list(int menu), Error: " + ex.getMessage() + "}");
		} catch (Exception ex) {
			System.out.println("Error ItemMenuDao {Metodo 2: list(int menu), Error: " + ex.getMessage() + "}");
		} finally {
			try {
				ps.close();
				rs.close();
				conexion.close();
			} catch (Exception ex) {
				System.out.println("Error ItemMenuDao {Metodo 3: list(int menu), Error: " + ex.getMessage() + "}");
			}
		}
		return items;
	}

	/**
	 * 
	 * @param nombre
	 * @return
	 */
	@SuppressWarnings("static-access")
	public byte[] findPhotoBy(String nombre) {
		byte[] foto = null;
		init("SELECT foto FROM item_menu WHERE nombre='" + nombre + "'");
		try {
			ps = conexion.getConexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				foto = rs.getBytes(1);
			}
			foto = readPhoto(foto);
		} catch (SQLException ex) {
			System.out.println(
					"Error ItemMenuDao {Metodo 1: findPhotoBy(String nombre), Error: " + ex.getMessage() + "}");
		} catch (Exception ex) {
			System.out.println(
					"Error ItemMenuDao {Metodo 2: findPhotoBy(String nombre), Error: " + ex.getMessage() + "}");
		} finally {
			try {
				ps.close();
				rs.close();
				conexion.close();
			} catch (Exception ex) {
				System.out.println(
						"Error ItemMenuDao {Metodo 3: findPhotoBy(String nombre), Error: " + ex.getMessage() + "}");
			}
		}
		return foto;
	}

	///////////////////////////////////////////////////////
	// Method Private
	///////////////////////////////////////////////////////
	/**
	 * 
	 * @return
	 * @throws IOException
	 */
	private byte[] readPhoto(byte[] foto) throws IOException {
		byte[] aux = null;
		InputStream bos = new ByteArrayInputStream(foto);
		int size = bos.available();
		byte[] datosIMAGEN = new byte[size];
		bos.read(datosIMAGEN, 0, size);
		aux = datosIMAGEN;
		bos.close();
		return aux;
	}

	/**
	 * 
	 * @param item
	 * @return
	 */
	@SuppressWarnings("static-access")
	private List<ItemMenu> listItems(String item) {
		List<ItemMenu> aux = new ArrayList<ItemMenu>();
		if (item != null) {
			Conexion conexion = new Conexion();
			PreparedStatement ps = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM item_menu WHERE submenu='" + item + "' ORDER BY fecha_registro";
			try {
				ps = conexion.getConexion().prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					ItemMenu i = new ItemMenu();
					i.setNombre(rs.getString(1));
					i.setMenu(new Menu());
					i.getMenu().setId(rs.getInt(2));
					i.setItems(listItemsSubMenu(i.getNombre()));
					i.setIcono(rs.getString(4));
					i.setAccion(rs.getString(5));
					i.setPostaccion(rs.getString(6));
					i.setData(rs.getString(7));
					i.setFecha_registro(rs.getString(8));
					i.setEstado(rs.getBoolean(9));
					i.setFoto(rs.getBytes(10));
					aux.add(i);
				}
			} catch (SQLException ex) {
				System.out.println(
						"Error ItemMenuDao {Metodo 1: listItems(String item), Error: " + ex.getMessage() + "}");
			} catch (Exception ex) {
				System.out.println(
						"Error ItemMenuDao {Metodo 2: listItems(String item), Error: " + ex.getMessage() + "}");
			} finally {
				try {
					ps.close();
					rs.close();
					conexion.close();
				} catch (Exception ex) {
					System.out.println(
							"Error ItemMenuDao {Metodo 3: listItems(String item), Error: " + ex.getMessage() + "}");
				}
			}
		}
		return aux;
	}

	/**
	 * 
	 * @param item
	 * @return
	 */
	@SuppressWarnings("static-access")
	private List<ItemMenu> listItemsSubMenu(String item) {
		List<ItemMenu> aux = new ArrayList<ItemMenu>();
		if (item != null) {
			Conexion conexion = new Conexion();
			PreparedStatement ps = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM item_menu WHERE submenu='" + item + "' ORDER BY fecha_registro";
			try {
				ps = conexion.getConexion().prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					ItemMenu i = new ItemMenu();
					i.setNombre(rs.getString(1));
					i.setMenu(new Menu());
					i.getMenu().setId(rs.getInt(2));
					i.setIcono(rs.getString(4));
					i.setAccion(rs.getString(5));
					i.setPostaccion(rs.getString(6));
					i.setData(rs.getString(7));
					i.setFecha_registro(rs.getString(8));
					i.setEstado(rs.getBoolean(9));
					i.setFoto(rs.getBytes(10));
					aux.add(i);
				}
			} catch (SQLException ex) {
				System.out.println(
						"Error ItemMenuDao {Metodo 1: listItemsSubMenu(String item), Error: " + ex.getMessage() + "}");
			} catch (Exception ex) {
				System.out.println(
						"Error ItemMenuDao {Metodo 2: listItemsSubMenu(String item), Error: " + ex.getMessage() + "}");
			} finally {
				try {
					ps.close();
					rs.close();
					conexion.close();
				} catch (Exception ex) {
					System.out.println("Error ItemMenuDao {Metodo 3: listItemsSubMenu(String item), Error: "
							+ ex.getMessage() + "}");
				}
			}
		}
		return aux;
	}

	///////////////////////////////////////////////////////
	// Getter and Setters
	///////////////////////////////////////////////////////
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
