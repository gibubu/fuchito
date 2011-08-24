<%@ page import="general.Torneo" %>



<div class="fieldcontain ${hasErrors(bean: torneo, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="torneo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="32" required="" value="${torneo?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'inicio', 'error')} required">
	<label for="inicio">
		<g:message code="torneo.inicio.label" default="Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicio" precision="day" value="${torneo?.inicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'fin', 'error')} required">
	<label for="fin">
		<g:message code="torneo.fin.label" default="Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fin" precision="day" value="${torneo?.fin}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'domingo', 'error')} ">
	<label for="domingo">
		<g:message code="torneo.domingo.label" default="Domingo" />

	</label>
	<g:checkBox name="domingo" value="${torneo?.domingo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'lunes', 'error')} ">
	<label for="lunes">
		<g:message code="torneo.lunes.label" default="Lunes" />

	</label>
	<g:checkBox name="lunes" value="${torneo?.lunes}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'martes', 'error')} ">
	<label for="martes">
		<g:message code="torneo.martes.label" default="Martes" />

	</label>
	<g:checkBox name="martes" value="${torneo?.martes}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'miercoles', 'error')} ">
	<label for="miercoles">
		<g:message code="torneo.miercoles.label" default="Miercoles" />

	</label>
	<g:checkBox name="miercoles" value="${torneo?.miercoles}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'jueves', 'error')} ">
	<label for="jueves">
		<g:message code="torneo.jueves.label" default="Jueves" />

	</label>
	<g:checkBox name="jueves" value="${torneo?.jueves}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'viernes', 'error')} ">
	<label for="viernes">
		<g:message code="torneo.viernes.label" default="Viernes" />

	</label>
	<g:checkBox name="viernes" value="${torneo?.viernes}" />
</div>

<div class="fieldcontain ${hasErrors(bean: torneo, field: 'sabado', 'error')} ">
	<label for="sabado">
		<g:message code="torneo.sabado.label" default="Sabado" />

	</label>
	<g:checkBox name="sabado" value="${torneo?.sabado}" />
</div>