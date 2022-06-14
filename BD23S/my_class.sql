-- Comandos para criação de tabelas

CREATE TABLE evento (
    idevento SERIAL NOT NULL,
    titulo   VARCHAR(20),
    dhinicio DATE,
    dhfim    DATE,
    PRIMARY KEY (idevento)
);

CREATE TABLE dashboard (
    iddashboard SERIAL NOT NULL,
    titulo      VARCHAR(25),
    PRIMARY KEY (iddashboard)
);

CREATE TABLE card (
    idcard SERIAL NOT NULL,
    titulo VARCHAR(25),
    estado VARCHAR(25),
    PRIMARY KEY (idcard)
);

CREATE TABLE turma (
    idturma SERIAL NOT NULL,
    nome    VARCHAR(50),
    PRIMARY KEY (idturma)
);

CREATE TABLE professor (
    idprofessor SERIAL NOT NULL,
    nome        VARCHAR(50),
    PRIMARY KEY (idprofessor)
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
    aluno_idaluno     INTEGER NOT NULL,
    remuneracao       FLOAT   NOT NULL,
    carteira_trabalho VARCHAR NOT NULL,
    PRIMARY KEY (aluno_idaluno),
    FOREIGN KEY (aluno_idaluno)
        REFERENCES aluno (idaluno)
);

CREATE INDEX monitor_FKIndex1 ON monitor (aluno_idaluno);

CREATE INDEX IFK_Rel_01 ON monitor (aluno_idaluno);

CREATE TABLE grupo_has_dashboard (
    grupo_idgrupo         INTEGER NOT NULL,
    dashboard_iddashboard INTEGER NOT NULL,
    PRIMARY KEY (grupo_idgrupo, dashboard_iddashboard),
    FOREIGN KEY (grupo_idgrupo)
        REFERENCES grupo (idgrupo),
    FOREIGN KEY (dashboard_iddashboard)
        REFERENCES dashboard (iddashboard)
);

CREATE INDEX grupo_has_dashboard_FKIndex1 ON grupo_has_dashboard (grupo_idgrupo);
CREATE INDEX grupo_has_dashboard_FKIndex2 ON grupo_has_dashboard (dashboard_iddashboard);

CREATE INDEX IFK_Rel_34 ON grupo_has_dashboard (grupo_idgrupo);
CREATE INDEX IFK_Rel_35 ON grupo_has_dashboard (dashboard_iddashboard);

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

CREATE INDEX IFK_Rel_32 ON grupo_has_aluno (grupo_idgrupo);
CREATE INDEX IFK_Rel_33 ON grupo_has_aluno (aluno_idaluno);

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

CREATE INDEX IFK_Rel_10 ON atividade_has_aluno (atividade_idatividade);
CREATE INDEX IFK_Rel_11 ON atividade_has_aluno (aluno_idaluno);

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

CREATE INDEX IFK_Rel_14 ON turma_has_grupo (turma_idturma);
CREATE INDEX IFK_Rel_15 ON turma_has_grupo (grupo_idgrupo);

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

CREATE INDEX IFK_Rel_30 ON turma_has_atividade (turma_idturma);
CREATE INDEX IFK_Rel_31 ON turma_has_atividade (atividade_idatividade);

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

CREATE INDEX IFK_Rel_16 ON turma_has_aluno (turma_idturma);
CREATE INDEX IFK_Rel_17 ON turma_has_aluno (aluno_idaluno);

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

CREATE INDEX IFK_Rel_20 ON evento_has_turma (evento_idevento);
CREATE INDEX IFK_Rel_21 ON evento_has_turma (turma_idturma);

CREATE TABLE card_has_dashboard (
    card_idcard           INTEGER NOT NULL,
    dashboard_iddashboard INTEGER NOT NULL,
    PRIMARY KEY (card_idcard, dashboard_iddashboard),
    FOREIGN KEY (card_idcard)
        REFERENCES card (idcard),
    FOREIGN KEY (dashboard_iddashboard)
        REFERENCES dashboard (iddashboard)
);

