--------------------- 140: Revisar enumerats a la BBDD -------------------------------
-- dis_contingut.tipus
alter table dis_contingut add (temp_tipus varchar2(8));
update dis_contingut set temp_tipus = tipus;
alter table dis_contingut modify (tipus null);
update dis_contingut set tipus = null;  
alter table dis_contingut modify tipus varchar2(8);
update dis_contingut set tipus = temp_tipus;
alter table dis_contingut modify (tipus not null);
alter table dis_contingut drop column temp_tipus;

update dis_contingut set tipus = 'BUSTIA' where tipus = '0';  
update dis_contingut set tipus = 'REGISTRE' where tipus = '1';  

-- dis_cont_log.tipus
alter table dis_cont_log add (temp_tipus varchar2(30));
update dis_cont_log set temp_tipus = tipus;
alter table dis_cont_log modify (tipus null);
update dis_cont_log set tipus = null;  
alter table dis_cont_log modify tipus varchar2(30);
update dis_cont_log set tipus = temp_tipus;
alter table dis_cont_log modify (tipus not null);
alter table dis_cont_log drop column temp_tipus;

update dis_cont_log set tipus = 'CREACIO' where tipus = '0';
update dis_cont_log set tipus = 'CONSULTA' where tipus = '1';
update dis_cont_log set tipus = 'MODIFICACIO' where tipus = '2';
update dis_cont_log set tipus = 'ELIMINACIO' where tipus = '3';
update dis_cont_log set tipus = 'RECUPERACIO' where tipus = '4';
update dis_cont_log set tipus = 'ELIMINACIODEF' where tipus = '5';
update dis_cont_log set tipus = 'ACTIVACIO' where tipus = '6';
update dis_cont_log set tipus = 'DESACTIVACIO' where tipus = '7';
update dis_cont_log set tipus = 'AGAFAR' where tipus = '8';
update dis_cont_log set tipus = 'ALLIBERAR' where tipus = '9';
update dis_cont_log set tipus = 'COPIA' where tipus = '10';
update dis_cont_log set tipus = 'MOVIMENT' where tipus = '11';
update dis_cont_log set tipus = 'ENVIAMENT' where tipus = '12';
update dis_cont_log set tipus = 'REENVIAMENT' where tipus = '13';
update dis_cont_log set tipus = 'PROCESSAMENT' where tipus = '14';
update dis_cont_log set tipus = 'TANCAMENT' where tipus = '15';
update dis_cont_log set tipus = 'REOBERTURA' where tipus = '16';
update dis_cont_log set tipus = 'ACUMULACIO' where tipus = '17';
update dis_cont_log set tipus = 'DISGREGACIO' where tipus = '18';
update dis_cont_log set tipus = 'PER_DEFECTE' where tipus = '19';
update dis_cont_log set tipus = 'PFIRMA_ENVIAMENT' where tipus = '20';
update dis_cont_log set tipus = 'PFIRMA_CANCELACIO' where tipus = '21';
update dis_cont_log set tipus = 'PFIRMA_CALLBACK' where tipus = '22';
update dis_cont_log set tipus = 'PFIRMA_FIRMA' where tipus = '23';
update dis_cont_log set tipus = 'PFIRMA_REBUIG' where tipus = '24';
update dis_cont_log set tipus = 'PFIRMA_REINTENT' where tipus = '25';
update dis_cont_log set tipus = 'ARXIU_CSV' where tipus = '26';
update dis_cont_log set tipus = 'ARXIU_CUSTODIAT' where tipus = '27';
update dis_cont_log set tipus = 'CUSTODIA_CANCELACIO' where tipus = '28';
update dis_cont_log set tipus = 'FIRMA_CLIENT' where tipus = '29';
update dis_cont_log set tipus = 'NOTIFICACIO_ENTREGADA' where tipus = '30';
update dis_cont_log set tipus = 'NOTIFICACIO_REBUTJADA' where tipus = '31';
update dis_cont_log set tipus = 'NOTIFICACIO_REINTENT' where tipus = '32';
update dis_cont_log set tipus = 'ENVIAMENT_EMAIL' where tipus = '33';
update dis_cont_log set tipus = 'MARCAMENT_PROCESSAT' where tipus = '34';
update dis_cont_log set tipus = 'DISTRIBUCIO' where tipus = '35';
update dis_cont_log set tipus = 'REGLA_APLICAR' where tipus = '36';
update dis_cont_log set tipus = 'BACK_REBUDA' where tipus = '37';
update dis_cont_log set tipus = 'BACK_PROCESSADA' where tipus = '38';
update dis_cont_log set tipus = 'BACK_REBUTJADA' where tipus = '39';
update dis_cont_log set tipus = 'BACK_ERROR' where tipus = '40';

