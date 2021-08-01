<%@ taglib uri="/WEB-INF/i18ntag.tld" prefix="i18n"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.ModelChiTietSanPham"%>
<%@ page import="dao.DaoChiTietSanPham"%>
<%@ page import="dao.DaoKhachHang"%>
<%@ page import="model.ModelKhachHang"%>
<%@ page import="dao.DaoDanhMucSanPham"%>
<%@ page import="model.ModelDanhMucSanPham"%>

<jsp:useBean id="spList" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="spListdm" class="java.util.ArrayList" scope="request" />

<html>
<head>
<title>Bootstrap</title>
<link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js"></script>
<script src="./bootstrap/popper.min.js"></script>
<script src="./bootstrap/bootstrap.min.js"></script>

<script>
	var masID_ = "masLayer_";
	$(document).ready(function() {			
			
		document.addEventListener("keydown", (e) => {
		    console.log("Escape key is pressed say hi \n");
		    $("#update_pop-up").fadeOut(500);
			var layer = document.getElementById(masID_);
			document.body.removeChild(layer);
		});
		
		$("#close_button").click(function() {
			$("#update_pop-up").fadeOut(500);
			var layer = document.getElementById(masID_);
			document.body.removeChild(layer);
		});
		

		
		$("#update_pơpup").click(function() {
			$("#update_pop-up").animate({left: '630px', top: '100px'});
			$("#update_pop-up").slideDown(500);
			$("#update_pop-up").css("z-index", "1000");
			
			var layer = document.createElement("div");
			layer.setAttribute("id", masID_);
			$(layer).css("position", "absolute");
			$(layer).animate({left: '0px', top: '0px'});
			$(layer).css("width", "100%");
			$(layer).css("height", "100%");
			$(layer).css("background-color", "gray");
			$(layer).css("z-index", "500");
			$(layer).css("opacity", "0.25");
			document.body.append(layer);
		});		
	});
</script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
	<div class="container text-uppercase" style="margin: 10px 0px">Lá»p
		Java18</div>

	<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top">
		<a class="navbar-brand" href="#">Logo</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbMenu" aria-expanded="true">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbMenu">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a href="#" class="nav-link"><i18n:i18ntag>index.menu.homepage</i18n:i18ntag></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle " id="" data-toggle="dropdown"><i18n:i18ntag>index.menu.products</i18n:i18ntag></a>
					<div class="dropdown-menu">
						<a href="./daoDanhMucAction?DanhMucSP=dm" class="dropdown-item">Danh
							muc SP</a>
					</div></li>

				<li class="nav-item"><a href="#" class="nav-link"><i18n:i18ntag>index.menu.order</i18n:i18ntag></a></li>
				<li class="nav-item dropdown"><a href="#"
					class="nav-link dropdown-toggle" id="" data-toggle="dropdown"><i18n:i18ntag>index.menu.admin.admin</i18n:i18ntag></a>
					<div class="dropdown-menu">
						<a href="#" class="dropdown-item"><i18n:i18ntag>index.menu.admin.user</i18n:i18ntag></a>
						<a href="#" class="dropdown-item"><i18n:i18ntag>index.menu.admin.category</i18n:i18ntag></a>
						<a href="#" class="dropdown-item"><i18n:i18ntag>index.proTable.provider</i18n:i18ntag></a>
					</div></li>
			</ul>

			<form class="form-inline my-2 my-lg-0" action="#"
				style="margin-right: 15px;">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
			</form>

			<div class="form-inline my-2 my-lg-0">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle " id="" data-toggle="dropdown">Languages</a>
						<div class="dropdown-menu">
							<a href="./changeLanguage?Language=vi" class="dropdown-item">Vietnamese</a>
							<a href="./changeLanguage?Language=en" class="dropdown-item">English</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container" style="border: 1px solid red; margin-top: 35px;">
		<h1 class="text-uppercase">
			<i18n:i18ntag>index.menu.admin.admin</i18n:i18ntag>
			>>
			<i18n:i18ntag>index.menu.products</i18n:i18ntag>
		</h1>
		<div class="row">
			<div class="col-sm-4 text-right"
				style="background-color: lavenderblush;">
				<i18n:i18ntag>index.menu.admin.category</i18n:i18ntag>
				<div>

					<table>
						<thead>
							<tr>
								<th><i18n:i18ntag>index.proTable1.spcode</i18n:i18ntag></th>
								<th><i18n:i18ntag>index.proTable1.TenSP</i18n:i18ntag></th>
								<th><i18n:i18ntag>index.proTable1.sellPrice</i18n:i18ntag></th>
								<th><i18n:i18ntag>index.proTable1.Discount</i18n:i18ntag></th>

							</tr>
						</thead>
						<tbody>
							<%
							ModelDanhMucSanPham dmsp;
											for (Object objdm : spListdm) {
												dmsp = (ModelDanhMucSanPham) objdm;
							%>
							<tr>
								<td><%=dmsp.getSanPhamCode()%></td>
								<td><%=dmsp.getTenSP()%></td>
								<td><%=dmsp.getGiaBan()%></td>
								<td><%=dmsp.getGiamGia()%></td>

<!-- 								<td> -->
<!-- 									<form action="./modifyProductAction"> -->
<%-- 										<input type="hidden" name="productID" value=<%=dmsp.getSanPhamCode()%>> --%>
<!-- 										<button type="submit" class="btn btn-success btn-sm"> -->
<!-- 											Edit</button> -->
<!-- 									</form> -->
<!-- 								</td> -->
							</tr>
							<%
							}
							%>

						</tbody>

					</table>

				</div>

			</div>
			<div class="col-sm-8" style="background-color: lavender;">

				<table
					class="table table-striped table-bordered table-hover table-sm"
					style="margin-top: 30px;">
					<caption class="text-uppercase">
						<i18n:i18ntag>index.proTable.caption</i18n:i18ntag>
						<div style="float: right">

