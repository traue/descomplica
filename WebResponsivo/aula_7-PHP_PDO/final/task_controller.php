<?php

	require_once "task_model.php";
	require_once "task_service.php";
	require_once "connection.php";
	$action = isset($_GET['act']) ? $_GET['act'] : $action;
	//echo $action;

    if($action == 'addTask') {
        $task = new Task();
        $conn = new Connection();
        $task->__set('task', $_POST['task']);
        $taskService = new TaskService($conn, $task);
		if($taskService->addTask()) {
			echo 'Inseriu';
			header('Location: index.php');
		} else {
			echo 'Erro';
		}
    } else if($action == 'getTasks') {
		$conn = new Connection();
		$taskService = new TaskService($conn, new Task());
		$tasks = $taskService->getTasks();
	}

	// if($action == 'addTask') {
	// 	$task = new Task();
	// 	$conn = new Connection();
	// 	$tarefa->__set('task', $_POST['task']);
	// 	$tarefaServ = new TarefaService($conn, $tarefa);
	// 	$inseriu = $tarefaServ->inserir();
	// 	if($inseriu) {
	// 		header('Location: nova_tarefa.php?inclusao=1');
	// 	}else{
	// 		header('Location: nova_tarefa.php?inclusao=2');
	// 	}

	// } else if($acao == 'recuperaTarefasPendentes') {
	// 	$tarefa = new Tarefa();
	// 	$tarefa->__set('id_status', 1);
	// 	$conn = new Conexao();
	// 	$tarefaServ = new TarefaService($conn, $tarefa);
	// 	$tarefas = $tarefaServ->recuperaTarefas();
	// } 
	
	//else if($acao == 'recuperaTarefas') {
	// 	$tarefa = new Tarefa();
	// 	$conn = new Conexao();
	// 	$tarefaServ = new TarefaService($conn, $tarefa);
	// 	$tarefas = $tarefaServ->recuperaTarefas();
	// } else if($acao == 'concluirTarefa') {
	// 	$tarefa = new Tarefa();
	// 	$conn = new Conexao();
	// 	$tarefa->__set('id', $_GET['id']);
	// 	$tarefa->__set('id_status', 2);
	// 	$tarefaServ = new TarefaService($conn, $tarefa);
	// 	$tarefaServ->concluirTarefa();
	// 	if(isset($_GET['pagina']) && $_GET['pagina'] == 'index') {
	// 		header('location: index.php');
	// 	}else {
	// 		header('location: todas_tarefas.php');
	// 	}


	// } else if($acao == 'excluirTarefa') {
	// 	$tarefa = new Tarefa();
	// 	$conn = new Conexao();
	// 	$tarefa->__set('id', $_GET['id']);
	// 	$tarefaServ = new TarefaService($conn, $tarefa);
	// 	$tarefaServ->removerTarefa();

	
	// 	if(isset($_GET['pagina']) && $_GET['pagina'] == 'index') {
	// 		header('location: index.php');
	// 	} else {
	// 		header('location: todas_tarefas.php');
	// 	}
	// } else if ($acao == 'atualizarTarefa') {
	// 	$tarefa = new Tarefa();
	// 	$conn = new Conexao();
	// 	$tarefa->__set('id', $_POST['id']);
	// 	$tarefa->__set('tarefa', $_POST['tarefa']);
	// 	$tarefaServ = new TarefaService($conn, $tarefa);
	// 	$tarefaServ->atualizaTarefa();
	// 	if(isset($_GET['pagina']) && $_GET['pagina'] == 'index') {
	// 		header('location: index.php');
	// 	} else {
	// 		header('location: todas_tarefas.php');
	// 	}
	// }
?>