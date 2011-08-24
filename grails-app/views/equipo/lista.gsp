
<%@ page import="general.Equipo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipo.label', default: 'Equipo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-equipo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="admin" ><g:message code="admin.label" default="Admin" /></g:link></li>
				<li><g:link class="create" action="nuevo"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-equipo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'equipo.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="correo" title="${message(code: 'equipo.correo.label', default: 'Correo')}" />

                                                <g:sortableColumn property="correo2" title="${message(code: 'equipo.correo2.label', default: 'Correo2')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${equipos}" status="i" var="equipo">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="ver" id="${equipo.id}">${fieldValue(bean: equipo, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: equipo, field: "correo")}</td>

                                                <td>${fieldValue(bean: equipo, field: "correo2")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${totalDeEquipos}" />
			</div>
		</div>
	</body>
</html>
