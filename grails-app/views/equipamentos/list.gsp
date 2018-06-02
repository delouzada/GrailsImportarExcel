
<%@ page import="busca.Equipamentos" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipamentos.label', default: 'Equipamentos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-equipamentos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-equipamentos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="familia" title="${message(code: 'equipamentos.familia.label', default: 'Familia')}" />
					
						<g:sortableColumn property="previsao_EO" title="${message(code: 'equipamentos.previsao_EO.label', default: 'Previsao EO')}" />
					
						<g:sortableColumn property="previsao_Lib_Civil" title="${message(code: 'equipamentos.previsao_Lib_Civil.label', default: 'Previsao Lib Civil')}" />
					
						<g:sortableColumn property="tag" title="${message(code: 'equipamentos.tag.label', default: 'Tag')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'equipamentos.tipo.label', default: 'Tipo')}" />
					
					        <g:sortableColumn property="realizado" title="${message(code: 'equipamentos.realizado.label', default: 'Entregue')}" />
                                                
                                       </tr>
				</thead>
				<tbody>
				<g:each in="${equipamentosInstanceList}" status="i" var="equipamentosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${equipamentosInstance.id}">${fieldValue(bean: equipamentosInstance, field: "familia")}</g:link></td>
					
						<td><g:formatDate format="dd/MM/yyyy" date="${equipamentosInstance.previsao_EO}" /></td>
					
						<td><g:formatDate  format="dd/MM/yyyy" date="${equipamentosInstance.previsao_Lib_Civil}" /></td>
 
                                                <td>${fieldValue(bean: equipamentosInstance, field: "tag")}</td>
					
						<td>${fieldValue(bean: equipamentosInstance, field: "tipo")}</td>
                                                
                                                <td>${fieldValue(bean: equipamentosInstance, field: "realizado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${equipamentosInstanceTotal}" />
			
                        
                       
                        </div>
                        
                        
                      <div class="paginateButtons">


</div> 
                        <br><br>     
  <g:form action="filter">
    <center><label>Familia</lable>
    <g:textField name="familia"  
     value="${params.familia}"/>
    <label>Tipo</label>
    <g:textField name="tipo"  
     value="${params.tipo}"/>
    
    <g:submitButton name="ok" value="Filtrar" /></center>
  
    <br><br/>
    
    
  </g:form>
  
                        
<br><br>
<h3>Gerar relatórios de quantitativos</h3> <br><br>
<fieldset class="form">
   
  <FONT COLOR="RED"><H4>OBS: Após digitar a informação desajada nos campos clique no icone do PDF ou Excel abaixo </H4></FONT><br>
 <g:jasperReport jasper="TOTEQUIP" format="PDF" > 
				 Família <input type="Text" name="FAMILIA" /><br>	
                                 Tipo:<input type="Text" name="TIPO" /><br>
		   </g:jasperReport><br><br>
                   		
		
                   
                   <g:jasperReport jasper="report1" format="PDF" > 
				Família: <input type="Text" name="FAMILIA"  /><br> 
                  
                          
                                Data Inicial:  <input type="text" name="dataInicial" id="dataInicial" value="${dataInicial}"/>
                                
                                Data Final:  <input type="text" name="dataFinal" id="dataFinal" value="${dataFinal}" />
		       
                               
                       
                   
                   </g:jasperReport><br><br><br>
                   
                
                    <g:jasperReport jasper="report1" format="XLS" > 
				Digite a Família do Equipamento e clique no icone do EXCEL <input type="Text" name="FAMILIA" /><br>		
		   </g:jasperReport><br><br><br>
                   
                   
                   
                   <g:jasperReport jasper="TOTEQUIP2" format="PDF" > 
				Digite a TAG do Equipamento e clique no icone do PDF <input type="Text" name="TAG" /><br>		
		   </g:jasperReport><br><br>
               
 </fieldset>
<!--<g:jasperReport jasper="equipamentos2" format="XLS" name="Equipamentos - XLS" />
<g:jasperReport jasper="equipamentos2" format="CSV" name="Equipamentos - CSV" />
<g:jasperReport jasper="equipamentos2" format="XML" name="Equipamentos - XML" />
<br><br/><br><br>-->

  <!-- <g:form action="listaporFamilia">
<b>Digite o nome do Equipamento: <b><input type="text" name="busca"/>

<input type="submit" value="Buscar" />


</g:form>-->

	</body>
</html>
