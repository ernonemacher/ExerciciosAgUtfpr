-- Comandos para criação de tabelas

CREATE TABLE professor (
    idprofessor SERIAL NOT NULL,
    nome        VARCHAR(50),
    PRIMARY KEY (idprofessor)
);

CREATE TABLE evento (
    idevento SERIAL NOT NULL,
    titulo   VARCHAR(20),
    dhinicio DATE,
    dhfim    DATE,
    PRIMARY KEY (idevento)
);

CREATE TABLE grupo (
    idgrupo SERIAL NOT NULL,
    nome    VARCHAR(50),
    PRIMARY KEY (idgrupo)
);

CREATE TABLE aluno (
    idaluno SERIAL NOT NULL,
    nome    VARCHAR(100),
    PRIMARY KEY (idaluno)
);

CREATE TABLE atividade (
    idatividade SERIAL NOT NULL,
    titulo      VARCHAR(50),
    dhfim       DATE,
    dhinicio    DATE,
    PRIMARY KEY (idatividade)
);

CREATE TABLE monitor (
    idmonitor         SERIAL       NOT NULL,
    aluno_idaluno     INTEGER      NOT NULL,
    carteira_trabalho VARCHAR(255) NOT NULL,
    remuneracao       FLOAT,
    PRIMARY KEY (idmonitor),
    FOREIGN KEY (aluno_idaluno)
        REFERENCES aluno (idaluno)
);

CREATE INDEX monitor_FKIndex1 ON monitor (aluno_idaluno);

CREATE INDEX IFK_Rel_69 ON monitor (aluno_idaluno);

CREATE TABLE grupo_has_atividade (
    grupo_idgrupo         INTEGER NOT NULL,
    atividade_idatividade INTEGER NOT NULL,
    concluido             BOOL,
    PRIMARY KEY (grupo_idgrupo, atividade_idatividade),
    FOREIGN KEY (grupo_idgrupo)
        REFERENCES grupo (idgrupo),
    FOREIGN KEY (atividade_idatividade)
        REFERENCES atividade (idatividade)
);

CREATE INDEX grupo_has_atividade_FKIndex1 ON grupo_has_atividade (grupo_idgrupo);
CREATE INDEX grupo_has_atividade_FKIndex2 ON grupo_has_atividade (atividade_idatividade);

CREATE INDEX IFK_Rel_55 ON grupo_has_atividade (grupo_idgrupo);
CREATE INDEX IFK_Rel_56 ON grupo_has_atividade (atividade_idatividade);

CREATE TABLE grupo_has_aluno (
    grupo_idgrupo INTEGER NOT NULL,
    aluno_idaluno INTEGER NOT NULL,
    PRIMARY KEY (grupo_idgrupo, aluno_idaluno),
    FOREIGN KEY (grupo_idgrupo)
        REFERENCES grupo (idgrupo),
    FOREIGN KEY (aluno_idaluno)
        REFERENCES aluno (idaluno)
);

CREATE INDEX grupo_has_aluno_FKIndex1 ON grupo_has_aluno (grupo_idgrupo);
CREATE INDEX grupo_has_aluno_FKIndex2 ON grupo_has_aluno (aluno_idaluno);

CREATE INDEX IFK_Rel_72 ON grupo_has_aluno (grupo_idgrupo);
CREATE INDEX IFK_Rel_73 ON grupo_has_aluno (aluno_idaluno);

CREATE TABLE dashboard (
    iddashboard   SERIAL NOT NULL,
    grupo_idgrupo INTEGER,
    aluno_idaluno INTEGER,
    titulo        VARCHAR(25),
    PRIMARY KEY (iddashboard),
    FOREIGN KEY (aluno_idaluno)
        REFERENCES aluno (idaluno),
    FOREIGN KEY (grupo_idgrupo)
        REFERENCES grupo (idgrupo)
);

CREATE INDEX dashboard_FKIndex1 ON dashboard (aluno_idaluno);
CREATE INDEX dashboard_FKIndex2 ON dashboard (grupo_idgrupo);

CREATE INDEX IFK_Rel_65 ON dashboard (aluno_idaluno);
CREATE INDEX IFK_Rel_66 ON dashboard (grupo_idgrupo);

