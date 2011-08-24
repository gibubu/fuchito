
<%@ page import="general.Encuentro" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'encuentro.label', default: 'Encuentro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-encuentro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="admin" ><g:message code="admin.label" default="Admin" /></g:link></li>
				<li><g:link class="list" action="lista"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="nuevo"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-encuentro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list encuentro">
			
				<g:if test="${encuentro?.dos}">
				<li class="fieldcontain">
					<span id="dos-label" class="property-label"><g:message code="encuentro.dos.label" default="Dos" /></span>
					
						<span class="property-value" aria-labelledby="dos-label"><g:link controller="equipo" action="show" id="${encuentro?.dos?.id}">${encuentro?.dos?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${encuentro?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="encuentro.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${encuentro?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${encuentro?.torneo}">
				<li class="fieldcontain">
					<span id="torneo-label" class="property-label"><g:message code="encuentro.torneo.label" default="Torneo" /></span>
					
						<span class="property-value" aria-labelledby="torneo-label"><g:link controller="torneo" action="show" id="${encuentro?.torneo?.id}">${encuentro?.torneo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${encuentro?.uno}">
				<li class="fieldcontain">
					<span id="uno-label" class="property-label"><g:message code="encuentro.uno.label" default="Uno" /></span>
					
						<span class="property-value" aria-labelledby="uno-label"><g:link controller="equipo" action="show" id="${encuentro?.uno?.id}">${encuentro?.uno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${encuentro?.id}" />
					<g:link class="edit" action="edita" id="${encuentro?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="elimina" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