-- dis_cont_log.objecte_log_tipus
alter table dis_cont_log add (temp_tipus varchar2(30));
update dis_cont_log set temp_tipus = objecte_log_tipus;
update dis_cont_log set objecte_log_tipus = null;  
alter table dis_cont_log modify objecte_log_tipus varchar2(30);
update dis_cont_log set objecte_log_tipus = temp_tipus;
alter table dis_cont_log drop column temp_tipus;

update dis_cont_log set objecte_log_tipus = 'CREACIO' where objecte_log_tipus = '0';
update dis_cont_log set objecte_log_tipus = 'CONSULTA' where objecte_log_tipus = '1';
update dis_cont_log set objecte_log_tipus = 'MODIFICACIO' where objecte_log_tipus = '2';
update dis_cont_log set objecte_log_tipus = 'ELIMINACIO' where objecte_log_tipus = '3';
update dis_cont_log set objecte_log_tipus = 'RECUPERACIO' where objecte_log_tipus = '4';
update dis_cont_log set objecte_log_tipus = 'ELIMINACIODEF' where objecte_log_tipus = '5';
update dis_cont_log set objecte_log_tipus = 'ACTIVACIO' where objecte_log_tipus = '6';
update dis_cont_log set objecte_log_tipus = 'DESACTIVACIO' where objecte_log_tipus = '7';
update dis_cont_log set objecte_log_tipus = 'AGAFAR' where objecte_log_tipus = '8';
update dis_cont_log set objecte_log_tipus = 'ALLIBERAR' where objecte_log_tipus = '9';
update dis_cont_log set objecte_log_tipus = 'COPIA' where objecte_log_tipus = '10';
update dis_cont_log set objecte_log_tipus = 'MOVIMENT' where objecte_log_tipus = '11';
update dis_cont_log set objecte_log_tipus = 'ENVIAMENT' where objecte_log_tipus = '12';
update dis_cont_log set objecte_log_tipus = 'REENVIAMENT' where objecte_log_tipus = '13';
update dis_cont_log set objecte_log_tipus = 'PROCESSAMENT' where objecte_log_tipus = '14';
update dis_cont_log set objecte_log_tipus = 'TANCAMENT' where objecte_log_tipus = '15';
update dis_cont_log set objecte_log_tipus = 'REOBERTURA' where objecte_log_tipus = '16';
update dis_cont_log set objecte_log_tipus = 'ACUMULACIO' where objecte_log_tipus = '17';
update dis_cont_log set objecte_log_tipus = 'DISGREGACIO' where objecte_log_tipus = '18';
update dis_cont_log set objecte_log_tipus = 'PER_DEFECTE' where objecte_log_tipus = '19';
update dis_cont_log set objecte_log_tipus = 'PFIRMA_ENVIAMENT' where objecte_log_tipus = '20';
update dis_cont_log set objecte_log_tipus = 'PFIRMA_CANCELACIO' where objecte_log_tipus = '21';
update dis_cont_log set objecte_log_tipus = 'PFIRMA_CALLBACK' where objecte_log_tipus = '22';
update dis_cont_log set objecte_log_tipus = 'PFIRMA_FIRMA' where objecte_log_tipus = '23';
update dis_cont_log set objecte_log_tipus = 'PFIRMA_REBUIG' where objecte_log_tipus = '24';
update dis_cont_log set objecte_log_tipus = 'PFIRMA_REINTENT' where objecte_log_tipus = '25';
update dis_cont_log set objecte_log_tipus = 'ARXIU_CSV' where objecte_log_tipus = '26';
update dis_cont_log set objecte_log_tipus = 'ARXIU_CUSTODIAT' where objecte_log_tipus = '27';
update dis_cont_log set objecte_log_tipus = 'CUSTODIA_CANCELACIO' where objecte_log_tipus = '28';
update dis_cont_log set objecte_log_tipus = 'FIRMA_CLIENT' where objecte_log_tipus = '29';
update dis_cont_log set objecte_log_tipus = 'NOTIFICACIO_ENTREGADA' where objecte_log_tipus = '30';
update dis_cont_log set objecte_log_tipus = 'NOTIFICACIO_REBUTJADA' where objecte_log_tipus = '31';
update dis_cont_log set objecte_log_tipus = 'NOTIFICACIO_REINTENT' where objecte_log_tipus = '32';
update dis_cont_log set objecte_log_tipus = 'ENVIAMENT_EMAIL' where objecte_log_tipus = '33';
update dis_cont_log set objecte_log_tipus = 'MARCAMENT_PROCESSAT' where objecte_log_tipus = '34';
update dis_cont_log set objecte_log_tipus = 'DISTRIBUCIO' where objecte_log_tipus = '35';
update dis_cont_log set objecte_log_tipus = 'REGLA_APLICAR' where objecte_log_tipus = '36';
update dis_cont_log set objecte_log_tipus = 'BACK_REBUDA' where objecte_log_tipus = '37';
update dis_cont_log set objecte_log_tipus = 'BACK_PROCESSADA' where objecte_log_tipus = '38';
update dis_cont_log set objecte_log_tipus = 'BACK_REBUTJADA' where objecte_log_tipus = '39';
update dis_cont_log set objecte_log_tipus = 'BACK_ERROR' where objecte_log_tipus = '40';

