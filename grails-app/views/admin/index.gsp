<!doctype html>
<html>
    <head>
        <meta name="layout" content="main">
        <title><g:message code="admin.label" default="Admin" /></title>
    </head>
    <body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="suceso"><g:message code="suceso.list.label" /></g:link></li>
                                <li><g:link class="list" controller="usuario"><g:message code="usuario.list.label" /></g:link></li>
                                <li><g:link class="list" controller="encuentro"><g:message code="encuentro.list.label" /></g:link></li>
                                <li><g:link class="list" controller="equipo"><g:message code="equipo.list.label" /></g:link></li>
				<li><g:link class="list" controller="torneo"><g:message code="torneo.list.label" /></g:link></li>
			</ul>
		</div>
        <div class="content">
            <h1><g:message code="admin.label" default="Admin" /></h1>
        </div>
    </body>
</html>