<!-- 							<form action="./addproduct.jsp"> -->
							<form action="./modifyProductAction">
								<input class="btn btn-primary btn-md" type="submit"
									value="<i18n:i18ntag>form.action.add</i18n:i18ntag>">
							</form>



							<button type="button" class="btn btn-info btn-md">
								<i18n:i18ntag>form.action.sort</i18n:i18ntag>
							</button>
							<button id="update_pơpup" type="button" class="btn btn-success btn-sm">
								<i18n:i18ntag>form.action.update</i18n:i18ntag>
							</button>
						</div>
					</caption>
					<thead>
						<tr>
							<th><i18n:i18ntag>index.proTable.copde</i18n:i18ntag></th>
							<th><i18n:i18ntag>index.proTable.name</i18n:i18ntag></th>
							<th><i18n:i18ntag>index.proTable.type</i18n:i18ntag></th>
							<th><i18n:i18ntag>index.proTable.provider</i18n:i18ntag></th>
						</tr>
					</thead>
					<tbody>
						<%
						ModelChiTietSanPham sp;
						for (Object obj : spList) {
							sp = (ModelChiTietSanPham) obj;
						%>
						<tr>
							<td><%=sp.getSanPhamCode()%></td>
							<td><%=sp.getTenSP()%></td>
							<td><%=sp.getTenLoaiSP()%></td>
							<td><%=sp.getTenNhaCungCap()%></td>

							<td>

								<form action="./gioHangAction" method="post">
									<input type="hidden" name="productID" value=<%=sp.getSanPhamCode()%>>
									<button type="submit" class="btn btn-success btn-sm">
										Chon mua</button>
								</form>
							</td>
							
							<td>
								<form action="./modifyProductAction">
									<input type="hidden" name="productID" value=<%=sp.getSanPhamCode()%>>
									<button type="submit" class="btn btn-success btn-sm">
										Edit</button>
								</form>
							</td>

						</tr>
						<%
						}
						%>


					</tbody>
				</table>

			</div>
			
			<div id="update_pop-up" style="display: none; border: 1px solid blue; padding: 5px; width: 40%; min-width:640px;position: absolute; background-color: white;">
				<div id="close_button" style="position: absolute; with:20px;height: 20px;top: 3px;right: 8px;z-index: 1000; color : red; cursor: pointer; ">X</div>
				<jsp:include page="productForm.jsp" />
			</div>
			
		</div>
	</div>

	<div class="container-fluid" style="border: 1px solid blue">
		container-fluid</div>
</body>

</html>