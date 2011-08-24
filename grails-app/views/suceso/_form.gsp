<%@ page import="general.Suceso" %>



<div class="fieldcontain ${hasErrors(bean: suceso, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="suceso.nombre.label" default="Nombre" />
		
	</label>
	<g:select name="nombre" from="${suceso.constraints.nombre.inList}" value="${suceso?.nombre}" valueMessagePrefix="suceso.nombre" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: suceso, field: 'encuentro', 'error')} required">
	<label for="encuentro">
		<g:message code="suceso.encuentro.label" default="Encuentro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="encuentro" name="encuentro.id" from="${general.Encuentro.list()}" optionKey="id" required="" value="${suceso?.encuentro?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: suceso, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="suceso.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day" value="${suceso?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: suceso, field: 'jugador', 'error')} required">
	<label for="jugador">
		<g:message code="suceso.jugador.label" default="Jugador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="jugador.id" from="${general.Jugador.list()}" optionKey="id" required="" value="${suceso?.jugador?.id}" class="many-to-one"/>
</div>