CREATE TABLE atividade_has_aluno (
    atividade_idatividade INTEGER NOT NULL,
    aluno_idaluno         INTEGER NOT NULL,
    concluido             BOOL,
    PRIMARY KEY (atividade_idatividade, aluno_idaluno),
    FOREIGN KEY (atividade_idatividade)
        REFERENCES atividade (idatividade),
    FOREIGN KEY (aluno_idaluno)
        REFERENCES aluno (idaluno)
);

CREATE INDEX atividade_has_aluno_FKIndex1 ON atividade_has_aluno (atividade_idatividade);
CREATE INDEX atividade_has_aluno_FKIndex2 ON atividade_has_aluno (aluno_idaluno);

CREATE INDEX IFK_Rel_51 ON atividade_has_aluno (atividade_idatividade);
CREATE INDEX IFK_Rel_52 ON atividade_has_aluno (aluno_idaluno);

CREATE TABLE evento_has_grupo (
    evento_idevento INTEGER NOT NULL,
    grupo_idgrupo   INTEGER NOT NULL,
    PRIMARY KEY (evento_idevento, grupo_idgrupo),
    FOREIGN KEY (evento_idevento)
        REFERENCES evento (idevento),
    FOREIGN KEY (grupo_idgrupo)
        REFERENCES grupo (idgrupo)
);

CREATE INDEX evento_has_grupo_FKIndex1 ON evento_has_grupo (evento_idevento);
CREATE INDEX evento_has_grupo_FKIndex2 ON evento_has_grupo (grupo_idgrupo);

CREATE INDEX IFK_Rel_45 ON evento_has_grupo (evento_idevento);
CREATE INDEX IFK_Rel_46 ON evento_has_grupo (grupo_idgrupo);

CREATE TABLE evento_has_aluno (
    evento_idevento INTEGER NOT NULL,
    aluno_idaluno   INTEGER NOT NULL,
    PRIMARY KEY (evento_idevento, aluno_idaluno),
    FOREIGN KEY (evento_idevento)
        REFERENCES evento (idevento),
    FOREIGN KEY (aluno_idaluno)
        REFERENCES aluno (idaluno)
);

CREATE INDEX evento_has_aluno_FKIndex1 ON evento_has_aluno (evento_idevento);
CREATE INDEX evento_has_aluno_FKIndex2 ON evento_has_aluno (aluno_idaluno);

CREATE INDEX IFK_Rel_57 ON evento_has_aluno (evento_idevento);
CREATE INDEX IFK_Rel_58 ON evento_has_aluno (aluno_idaluno);

CREATE TABLE evento_has_atividade (
    evento_idevento       INTEGER NOT NULL,
    atividade_idatividade INTEGER NOT NULL,
    PRIMARY KEY (evento_idevento, atividade_idatividade),
    FOREIGN KEY (evento_idevento)
        REFERENCES evento (idevento),
    FOREIGN KEY (atividade_idatividade)
        REFERENCES atividade (idatividade)
);

CREATE INDEX evento_has_atividade_FKIndex1 ON evento_has_atividade (evento_idevento);
CREATE INDEX evento_has_atividade_FKIndex2 ON evento_has_atividade (atividade_idatividade);

CREATE INDEX IFK_Rel_49 ON evento_has_atividade (evento_idevento);
CREATE INDEX IFK_Rel_50 ON evento_has_atividade (atividade_idatividade);

CREATE TABLE disciplina (
    iddisciplina      SERIAL  NOT NULL,
    monitor_idmonitor INTEGER NOT NULL,
    nome              VARCHAR(200),
    PRIMARY KEY (iddisciplina),
    FOREIGN KEY (monitor_idmonitor)
        REFERENCES monitor (idmonitor)
);

CREATE INDEX disciplina_FKIndex1 ON disciplina (monitor_idmonitor);

CREATE INDEX IFK_Rel_40 ON disciplina (monitor_idmonitor);

CREATE TABLE card (
    idcard                SERIAL  NOT NULL,
    dashboard_iddashboard INTEGER NOT NULL,
    titulo                VARCHAR(25),
    estado                VARCHAR(25),
    PRIMARY KEY (idcard),
    FOREIGN KEY (dashboard_iddashboard)
        REFERENCES dashboard (iddashboard)
);

