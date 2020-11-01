<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

<!-- Font Awasome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" />

<!-- Bootstrap -->
<link rel="stylesheet" href="${url_project}/resources/css/SCKJR.css"
	type="text/css">

<!-- Title -->
<title>PastLey ${title_project}</title>

</head>

<body>
	<div>
		<jsp:useBean id="item_menu_bean"
			class="com.pastley.dao.MenuEmpresaDao" scope="page"></jsp:useBean>
		<c:set var="items_menu_inicio" scope="request"
			value="${item_menu_bean.findBy('122334555ASD',1)}">
		</c:set>

		<c:if test="${items_menu_inicio.size() >0}">
			<!--        -->
			<!-- NAVBAR -->
			<!--        -->
			<nav class="sckjr-navbar-advanced" id="sckjr-navbar-advanced">

				<!--       -->
				<!-- ICONS -->
				<!--       -->
				<div
					class="sckjr-container sckjr-navbar-advanced__container-buttons">
					<button id="sckjr-navbar-advanced__container-buttons-menu"
						class="sckjr-navbar-advanced__container-buttons-menu">
						<i class="fas fa-bars"></i>
					</button>
					<button id="sckjr-navbar-advanced__container-buttons-close"
						class="sckjr-navbar-advanced__container-buttons-close">
						<i class="fas fa-times"></i>
					</button>
				</div>

				<!--       -->
				<!-- ITEMS -->
				<!--       -->
				<div class="sckjr-container sckjr-navbar-advanced__container-links">
					<c:forEach var="item_menu_nivel_1" items="${items_menu_inicio}">
						<c:if
							test="${item_menu_nivel_1.items != null && item_menu_nivel_1.items.size() > 0}">
							<div class="sckjr-navbar-advanced__container-links-advanced"
								id="sckjr-navbar-advanced__container-links-advanced">
								<p>${item_menu_nivel_1.nombre}</p>
								<i class="fas fa-caret-down"></i>
							</div>
						</c:if>
					</c:forEach>
					<div class="sckjr-navbar-advanced__container-links-items">
						<c:forEach var="item_menu_nivel_1" items="${items_menu_inicio}">
							<c:if
								test="${item_menu_nivel_1.items != null && item_menu_nivel_1.items.size() == 0}">
								<a href="${url_project}/${item_menu_nivel_1.accion}">${item_menu_nivel_1.nombre}</a>
							</c:if>
						</c:forEach>
					</div>
				</div>

				<!--           -->
				<!-- CATEGORYS -->
				<!--           -->
				<div class="sckjr-container sckjr-navbar-advanced__container-grid">
					<div class="sckjr-navbar-advanced__container-grid-structure"
						id="sckjr-navbar-advanced__container-grid-structure">
						<div
							class="sckjr-navbar-advanced__container-grid-structure-categories">

							<button
								class="sckjr-navbar-advanced__container-grid-structure-button-return">
								<i class="fas fa-arrow-left"></i> Regresar
							</button>

							<c:forEach var="item_menu_nivel_1" items="${items_menu_inicio}">
								<h3 class="sckjr-subtitle">${item_menu_nivel_1.nombre}</h3>
								<c:if
									test="${item_menu_nivel_1.items != null && item_menu_nivel_1.items.size() > 0}">
									<c:forEach var="item_menu_nivel_2"
										items="${item_menu_nivel_1.items}">
										<a href="${item_menu_nivel_2.accion}"
											data-categoria="${item_menu_nivel_2.data}">
											${item_menu_nivel_2.nombre}<i
											class="${item_menu_nivel_2.icono}"></i>
										</a>
									</c:forEach>
								</c:if>
							</c:forEach>
						</div>

						<!--              -->
						<!-- SUBCATEGORYS -->
						<!--              -->
						<div
							class="sckjr-navbar-advanced__container-grid-structure-container-subcategories">
							<c:forEach var="item_menu_nivel_1" items="${items_menu_inicio}">
								<c:if
									test="${item_menu_nivel_1.items != null && item_menu_nivel_1.items.size() > 0}">
									<c:forEach var="item_menu_nivel_2"
										items="${item_menu_nivel_1.items}">
										<c:if
											test="${item_menu_nivel_2.items != null && item_menu_nivel_2.items.size() > 0}">

											<div
												class="sckjr-navbar-advanced__container-grid-structure-container-subcategories-subcategories "
												data-categoria="${item_menu_nivel_2.data}">

												<div
													class="sckjr-navbar-advanced__container-grid-structure-container-subcategories-subcategories-links">
													<button
														class="sckjr-navbar-advanced__container-grid-structure-button-return">
														<i class="fas fa-arrow-left"></i>Regresar
													</button>
													<h3 class="sckjr-subtitle">${item_menu_nivel_2.nombre}</h3>
													<c:forEach var="item_menu_nivel_3"
														items="${item_menu_nivel_2.items}">
														<a href="${item_menu_nivel_3.accion}">${item_menu_nivel_3.nombre}</a>
													</c:forEach>
												</div>

												<div
													class="sckjr-navbar-advanced__container-grid-structure-container-subcategories-banner">
													<c:forEach var="item_menu_nivel_3" varStatus="index"
														items="${item_menu_nivel_2.items}">
														<c:if test="${index.index == 0}">
															<a href="${item_menu_nivel_3.accion}"> <c:if
																	test="${item_menu_nivel_3.foto != null}">
																	<img
																		src="${url_project}/fotos?accion=foto-categoria-menu-inicio&id-foto=${item_menu_nivel_3.nombre}"
																		alt="Cargando ${item_menu_nivel_3.nombre}">

																</c:if> <c:if test="${item_menu_nivel_3.foto == null}">
																	<img src="${url_project}/resources/img/product.png"
																		alt="Cargando ${item_menu_nivel_3.nombre}">

																</c:if>
															</a>
														</c:if>
													</c:forEach>
												</div>

												<div
													class="sckjr-navbar-advanced__container-grid-structure-container-subcategories-gallery">
													<c:forEach var="item_menu_nivel_3" varStatus="index"
														items="${item_menu_nivel_2.items}">
														<c:if
															test="${index.index > 0 && item_menu_nivel_3.foto != null}">
															<a href="${item_menu_nivel_3.accion}"> <img
																src="${url_project}/fotos?accion=foto-categoria-menu-inicio&id-foto=${item_menu_nivel_3.nombre}"
																alt="Cargando ${item_menu_nivel_3.nombre}">
															</a>
														</c:if>
													</c:forEach>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</nav>
		</c:if>
	</div>