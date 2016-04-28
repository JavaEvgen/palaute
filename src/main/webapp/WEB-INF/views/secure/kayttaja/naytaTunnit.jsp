<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Henkilön tietojen näyttäminen</title>



</head>

<body>
	<jsp:include page="navigointi.jsp"></jsp:include>

	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>Tunnit</h3>
				</div>
			</div>
			<div class="clearfix"></div>

			<div class="row">

				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>Kaikki tunnit</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div class="table-responsive">
								<table id="example"
									class="table table-striped responsive-utilities jambo_table">
									<thead>
										<tr class="headings ">
											<th>Päivämäärä</th>
											<th>Projekti</th>
											<th>Selite</th>
											<th>Aloitus-aika</th>
											<th>Lopetus-aika</th>
											<th>Yhteensä</th>
											<th>Poista</th>
										</tr>
									</thead>

									<tbody>

										<tr class="even pointer">
											<c:forEach items="${tunnit}" var="tunti">
												<td class=" "><c:out value="${tunti.date}"></c:out></td>

												<c:forEach items="${projektit}" var="projektit">
													<c:if test="${tunti.projID == projektit.projID}">
														<td><a
															href="<c:out value="/tunnit_lila/henkilo/ptunti/${tunti.projID}"/>"><c:out
																	value="${projektit.projnimi}"></c:out></a></td>
													</c:if>
												</c:forEach>
												<td class=" "><c:out value="${tunti.kuvaus}"></c:out></td>
												<td><c:out value="${tunti.aloitusaika}" /></td>
												<td><c:out value="${tunti.lopetusaika}" /></td>






												<c:set var="at" value="${tunti.aloitusaika}" />
												<c:set var="atunnit" value="${fn:substring(at, 0, 2)}" />

												<c:set var="am" value="${tunti.aloitusaika}" />
												<c:set var="aminuutit" value="${fn:substring(am, 3, 5)}" />

												

												<c:set var="lot" value="${tunti.lopetusaika}" />
												<c:set var="ltunnit" value="${fn:substring(lot, 0, 2)}" />

												<c:set var="lm" value="${tunti.lopetusaika}" />
												<c:set var="lminuutit" value="${fn:substring(lm, 3, 5)}" />

												

												<c:set var="yht"
													value="${ltunnit - atunnit}:${lminuutit - aminuutit}"></c:set>
												<td><c:out value="${yht}" /></td>
												<td class=" "><a
													href="/tunnit_lila/tunnit/delete/${tunti.tuntiID}"><button
															type="button" class="btn btn-danger btn-xs">Poista</button></a></td>
										</tr>






										</c:forEach>









									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<a href="/tunnit_lila/tunnit/uusi/${henkilo.id}"><button
								type="button" class="btn btn-success ">Lisää tunti</button></a>
					</div>
				</div>
			</div>


		</div>
		<!-- footer content -->

		<footer>
			<div class="copyright-info">
				<p class="pull-right">
					Tuntikirjaus <i class="fa fa-copyright"></i> Team Lila
				</p>
			</div>
			<div class="clearfix"></div>
		</footer>
		<!-- /footer content -->
	</div>
	<!-- /page content -->











</body>

</html>