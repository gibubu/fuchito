
<%@ page import="general.Jugador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jugador.label', default: 'Jugador')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-jugador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="lista"><g:message code="jugador.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="nuevo"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-jugador" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list jugador">

				<g:if test="${jugador?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="jugador.nombre.label" default="Nombre" /></span>

						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${jugador}" field="nombre"/></span>

				</li>
				</g:if>

				<g:if test="${jugador?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="jugador.apellido.label" default="Apellido" /></span>

						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${jugador}" field="apellido"/></span>

				</li>
				</g:if>

				<g:if test="${jugador?.equipo}">
				<li class="fieldcontain">
					<span id="equipo-label" class="property-label"><g:message code="jugador.equipo.label" default="Equipo" /></span>

						<span class="property-value" aria-labelledby="equipo-label"><g:link controller="equipo" action="show" id="${jugador?.equipo?.id}">${jugador?.equipo?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

                                <tr class="prop">
                                  <td colspan="2"><img src="${createLink(action:'imagen',id:jugador?.id)}" /></td>
                                </tr>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${jugador?.id}" />
					<g:link class="edit" action="edita" id="${jugador?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="elimina" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
