
<%@ page import="general.Equipo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipo.label', default: 'Equipo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-equipo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="admin" ><g:message code="admin.label" default="Admin" /></g:link></li>
				<li><g:link class="list" action="lista"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="nuevo"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-equipo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list equipo">
			
				<g:if test="${equipo?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="equipo.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${equipo}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipo?.correo}">
				<li class="fieldcontain">
					<span id="correo-label" class="property-label"><g:message code="equipo.correo.label" default="Correo" /></span>
					
						<span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${equipo}" field="correo"/></span>
					
				</li>
				</g:if>

                                <g:if test="${equipo?.correo2}">
				<li class="fieldcontain">
					<span id="correo2-label" class="property-label"><g:message code="equipo.correo2.label" default="Correo2" /></span>

						<span class="property-value" aria-labelledby="correo2-label"><g:fieldValue bean="${equipo}" field="correo2"/></span>

				</li>
				</g:if>
			
				<g:if test="${equipo?.torneo}">
				<li class="fieldcontain">
					<span id="torneo-label" class="property-label"><g:message code="equipo.torneo.label" default="Torneo" /></span>
					
						<span class="property-value" aria-labelledby="torneo-label"><g:link controller="torneo" action="show" id="${equipo?.torneo?.id}">${equipo?.torneo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${equipo?.id}" />
					<g:link class="edit" action="edita" id="${equipo?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="elimina" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
