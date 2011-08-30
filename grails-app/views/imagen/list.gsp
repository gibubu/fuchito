
<%@ page import="general.Imagen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'imagen.label', default: 'Imagen')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'imagen.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'imagen.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="tipoContenido" title="${message(code: 'imagen.tipoContenido.label', default: 'Tipo Contenido')}" />
                        
                            <g:sortableColumn property="tamano" title="${message(code: 'imagen.tamano.label', default: 'Tamano')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${imagenInstanceList}" status="i" var="imagenInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${imagenInstance.id}">${fieldValue(bean: imagenInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: imagenInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: imagenInstance, field: "tipoContenido")}</td>
                        
                            <td>${fieldValue(bean: imagenInstance, field: "tamano")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${imagenInstanceTotal}" />
            </div>
        </div>
    </body>
</html>