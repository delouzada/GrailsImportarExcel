<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipamentos.label', default: 'Equipamentos')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	
          <g:form action="etiquetaPrevEO" >
	
          <br /><br />
          Data Inicial: <input type="text" name="dataInicial" id="dataInicial"/>
          <br /><br />
         Data Final: <input type="text" name="dataFinal" id="dataFinal" />
          <br />
          <br />
					<g:submitButton name="create" class="save" value="Buscar" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
