

<%@ page import="general.Imagen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'imagen.label', default: 'Imagen')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${imagenInstance}">
            <div class="errors">
                <g:renderErrors bean="${imagenInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>

<div class="fieldcontain ${hasErrors(bean: imagen, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="jugador.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="64" required="" value="${imagen?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagen, field: 'tipoContenido', 'error')} required">
	<label for="tipoContenido">
		<g:message code="jugador.nombre.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipoContenido" maxlength="64" required="" value="${imagen?.tipoContenido}"/>
</div>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="imagen"><g:message code="imagen.archivo.label" default="Archivo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imagenInstance, field: 'imagen', 'errors')}">
                                    <input type="file" id="imagen" name="imagen" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
