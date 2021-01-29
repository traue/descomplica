
---------aulas views------------------

--view de histórico de pagamentos:
CREATE VIEW historico_pgtos AS
SELECT
    cobranca.id_cobranca,
    cobranca.data_pgto,
    usuario.nome,
    cobranca.valor,
    cobranca.final_cartao,
    plano.titulo
FROM
    cobranca
    INNER JOIN usuario ON cobranca.usuario_id_usuario = usuario.id_usuario
    INNER JOIN plano ON cobranca.plano_id_plano = plano.id_plano
ORDER BY data_pgto;


--seleção dos dados
select * from historico_pgtos
where nome like 'Chavinho'



--criando uma view das musicias das listas dos usuários
CREATE VIEW lista_reproducao_usuario AS
SELECT
    --usuario.nome,
    --lista_reprod.nome_lista,
    musica.titulo,
    musica.duracao,
    artista.nome AS artista_nome
FROM
    lista_reprod
    INNER JOIN usuario ON lista_reprod.usuario_id_usuario = usuario.id_usuario
    INNER JOIN rel_lista_musica ON rel_lista_musica.musica_id_musica = lista_reprod.id_lista
    INNER JOIN musica ON rel_lista_musica.musica_id_musica = musica.id_musica
    INNER JOIN artista ON musica.artista_id_artista = artista.id_artista
ORDER BY  rel_lista_musica.ordem_musica;


--trazendo as listas
select * from lista_reproducao_usuario

--recuperando as listas de um usuário especifico
--não funciona pois a coluna id_usuario não está na view!
select * from lista_reproducao_usuario
where id_usuario = 1;



--CORRIGINDO A VIEW
CREATE OR REPLACE VIEW lista_reproducao_usuario AS 
SELECT
    usuario.id_usuario,
    usuario.nome,
    lista_reprod.nome_lista,
    musica.titulo,
    musica.duracao,
    artista.nome AS artista_nome
FROM
    lista_reprod
    INNER JOIN usuario ON lista_reprod.usuario_id_usuario = usuario.id_usuario
    INNER JOIN rel_lista_musica ON rel_lista_musica.musica_id_musica = lista_reprod.id_lista
    INNER JOIN musica ON rel_lista_musica.musica_id_musica = musica.id_musica
    INNER JOIN artista ON musica.artista_id_artista = artista.id_artista
ORDER BY  rel_lista_musica.ordem_musica;


--agora funciona
select * from lista_reproducao_usuario
where id_usuario = 1;


--e se quiser trazer uma lista específica..
select * from lista_reproducao_usuario
where id_usuario = 1
    and nome_lista = 'Para estudar';