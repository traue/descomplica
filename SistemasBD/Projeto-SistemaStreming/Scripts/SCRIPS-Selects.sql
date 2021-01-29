--as músicas e seus respectivos estilos
SELECT
    musica.titulo,
    estilo.estilo
FROM
    musica
INNER JOIN 
    estilo
ON musica.estilo_id_estilo = estilo.id_estilo


--as músicas dos Beatles, do album Yellow Submarina
SELECT
    musica.titulo AS titulo_musica,
    musica.duracao,
    artista.nome
FROM
    musica
    INNER JOIN rel_musica_album ON rel_musica_album.musica_id_musica = musica.id_musica
    INNER JOIN album ON rel_musica_album.album_id_album = album.id_album
    INNER JOIN artista ON musica.artista_id_artista = artista.id_artista
WHERE artista.nome = 'The Beatles'
      and album.titulo = 'Yellow Submarine'
ORDER BY rel_musica_album.ordem_musica;


--As músicas de todas as listas de todos os usuários
SELECT
    usuario.nome as usuario,
    lista_reprod.nome_lista,
    musica.titulo,
    musica.duracao,
    artista.nome AS artista
FROM
    lista_reprod
    INNER JOIN usuario ON lista_reprod.usuario_id_usuario = usuario.id_usuario
    INNER JOIN rel_lista_musica ON rel_lista_musica.musica_id_musica = lista_reprod.id_lista
    INNER JOIN musica ON rel_lista_musica.musica_id_musica = musica.id_musica
    INNER JOIN artista ON musica.artista_id_artista = artista.id_artista
ORDER BY  usuario.nome, lista_reprod.nome_lista, rel_lista_musica.ordem_musica;

--histórico de cobranças de um determinado usuário
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
WHERE usuario.id_usuario = 3
ORDER BY data_pgto;