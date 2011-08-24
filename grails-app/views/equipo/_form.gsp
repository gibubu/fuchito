<%@ page import="general.Equipo" %>

<div class="fieldcontain ${hasErrors(bean: equipo, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="equipo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="32" required="" value="${equipo?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: equipo, field: 'correo', 'error')} ">
	<label for="correo">
		<g:message code="equipo.correo.label" default="Correo" />

	</label>
	<g:field type="email" name="correo" maxlength="128" value="${equipo?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: equipo, field: 'correo2', 'error')} ">
	<label for="correo2">
		<g:message code="equipo.correo2.label" default="Correo2" />

	</label>
	<g:textField name="correo2" value="${equipo?.correo2}"/>
</div>
