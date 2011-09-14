<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Bienvenido al control de torneos</title>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="page-body" role="main">
            <div class="nav" role="navigation">
                <ul>
                    <li><g:link class="list" controller="jugador" ><g:message code="jugador.equipo.label" default="Mi Equipo" /></g:link></li>
                    <li><g:link class="list" controller="imagen" ><g:message code="jugador.equipo.label" default="Mi Equipo" /></g:link></li>
                    <li><g:link class="list" controller="estadistica" ><g:message code="estadistica.label" default="Estadísticas" /></g:link></li>
                    <li><g:link class="list" controller="goleo" ><g:message code="goleo.label" default="Goleo" /></g:link></li>
                    <li><g:link class="list" controller="admin" ><g:message code="admin.label" default="Admin" /></g:link></li>
                </ul>
            </div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <div class="content" style="padding:10px 25px;">
                <h1 style="padding:0;margin:0;">Bienvenido al  control de torneo</h1>
            </div>
		</div>
	</body>
</html>