CREATE INDEX card_FKIndex1 ON card (dashboard_iddashboard);

CREATE INDEX IFK_Rel_64 ON card (dashboard_iddashboard);

CREATE TABLE materia (
    idmateria               SERIAL  NOT NULL,
    professor_idprofessor   INTEGER NOT NULL,
    disciplina_iddisciplina INTEGER NOT NULL,
    descricao               VARCHAR(255),
    PRIMARY KEY (idmateria),
    FOREIGN KEY (disciplina_iddisciplina)
        REFERENCES disciplina (iddisciplina),
    FOREIGN KEY (professor_idprofessor)
        REFERENCES professor (idprofessor)
);

CREATE INDEX materia_FKIndex1 ON materia (disciplina_iddisciplina);
CREATE INDEX materia_FKIndex2 ON materia (professor_idprofessor);

CREATE INDEX IFK_Rel_41 ON materia (disciplina_iddisciplina);
CREATE INDEX IFK_Rel_42 ON materia (professor_idprofessor);

CREATE TABLE card_has_card (
    card_idcard_pai   INTEGER NOT NULL,
    card_idcard_filho INTEGER NOT NULL,
    PRIMARY KEY (card_idcard_pai, card_idcard_filho),
    FOREIGN KEY (card_idcard_pai)
        REFERENCES card (idcard),
    FOREIGN KEY (card_idcard_filho)
        REFERENCES card (idcard)
);

CREATE INDEX card_has_card_FKIndex1 ON card_has_card (card_idcard_pai);
CREATE INDEX card_has_card_FKIndex2 ON card_has_card (card_idcard_filho);

CREATE INDEX IFK_Rel_62 ON card_has_card (card_idcard_pai);
CREATE INDEX IFK_Rel_63 ON card_has_card (card_idcard_filho);

CREATE TABLE atividade_has_card (
    atividade_idatividade INTEGER NOT NULL,
    card_idcard           INTEGER NOT NULL,
    PRIMARY KEY (atividade_idatividade, card_idcard),
    FOREIGN KEY (atividade_idatividade)
        REFERENCES atividade (idatividade),
    FOREIGN KEY (card_idcard)
        REFERENCES card (idcard)
);

CREATE INDEX atividade_has_card_FKIndex1 ON atividade_has_card (atividade_idatividade);
CREATE INDEX atividade_has_card_FKIndex2 ON atividade_has_card (card_idcard);

CREATE INDEX IFK_Rel_59 ON atividade_has_card (atividade_idatividade);
CREATE INDEX IFK_Rel_60 ON atividade_has_card (card_idcard);

CREATE TABLE turma (
    idturma           SERIAL  NOT NULL,
    materia_idmateria INTEGER NOT NULL,
    nome              VARCHAR(50),
    PRIMARY KEY (idturma),
    FOREIGN KEY (materia_idmateria)
        REFERENCES materia (idmateria)
);

CREATE INDEX turma_FKIndex1 ON turma (materia_idmateria);

CREATE INDEX IFK_Rel_38 ON turma (materia_idmateria);

CREATE TABLE turma_has_grupo (
    turma_idturma INTEGER NOT NULL,
    grupo_idgrupo INTEGER NOT NULL,
    PRIMARY KEY (turma_idturma, grupo_idgrupo),
    FOREIGN KEY (turma_idturma)
        REFERENCES turma (idturma),
    FOREIGN KEY (grupo_idgrupo)
        REFERENCES grupo (idgrupo)
);

CREATE INDEX turma_has_grupo_FKIndex1 ON turma_has_grupo (turma_idturma);
CREATE INDEX turma_has_grupo_FKIndex2 ON turma_has_grupo (grupo_idgrupo);

CREATE INDEX IFK_Rel_70 ON turma_has_grupo (turma_idturma);
CREATE INDEX IFK_Rel_71 ON turma_has_grupo (grupo_idgrupo);

CREATE TABLE turma_has_aluno (
    turma_idturma INTEGER NOT NULL,
    aluno_idaluno INTEGER NOT NULL,
    PRIMARY KEY (turma_idturma, aluno_idaluno),
    FOREIGN KEY (turma_idturma)
        REFERENCES turma (idturma),
    FOREIGN KEY (aluno_idaluno)
        REFERENCES aluno (idaluno)
);

