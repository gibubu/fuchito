<%@ page import="general.Equipo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipo.label', default: 'Equipo')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-equipo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="admin" ><g:message code="admin.label" default="Admin" /></g:link></li>
			</ul>
		</div>
		<div id="create-equipo" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:form action="creados" >
				<fieldset class="form">
<div class="fieldcontain ${hasErrors(bean: equipo, field: 'jj', 'error')} required">
	<label for="jj">
		<g:message code="equipo.jj.label" default="JJ" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="jj" maxlength="32" required="" value="${equipo?.jj}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: equipo, field: 'jg', 'error')} required">
	<label for="jg">
		<g:message code="equipo.jg.label" default="JG" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="jg" maxlength="32" required="" value="${equipo?.jg}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: equipo, field: 'je', 'error')} required">
	<label for="je">
		<g:message code="equipo.je.label" default="JE" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="je" maxlength="32" required="" value="${equipo?.je}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: equipo, field: 'jp', 'error')} required">
	<label for="jp">
		<g:message code="equipo.jp.label" default="JP" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="jp" maxlength="32" required="" value="${equipo?.jp}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: equipo, field: 'gf', 'error')} required">
	<label for="gf">
		<g:message code="equipo.gf.label" default="GF" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gf" maxlength="32" required="" value="${equipo?.gf}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: equipo, field: 'gc', 'error')} required">
	<label for="gc">
		<g:message code="equipo.gc.label" default="GC" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gc" maxlength="32" required="" value="${equipo?.gc}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: equipo, field: 'dif', 'error')} required">
	<label for="dif">
		<g:message code="equipo.dif.label" default="DIF" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dif" maxlength="32" required="" value="${equipo?.dif}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: equipo, field: 'pts', 'error')} required">
	<label for="pts">
		<g:message code="equipo.pts.label" default="PTS" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pts" maxlength="32" required="" value="${equipo?.pts}"/>
</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
