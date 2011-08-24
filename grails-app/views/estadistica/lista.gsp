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

						<g:sortableColumn property="jj" title="${message(code: 'equipo.jj.label', default: 'JJ')}" />

                                                <g:sortableColumn property="jg" title="${message(code: 'equipo.jg.label', default: 'JG')}" />

                                                <g:sortableColumn property="je" title="${message(code: 'equipo.je.label', default: 'JE')}" />

						<g:sortableColumn property="jp" title="${message(code: 'equipo.jp.label', default: 'JP')}" />

                                                <g:sortableColumn property="gf" title="${message(code: 'equipo.gf.label', default: 'GF')}" />

                                                <g:sortableColumn property="gc" title="${message(code: 'equipo.gc.label', default: 'GC')}" />

                                                <g:sortableColumn property="dif" title="${message(code: 'equipo.dif.label', default: 'DIF')}" />

                                                <g:sortableColumn property="pts" title="${message(code: 'equipo.pts.label', default: 'PTS')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${equipos}" status="i" var="equipo">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${equipo.id}">${fieldValue(bean: equipo, field: "nombre")}</g:link></td>

						<td>${fieldValue(bean: equipo, field: "jj")}</td>

						<td>${fieldValue(bean: equipo, field: "jg")}</td>

                                                <td>${fieldValue(bean: equipo, field: "je")}</td>

                                                <td>${fieldValue(bean: equipo, field: "jp")}</td>

                                                <td>${fieldValue(bean: equipo, field: "gf")}</td>

                                                <td>${fieldValue(bean: equipo, field: "gc")}</td>

                                                <td>${fieldValue(bean: equipo, field: "dif")}</td>

                                                <td>${fieldValue(bean: equipo, field: "pts")}</td>

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
