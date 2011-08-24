
<%@ page import="general.Suceso" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'suceso.label', default: 'Suceso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-suceso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="admin" ><g:message code="admin.label" default="Admin" /></g:link></li>
				<li><g:link class="create" action="nuevo"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><g:link class="create" action="suceso"><g:message code="suceso.equipo.suceso.label" default="Crear Resultados"/></g:link></li>
			</ul>
		</div>
		<div id="list-suceso" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'suceso.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="suceso.encuentro.label" default="Encuentro" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'suceso.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="suceso.jugador.label" default="Jugador" /></th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${sucesos}" status="i" var="suceso">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="ver" id="${suceso.id}">${fieldValue(bean: suceso, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: suceso, field: "encuentro")}</td>
					
						<td><g:formatDate date="${suceso.fecha}" /></td>
					
						<td>${fieldValue(bean: suceso, field: "jugador")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${totalDeSucesos}" />
			</div>
		</div>
	</body>
</html>