-- dis_cont_log.objecte_tipus
alter table dis_cont_log add (temp_tipus varchar2(12));
update dis_cont_log set temp_tipus = objecte_tipus;
update dis_cont_log set objecte_tipus = null;  
alter table dis_cont_log modify objecte_tipus varchar2(12);
update dis_cont_log set objecte_tipus = temp_tipus;
alter table dis_cont_log drop column temp_tipus;

update dis_cont_log set objecte_tipus= 'CONTINGUT' where objecte_tipus = '0';
update dis_cont_log set objecte_tipus= 'EXPEDIENT' where objecte_tipus = '1';
update dis_cont_log set objecte_tipus= 'CARPETA' where objecte_tipus = '2';
update dis_cont_log set objecte_tipus= 'DOCUMENT' where objecte_tipus = '3';
update dis_cont_log set objecte_tipus= 'DADA' where objecte_tipus = '4';
update dis_cont_log set objecte_tipus= 'BUSTIA' where objecte_tipus = '5';
update dis_cont_log set objecte_tipus= 'ARXIU' where objecte_tipus = '6';
update dis_cont_log set objecte_tipus= 'INTERESSAT' where objecte_tipus = '7';
update dis_cont_log set objecte_tipus= 'REGISTRE' where objecte_tipus = '8';
update dis_cont_log set objecte_tipus= 'RELACIO' where objecte_tipus = '9';
update dis_cont_log set objecte_tipus= 'NOTIFICACIO' where objecte_tipus = '10';
update dis_cont_log set objecte_tipus= 'PUBLICACIO' where objecte_tipus = '11';
update dis_cont_log set objecte_tipus= 'ALTRES' where objecte_tipus = '12';

-- dis_unitat_organitzativa.tipus_transicio
alter table dis_unitat_organitzativa add (temp_tipus varchar2(12));
update dis_unitat_organitzativa set temp_tipus = tipus_transicio;
update dis_unitat_organitzativa set tipus_transicio = null;  
alter table dis_unitat_organitzativa modify tipus_transicio varchar2(12);
update dis_unitat_organitzativa set tipus_transicio = temp_tipus;
alter table dis_unitat_organitzativa drop column temp_tipus;

update dis_unitat_organitzativa set tipus_transicio= 'DIVISIO' where tipus_transicio = '0';
update dis_unitat_organitzativa set tipus_transicio= 'FUSIO' where tipus_transicio = '1';
update dis_unitat_organitzativa set tipus_transicio= 'SUBSTITUCIO' where tipus_transicio = '2';





