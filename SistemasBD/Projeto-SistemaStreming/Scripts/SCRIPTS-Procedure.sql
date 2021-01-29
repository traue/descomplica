CREATE OR REPLACE PROCEDURE insere_cobranca
	(data_pgto IN DATE, 
		valor IN NUMBER, 
		usuario IN NUMBER, 
		cartao IN NUMBER, 
		plano IN NUMBER)
IS
BEGIN
	INSERT INTO cobranca(data_pgto, valor, usuario_id_usuario, final_cartao, plano_id_plano)
	VALUES(data_pgto, valor, usuario, cartao, plano);
	COMMIT;
END;

EXEC insere_cobranca (TO_DATE('03/11/2020', 'dd/mm/yyyy'), 10, 1, 5678, 1);



SELECT * FROM cobranca

