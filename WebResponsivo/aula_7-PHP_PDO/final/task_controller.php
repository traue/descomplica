<?php

	require_once "task_model.php";
	require_once "task_service.php";
	require_once "connection.php";

	$action = isset($_GET['act']) ? $_GET['act'] : $action;
	// echo $action;

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
	} else if($action == 'excluir') {
		$conn = new Connection();
		$task = new Task();
		$task->__set('taskId', $_GET['taskId']);
		$taskService = new TaskService($conn, $task);
		if($taskService->deleteTask()) {
			header('Location: index.php');
		} else {
			echo 'Erro';
		}
	}

?>