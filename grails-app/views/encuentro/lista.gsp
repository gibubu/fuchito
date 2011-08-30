
<%@ page import="general.Encuentro" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'encuentro.label', default: 'Encuentro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-encuentro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="admin" ><g:message code="admin.label" default="Admin" /></g:link></li>
				<li><g:link class="create" action="genera"><g:message code="encuentro.genera.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-encuentro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

<!--                                                <th><g:message code="encuentro.fecha.label" default="Fecha" /></th>-->

						<g:sortableColumn property="fecha" title="${message(code: 'encuentro.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="encuentro.uno.label" default="Uno" /></th>

                                                <th><g:message code="encuentro.dos.label" default="Dos" /></th>

                                                <g:sortableColumn property="jugado" title="${message(code: 'encuentro.jugado.label', default: '#')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${encuentros}" status="i" var="encuentro">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
<!--                                                <td>${fieldValue(bean: encuentro, field: "fecha")}</td>-->
                                          
                                                <td><g:link action="ver" id="${encuentro.id}">${fieldValue(bean: encuentro, field: "fecha")}</g:link></td>

                                                <td>${fieldValue(bean: encuentro, field: "uno")}</td>

                                                <td>${fieldValue(bean: encuentro, field: "dos")}</td>

                                                <td>${fieldValue(bean: encuentro, field: "jugado")}</td>

<!--                                                <td><g:link action="ver" id="${encuentro.jugado}">${fieldValue(bean: encuentro, field: "jugado")}</g:link></td>-->

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${totalDeEncuentros}" />
			</div>
		</div>
	</body>
</html>
