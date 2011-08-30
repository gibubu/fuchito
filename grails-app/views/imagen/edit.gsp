

<%@ page import="general.Imagen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'imagen.label', default: 'Imagen')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${imagenInstance}">
            <div class="errors">
                <g:renderErrors bean="${imagenInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${imagenInstance?.id}" />
                <g:hiddenField name="version" value="${imagenInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="imagen.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imagenInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" maxlength="64" value="${imagenInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoContenido"><g:message code="imagen.tipoContenido.label" default="Tipo Contenido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imagenInstance, field: 'tipoContenido', 'errors')}">
                                    <g:textField name="tipoContenido" maxlength="128" value="${imagenInstance?.tipoContenido}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tamano"><g:message code="imagen.tamano.label" default="Tamano" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imagenInstance, field: 'tamano', 'errors')}">
                                    <g:textField name="tamano" value="${fieldValue(bean: imagenInstance, field: 'tamano')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="archivo"><g:message code="imagen.archivo.label" default="Archivo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imagenInstance, field: 'archivo', 'errors')}">
                                    <input type="file" id="archivo" name="archivo" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
