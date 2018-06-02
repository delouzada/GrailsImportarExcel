


   <%@ page import="busca.Equipamentos" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="main">
<style type="text/css">
.erro{
text-align: center;
font-size: 14px;
color: red;
}
</style>
       
<g:set var="entityName" value="${message(code: 'equipamentos.label', default: 'Equipamentos')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
<g:javascript library="jquery" plugin="jquery" />
</head>
<body>
          
          
          
            <g:formRemote name="fomrBusca" url="[action:'listaPorFamilia']" update="resultado" >
          <br /><br />
          Digite a Familia <input type="text" name="familia" id="familia"/>
<input type="submit"  class="save" value="Buscar" />
            </g:formRemote>

        
        <g:if test="${flash.message}">
          <div class="message">${flash.message}</div>
        </g:if>
        
        <div id="resultado">
          
          
          
          <g:render template="listaPorFamilia" collection="${equipamentosInstance}" var="equipamentosInstance" />
          
          
        </div>
        
              
                </body>
</html>

  
