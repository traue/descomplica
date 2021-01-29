--criação dos países
INSERT INTO pais (id_pais, nome_pais, sigla)
VALUES (2, 'Reino Unido', 'UK');

INSERT INTO pais (id_pais, nome_pais, sigla)
VALUES (3, 'Finlandia', 'FL');

INSERT INTO pais (id_pais, nome_pais, sigla)
VALUES (4, 'Espanha', 'ES');

INSERT INTO pais (id_pais, nome_pais, sigla)
VALUES (5, 'Alemanha', 'AL');

INSERT INTO pais (id_pais, nome_pais, sigla)
VALUES (6, 'EUA', 'EUA');


--criação dos estilos
INSERT INTO estilo (id_estilo, estilo)
VALUES (1, 'Rock');

INSERT INTO estilo (id_estilo, estilo)
VALUES (2, 'Country');

INSERT INTO estilo (id_estilo, estilo)
VALUES (3, 'MPB');

INSERT INTO estilo (id_estilo, estilo)
VALUES (4, 'POP');

INSERT INTO estilo (id_estilo, estilo)
VALUES (5, 'Folk');

INSERT INTO estilo (id_estilo, estilo)
VALUES (6, 'Sertanejo');

INSERT INTO estilo (id_estilo, estilo)
VALUES (7, 'Blues');

INSERT INTO estilo (id_estilo, estilo)
VALUES (8, 'Jazz');


--criação dos albuns
INSERT INTO album (id_album, titulo, ano_lancamento, gravadora)
VALUES (1, 'Yellow Submarine', 1969, 'Abbey Road');

INSERT INTO album (id_album, titulo, ano_lancamento, gravadora)
VALUES (3, 'Help!', 1965, 'Parlophone');

INSERT INTO album (id_album, titulo, ano_lancamento, gravadora)
VALUES (5, 'Invitation', 1983, 'Warner Bros');


--criação dos artistas
INSERT INTO artista (id_artista, nome, bibliografia, pais_id_pais)
VALUES (1, 'The Beatles', 'Banda Inglesa muito famoso...', 2);

INSERT INTO artista (id_artista, nome, bibliografia, pais_id_pais)
VALUES (2, 'Jaco Pastorius', 'Baixista de Jazz...', 6);


