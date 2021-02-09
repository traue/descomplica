<?php
	class Task {
		private $taskId;
		private $task;
		private $date;

		public function __get($atrib){
			return $this->$atrib;
		}

		public function __set($atrib, $value){
			$this->$atrib = $value;
		}
	}
?>