-- 142: Revisar i corregir llargades dels camps de les anotacions ------------------------------
alter table dis_registre modify numero varchar2(255);
alter table dis_contingut modify nom varchar2(500);
alter table dis_registre modify idioma_codi varchar2(19);
alter table dis_registre modify entitat_codi varchar2(255);
alter table dis_registre modify entitat_desc varchar2(255);
alter table dis_registre modify oficina_desc varchar2(300);
alter table dis_registre modify llibre_desc varchar2(255);
alter table dis_registre modify assumpte_desc varchar2(255);
alter table dis_registre modify transport_tipus_codi varchar2(20);
alter table dis_registre modify usuari_nom varchar2(767);
alter table dis_registre modify usuari_contacte varchar2(255);
alter table dis_registre modify aplicacio_codi varchar2(255);
alter table dis_registre modify aplicacio_versio varchar2(255);
alter table dis_registre modify docfis_codi varchar2(19);
alter table dis_registre modify justificant_arxiu_uuid varchar2(256);

alter table dis_registre_inter modify tipus varchar2(19);
alter table dis_registre_inter modify nom varchar2(255);
alter table dis_registre_inter modify llinatge1 varchar2(255);
alter table dis_registre_inter modify llinatge2 varchar2(255);
alter table dis_registre_inter modify rao_social varchar2(2000);

alter table dis_registre_annex modify fitxer_arxiu_uuid varchar2(256);
alter table dis_registre_annex modify fitxer_nom varchar2(256);

alter table dis_registre_annex_firma modify fitxer_nom varchar2(256);



-- 151: Rendiment de l'enviament per email d'una anotació de registre

ALTER TABLE DIS_REGISTRE_ANNEX
ADD (
    SIGN_DETALLS_DESCARREGAT NUMBER(1) DEFAULT 0
);

CREATE TABLE DIS_REGISTRE_FIRMA_DETALL
(
	ID NUMBER(19),
    DATA TIMESTAMP,
    RESPONSABLE_NIF VARCHAR2(30),
    RESPONSABLE_NOM VARCHAR2(256),
    EMISSOR_CERTIFICAT VARCHAR2(2000),
    FIRMA_ID NUMBER(19),
    CREATEDBY_CODI       	VARCHAR2(64),
    CREATEDDATE          	TIMESTAMP(6),
    LASTMODIFIEDBY_CODI  	VARCHAR2(64),
    LASTMODIFIEDDATE     	TIMESTAMP(6)
);
ALTER TABLE DIS_REGISTRE_FIRMA_DETALL ADD (CONSTRAINT DIS_REGISTRE_FIRMA_DETALL_PK PRIMARY KEY (ID)); 
ALTER TABLE DIS_REGISTRE_FIRMA_DETALL ADD CONSTRAINT DIS_FIRMA_REGISTRE_DETALL_FK FOREIGN KEY (FIRMA_ID) REFERENCES DIS_REGISTRE_ANNEX_FIRMA (ID);

ALTER TABLE DIS_REGISTRE_ANNEX MODIFY FIRMA_CSV VARCHAR2(256);

GRANT SELECT, UPDATE, INSERT, DELETE ON DIS_REGISTRE_FIRMA_DETALL TO WWW_DISTRIBUCIO;


--------------------- 175: Guardar informació de firmes d'annexos per no haver-els de consultar cada vegada -------------------------------
ALTER TABLE DIS_REGISTRE
ADD (
    JUSTIFICANT_DESCARREGAT NUMBER(1) DEFAULT 0
);
ALTER TABLE DIS_REGISTRE
ADD (
    JUSTIFICANT_ID NUMBER(19)
);
ALTER TABLE DIS_REGISTRE ADD CONSTRAINT DIS_JUSTIFICANT_REGISTRE_FK FOREIGN KEY (JUSTIFICANT_ID) REFERENCES DIS_REGISTRE_ANNEX (ID);
ALTER TABLE DIS_REGISTRE_ANNEX MODIFY (SICRES_TIPUS_DOC NULL);
ALTER TABLE DIS_REGISTRE_ANNEX DROP CONSTRAINT DIS_REGANX_MULT_UK;