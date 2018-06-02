
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
          
                                       
                                        
                                          <g:jasperReport jasper="TOTEQUIP" format="PDF" > 
				Digite a Família? <input type="Text" name="FAMILIA" /><br>		
		   </g:jasperReport>
                                        
                                        
       
	
        
        <g:if test="${flash.message}">
          <div class="message">${flash.message}</div>
        </g:if>
        
        <div id="resultado">
          
          
          
          
          
          
        </div>
        
              
                </body>
</html>

  


      
           <div class="nav">
                  
	   </div>      
 