<%@ page import="general.Encuentro" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'encuentro.label', default: 'Encuentro')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-encuentro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="admin" ><g:message code="admin.label" default="Admin" /></g:link></li>
				<li><g:link class="list" action="lista"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="nuevo"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-encuentro" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${encuentro}">
			<ul class="errors" role="alert">
				<g:eachError bean="${encuentro}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${encuentro?.id}" />
				<g:hiddenField name="version" value="${encuentro?.version}" />
				<fieldset class="form">
<div class="fieldcontain ${hasErrors(bean: encuentro, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="encuentro.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="minute" value="${encuentro?.fecha}"  />
</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="actualiza" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="elimina" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
