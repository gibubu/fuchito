<%@ page import="general.Jugador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jugador.label', default: 'Jugador')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-jugador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="lista"><g:message code="jugador.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-jugador" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${jugador}">
			<ul class="errors" role="alert">
				<g:eachError bean="${jugador}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="crea" >
				<fieldset class="form">

<div class="fieldcontain ${hasErrors(bean: jugador, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="jugador.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="64" required="" value="${jugador?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jugador, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="jugador.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" maxlength="128" required="" value="${jugador?.apellido}"/>
</div>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="archivo"><g:message code="jugador.archivo.label" default="Archivo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jugador, field: 'archivo', 'errors')}">
                                    <input type="file" id="imagen" name="archivo" />
                                </td>
                            </tr>

<!--<div class="fieldcontain ${hasErrors(bean: jugador, field: 'archivo', 'error')} required">
	<label for="archivo">
		<g:message code="jugador.archivo.label" default="Archivo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="archivo" name="archivo" />
</div>-->

                                </fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
