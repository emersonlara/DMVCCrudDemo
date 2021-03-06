CREATE TABLE TB_UF (
  UF        CHAR(2) NOT NULL,
  DESCRICAO VARCHAR(100)
);

ALTER TABLE TB_UF ADD CONSTRAINT PK_UF
  PRIMARY KEY (UF);

CREATE TABLE TB_PESSOA (
  ID        INTEGER NOT NULL,
  NOME      VARCHAR(100),
  ENDERECO  VARCHAR(150),
  NUMERO    VARCHAR(20),
  BAIRRO    VARCHAR(50),
  CIDADE    VARCHAR(50),
  UF        CHAR(2),
  CEP       CHAR(8)
);

ALTER TABLE TB_PESSOA ADD CONSTRAINT PK_PESSOA
  PRIMARY KEY (ID);

ALTER TABLE TB_PESSOA ADD CONSTRAINT FK_UF_PESSOA
  FOREIGN KEY (UF)
  REFERENCES TB_UF (UF);

CREATE TABLE TB_PESSOA_TELEFONE (
  ID_PESSOA     INTEGER NOT NULL,
  ID_TELEFONE   INTEGER NOT NULL,
  TELEFONE      VARCHAR(20),
  CONTATO       VARCHAR(100)
);

ALTER TABLE TB_PESSOA_TELEFONE ADD CONSTRAINT PK_PESSOA_TELEFONE
  PRIMARY KEY (ID_PESSOA, ID_TELEFONE);

ALTER TABLE TB_PESSOA_TELEFONE ADD CONSTRAINT FK_PESSOA_TELEFONE
  FOREIGN KEY (ID_PESSOA)
  REFERENCES TB_PESSOA (ID)
  ON UPDATE CASCADE
  ON DELETE CASCADE;



CREATE SEQUENCE SEQ_PESSOA;

SET TERM ^ ;

create trigger TB_PESSOA_BI for TB_PESSOA
active BEFORE INSERT position 0
as
begin
  NEW.ID = NEXT VALUE FOR SEQ_PESSOA;
end^

SET TERM ; ^

CREATE VIEW VW_BAIRROS
AS
SELECT DISTINCT
  BAIRRO
FROM
  TB_PESSOA
ORDER BY 1;

INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('AC', 'ACRE');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('AL', 'ALAGOAS');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('AM', 'AMAZONAS');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('AP', 'AMAPA');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('BA', 'BAHIA');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('CE', 'CEARA');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('DF', 'DISTRITO FEDERERAL');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('ES', 'ESPIRITO SANTO');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('GO', 'GOIAS');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('MA', 'MARANHAO');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('MG', 'MINAS GERAIS');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('MS', 'MATO GROSSO DO SUL');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('MT', 'MATO GROSSO');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('PA', 'PARA');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('PB', 'PARAIBA');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('PE', 'PERNAMBUCO');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('PI', 'PIAUI');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('PR', 'PARANA');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('RJ', 'RIO DE JANEIRO');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('RN', 'RIO GRANDE DO NORTE');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('RO', 'RONDONIA');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('RR', 'RORAIMA');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('RS', 'RIO GRANDE DO SUL');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('SC', 'SANTA CATARINA');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('SE', 'SERGIPE');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('SP', 'SAO PAULO');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('TO', 'TOCANTINS');
INSERT INTO TB_UF (UF, DESCRICAO) VALUES ('EX', 'EXTERIOR');