CREATE INDEX turma_has_aluno_FKIndex1 ON turma_has_aluno (turma_idturma);
CREATE INDEX turma_has_aluno_FKIndex2 ON turma_has_aluno (aluno_idaluno);

CREATE INDEX IFK_Rel_67 ON turma_has_aluno (turma_idturma);
CREATE INDEX IFK_Rel_68 ON turma_has_aluno (aluno_idaluno);

CREATE TABLE turma_has_atividade (
    turma_idturma         INTEGER NOT NULL,
    atividade_idatividade INTEGER NOT NULL,
    PRIMARY KEY (turma_idturma, atividade_idatividade),
    FOREIGN KEY (turma_idturma)
        REFERENCES turma (idturma),
    FOREIGN KEY (atividade_idatividade)
        REFERENCES atividade (idatividade)
);

CREATE INDEX turma_has_atividade_FKIndex1 ON turma_has_atividade (turma_idturma);
CREATE INDEX turma_has_atividade_FKIndex2 ON turma_has_atividade (atividade_idatividade);

CREATE INDEX IFK_Rel_53 ON turma_has_atividade (turma_idturma);
CREATE INDEX IFK_Rel_54 ON turma_has_atividade (atividade_idatividade);

CREATE TABLE evento_has_turma (
    evento_idevento INTEGER NOT NULL,
    turma_idturma   INTEGER NOT NULL,
    PRIMARY KEY (evento_idevento, turma_idturma),
    FOREIGN KEY (evento_idevento)
        REFERENCES evento (idevento),
    FOREIGN KEY (turma_idturma)
        REFERENCES turma (idturma)
);

CREATE INDEX evento_has_turma_FKIndex1 ON evento_has_turma (evento_idevento);
CREATE INDEX evento_has_turma_FKIndex2 ON evento_has_turma (turma_idturma);

CREATE INDEX IFK_Rel_43 ON evento_has_turma (evento_idevento);
CREATE INDEX IFK_Rel_44 ON evento_has_turma (turma_idturma);

-- Comandos para inserção de 3 a 5 registros em cada tabela;

INSERT INTO aluno (nome)
VALUES ('Eduardo Nonemacher'),
       ('Gabriel Zaro'),
       ('Cássio Ritse'),
       ('Felippe Negrão'),
       ('Roberto Goz');

