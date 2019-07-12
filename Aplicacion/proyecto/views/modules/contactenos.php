<footer class="row" id="contactenos">

	<hr>
	
	<h1 class="text-center text-info"><b>CONTÁCTENOS</b></h1>

	<hr>
	
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
	
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3939.8492334944094!2d-78.59619768582999!3d-9.077496396246039!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91ab810ce4fd260f%3A0xa34563648656dc9f!2sHidrandina+S.A.!5e0!3m2!1ses-419!2spe!4v1562910813520!5m2!1ses-419!2spe" width="100%" frameborder="0" style="border:0" allowfullscreen></iframe>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 jumbotron">

    		<h4 class="blockquote-reverse text-primary">
    			<ul>
	              <li><span class="glyphicon glyphicon-phone"></span>  (043) 49 60 12</li>
	              <li><span class="glyphicon glyphicon-map-marker"></span>  Chimbote 02803</li>
	              <li><span class="glyphicon glyphicon-envelope"></span>  atencionhdna@distriluz.com.pe</li>    
	          	</ul>      
    		</h4>

			</div>

	</div>

	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" id="formulario" >

		<ol>
    		<li>
        		<a href="http://www.facebook.com" target="_blank">
          		<i class="fa fa-facebook" style="font-size:24px;"></i>  
       		 	</a>
   			</li>

    		<li>
        		<a href="http://www.youtube.com" target="_blank">  
          		<i class="fa fa-youtube" style="font-size:24px;"></i>  
       			</a>
    		</li>
    
    		<li>
        		<a href="http://www.twitter.com" target="_blank">
          		<i class="fa fa-twitter" style="font-size:24px;"></i>  
        		</a>
    		</li>
			</ol>

			<form method="post" onsubmit="return validarMensaje()">

			    <input type="text" class="form-control" id="nombre" name="nombre"  placeholder="Nombre" required>

			    <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>

			    <textarea name="mensaje" id="mensaje" cols="30" rows="10" placeholder="Contenido del Mensaje" class="form-control" required></textarea>

			 
			  	<input type="submit" class="btn btn-default" value="Enviar">
		</form>

		<?php

		$mensajes = new MensajesController();
		$mensajes -> registroMensajesController();

		?>
				
	</div>

</footer>
