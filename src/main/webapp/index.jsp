<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="script/index.js"></script>
	<style type="text/css">
	
		body {
    		display: flex;
    		flex-direction: column;
    		gap: 50px;
		    justify-content: center;
		    align-items: center;
		    height: 100vh;
		    margin: 0;
		}
	
		form {
		    width: 33%;
		    background: #f8f9fa;
		    padding: 20px;
		    border-radius: 10px;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}
		
		form input[type="submit"] {
			width: 40%;
			margin-left: 30%;
			margin-right: 30%;

		}
	
	</style>
	
	<title>Projeto</title>
</head>
<body>
	<h1>Bem vindo</h1>
	
	<form action="<%=request.getContextPath() %>/ServletLogin" method="post" class="row g-3 needs-validation " novalidate >
	<input type="hidden" value="<%= request.getParameter("url") %>" name="url" >
		
		<div class="mb-3">
			<label class="form-label" >Login</label>
			<input class="form-control" name="login" type="text" required="required">
			<div class="invalid-feedback">
		    	Informe o login.
		    </div>
		</div>
		<div class="mb-3">	
			<label class="form-label" >Senha</label>
			<input class="form-control" name="senha" type="password" required="required">
			<div class="invalid-feedback">
		    	Informe a senha.
		    </div>
		</div>
			
		<input class="btn btn-primary" type="submit" value="Acessar">	
	</form>
	
	<div class="alert alert-danger" role="alert">
 		<h4>${msg}</h4>
	</div>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	
	<script type="text/javascript">
	
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function () {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	    })
	})()
	
	</script>
</body>
</html>