INSERT INTO monitor (aluno_idaluno, remuneracao, carteira_trabalho)
VALUES ((SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse'), 500, 'carteiranonemacher123'),
       ((SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher'), 1000, 'carteirazaro321'),
       ((SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro'), 1000, 'carteiraritse222');

INSERT INTO disciplina (monitor_idmonitor, nome)
VALUES ((SELECT idmonitor
         FROM monitor
                  JOIN aluno a on monitor.aluno_idaluno = a.idaluno
         WHERE a.nome = 'Cássio Ritse'), 'Estrutura de dados'),
       ((SELECT idmonitor
         FROM monitor
                  JOIN aluno a on monitor.aluno_idaluno = a.idaluno
         WHERE a.nome = 'Eduardo Nonemacher'), 'Programação Orientada a Objetos'),
       ((SELECT idmonitor
         FROM monitor
                  JOIN aluno a on monitor.aluno_idaluno = a.idaluno
         WHERE a.nome = 'Gabriel Zaro'), 'Banco de dados');

INSERT INTO professor (nome)
VALUES ('Evandro Kuchera'),
       ('Luis Khun'),
       ('Fernando Mazetto'),
       ('Rafael Gomes Mantovani'),
       ('Franciele Beal');


INSERT INTO materia (professor_idprofessor, disciplina_iddisciplina, descricao)
VALUES ((SELECT idprofessor FROM professor WHERE nome = 'Evandro Kuchera'),
        (SELECT iddisciplina
         FROM disciplina
         WHERE monitor_idmonitor = (SELECT idmonitor
                                    FROM monitor
                                             JOIN aluno a on a.idaluno = monitor.aluno_idaluno
                                    WHERE a.nome = 'Cássio Ritse')
           AND nome = 'Estrutura de dados'),
        'Estrutura de dados'),
       ((SELECT idprofessor FROM professor WHERE nome = 'Rafael Gomes Mantovani'),
        (SELECT iddisciplina
         FROM disciplina
         WHERE monitor_idmonitor = (SELECT idmonitor
                                    FROM monitor
                                             JOIN aluno a on a.idaluno = monitor.aluno_idaluno
                                    WHERE a.nome = 'Eduardo Nonemacher')
           AND nome = 'Programação Orientada a Objetos'),
        'Programação Orientada a Objetos'),
       ((SELECT idprofessor FROM professor WHERE nome = 'Franciele Beal'),
        (SELECT iddisciplina
         FROM disciplina
         WHERE monitor_idmonitor = (SELECT idmonitor
                                    FROM monitor
                                             JOIN aluno a on a.idaluno = monitor.aluno_idaluno
                                    WHERE a.nome = 'Gabriel Zaro')
           AND nome = 'Banco de dados'),
        'Banco de dados');

INSERT INTO turma (materia_idmateria, nome)
VALUES ((SELECT idmateria FROM materia WHERE descricao = 'Estrutura de dados'), 'ED23S'),
       ((SELECT idmateria FROM materia WHERE descricao = 'Programação Orientada a Objetos'), 'PO23S'),
       ((SELECT idmateria FROM materia WHERE descricao = 'Banco de dados'), 'BD23S');

INSERT INTO evento (titulo, dhinicio, dhfim)
VALUES ('Início da matéria', '2022-01-01', '2022-01-06'),
       ('Atividade 1', '2022-02-06', '2022-03-06'),
       ('Devolutiva', '2022-06-01', '2022-06-14');

INSERT INTO grupo (nome)
VALUES ('Grupo de estudo'),
       ('Trabalho de BD'),
       ('CCH de POO');

INSERT INTO atividade (titulo, dhfim, dhinicio)
VALUES ('Pratica 1', '2022-02-01', '2022-02-25'),
       ('Pratica 2', '2022-03-01', '2022-03-25'),
       ('Pratica 3', '2022-04-01', '2022-05-25');

INSERT INTO dashboard (grupo_idgrupo, aluno_idaluno, titulo)
VALUES ((SELECT idgrupo FROM grupo WHERE nome = 'Grupo de estudo'), NULL, 'Dashboard do gp estudo'),
       (NULL, (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher'), 'MyClass dashboard'),
       ((SELECT idgrupo FROM grupo WHERE nome = 'CCH de POO'), NULL, 'CCH de POO');

INSERT INTO card (dashboard_iddashboard, titulo, estado)
VALUES ((SELECT iddashboard FROM dashboard WHERE titulo = 'MyClass dashboard'), 'Fazer slides', 'new'),
       ((SELECT iddashboard FROM dashboard WHERE titulo = 'CCH de POO'), 'Criar interface', 'new'),
       ((SELECT iddashboard FROM dashboard WHERE titulo = 'CCH de POO'), 'Definir o titulo do banco', 'new'),
       ((SELECT iddashboard FROM dashboard WHERE titulo = 'CCH de POO'), 'Alterar classes', 'new'),
       ((SELECT iddashboard FROM dashboard WHERE titulo = 'CCH de POO'), 'Definir tema', 'new'),
       ((SELECT iddashboard FROM dashboard WHERE titulo = 'Dashboard do gp estudo'), 'Separar tarefas', 'new');

INSERT INTO card_has_card (card_idcard_pai, card_idcard_filho)
VALUES ((SELECT idcard FROM card WHERE titulo = 'Criar interface'),
        (SELECT idcard FROM card WHERE titulo = 'Definir o titulo do banco')),
       ((SELECT idcard FROM card WHERE titulo = 'Criar interface'),
        (SELECT idcard FROM card WHERE titulo = 'Alterar classes')),
       ((SELECT idcard FROM card WHERE titulo = 'Criar interface'),
        (SELECT idcard FROM card WHERE titulo = 'Definir tema'));

INSERT INTO grupo_has_aluno (grupo_idgrupo, aluno_idaluno)
VALUES ((SELECT idgrupo FROM grupo WHERE nome = 'Grupo de estudo'),
        (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse')),
       ((SELECT idgrupo FROM grupo WHERE nome = 'CCH de POO'),
        (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher')),
       ((SELECT idgrupo FROM grupo WHERE nome = 'Trabalho de BD'),
        (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro'));

INSERT INTO atividade_has_aluno (atividade_idatividade, aluno_idaluno, concluido)
VALUES ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1'),
        (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse'), true),
       ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1'),
        (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro'), true),
       ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 2'),
        (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse'), false),
       ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 3'),
        (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher'), true);

INSERT INTO turma_has_grupo (turma_idturma, grupo_idgrupo)
VALUES ((SELECT idmateria FROM materia WHERE descricao = 'Estrutura de dados'),
        (SELECT idgrupo FROM grupo WHERE nome = 'Grupo de estudo')),
       ((SELECT idmateria FROM materia WHERE descricao = 'Programação Orientada a Objetos'),
        (SELECT idgrupo FROM grupo WHERE nome = 'CCH de POO')),
       ((SELECT idmateria FROM materia WHERE descricao = 'Banco de dados'),
        (SELECT idgrupo FROM grupo WHERE nome = 'Trabalho de BD'));

INSERT INTO turma_has_atividade (turma_idturma, atividade_idatividade)
VALUES ((SELECT idmateria FROM materia WHERE descricao = 'Estrutura de dados'),
        (SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1')),
       ((SELECT idmateria FROM materia WHERE descricao = 'Programação Orientada a Objetos'),
        (SELECT idatividade FROM atividade WHERE titulo = 'Pratica 2')),
       ((SELECT idmateria FROM materia WHERE descricao = 'Banco de dados'),
        (SELECT idatividade FROM atividade WHERE titulo = 'Pratica 3'));

INSERT INTO turma_has_aluno (turma_idturma, aluno_idaluno)
VALUES ((SELECT idmateria FROM materia WHERE descricao = 'Estrutura de dados'),
        (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse')),
       ((SELECT idmateria FROM materia WHERE descricao = 'Programação Orientada a Objetos'),
        (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')),
       ((SELECT idmateria FROM materia WHERE descricao = 'Banco de dados'),
        (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher'));

INSERT INTO evento_has_turma (evento_idevento, turma_idturma)
VALUES ((SELECT idevento FROM evento WHERE titulo = 'Devolutiva'),
        (SELECT idmateria FROM materia WHERE descricao = 'Estrutura de dados')),
       ((SELECT idevento FROM evento WHERE titulo = 'Atividade 1'),
        (SELECT idmateria FROM materia WHERE descricao = 'Programação Orientada a Objetos')),
       ((SELECT idevento FROM evento WHERE titulo = 'Início da matéria'),
        (SELECT idmateria FROM materia WHERE descricao = 'Banco de dados'));

INSERT INTO grupo_has_atividade (atividade_idatividade, grupo_idgrupo, concluido)
VALUES ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1'),
        (SELECT idgrupo FROM grupo WHERE nome = 'Grupo de estudo'), true),
       ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1'),
        (SELECT idgrupo FROM grupo WHERE nome = 'CCH de POO'), true),
       ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 2'),
        (SELECT idgrupo FROM grupo WHERE nome = 'Trabalho de BD'), true);

INSERT INTO evento_has_atividade (evento_idevento, atividade_idatividade)
VALUES ((SELECT idevento FROM evento WHERE titulo = 'Devolutiva'),
        (SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1')),
       ((SELECT idevento FROM evento WHERE titulo = 'Atividade 1'),
        (SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1')),
       ((SELECT idevento FROM evento WHERE titulo = 'Início da matéria'),
        (SELECT idatividade FROM atividade WHERE titulo = 'Pratica 2'));

INSERT INTO evento_has_grupo (evento_idevento, grupo_idgrupo)
VALUES ((SELECT idevento FROM evento WHERE titulo = 'Devolutiva'),
        (SELECT idgrupo FROM grupo WHERE nome = 'Grupo de estudo')),
       ((SELECT idevento FROM evento WHERE titulo = 'Atividade 1'),
        (SELECT idgrupo FROM grupo WHERE nome = 'CCH de POO')),
       ((SELECT idevento FROM evento WHERE titulo = 'Início da matéria'),
        (SELECT idgrupo FROM grupo WHERE nome = 'Trabalho de BD'));

INSERT INTO atividade_has_card (atividade_idatividade, card_idcard)
VALUES ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1'),
        (SELECT idcard FROM card WHERE titulo = 'Fazer slides')),
       ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1'),
        (SELECT idcard FROM card WHERE titulo = 'Criar interface')),
       ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 2'),
        (SELECT idcard FROM card WHERE titulo = 'Separar tarefas'));

INSERT INTO evento_has_aluno (evento_idevento, aluno_idaluno)
VALUES ((SELECT idevento FROM evento WHERE titulo = 'Devolutiva'),
        (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher')),
       ((SELECT idevento FROM evento WHERE titulo = 'Atividade 1'),
        (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')),
       ((SELECT idevento FROM evento WHERE titulo = 'Início da matéria'),
        (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse'));

-- Comando de alteração para um registro de uma tabela de sua escolha;

UPDATE aluno
SET nome = 'Felipe Negrão'
WHERE nome = 'Felippe Negrão';

-- Comando de deleção para um registro de uma tabela de sua escolha;

DELETE
FROM aluno
WHERE nome = 'Roberto Goz';

-- Consulta simples para cada uma das tabelas;

SELECT idevento, titulo, dhinicio, dhfim
FROM evento;

SELECT iddashboard, grupo_idgrupo, aluno_idaluno, titulo
FROM dashboard;

SELECT idcard, dashboard_iddashboard, titulo, estado
FROM card;

SELECT card_idcard_pai, card_idcard_filho
FROM card_has_card;

SELECT idturma, materia_idmateria, nome
FROM turma;

SELECT idprofessor, nome
FROM professor;

SELECT idgrupo, nome
FROM grupo;

SELECT idaluno, nome
FROM aluno;

SELECT idatividade, titulo, dhfim, dhinicio
FROM atividade;

SELECT idmonitor, aluno_idaluno, carteira_trabalho, remuneracao
FROM monitor;

SELECT iddisciplina, monitor_idmonitor, nome
FROM disciplina;

SELECT idmateria, professor_idprofessor, disciplina_iddisciplina, descricao
FROM materia;

SELECT grupo_idgrupo, aluno_idaluno
FROM grupo_has_aluno;

SELECT atividade_idatividade, aluno_idaluno, concluido
FROM atividade_has_aluno;

SELECT turma_idturma, grupo_idgrupo
FROM turma_has_grupo;

SELECT turma_idturma, atividade_idatividade
FROM turma_has_atividade;

SELECT turma_idturma, aluno_idaluno
FROM turma_has_aluno;

SELECT evento_idevento, turma_idturma
FROM evento_has_turma;

SELECT grupo_idgrupo, atividade_idatividade, concluido
FROM grupo_has_atividade;

SELECT evento_idevento, atividade_idatividade
FROM evento_has_atividade;

SELECT evento_idevento, grupo_idgrupo
FROM evento_has_grupo;

SELECT atividade_idatividade, card_idcard
FROM atividade_has_card;

SELECT evento_idevento, aluno_idaluno
FROM evento_has_aluno;


-- Duas consultas com junção de tabelas (JOIN);

SELECT idaluno,
       nome,
       remuneracao,
       carteira_trabalho
FROM monitor m
         JOIN aluno a ON a.idaluno = m.aluno_idaluno;

SELECT iddisciplina,
       monitor_idmonitor,
       d.nome AS nome_disciplina,
       idaluno,
       a.nome AS nome_aluno,
       remuneracao,
       carteira_trabalho
FROM disciplina d
         JOIN monitor m on d.monitor_idmonitor = m.aluno_idaluno
         JOIN aluno a ON a.idaluno = m.aluno_idaluno;

-- Duas consultas com função de agregação;

SELECT COUNT(idaluno) AS quantidade_alunos
FROM aluno;

SELECT SUM(remuneracao) AS soma_remuneracao
FROM monitor;

-- Uma consulta com agrupamento ou subconsulta.

SELECT iddashboard,
       titulo,
       (select nome
        from grupo g
        WHERE g.idgrupo = d.grupo_idgrupo) AS nome_grupo
FROM dashboard d