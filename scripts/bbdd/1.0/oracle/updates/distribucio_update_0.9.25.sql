-- #94 Implementació d'un sistema d'avisos 
CREATE TABLE DIS_AVIS
(
  ID                   NUMBER(19)               NOT NULL,
  ASSUMPTE             VARCHAR2(256)            NOT NULL,
  MISSATGE             VARCHAR2(2048)           NOT NULL,
  DATA_INICI           TIMESTAMP(6)             NOT NULL,
  DATA_FINAL           TIMESTAMP(6)             NOT NULL,
  ACTIU                NUMBER(1)                NOT NULL,
  AVIS_NIVELL         VARCHAR2(10)             NOT NULL,
  CREATEDBY_CODI       VARCHAR2(64),
  CREATEDDATE          TIMESTAMP(6),
  LASTMODIFIEDBY_CODI  VARCHAR2(64),
  LASTMODIFIEDDATE     TIMESTAMP(6)
);

ALTER TABLE DIS_AVIS ADD (
  CONSTRAINT DIS_AVIS_PK PRIMARY KEY (ID));

CREATE INDEX DIS_AVIS_DATA_INICI_I ON DIS_AVIS(DATA_INICI);
CREATE INDEX DIS_AVIS_DATA_FINAL_I ON DIS_AVIS(DATA_FINAL);

GRANT SELECT, UPDATE, INSERT, DELETE ON DIS_AVIS TO WWW_DISTRIBUCIO; 


-- #103 Afegir el camp "backoffice" a les anotacions de registre i a les regles
ALTER TABLE DIS_REGLA ADD BACKOFFICE_CODI VARCHAR2(20);
ALTER TABLE DIS_REGISTRE ADD BACK_CODI VARCHAR2(20);


-- #118: Nous camps pel WS d'alta d'anotacions de registre 
ALTER TABLE DIS_REGISTRE ADD PRESENCIAL NUMBER(1);
ALTER TABLE DIS_REGISTRE_INTER ADD CODI_DIRE VARCHAR2(64);

-- #123 Eliminar obligatorietat del camp Tipo Asunto
ALTER TABLE DIS_REGISTRE MODIFY (ASSUMPTE_TIPUS_CODI NULL);

--#130: Falta el codi d'òrgan pels interessats de tipus administració pública 
ALTER TABLE DIS_REGISTRE_INTER ADD ORGAN_CODI VARCHAR(9);