CREATE INDEX card_has_dashboard_FKIndex1 ON card_has_dashboard (card_idcard);
CREATE INDEX card_has_dashboard_FKIndex2 ON card_has_dashboard (dashboard_iddashboard);

CREATE INDEX IFK_Rel_04 ON card_has_dashboard (card_idcard);
CREATE INDEX IFK_Rel_05 ON card_has_dashboard (dashboard_iddashboard);

CREATE TABLE atividade_has_grupo (
    atividade_idatividade INTEGER NOT NULL,
    grupo_idgrupo         INTEGER NOT NULL,
    concluido             BOOL,
    PRIMARY KEY (atividade_idatividade, grupo_idgrupo),
    FOREIGN KEY (atividade_idatividade)
        REFERENCES atividade (idatividade),
    FOREIGN KEY (grupo_idgrupo)
        REFERENCES grupo (idgrupo)
);

CREATE INDEX atividade_has_grupo_FKIndex1 ON atividade_has_grupo (atividade_idatividade);
CREATE INDEX atividade_has_grupo_FKIndex2 ON atividade_has_grupo (grupo_idgrupo);

CREATE INDEX IFK_Rel_08 ON atividade_has_grupo (atividade_idatividade);
CREATE INDEX IFK_Rel_09 ON atividade_has_grupo (grupo_idgrupo);

CREATE TABLE dashboard_has_aluno (
    dashboard_iddashboard INTEGER NOT NULL,
    aluno_idaluno         INTEGER NOT NULL,
    PRIMARY KEY (dashboard_iddashboard, aluno_idaluno),
    FOREIGN KEY (dashboard_iddashboard)
        REFERENCES dashboard (iddashboard),
    FOREIGN KEY (aluno_idaluno)
        REFERENCES aluno (idaluno)
);

CREATE INDEX dashboard_has_aluno_FKIndex1 ON dashboard_has_aluno (dashboard_iddashboard);
CREATE INDEX dashboard_has_aluno_FKIndex2 ON dashboard_has_aluno (aluno_idaluno);

CREATE INDEX IFK_Rel_02 ON dashboard_has_aluno (dashboard_iddashboard);
CREATE INDEX IFK_Rel_03 ON dashboard_has_aluno (aluno_idaluno);

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

CREATE INDEX IFK_Rel_28 ON evento_has_atividade (evento_idevento);
CREATE INDEX IFK_Rel_29 ON evento_has_atividade (atividade_idatividade);

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

CREATE INDEX IFK_Rel_24 ON evento_has_grupo (evento_idevento);
CREATE INDEX IFK_Rel_25 ON evento_has_grupo (grupo_idgrupo);

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

CREATE INDEX IFK_Rel_06 ON atividade_has_card (atividade_idatividade);
CREATE INDEX IFK_Rel_07 ON atividade_has_card (card_idcard);

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

CREATE INDEX IFK_Rel_26 ON evento_has_aluno (evento_idevento);
CREATE INDEX IFK_Rel_27 ON evento_has_aluno (aluno_idaluno);

CREATE TABLE disciplina (
    id_disciplina         SERIAL  NOT NULL,
    monitor_aluno_idaluno INTEGER NOT NULL,
    nome                  VARCHAR(200),
    PRIMARY KEY (id_disciplina, monitor_aluno_idaluno),
    FOREIGN KEY (monitor_aluno_idaluno)
        REFERENCES monitor (aluno_idaluno)
);

CREATE INDEX disciplina_FKIndex1 ON disciplina (monitor_aluno_idaluno);

CREATE INDEX IFK_Rel_38 ON disciplina (monitor_aluno_idaluno);

