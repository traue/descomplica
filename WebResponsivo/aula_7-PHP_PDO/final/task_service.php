<?php

	class TaskService{

		private $conn;
		private $task;

		public function __construct(Connection $conn, Task $task){
			$this->conn = $conn->connect();
			$this->task = $task;
		}

		public function addTask(){
			$query = 'INSERT INTO tasks(task) VALUES(:task)';
			$stm = $this->conn->prepare($query);
			$stm->bindValue(':task', $this->task->__get('task'));
			$stm->execute();
			if($stm->rowCount() > 0){	
				return true;
			}
			return false;
		}

		public function getTasks() {
			$query = 'SELECT
						t.taskId, t.task, t.date
					FROM
						tasks as t
					ORDER BY t.taskId';

			$stm = $this->conn->prepare($query);
			$stm->execute();
			return $stm->fetchAll(PDO::FETCH_ASSOC);
		}

		public function deleteTask() {
			$query = "DELETE FROM tasks WHERE taskId = :taskId";
			$stm = $this->conn->prepare($query);
			$stm->bindValue(':taskId', $this->task->__get('taskId'));
			return $stm->execute();
		}
	}

?>