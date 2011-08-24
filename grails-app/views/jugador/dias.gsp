<%@ page import="general.Equipo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipo.label', default: 'Equipo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-equipo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="edit-equipo" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${equipo}">
			<ul class="errors" role="alert">
				<g:eachError bean="${equipo}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${equipo?.id}" />
				<g:hiddenField name="version" value="${equipo?.version}" />
				<fieldset class="form">
<div class="fieldcontain ${hasErrors(bean: torneo, field: 'domingo', 'error')} ">
	<label for="domingo">
		<g:message code="torneo.domingo.label" default="Domingo" />

	</label>
	<g:checkBox name="domingo" value="${torneo?.domingo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'lunes', 'error')} ">
	<label for="lunes">
		<g:message code="torneo.lunes.label" default="Lunes" />

	</label>
	<g:checkBox name="lunes" value="${torneo?.lunes}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'martes', 'error')} ">
	<label for="martes">
		<g:message code="torneo.martes.label" default="Martes" />

	</label>
	<g:checkBox name="martes" value="${torneo?.martes}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'miercoles', 'error')} ">
	<label for="miercoles">
		<g:message code="torneo.miercoles.label" default="Miercoles" />

	</label>
	<g:checkBox name="miercoles" value="${torneo?.miercoles}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'jueves', 'error')} ">
	<label for="jueves">
		<g:message code="torneo.jueves.label" default="Jueves" />

	</label>
	<g:checkBox name="jueves" value="${torneo?.jueves}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'viernes', 'error')} ">
	<label for="viernes">
		<g:message code="torneo.viernes.label" default="Viernes" />

	</label>
	<g:checkBox name="viernes" value="${torneo?.viernes}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'sabado', 'error')} ">
	<label for="sabado">
		<g:message code="torneo.sabado.label" default="Sabado" />

	</label>
	<g:checkBox name="sabado" value="${torneo?.sabado}" />
</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="refresh" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
