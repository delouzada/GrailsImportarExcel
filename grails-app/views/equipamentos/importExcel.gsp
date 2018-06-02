<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
        <link rel="stylesheet" type="text/css" href="/BUSCA/css/importacao.css"/>


<script type="text/javascript" src="/BUSCA/js/jquery.min.js"></script>
<!-- Third party script for BrowserPlus runtime (Google Gears included in Gears runtime now) -->
<script type="text/javascript" src="/BUSCA/js/browserplus-min.js"></script>

<!-- Load plupload and all it's runtimes and finally the jQuery queue widget -->
<script type="text/javascript" src="/BUSCA/plupload/js/plupload.full.js"></script>

<script type="text/javascript" src="/BUSCA/plupload/js/jquery.plupload.queue/jquery.plupload.queue.js"></script>

<script type="text/javascript" src="/BUSCA/js/importacao.js"></script>

<script type="text/javascript" src="/BUSCA/plupload/js/i18n/pt-br.js"></script>

  </head> 
  <body>

    
   <h3>Custom example</h3>

  <g:form action="fileUpload" method="post" enctype="multipart/form-data" >

   <div id="uploader">
		<p>You browser doesn't have Flash, Silverlight, Gears, BrowserPlus or HTML5 support.</p>
	</div>
</g:form>


  
  </body>
</html>
