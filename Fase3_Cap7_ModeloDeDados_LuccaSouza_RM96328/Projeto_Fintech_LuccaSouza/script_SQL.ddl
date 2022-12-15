-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2022-11-15 07:01:25 ART
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_fintech_bairro (
    cd_bairro        NUMBER NOT NULL,
    t_fintech_cidade NUMBER NOT NULL,
    nm_bairro        VARCHAR2(30) NOT NULL
);

ALTER TABLE t_fintech_bairro ADD CONSTRAINT t_fintech_bairro_pk PRIMARY KEY ( cd_bairro );

CREATE TABLE t_fintech_cidade (
    cd_cidade        NUMBER NOT NULL,
    t_fintech_estado NUMBER NOT NULL,
    nm_cidade        VARCHAR2(30) NOT NULL
);

ALTER TABLE t_fintech_cidade ADD CONSTRAINT t_fintech_cidade_pk PRIMARY KEY ( cd_cidade );

CREATE TABLE t_fintech_conta (
    id_conta          INTEGER NOT NULL,
    t_fintech_usuario INTEGER NOT NULL,
    nr_saldo          FLOAT NOT NULL
);

CREATE UNIQUE INDEX t_fintech_conta__idx ON
    t_fintech_conta (
        t_fintech_usuario
    ASC );

ALTER TABLE t_fintech_conta ADD CONSTRAINT t_fintech_conta_pk PRIMARY KEY ( id_conta );

CREATE TABLE t_fintech_endereco (
    nr_cep                    NUMBER NOT NULL,
    t_fintech_bairro          NUMBER NOT NULL,
    t_fintech_tipo_logradouro NUMBER NOT NULL,
    ds_logradouro             VARCHAR2(30) NOT NULL
);

ALTER TABLE t_fintech_endereco ADD CONSTRAINT t_fintech_endereco_pk PRIMARY KEY ( nr_cep );

CREATE TABLE t_fintech_estado (
    cd_estado NUMBER NOT NULL,
    nm_estado VARCHAR2(30) NOT NULL
);

ALTER TABLE t_fintech_estado ADD CONSTRAINT t_fintech_estado_pk PRIMARY KEY ( cd_estado );

CREATE TABLE t_fintech_forma_pagamento (
    t_fintech_conta    INTEGER NOT NULL,
    cd_forma_pagamento NUMBER NOT NULL,
    ds_tipo_pagamento  VARCHAR2(30)
);

ALTER TABLE t_fintech_forma_pagamento ADD CONSTRAINT t_fintech_forma_pagamento_pk PRIMARY KEY ( cd_forma_pagamento,
                                                                                                t_fintech_conta );

CREATE TABLE t_fintech_investimento (
    t_fintech_conta INTEGER NOT NULL,
    cd_investimento NUMBER NOT NULL,
    vl_investido    FLOAT NOT NULL
);

ALTER TABLE t_fintech_investimento ADD CONSTRAINT t_fintech_investimento_pk PRIMARY KEY ( cd_investimento,
                                                                                          t_fintech_conta );

CREATE TABLE t_fintech_tipo_logradouro (
    cd_tipo_logradouro NUMBER NOT NULL,
    ds_tipo_logradouro VARCHAR2(30) NOT NULL
);

ALTER TABLE t_fintech_tipo_logradouro ADD CONSTRAINT t_fintech_tipo_logradouro_pk PRIMARY KEY ( cd_tipo_logradouro );

CREATE TABLE t_fintech_transacao (
    t_fintech_conta INTEGER NOT NULL,
    cd_transacao    NUMBER NOT NULL,
    vl_transacao    FLOAT NOT NULL,
    dt_transacao    DATE NOT NULL
);

ALTER TABLE t_fintech_transacao ADD CONSTRAINT t_fintech_transacao_pk PRIMARY KEY ( cd_transacao,
                                                                                    t_fintech_conta );

CREATE TABLE t_fintech_usuario (
    id_usuario      INTEGER NOT NULL,
    t_fintech_conta INTEGER NOT NULL,
    nm_completo     VARCHAR2(30) NOT NULL,
    dt_nascimento   DATE NOT NULL,
    ds_sexo         VARCHAR2(30) NOT NULL,
    ds_senha        VARCHAR2(30) NOT NULL,
    ds_email        VARCHAR2(30) NOT NULL
);

CREATE UNIQUE INDEX t_fintech_usuario__idx ON
    t_fintech_usuario (
        t_fintech_conta
    ASC );

ALTER TABLE t_fintech_usuario ADD CONSTRAINT t_fintech_usuario_pk PRIMARY KEY ( id_usuario );

CREATE TABLE t_fintech_usuario_endereco (
    t_fintech_endereco NUMBER NOT NULL,
    t_fintech_usuario  INTEGER NOT NULL,
    nr_endereco        NUMBER NOT NULL
);

ALTER TABLE t_fintech_usuario_endereco ADD CONSTRAINT t_fintech_usuario_endereco_pk PRIMARY KEY ( t_fintech_endereco,
                                                                                                  t_fintech_usuario );

ALTER TABLE t_fintech_endereco
    ADD CONSTRAINT t_fintech_bairro_fk FOREIGN KEY ( t_fintech_bairro )
        REFERENCES t_fintech_bairro ( cd_bairro );

ALTER TABLE t_fintech_bairro
    ADD CONSTRAINT t_fintech_cidade_fk FOREIGN KEY ( t_fintech_cidade )
        REFERENCES t_fintech_cidade ( cd_cidade );

ALTER TABLE t_fintech_forma_pagamento
    ADD CONSTRAINT t_fintech_conta_fk FOREIGN KEY ( t_fintech_conta )
        REFERENCES t_fintech_conta ( id_conta );

ALTER TABLE t_fintech_investimento
    ADD CONSTRAINT t_fintech_conta_fkv2 FOREIGN KEY ( t_fintech_conta )
        REFERENCES t_fintech_conta ( id_conta );

ALTER TABLE t_fintech_transacao
    ADD CONSTRAINT t_fintech_conta_fkv3 FOREIGN KEY ( t_fintech_conta )
        REFERENCES t_fintech_conta ( id_conta );

ALTER TABLE t_fintech_usuario
    ADD CONSTRAINT t_fintech_conta_fkv4 FOREIGN KEY ( t_fintech_conta )
        REFERENCES t_fintech_conta ( id_conta );

ALTER TABLE t_fintech_usuario_endereco
    ADD CONSTRAINT t_fintech_endereco_fk FOREIGN KEY ( t_fintech_endereco )
        REFERENCES t_fintech_endereco ( nr_cep );

ALTER TABLE t_fintech_cidade
    ADD CONSTRAINT t_fintech_estado_fk FOREIGN KEY ( t_fintech_estado )
        REFERENCES t_fintech_estado ( cd_estado );

ALTER TABLE t_fintech_endereco
    ADD CONSTRAINT t_fintech_tipo_logradouro_fk FOREIGN KEY ( t_fintech_tipo_logradouro )
        REFERENCES t_fintech_tipo_logradouro ( cd_tipo_logradouro );

ALTER TABLE t_fintech_usuario_endereco
    ADD CONSTRAINT t_fintech_usuario_fk FOREIGN KEY ( t_fintech_usuario )
        REFERENCES t_fintech_usuario ( id_usuario );

ALTER TABLE t_fintech_conta
    ADD CONSTRAINT t_fintech_usuario_fkv2 FOREIGN KEY ( t_fintech_usuario )
        REFERENCES t_fintech_usuario ( id_usuario );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             2
-- ALTER TABLE                             22
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
