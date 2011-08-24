
<%@ page import="general.Torneo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'torneo.label', default: 'Torneo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-torneo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" controller="admin"><g:message code="admin.label" default="Admin" /></g:link></li>
				<li><g:link class="create" action="nuevo"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-torneo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'torneo.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="inicio" title="${message(code: 'torneo.inicio.label', default: 'Inicio')}" />

                                                <g:sortableColumn property="fin" title="${message(code: 'torneo.fin.label', default: 'Fin')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${torneos}" status="i" var="torneo">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="ver" id="${torneo.id}">${fieldValue(bean: torneo, field: "nombre")}</g:link></td>
					
						<td><g:formatDate date="${torneo.inicio}" /></td>

                                                <td><g:formatDate date="${torneo.fin}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${totalDeTorneos}" />
			</div>
		</div>
	</body>
</html>
