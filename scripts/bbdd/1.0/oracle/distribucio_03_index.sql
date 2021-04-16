CREATE INDEX DIS_CONTINGUT_ALERTA_FK_I ON DIS_ALERTA(CONTINGUT_ID);
CREATE INDEX DIS_USUCRE_ALERTA_FK_I ON DIS_ALERTA(CREATEDBY_CODI);
CREATE INDEX DIS_USUMOD_ALERTA_FK_I ON DIS_ALERTA(LASTMODIFIEDBY_CODI);

CREATE INDEX DIS_USUCRE_ENTITAT_FK_I ON DIS_ENTITAT(CREATEDBY_CODI);
CREATE INDEX DIS_USUMOD_ENTITAT_FK_I ON DIS_ENTITAT(LASTMODIFIEDBY_CODI);

CREATE INDEX DIS_PARE_CONTINGUT_FK_I ON DIS_CONTINGUT(PARE_ID);
CREATE INDEX DIS_CONTMOV_CONTINGUT_FK_I ON DIS_CONTINGUT(CONTMOV_ID);
CREATE INDEX DIS_ENTITAT_CONTINGUT_FK_I ON DIS_CONTINGUT(ENTITAT_ID);
CREATE INDEX DIS_USUCRE_CONTINGUT_FK_I ON DIS_CONTINGUT(CREATEDBY_CODI);
CREATE INDEX DIS_USUMOD_CONTINGUT_FK_I ON DIS_CONTINGUT(LASTMODIFIEDBY_CODI);

CREATE INDEX DIS_CONTINGUT_CONTMOV_FK_I ON DIS_CONT_MOV(CONTINGUT_ID);
CREATE INDEX DIS_DEST_CONTMOVEMAIL_FK_I ON DIS_CONT_MOV_EMAIL(DESTINATARI_CODI);
CREATE INDEX DIS_ORIGEN_CONTMOV_FK_I ON DIS_CONT_MOV(ORIGEN_ID);
CREATE INDEX DIS_DESTI_CONTMOV_FK_I ON DIS_CONT_MOV(DESTI_ID);
CREATE INDEX DIS_USUCRE_CONTMOV_FK_I ON DIS_CONT_MOV(CREATEDBY_CODI);
CREATE INDEX DIS_USUMOD_CONTMOV_FK_I ON DIS_CONT_MOV(LASTMODIFIEDBY_CODI);

CREATE INDEX DIS_CONTINGUT_CONTLOG_FK_I ON DIS_CONT_LOG(CONTINGUT_ID);
CREATE INDEX DIS_PARE_CONTLOG_FK_I ON DIS_CONT_LOG(PARE_ID);
CREATE INDEX DIS_CONTMOV_CONTLOG_FK_I ON DIS_CONT_LOG(CONTMOV_ID);
CREATE INDEX DIS_USUCRE_CONTLOG_FK_I ON DIS_CONT_LOG(CREATEDBY_CODI);
CREATE INDEX DIS_USUMOD_CONTLOG_FK_I ON DIS_CONT_LOG(LASTMODIFIEDBY_CODI);

CREATE INDEX DIS_USUCRE_REGISTRE_FK_I ON DIS_REGISTRE(CREATEDBY_CODI);
CREATE INDEX DIS_USUMOD_REGISTRE_FK_I ON DIS_REGISTRE(LASTMODIFIEDBY_CODI);

CREATE INDEX DIS_USUCRE_REGANX_FK_I ON DIS_REGISTRE_ANNEX(CREATEDBY_CODI);
CREATE INDEX DIS_REGISTRE_REGNX_FK_I ON DIS_REGISTRE_ANNEX(REGISTRE_ID);
CREATE INDEX DIS_USUMOD_REGNX_FK_I ON DIS_REGISTRE_ANNEX(LASTMODIFIEDBY_CODI);

CREATE INDEX DIS_USUCRE_REGANXFIR_FK_I ON DIS_REGISTRE_ANNEX_FIRMA(CREATEDBY_CODI);
CREATE INDEX DIS_FIRMA_ANNEX_FK_I ON DIS_REGISTRE_ANNEX_FIRMA(ANNEX_ID);
CREATE INDEX DIS_USUMOD_REGANXFIR_FK_I ON DIS_REGISTRE_ANNEX_FIRMA(LASTMODIFIEDBY_CODI);

CREATE INDEX DIS_USUCRE_REGINT_FK_I ON DIS_REGISTRE_INTER(CREATEDBY_CODI);
CREATE INDEX DIS_REGISTRE_REGINT_FK_I ON DIS_REGISTRE_INTER(REGISTRE_ID);
CREATE INDEX DIS_REGISTRE_REGRPS_FK_I ON DIS_REGISTRE_INTER(REPRESENTANT_ID);
CREATE INDEX DIS_REGISTRE_REGRPT_FK_I ON DIS_REGISTRE_INTER(REPRESENTAT_ID);
CREATE INDEX DIS_USUMOD_REGINT_FK_I ON DIS_REGISTRE_INTER(LASTMODIFIEDBY_CODI);

CREATE INDEX DIS_ENTITAT_REGLA_FK_I ON DIS_REGLA(ENTITAT_ID);
CREATE INDEX DIS_METAEXPEDIENT_REGLA_FK_I ON DIS_REGLA(METAEXPEDIENT_ID);
CREATE INDEX DIS_BUSTIA_REGLA_FK_I ON DIS_REGLA(BUSTIA_ID);
CREATE INDEX DIS_USUCRE_REGLA_FK_I ON DIS_REGLA(CREATEDBY_CODI);
CREATE INDEX DIS_USUMOD_REGLA_FK_I ON DIS_REGLA(LASTMODIFIEDBY_CODI);

CREATE INDEX DIS_AVIS_DATA_INICI_I ON DIS_AVIS(DATA_INICI);
CREATE INDEX DIS_AVIS_DATA_FINAL_I ON DIS_AVIS(DATA_FINAL);

CREATE INDEX DIS_ACL_OID_ENTRY_FK_I ON DIS_ACL_ENTRY(ACL_OBJECT_IDENTITY);
CREATE INDEX DIS_ACL_SID_ENTRY_FK_I ON DIS_ACL_ENTRY(SID);

CREATE INDEX DIS_ACL_CLASS_OID_FK_I ON DIS_ACL_OBJECT_IDENTITY(OBJECT_ID_CLASS);
CREATE INDEX DIS_ACL_PARENT_OID_FK_I ON DIS_ACL_OBJECT_IDENTITY(PARENT_OBJECT);
CREATE INDEX DIS_ACL_SID_OID_FK_I ON DIS_ACL_OBJECT_IDENTITY(OWNER_SID);

CREATE INDEX DIS_REGISTRE_PENDENT_I ON DIS_REGISTRE (PENDENT);

CREATE INDEX DIS_BUSTIA_FAV_BUSTIA_FK_I ON DIS_BUSTIA_FAVORIT(BUSTIA_ID);
CREATE INDEX DIS_BUSTIA_FAV_USUARI_FK_I ON DIS_BUSTIA_FAVORIT(USUARI_CODI);

CREATE INDEX DIS_AGAFATPER_REGISTRE_FK_I ON DIS_REGISTRE(AGAFAT_PER);