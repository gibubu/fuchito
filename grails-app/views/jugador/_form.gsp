<%@ page import="general.Jugador" %>



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
