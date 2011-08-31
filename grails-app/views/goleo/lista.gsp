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
			</ul>
		</div>
		<div id="list-jugador" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                        <table>
				<thead>
					<tr>

						<th><g:message code="nombre.label" default="Nombre" /></th>
<!--                                                <g:sortableColumn property="nombre" title="${message(code: 'nombre.label', default: 'Nombre')}" />-->

						<th><g:message code="equipo.label" default="Equipo" /></th>
<!--                                                <g:sortableColumn property="equipo" title="${message(code: 'equipo.label', default: 'Equipo')}" />-->

                                                <g:sortableColumn property="goles" title="${message(code: 'goles.label', default: 'Goles')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${jugadores}" status="i" var="jugador">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                                <td>${fieldValue(bean: jugador, field: "nombre")}</td>

<!--						<td><g:link action="show" id="${jugador.id}">${fieldValue(bean: jugador, field: "nombre")}</g:link></td>-->

						<td>${fieldValue(bean: jugador, field: "equipo")}</td>

						<td>${fieldValue(bean: jugador, field: "goles")}</td>

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
