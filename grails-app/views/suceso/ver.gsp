
<%@ page import="general.Suceso" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'suceso.label', default: 'Suceso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-suceso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="admin" ><g:message code="admin.label" default="Admin" /></g:link></li>
				<li><g:link class="list" action="lista"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="nuevo"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-suceso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list suceso">
			
				<g:if test="${suceso?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="suceso.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${suceso}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${suceso?.encuentro}">
				<li class="fieldcontain">
					<span id="encuentro-label" class="property-label"><g:message code="suceso.encuentro.label" default="Encuentro" /></span>
					
						<span class="property-value" aria-labelledby="encuentro-label"><g:link controller="encuentro" action="show" id="${suceso?.encuentro?.id}">${suceso?.encuentro?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${suceso?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="suceso.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${suceso?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${suceso?.jugador}">
				<li class="fieldcontain">
					<span id="jugador-label" class="property-label"><g:message code="suceso.jugador.label" default="Jugador" /></span>
					
						<span class="property-value" aria-labelledby="jugador-label"><g:link controller="jugador" action="show" id="${suceso?.jugador?.id}">${suceso?.jugador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${suceso?.id}" />
					<g:link class="edit" action="edita" id="${suceso?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="elimina" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
