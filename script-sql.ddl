-- Gerado por Oracle SQL Developer Data Modeler 4.1.3.901
--   em:        2022-06-05 20:14:47 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE T_CLIENTE
  (
    id_cliente             NUMBER (8) NOT NULL ,
    nm_nome_completo       VARCHAR2 (50) NOT NULL ,
    nr_telefone            VARCHAR2 (11) NOT NULL ,
    T_ENDERECO_id_endereco NUMBER (8) NOT NULL
  ) ;
CREATE UNIQUE INDEX T_CLIENTE__IDX ON T_CLIENTE
  (
    T_ENDERECO_id_endereco ASC
  )
  ;
ALTER TABLE T_CLIENTE ADD CONSTRAINT T_CLIENTE_PK PRIMARY KEY ( id_cliente ) ;


CREATE TABLE T_ENDERECO
  (
    id_endereco            NUMBER (8) NOT NULL ,
    ds_logradouro          VARCHAR2 (40) NOT NULL ,
    nr_endereco            NUMBER (4) NOT NULL ,
    ds_complemento         VARCHAR2 (8) NOT NULL ,
    ds_ponto_referencia    VARCHAR2 (40) ,
    T_CLIENTE_id_cliente   NUMBER (8) NOT NULL ,
    T_RETIRADA_id_retirada NUMBER (14) NOT NULL
  ) ;
CREATE UNIQUE INDEX T_ENDERECO__IDX ON T_ENDERECO
  (
    T_CLIENTE_id_cliente ASC
  )
  ;
CREATE UNIQUE INDEX T_ENDERECO__IDXv1 ON T_ENDERECO
  (
    T_RETIRADA_id_retirada ASC
  )
  ;
ALTER TABLE T_ENDERECO ADD CONSTRAINT T_ENDERECO_PK PRIMARY KEY ( id_endereco ) ;


CREATE TABLE T_ENTREGADOR
  (
    id_entregador        NUMBER (8) NOT NULL ,
    ds_veiculo           VARCHAR2 (9) NOT NULL ,
    nr_telefone          VARCHAR2 (11) NOT NULL ,
    ds_regiao_de_atuacao VARCHAR2 (30) NOT NULL
  ) ;
ALTER TABLE T_ENTREGADOR ADD CONSTRAINT T_ENTREGADOR_PK PRIMARY KEY ( id_entregador ) ;


CREATE TABLE T_PRODUTO
  (
    id_produto             NUMBER (11) NOT NULL ,
    nm_produto             VARCHAR2 (30) NOT NULL ,
    vl_unitario            NUMBER (8,2) NOT NULL ,
    T_RETIRADA_id_retirada NUMBER (14) NOT NULL
  ) ;
CREATE UNIQUE INDEX T_PRODUTO__IDX ON T_PRODUTO
  (
    T_RETIRADA_id_retirada ASC
  )
  ;
ALTER TABLE T_PRODUTO ADD CONSTRAINT T_PRODUTO_PK PRIMARY KEY ( id_produto ) ;


CREATE TABLE T_RETIRADA
  (
    id_retirada             NUMBER (14) NOT NULL ,
    nm_estabelecimento      VARCHAR2 (50) NOT NULL ,
    ds_tipo_estabelecimento VARCHAR2 (12) NOT NULL ,
    T_ENDERECO_id_endereco  NUMBER (8) NOT NULL ,
    T_PRODUTO_id_produto    NUMBER (11) NOT NULL
  ) ;
CREATE UNIQUE INDEX T_ESTABELECIMENTO__IDX ON T_RETIRADA
  (
    T_ENDERECO_id_endereco ASC
  )
  ;
CREATE UNIQUE INDEX T_ESTABELECIMENTO__IDXv1 ON T_RETIRADA
  (
    T_PRODUTO_id_produto ASC
  )
  ;
ALTER TABLE T_RETIRADA ADD CONSTRAINT T_RETIRADA_PK PRIMARY KEY ( id_retirada ) ;


CREATE TABLE T_TRANSACAO
  (
    ds_forma_pagamento         VARCHAR2 (20) NOT NULL ,
    ds_status_pagamento        VARCHAR2 (8) NOT NULL ,
    vl_preco_total             NUMBER (8,2) NOT NULL ,
    qt_produto                 INTEGER ,
    ds_data_do_pedido          DATE NOT NULL ,
    ds_data_entrega            DATE NOT NULL ,
    T_CLIENTE_id_cliente       NUMBER (8) NOT NULL ,
    T_ENTREGADOR_id_entregador NUMBER (8) NOT NULL ,
    T_PRODUTO_id_produto       NUMBER (11) NOT NULL
  ) ;
ALTER TABLE T_TRANSACAO ADD CONSTRAINT T_TRANSACAO_PK PRIMARY KEY ( T_CLIENTE_id_cliente, T_ENTREGADOR_id_entregador, T_PRODUTO_id_produto ) ;


ALTER TABLE T_CLIENTE ADD CONSTRAINT T_CLIENTE_T_ENDERECO_FK FOREIGN KEY ( T_ENDERECO_id_endereco ) REFERENCES T_ENDERECO ( id_endereco ) ;

ALTER TABLE T_ENDERECO ADD CONSTRAINT T_ENDERECO_T_CLIENTE_FK FOREIGN KEY ( T_CLIENTE_id_cliente ) REFERENCES T_CLIENTE ( id_cliente ) ;

ALTER TABLE T_ENDERECO ADD CONSTRAINT T_ENDERECO_T_RETIRADA_FK FOREIGN KEY ( T_RETIRADA_id_retirada ) REFERENCES T_RETIRADA ( id_retirada ) ;

ALTER TABLE T_PRODUTO ADD CONSTRAINT T_PRODUTO_T_RETIRADA_FK FOREIGN KEY ( T_RETIRADA_id_retirada ) REFERENCES T_RETIRADA ( id_retirada ) ;

ALTER TABLE T_RETIRADA ADD CONSTRAINT T_RETIRADA_T_ENDERECO_FK FOREIGN KEY ( T_ENDERECO_id_endereco ) REFERENCES T_ENDERECO ( id_endereco ) ;

ALTER TABLE T_RETIRADA ADD CONSTRAINT T_RETIRADA_T_PRODUTO_FK FOREIGN KEY ( T_PRODUTO_id_produto ) REFERENCES T_PRODUTO ( id_produto ) ;

ALTER TABLE T_TRANSACAO ADD CONSTRAINT T_TRANSACAO_T_CLIENTE_FK FOREIGN KEY ( T_CLIENTE_id_cliente ) REFERENCES T_CLIENTE ( id_cliente ) ;

ALTER TABLE T_TRANSACAO ADD CONSTRAINT T_TRANSACAO_T_ENTREGADOR_FK FOREIGN KEY ( T_ENTREGADOR_id_entregador ) REFERENCES T_ENTREGADOR ( id_entregador ) ;

ALTER TABLE T_TRANSACAO ADD CONSTRAINT T_TRANSACAO_T_PRODUTO_FK FOREIGN KEY ( T_PRODUTO_id_produto ) REFERENCES T_PRODUTO ( id_produto ) ;


-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             6
-- ALTER TABLE                             15
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
