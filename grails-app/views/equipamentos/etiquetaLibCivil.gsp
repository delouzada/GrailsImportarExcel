<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/BUSCA/css/etiquetas_print.css" media="all" />
    <title>Busca por Data Lib.Civil</title>
  </head>
  <body>
  
    
    <div id="wrapper">
     

      <ul class="pagina"> <!-- a cada 33 etiquetas -->

        
        
  <%
  
    int  contador=0
  
  int paginas = equipamentos.size()/30
  float resto = equipamentos.size()%30
  
  if (resto!=0){
    paginas++
  }

  
  
  equipamentos.each(){  k,v -> 
  %>
	
        
     	<% if  (contador== 30){
          contador=0
        %>
	
        
        
        
</ul>   
      
      <ul class="pagina">
	<%
         }
	contador++
        %>

      
  	<li style="color: #COR8;" class="xEtiqueta"> 	<!-- /* CADA ETIQUETA */ -->

          		<ul>
			<li class="xSkuGroup">
				<span class="xSku">Tag: ${v.tag}</span>

                        </li>
                        
                        <li class="xRuaGroup">
				<span class="xAndar">Familia: ${v.familia}</span>
                                
                                <span class="xRua">Tipo: ${v.tipo}</span>
                                
                                <% if(!v.previsao_Lib_Civil.contains('01/03/1900')){ %>
                                <span class="xPedidoData">LIB: ${v.previsao_Lib_Civil}</span>
                                
                                <%}else{%>
                                 <span class="xPedidoData">LIB:</span>
                                <%}%>
                                
                                <%if(!v.previsao_EO.contains('01/03/1900')){%>
                                <span class="xLiData">EO: ${v.previsao_EO} </span>
                                
                                <%}else{%>
                                <span class="xLiData">EO: </span>
                                
                                <%}%>
			</li>
                        
                        
                        </ul>
                        

<%

}

%>
</div>	
  </body>
</html>

