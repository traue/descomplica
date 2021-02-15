<?php
	class TaskService{
		private $conn; //conexão
		private $task; //tarefa

		//construtor da classe
		public function __construct(Connection $conn, Task $task){
			$this->conn = $conn->connect();
			$this->task = $task;
		}

		public function addTask(){
			$query = 'INSERT INTO tasks(task) VALUES(:task)'; //query
			$stm = $this->conn->prepare($query); //prepara a query
			$stm->bindValue(':task', $this->task->__get('task')); //substitui o parâmetro
 			$stm->execute(); //executa a query
			if($stm->rowCount() > 0){	
				return true; //se inseriu, o rowCount do resultado é 1 
			}
			return false; //caso cotrário, emcontramos um erro
		}

		public function getTasks() {
			$query = 'SELECT
						t.taskId, t.task, t.date
					FROM
						tasks as t
					ORDER BY t.date DESC'; //query

			$stm = $this->conn->prepare($query); //prepara
			$stm->execute(); //executa
			return $stm->fetchAll(PDO::FETCH_ASSOC); //retorna os dados em um resultset
			//FETCH_ASSOC o array é indexado com os mesmos nomes das colunas
		}

		public function deleteTask() {
			$query = "DELETE FROM tasks WHERE taskId = :taskId"; //query
			$stm = $this->conn->prepare($query); //prepara
			$stm->bindValue(':taskId', $this->task->__get('taskId')); //substitui o id na query
			return $stm->execute(); //executa
		}
	}
?>