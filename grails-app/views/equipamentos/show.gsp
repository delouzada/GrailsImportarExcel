
<%@ page import="busca.Equipamentos" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipamentos.label', default: 'Equipamentos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-equipamentos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-equipamentos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list equipamentos">
			
				<g:if test="${equipamentosInstance?.familia}">
				<li class="fieldcontain">
					<span id="familia-label" class="property-label"><g:message code="equipamentos.familia.label" default="Familia" /></span>
					
						<span class="property-value" aria-labelledby="familia-label"><g:fieldValue bean="${equipamentosInstance}" field="familia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentosInstance?.previsao_EO}">
				<li class="fieldcontain">
					<span id="previsao_EO-label" class="property-label"><g:message code="equipamentos.previsao_EO.label" default="Previsao EO" /></span>
					
						<span class="property-value" aria-labelledby="previsao_EO-label"><g:formatDate  format="dd/MM/yyyy" date="${equipamentosInstance?.previsao_EO}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentosInstance?.previsao_Lib_Civil}">
				<li class="fieldcontain">
					<span id="previsao_Lib_Civil-label" class="property-label"><g:message code="equipamentos.previsao_Lib_Civil.label" default="Previsao Lib Civil" /></span>
					
						<span class="property-value" aria-labelledby="previsao_Lib_Civil-label"><g:formatDate  format="dd/MM/yyyy" date="${equipamentosInstance?.previsao_Lib_Civil}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentosInstance?.tag}">
				<li class="fieldcontain">
					<span id="tag-label" class="property-label"><g:message code="equipamentos.tag.label" default="Tag" /></span>
					
						<span class="property-value" aria-labelledby="tag-label"><g:fieldValue bean="${equipamentosInstance}" field="tag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentosInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="equipamentos.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${equipamentosInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${equipamentosInstance?.id}" />
					<g:link class="edit" action="edit" id="${equipamentosInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
