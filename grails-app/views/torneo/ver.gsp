
<%@ page import="general.Torneo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'torneo.label', default: 'Torneo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-torneo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" controller="admin"><g:message code="admin.label" default="Admin" /></g:link></li>
                                <li><g:link class="list" action="lista"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="nuevo"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-torneo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list torneo">
			
				<g:if test="${torneo?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="torneo.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${torneo}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${torneo?.equipos}">
				<li class="fieldcontain">
					<span id="equipos-label" class="property-label"><g:message code="torneo.equipos.label" default="Equipos" /></span>
					
						<g:each in="${torneo.equipos}" var="e">
						<span class="property-value" aria-labelledby="equipos-label"><g:link controller="equipo" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${torneo?.inicio}">
				<li class="fieldcontain">
					<span id="inicio-label" class="property-label"><g:message code="torneo.inicio.label" default="Inicio" /></span>
					
						<span class="property-value" aria-labelledby="inicio-label"><g:formatDate date="${torneo?.inicio}" /></span>
					
				</li>
				</g:if>

                                <g:if test="${torneo?.fin}">
				<li class="fieldcontain">
					<span id="fin-label" class="property-label"><g:message code="torneo.fin.label" default="Fin" /></span>

						<span class="property-value" aria-labelledby="fin-label"><g:formatDate date="${torneo?.fin}" /></span>

				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${torneo?.id}" />
					<g:link class="edit" action="edita" id="${torneo?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="elimina" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
