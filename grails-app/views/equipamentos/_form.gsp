<%@ page import="busca.Equipamentos" %>



<div class="fieldcontain ${hasErrors(bean: equipamentosInstance, field: 'familia', 'error')} ">
	<label for="familia">
		<g:message code="equipamentos.familia.label" default="Familia" />
		
	</label>
	<g:textField name="familia" value="${equipamentosInstance?.familia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: equipamentosInstance, field: 'previsao_EO', 'error')} required">
	<label for="previsao_EO">
		<g:message code="equipamentos.previsao_EO.label" default="Previsao EO" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="previsao_EO" precision="day"  value="${equipamentosInstance?.previsao_EO}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: equipamentosInstance, field: 'previsao_Lib_Civil', 'error')} required">
	<label for="previsao_Lib_Civil">
		<g:message code="equipamentos.previsao_Lib_Civil.label" default="Previsao Lib Civil" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="previsao_Lib_Civil" precision="day"  value="${equipamentosInstance?.previsao_Lib_Civil}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: equipamentosInstance, field: 'tag', 'error')} ">
	<label for="tag">
		<g:message code="equipamentos.tag.label" default="Tag" />
		
	</label>
	<g:textField name="tag" value="${equipamentosInstance?.tag}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: equipamentosInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="equipamentos.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${equipamentosInstance?.tipo}"/>
</div>