--criação das músicas
INSERT INTO musica (id_musica, titulo, duracao, ano, letra, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (1, 'Yellow Submarine', 160, 1966, 'In the town..', utl_raw.cast_to_raw('arquivo'), 'Anos 60;Psicolédica', 1, 1);

INSERT INTO musica (id_musica, titulo, duracao, ano, letra, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (2, 'Only a Northern Song', 214, 1969, 'If youre listening..', utl_raw.cast_to_raw('arquivo'), 'Anos 60;Psicolédica', 1, 1);

INSERT INTO musica (id_musica, titulo, duracao, ano, letra, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (3, 'All Together Now', 131, 1966, 'One, two, three..', utl_raw.cast_to_raw('arquivo'), 'Anos 60;Psicolédica', 1, 1);

INSERT INTO musica (id_musica, titulo, duracao, ano, letra, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (4, 'Hey Bulldog', 191, 1966, 'In the town..', utl_raw.cast_to_raw('arquivo'), 'Anos 60;Psicolédica', 1, 1);

INSERT INTO musica (id_musica, titulo, duracao, ano, letra, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (5, 'Its All Too Much', 385, 1966, 'Its all too much..', utl_raw.cast_to_raw('arquivo'), 'Anos 60;Psicolédica', 1, 1);

INSERT INTO musica (id_musica, titulo, duracao, ano, letra, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (6, 'All You Need Is Love', 191, 1966, 'Love, love, love..', utl_raw.cast_to_raw('arquivo'), 'Anos 60;Psicolédica', 1, 1);

INSERT INTO musica (id_musica, titulo, duracao, ano, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (7, 'Invitation', 417, 1983, utl_raw.cast_to_raw('arquivo'), 'Jazz famosos;Jazz improviso', 2, 8);

INSERT INTO musica (id_musica, titulo, duracao, ano, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (8, 'Amerika', 69, 1983, utl_raw.cast_to_raw('arquivo'), 'Jazz clássico;Jazz improviso', 2, 8);

INSERT INTO musica (id_musica, titulo, duracao, ano, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (9, 'The Chicken', 409, 1983, utl_raw.cast_to_raw('arquivo'), 'Jazz clássico;Jazz improviso', 2, 8);

INSERT INTO musica (id_musica, titulo, duracao, ano, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (10, 'Continuum', 268, 1983, utl_raw.cast_to_raw('arquivo'), 'Jazz clássico;Jazz improviso', 2, 8);

INSERT INTO musica (id_musica, titulo, duracao, ano, arquivo, tags, artista_id_artista, estilo_id_estilo)
VALUES (11, '"Liberty City', 273, 1983, utl_raw.cast_to_raw('arquivo'), 'Jazz clássico;Jazz improviso', 2, 8);


--criação dos relacionamentos entre musica e album, com a ordem da música no album
INSERT INTO rel_musica_album (musica_id_musica, album_id_album, ordem_musica)
VALUES (1, 1, 1);

INSERT INTO rel_musica_album (musica_id_musica, album_id_album, ordem_musica)
VALUES (2, 1, 2);

INSERT INTO rel_musica_album (musica_id_musica, album_id_album, ordem_musica)
VALUES (3, 1, 3);

INSERT INTO rel_musica_album (musica_id_musica, album_id_album, ordem_musica)
VALUES (4, 1, 4);

INSERT INTO rel_musica_album (musica_id_musica, album_id_album, ordem_musica)
VALUES (5, 1, 5);

INSERT INTO rel_musica_album (musica_id_musica, album_id_album, ordem_musica)
VALUES (7, 5, 1);

INSERT INTO rel_musica_album (musica_id_musica, album_id_album, ordem_musica)
VALUES (8, 5, 2);

INSERT INTO rel_musica_album (musica_id_musica, album_id_album, ordem_musica)
VALUES (9, 5, 3);

INSERT INTO rel_musica_album (musica_id_musica, album_id_album, ordem_musica)
VALUES (10, 5, 4);

INSERT INTO rel_musica_album (musica_id_musica, album_id_album, ordem_musica)
VALUES (11, 5, 5);

--criação dos planos
INSERT INTO plano (id_plano, titulo, descricao, valor, vigencia)
VALUES(1, 'Individual', 'Plano individual total', 6.99, 30);

INSERT INTO plano (id_plano, titulo, descricao, valor, vigencia)
VALUES(2, 'Familiar', 'Plano familiar total', 9.79, 30);

--criação dos usuários
INSERT INTO usuario(id_usuario, email, senha, nome, plano_id_plano)
VALUES (1, 'madruguinha@descomplica.com.br', 'Senha123', 'Madruguinha', 2);

INSERT INTO usuario(id_usuario, email, senha, nome, id_usuario_resp, plano_id_plano)
VALUES (2, 'chiquinha@descomplica.com.br', 'Senha123', 'Chiquinha', 1, 2);

INSERT INTO usuario(id_usuario, email, senha, nome, plano_id_plano)
VALUES (3, 'chaves@descomplica.com.br', 'Senha123', 'Chavinho', 1);

--criação de algumas cobranças
INSERT INTO cobranca(id_cobranca, data_pgto, valor, usuario_id_usuario, final_cartao, plano_id_plano)
VALUES(1, (TO_DATE('01/04/2020', 'dd/mm/yyyy')), 9.79, 1, 1234, 2);

INSERT INTO cobranca(id_cobranca, data_pgto, valor, usuario_id_usuario, final_cartao, plano_id_plano)
VALUES(2, (TO_DATE('01/05/2020', 'dd/mm/yyyy')), 9.79, 1, 1234, 2);

INSERT INTO cobranca(id_cobranca, data_pgto, valor, usuario_id_usuario, final_cartao, plano_id_plano)
VALUES(3, (TO_DATE('01/06/2020', 'dd/mm/yyyy')), 9.79, 1, 1234, 2);

INSERT INTO cobranca(id_cobranca, data_pgto, valor, usuario_id_usuario, final_cartao, plano_id_plano)
VALUES(4, (TO_DATE('01/07/2020', 'dd/mm/yyyy')), 9.79, 1, 1234, 2);

INSERT INTO cobranca(id_cobranca, data_pgto, valor, usuario_id_usuario, final_cartao, plano_id_plano)
VALUES(5, (TO_DATE('01/08/2020', 'dd/mm/yyyy')), 9.79, 1, 1234, 2);

INSERT INTO cobranca(id_cobranca, data_pgto, valor, usuario_id_usuario, final_cartao, plano_id_plano)
VALUES(6, (TO_DATE('01/01/2020', 'dd/mm/yyyy')), 6.99, 3, 4321, 1);

INSERT INTO cobranca(id_cobranca, data_pgto, valor, usuario_id_usuario, final_cartao, plano_id_plano)
VALUES(7, (TO_DATE('01/02/2020', 'dd/mm/yyyy')), 6.99, 3, 4321, 1);

--inserindo alguns cartões de crédito
INSERT INTO cartao_credito (id_cartao, nome_impresso, numero, validade_mes, validade_ano, cvv, usuario_id_usuario)
VALUES(1, 'Roberto Bolaños', 1234432112344321, 10, 2030, 123, 3);

INSERT INTO cartao_credito (id_cartao, nome_impresso, numero, validade_mes, validade_ano, cvv, usuario_id_usuario)
VALUES(2, 'Ramón Valdés', 4321123443211234, 12, 2022, 321, 1);


--criando algumas listas de reprodução
INSERT INTO lista_reprod(id_lista, nome_lista, usuario_id_usuario)
VALUES(1, 'Para curtir', 1);

INSERT INTO lista_reprod(id_lista, nome_lista, usuario_id_usuario)
VALUES(2, 'Para estudar', 1);

INSERT INTO lista_reprod(id_lista, nome_lista, usuario_id_usuario)
VALUES(3, 'Beatlemania', 2);

INSERT INTO lista_reprod(id_lista, nome_lista, usuario_id_usuario)
VALUES(4, 'Jazz legal', 3);

--inserdindo dados na relação da lista de rep com as músicas com a ordem da música na lista 
INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(1, 1, 1);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(2, 1, 2);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(4, 1, 3);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(6, 1, 4);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(11, 1, 5);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(1, 2, 3);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(5, 2, 2);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(1, 3, 1);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(2, 3, 1);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(3, 3, 2);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(4, 3, 3);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(5, 3, 5);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(6, 3, 4);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(8, 4, 1);

INSERT INTO rel_lista_musica (musica_id_musica, lista_reprod_id_lista, ordem_musica)
VALUES(11, 4, 2);