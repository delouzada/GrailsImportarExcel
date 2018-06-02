<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>GERADOR DE ETIQUETAS</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h2>Buscas:</h2>
			<ul>
				
                          
                                    
                               <%= link(action:'buscaPrevEO',controller:'Equipamentos') { 'Por Data prevista EO' }%> <br>
                               <%= link(action:'buscaLibCivil',controller:'Equipamentos') { 'Por Data liberação Civil' }%> <br> 
                                <%= link(action:'buscaPorFamilia',controller:'Equipamentos') { 'Por Familia/Equipamento' }%>
                                 
                          
                               <br><br/>   
                        
                        <h2>Importação:</h2>
			
                              <%= link(action:'importExcel',controller:'Equipamentos') { 'Upload de arquivos' }%>  
                               <!--<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Versão do Groove: $//{GroovySystem.getVersion()}</li>
                                <!--<li>Groovy version:$//{//org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>-->
				
			</ul>
                        <br><br/>
			<h2>Plugins Instalados</h2>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Controle e geração de etiquetas de equipamentos</h1>
			<p></p>

			<div id="controller-list" role="navigation">
				<h2>Controles disponíveis:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
                                  
                                  
				</ul>
			</div>
		</div>
	</body>
</html>
