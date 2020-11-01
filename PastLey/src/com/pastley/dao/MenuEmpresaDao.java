package com.pastley.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pastley.entity.*;

/**
 * Implementation MenuEmpresaDao.
 * 
 * @author DeveUp.
 * @phone 3118398189.
 * @email deveup@gmail.com.
 * @version 1.0.0.0.
 */
public class MenuEmpresaDao extends GenericDao implements Serializable {

	private static final long serialVersionUID = 1L;

	private MenuEmpresa menu_empresa;

	public MenuEmpresaDao() {
		super();
	}

	/**
	 * 
	 * @param empresa
	 * @param menu
	 * @return
	 */
	@SuppressWarnings("static-access")
	public List<ItemMenu> findBy(String empresa, int menu) {
		ItemMenuDao dao = new ItemMenuDao();
		init("SELECT * FROM menu_empresa WHERE empresa='" + empresa + "' AND menu=" + menu);
		try {
			ps = conexion.getConexion().prepareStatement(sql);
			rs = ps.executeQuery();
			this.menu_empresa = null;
			while (rs.next()) {
				this.menu_empresa = new MenuEmpresa();
				menu_empresa.setEmpresa(new Empresa());
				menu_empresa.getEmpresa().setNombre(rs.getString(1));
				menu_empresa.setMenu(new Menu());
				menu_empresa.getMenu().setId(rs.getInt(2));
			}
			if (this.menu_empresa != null) {
				return dao.list(menu_empresa.getMenu().getId());
			}
		} catch (SQLException ex) {
			System.out.println("Error MenuEmpresaDao {Metodo 1: findBy, Error: " + ex.getMessage() + "}");
		} catch (Exception ex) {
			System.out.println("Error MenuEmpresaDao {Metodo 2: findBy, Error: " + ex.getMessage() + "}");
		} finally {
			try {
				ps.close();
				rs.close();
				conexion.close();
			} catch (Exception ex) {
				System.out.println("Error MenuEmpresaDao {Metodo 3: findBy, Error: " + ex.getMessage() + "}");
			}
		}
		return new ArrayList<ItemMenu>();
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public MenuEmpresa getMenu_empresa() {
		return menu_empresa;
	}

	public void setMenu_empresa(MenuEmpresa menu_empresa) {
		this.menu_empresa = menu_empresa;
	}
}
