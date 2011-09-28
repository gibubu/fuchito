
<%@ page import="general.Jugador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jugador.label', default: 'Jugador')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-jugador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="nuevo"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
<!--                                <li><g:link class="edit" action="dias"><g:message code="jugador.dias.label" default="Dias a Jugar" /></g:link></li>-->
			</ul>
		</div>
		<div id="list-jugador" class="content scaffold-list" role="main">
			<h1><g:message code="jugador.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="nombre" title="${message(code: 'jugador.nombre.label', default: 'Nombre')}" />

						<g:sortableColumn property="apellido" title="${message(code: 'jugador.apellido.label', default: 'Apellido')}" />

						<th><g:message code="jugador.equipo.label" default="Equipo" /></th>

                                                <th><g:message code="jugador.goles.label" default="Goles" /></th>

                                                <th><g:message code="jugador.goles.label" default="Foto" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${jugadores}" status="i" var="jugador">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="ver" id="${jugador.id}">${fieldValue(bean: jugador, field: "nombre")}</g:link></td>

						<td>${fieldValue(bean: jugador, field: "apellido")}</td>

						<td>${fieldValue(bean: jugador, field: "equipo")}</td>

                                                <td>${fieldValue(bean: jugador, field: "goles")}</td>

                                                <td><img style="width: 115px; height: 130px;" src="${createLink(action:'imagen',id:jugador?.id)}" /></td>



					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${totalDeJugadores}" />
			</div>
		</div>
	</body>
</html>
