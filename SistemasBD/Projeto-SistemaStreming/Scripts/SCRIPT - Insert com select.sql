INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(
    (SELECT id_musica FROM musica where titulo = 'Amerika'), 
    (SELECT id_lista FROM lista_reprod where nome_lista = 'Jazz legal'), 
    3 --ordem
);