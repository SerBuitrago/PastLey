package com.pastley.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.pastley.dao.*;

/**
 * Implementation ImagenController.
 * 
 * @author DeveUp.
 * @phone 3118398189.
 * @email deveup@gmail.com.
 * @version 1.0.0.0.
 */
@WebServlet(name = "ImagenController", urlPatterns = { "/fotos" })
public class ImagenController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	///////////////////////////////////////////////////////
	// Builders
	///////////////////////////////////////////////////////
	public ImagenController() {
	}

	///////////////////////////////////////////////////////
	// Methods Servlet
	///////////////////////////////////////////////////////
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("accion");
		switch (accion) {
		case "foto-categoria-menu-inicio": 
			fotoCategoriaMenuInicio(response, request.getParameter("id-foto"));
			break;
		default:
			break;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.processRequest(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.processRequest(request, response);
	}

	///////////////////////////////////////////////////////
	// Methods
	///////////////////////////////////////////////////////
	/**
	 * 
	 * @param response
	 * @param id
	 * @throws IOException
	 */
	public void fotoCategoriaMenuInicio(HttpServletResponse response, String nombre) throws IOException {
		ItemMenuDao dao = new ItemMenuDao();
		response.getOutputStream().write(dao.findPhotoBy(nombre));
	}
}