CREATE TABLE aula (
    idaula                           SERIAL  NOT NULL,
    professor_idprofessor            INTEGER NOT NULL,
    disciplina_id_disciplina         INTEGER NOT NULL,
    disciplina_monitor_aluno_idaluno INTEGER NOT NULL,
    descricao                        VARCHAR(255),
    PRIMARY KEY (idaula, professor_idprofessor, disciplina_id_disciplina, disciplina_monitor_aluno_idaluno),
    FOREIGN KEY (professor_idprofessor)
        REFERENCES professor (idprofessor),
    FOREIGN KEY (disciplina_id_disciplina, disciplina_monitor_aluno_idaluno)
        REFERENCES disciplina (id_disciplina, monitor_aluno_idaluno)
);

CREATE INDEX aula_FKIndex1 ON aula (professor_idprofessor);
CREATE INDEX aula_FKIndex2 ON aula (disciplina_id_disciplina, disciplina_monitor_aluno_idaluno);

CREATE INDEX IFK_Rel_36 ON aula (professor_idprofessor);
CREATE INDEX IFK_Rel_37 ON aula (disciplina_id_disciplina, disciplina_monitor_aluno_idaluno);

CREATE TABLE aula_has_turma (
    aula_idaula                           INTEGER NOT NULL,
    turma_idturma                         INTEGER NOT NULL,
    aula_professor_idprofessor            INTEGER NOT NULL,
    aula_disciplina_id_disciplina         INTEGER NOT NULL,
    aula_disciplina_monitor_aluno_idaluno INTEGER NOT NULL,
    PRIMARY KEY (aula_idaula, turma_idturma, aula_professor_idprofessor, aula_disciplina_id_disciplina,
                 aula_disciplina_monitor_aluno_idaluno),
    FOREIGN KEY (aula_idaula, aula_professor_idprofessor, aula_disciplina_id_disciplina,
                 aula_disciplina_monitor_aluno_idaluno)
        REFERENCES aula (idaula, professor_idprofessor, disciplina_id_disciplina, disciplina_monitor_aluno_idaluno),
    FOREIGN KEY (turma_idturma)
        REFERENCES turma (idturma)
);

CREATE INDEX aula_has_turma_FKIndex1 ON aula_has_turma (aula_idaula, aula_professor_idprofessor,
                                                        aula_disciplina_id_disciplina,
                                                        aula_disciplina_monitor_aluno_idaluno);
CREATE INDEX aula_has_turma_FKIndex2 ON aula_has_turma (turma_idturma);

CREATE INDEX IFK_Rel_18 ON aula_has_turma (aula_idaula, aula_professor_idprofessor, aula_disciplina_id_disciplina,
                                           aula_disciplina_monitor_aluno_idaluno);
CREATE INDEX IFK_Rel_19 ON aula_has_turma (turma_idturma);


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

