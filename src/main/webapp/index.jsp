<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="script/index.js"></script>
	<link rel="stylesheet" href="./index.css">

	
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
	
	<% if (request.getAttribute("msg") != null) { %>
  <div class="custom-alert">
    <%= request.getAttribute("msg") %>
  </div>
<% } %>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	
	<script type="text/javascript">
	
	setTimeout(() => {
	    const alert = document.querySelector('.custom-alert');
	    if (alert) {
	      alert.style.transition = 'opacity 0.5s ease';
	      alert.style.opacity = '0';
	      setTimeout(() => alert.remove(), 500);
	    }
	  }, 4000);
	
	</script>
</body>
</html>