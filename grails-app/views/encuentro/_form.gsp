<%@ page import="general.Encuentro" %>


<div class="fieldcontain ${hasErrors(bean: encuentro, field: 'uno', 'error')} required">
	<label for="uno">
		<g:message code="encuentro.uno.label" default="Uno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="uno" name="uno.id" from="${general.Equipo.list()}" optionKey="id" required="" value="${encuentro?.uno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: encuentro, field: 'dos', 'error')} required">
	<label for="dos">
		<g:message code="encuentro.dos.label" default="Dos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dos" name="dos.id" from="${general.Equipo.list()}" optionKey="id" required="" value="${encuentro?.dos?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: encuentro, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="encuentro.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day" value="${encuentro?.fecha}"  />
</div>
