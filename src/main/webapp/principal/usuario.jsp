<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

<body>

	<!-- Pre-loader start -->
	<jsp:include page="theme-loader.jsp"></jsp:include>

	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbar-main-menu.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->

						<jsp:include page="page-header.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">Cadastro de usuario</h4>
														
														<form action="<%= request.getContextPath() %>/ServletUsuarioController" method="post" id="formUser" >
														
															<input type="hidden" name="acao" id="acao" value="" >
															
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Cod.</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="id" id="id" class="form-control" 
                                                                    		readonly="readonly" style="width:10%" value="${modelLogin.id}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Nome: (*)</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="nome" id="nome" class="form-control" 
                                                                    		required="required" style="width:60%" value="${modelLogin.nome}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Email: (*)</label>
                                                                <div class="col-sm-10">
                                                                    <input type="email" name="email" id="email" class="form-control" 
                                                                    		required="required" autocomplete="off" style="width:60%" value="${modelLogin.email}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Login: (*)</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="login" id="login" class="form-control" 
                                                                    		required="required" style="width:60%" value="${modelLogin.login}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Senha: (*)</label>
                                                                <div class="col-sm-10">
                                                                    <input type="password" name="senha" id="senha" class="form-control" 
                                                                    		required="required" autocomplete="off" style="width:60%" value="${modelLogin.senha}">
                                                                </div>
                                                            </div>

                                                            
                                                            <button type="button" class="btn btn-primary waves-effect waves-light" onclick="limparForm()" >Novo</button>
												            <button type="submit" class="btn btn-success waves-effect waves-light">Salvar</button>
															<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Excluir</button>
															<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#pesquisarModal">Pesquisar</button>
                                                        </form>
													</div>
												</div>
											</div>
										</div>
										<span>${msg}</span>
									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="javascript-file.jsp"></jsp:include>
	
	<!-- Modal Pesquisar-->
	<div class="modal fade" id="pesquisarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Pesquisa de usuário</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--Modal Deletar-->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	       Deseja realmente excluir o usuario?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
	        <button type="button" class="btn btn-danger" onclick="onDelete()">Sim</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script type="text/javascript">
	
		function onDelete(){

			document.getElementById("formUser").method = 'get';
			document.getElementById("acao").value = 'deletar';
			document.getElementById("formUser").submit();
			
		}
	
		function limparForm() {
		    let elementos = document.getElementById("formUser").elements;
		    
		    for (let p = 0; p < elementos.length; p++) { 
		        elementos[p].value = '';
		    }
		}
	</script>

</body>

</html>