INSERT INTO disciplina (monitor_aluno_idaluno, nome)
VALUES ((SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse'), 'Estutura de dados'),
       ((SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher'), 'Programação Orientada a Objetos'),
       ((SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro'), 'Banco de dados');

INSERT INTO professor (nome)
VALUES ('Evandro Kuchera'),
       ('Luis Khun'),
       ('Fernando Mazetto'),
       ('Rafael Gomes Mantovani'),
       ('Franciele Beal');

INSERT INTO aula (professor_idprofessor, disciplina_id_disciplina, disciplina_monitor_aluno_idaluno, descricao)
VALUES ((SELECT idprofessor FROM professor WHERE nome = 'Evandro Kuchera'),
        (SELECT id_disciplina
         FROM disciplina
         WHERE monitor_aluno_idaluno = (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse')
           AND nome = 'Estutura de dados'),
        (SELECT monitor_aluno_idaluno
         FROM disciplina
         WHERE monitor_aluno_idaluno = (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse')
           AND nome = 'Estutura de dados'),
        'Aula bem estruturada do professor Rafael'),
       ((SELECT idprofessor FROM professor WHERE nome = 'Rafael Gomes Mantovani'),
        (SELECT id_disciplina
         FROM disciplina
         WHERE monitor_aluno_idaluno = (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher')
           AND nome = 'Programação Orientada a Objetos'),
        (SELECT monitor_aluno_idaluno
         FROM disciplina
         WHERE monitor_aluno_idaluno = (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher')
           AND nome = 'Programação Orientada a Objetos'),
        NULL),
       ((SELECT idprofessor FROM professor WHERE nome = 'Franciele Beal'),
        (SELECT id_disciplina
         FROM disciplina
         WHERE monitor_aluno_idaluno = (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')
           AND nome = 'Banco de dados'),
        (SELECT monitor_aluno_idaluno
         FROM disciplina
         WHERE monitor_aluno_idaluno = (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')
           AND nome = 'Banco de dados'), NULL);

INSERT INTO turma (idturma)
VALUES (1),
       (2),
       (3);

INSERT INTO evento (titulo, dhinicio, dhfim)
VALUES ('Início da matéria', '2022-01-01', '2022-01-06'),
       ('Atividade 1', '2022-02-06', '2022-03-06'),
       ('Devolutiva', '2022-06-01', '2022-06-14');

INSERT INTO grupo (nome)
VALUES ('Grupo de estudo'),
       ('Trabalho de BD'),
       ('CCH de POO');

INSERT INTO atividade (titulo, dhinicio, dhfim)
VALUES ('Pratica 1', '2022-02-01', '2022-02-25'),
       ('Pratica 2', '2022-03-01', '2022-03-25'),
       ('Pratica 3', '2022-04-01', '2022-05-25');

INSERT INTO dashboard (titulo)
VALUES ('Dashboard do gp estudo'),
       ('MyClass dashboard'),
       ('CCH de POO');

INSERT INTO card (titulo, estado)
VALUES ('Fazer slides', 'new'),
       ('Fazer scripts', 'new'),
       ('Separar tarefas', 'new');

INSERT INTO grupo_has_dashboard (grupo_idgrupo, dashboard_iddashboard)
VALUES ((SELECT idgrupo FROM grupo WHERE nome = 'Grupo de estudo'),
        (SELECT iddashboard FROM dashboard WHERE titulo = 'MyClass dashboard')),
       ((SELECT idgrupo FROM grupo WHERE nome = 'CCH de POO'),
        (SELECT iddashboard FROM dashboard WHERE titulo = 'CCH de POO')),
       ((SELECT idgrupo FROM grupo WHERE nome = 'Trabalho de BD'),
        (SELECT iddashboard FROM dashboard WHERE titulo = 'Dashboard do gp estudo'));

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
VALUES (1, (SELECT idgrupo FROM grupo WHERE nome = 'Grupo de estudo')),
       (2, (SELECT idgrupo FROM grupo WHERE nome = 'CCH de POO')),
       (3, (SELECT idgrupo FROM grupo WHERE nome = 'Trabalho de BD'));

INSERT INTO turma_has_atividade (turma_idturma, atividade_idatividade)
VALUES (1, (SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1')),
       (2, (SELECT idatividade FROM atividade WHERE titulo = 'Pratica 2')),
       (3, (SELECT idatividade FROM atividade WHERE titulo = 'Pratica 3'));

INSERT INTO turma_has_aluno (turma_idturma, aluno_idaluno)
VALUES (1, (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse')),
       (2, (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')),
       (3, (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher'));

INSERT INTO evento_has_turma (evento_idevento, turma_idturma)
VALUES ((SELECT idevento FROM evento WHERE titulo = 'Devolutiva'), 1),
       ((SELECT idevento FROM evento WHERE titulo = 'Atividade 1'), 2),
       ((SELECT idevento FROM evento WHERE titulo = 'Início da matéria'), 3);

INSERT INTO card_has_dashboard (card_idcard, dashboard_iddashboard)
VALUES ((SELECT idcard FROM card WHERE titulo = 'Fazer slides'),
        (SELECT iddashboard FROM dashboard WHERE titulo = 'MyClass dashboard')),
       ((SELECT idcard FROM card WHERE titulo = 'Fazer scripts'),
        (SELECT iddashboard FROM dashboard WHERE titulo = 'CCH de POO')),
       ((SELECT idcard FROM card WHERE titulo = 'Separar tarefas'),
        (SELECT iddashboard FROM dashboard WHERE titulo = 'Dashboard do gp estudo'));

INSERT INTO atividade_has_grupo (atividade_idatividade, grupo_idgrupo, concluido)
VALUES ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1'),
        (SELECT idgrupo FROM grupo WHERE nome = 'Grupo de estudo'), true),
       ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 1'),
        (SELECT idgrupo FROM grupo WHERE nome = 'CCH de POO'), true),
       ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 2'),
        (SELECT idgrupo FROM grupo WHERE nome = 'Trabalho de BD'), true);

INSERT INTO dashboard_has_aluno (dashboard_iddashboard, aluno_idaluno)
VALUES ((SELECT iddashboard FROM dashboard WHERE titulo = 'MyClass dashboard'),
        (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher')),
       ((SELECT iddashboard FROM dashboard WHERE titulo = 'CCH de POO'),
        (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')),
       ((SELECT iddashboard FROM dashboard WHERE titulo = 'Dashboard do gp estudo'),
        (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse'));

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
        (SELECT idcard FROM card WHERE titulo = 'Fazer scripts')),
       ((SELECT idatividade FROM atividade WHERE titulo = 'Pratica 2'),
        (SELECT idcard FROM card WHERE titulo = 'Separar tarefas'));

INSERT INTO evento_has_aluno (evento_idevento, aluno_idaluno)
VALUES ((SELECT idevento FROM evento WHERE titulo = 'Devolutiva'),
        (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher')),
       ((SELECT idevento FROM evento WHERE titulo = 'Atividade 1'),
        (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')),
       ((SELECT idevento FROM evento WHERE titulo = 'Início da matéria'),
        (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse'));

INSERT INTO aula_has_turma (aula_idaula, turma_idturma, aula_professor_idprofessor, aula_disciplina_id_disciplina,
                            aula_disciplina_monitor_aluno_idaluno)
VALUES ((SELECT idaula
         FROM aula
         WHERE professor_idprofessor = (SELECT idprofessor FROM professor WHERE nome = 'Evandro Kuchera')
           and disciplina_id_disciplina = (SELECT id_disciplina
                                           FROM disciplina
                                           WHERE monitor_aluno_idaluno =
                                                 (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse')
                                             AND nome = 'Estutura de dados')
           and disciplina_monitor_aluno_idaluno = (SELECT monitor_aluno_idaluno
                                                   FROM disciplina
                                                   WHERE monitor_aluno_idaluno =
                                                         (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse')
                                                     AND nome = 'Estutura de dados')), 1,
        (SELECT idprofessor FROM professor WHERE nome = 'Evandro Kuchera'), (SELECT id_disciplina
                                                                             FROM disciplina
                                                                             WHERE monitor_aluno_idaluno =
                                                                                   (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse')
                                                                               AND nome = 'Estutura de dados'),
        (SELECT monitor_aluno_idaluno
         FROM disciplina
         WHERE monitor_aluno_idaluno = (SELECT idaluno FROM aluno WHERE nome = 'Cássio Ritse')
           AND nome = 'Estutura de dados')),
       ((SELECT idaula
         FROM aula
         WHERE professor_idprofessor = (SELECT idprofessor FROM professor WHERE nome = 'Rafael Gomes Mantovani')
           and disciplina_id_disciplina = (SELECT id_disciplina
                                           FROM disciplina
                                           WHERE monitor_aluno_idaluno =
                                                 (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher')
                                             AND nome = 'Programação Orientada a Objetos')
           and disciplina_monitor_aluno_idaluno = (SELECT monitor_aluno_idaluno
                                                   FROM disciplina
                                                   WHERE monitor_aluno_idaluno =
                                                         (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher')
                                                     AND nome = 'Programação Orientada a Objetos')), 2,
        (SELECT idprofessor FROM professor WHERE nome = 'Rafael Gomes Mantovani'), (SELECT id_disciplina
                                                                                    FROM disciplina
                                                                                    WHERE monitor_aluno_idaluno =
                                                                                          (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher')
                                                                                      AND nome = 'Programação Orientada a Objetos'),
        (SELECT monitor_aluno_idaluno
         FROM disciplina
         WHERE monitor_aluno_idaluno = (SELECT idaluno FROM aluno WHERE nome = 'Eduardo Nonemacher')
           AND nome = 'Programação Orientada a Objetos')),
       ((SELECT idaula
         FROM aula
         WHERE professor_idprofessor = (SELECT idprofessor FROM professor WHERE nome = 'Franciele Beal')
           and disciplina_id_disciplina = (SELECT id_disciplina
                                           FROM disciplina
                                           WHERE monitor_aluno_idaluno =
                                                 (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')
                                             AND nome = 'Banco de dados')
           and disciplina_monitor_aluno_idaluno = (SELECT monitor_aluno_idaluno
                                                   FROM disciplina
                                                   WHERE monitor_aluno_idaluno =
                                                         (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')
                                                     AND nome = 'Banco de dados')), 3,
        (SELECT idprofessor FROM professor WHERE nome = 'Franciele Beal'), (SELECT id_disciplina
                                                                            FROM disciplina
                                                                            WHERE monitor_aluno_idaluno =
                                                                                  (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')
                                                                              AND nome = 'Banco de dados'),
        (SELECT monitor_aluno_idaluno
         FROM disciplina
         WHERE monitor_aluno_idaluno = (SELECT idaluno FROM aluno WHERE nome = 'Gabriel Zaro')
           AND nome = 'Banco de dados'));


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

SELECT iddashboard, titulo
FROM dashboard;

SELECT idcard, titulo, estado
FROM card;

SELECT idturma, nome
FROM turma;

SELECT idprofessor, nome
FROM professor;

SELECT idgrupo, nome
FROM grupo;

SELECT idaluno, nome
FROM aluno;

SELECT idatividade, titulo, dhfim, dhinicio
FROM atividade;

SELECT aluno_idaluno, remuneracao, carteira_trabalho
FROM monitor;

SELECT grupo_idgrupo, dashboard_iddashboard
FROM grupo_has_dashboard;

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

SELECT card_idcard, dashboard_iddashboard
FROM card_has_dashboard;

SELECT atividade_idatividade, grupo_idgrupo, concluido
FROM atividade_has_grupo;

SELECT dashboard_iddashboard, aluno_idaluno
FROM dashboard_has_aluno;

SELECT evento_idevento, atividade_idatividade
FROM evento_has_atividade;

SELECT evento_idevento, grupo_idgrupo
FROM evento_has_grupo;

SELECT atividade_idatividade, card_idcard
FROM atividade_has_card;

SELECT evento_idevento, aluno_idaluno
FROM evento_has_aluno;

SELECT id_disciplina, monitor_aluno_idaluno, nome
FROM disciplina;

SELECT idaula, professor_idprofessor, disciplina_id_disciplina, disciplina_monitor_aluno_idaluno, descricao
FROM aula;

SELECT aula_idaula,
       turma_idturma,
       aula_professor_idprofessor,
       aula_disciplina_id_disciplina,
       aula_disciplina_monitor_aluno_idaluno
FROM aula_has_turma;


-- Duas consultas com junção de tabelas (JOIN);

SELECT idaluno,
       nome,
       remuneracao,
       carteira_trabalho
FROM monitor m
         JOIN aluno a ON a.idaluno = m.aluno_idaluno;

SELECT id_disciplina,
       monitor_aluno_idaluno,
       d.nome AS nome_disciplina,
       idaluno,
       a.nome AS nome_aluno,
       remuneracao,
       carteira_trabalho
FROM disciplina d
         JOIN monitor m on d.monitor_aluno_idaluno = m.aluno_idaluno
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
        from grupo
        WHERE idgrupo = (select grupo_idgrupo
                         from grupo_has_dashboard
                         where dashboard_iddashboard = iddashboard)) AS grupo_dashboard
FROM dashboard

