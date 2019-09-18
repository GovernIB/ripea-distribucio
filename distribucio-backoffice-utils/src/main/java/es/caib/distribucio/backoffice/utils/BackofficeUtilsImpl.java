
package es.caib.distribucio.backoffice.utils;

import es.caib.distribucio.core.api.service.ws.backoffice.Annex;
import es.caib.distribucio.core.api.service.ws.backoffice.AnotacioRegistreEntrada;
import es.caib.plugins.arxiu.api.Carpeta;
import es.caib.plugins.arxiu.api.ContingutArxiu;
import es.caib.plugins.arxiu.api.ContingutTipus;
import es.caib.plugins.arxiu.api.Expedient;
import es.caib.plugins.arxiu.api.IArxiuPlugin;

public class BackofficeUtilsImpl implements BackofficeUtils {
	private IArxiuPlugin iArxiuPlugin;
	
	// name of carpeta to which annexos should be moved, if null annexos are moved directly to expedient without creating carpeta
	private String carpetaAnnexos;
	
	
	public ArxiuResultat crearExpedientAmbAnotacioRegistre(
			Expedient expedient,
			AnotacioRegistreEntrada anotacioRegistreEntrada){
		
		ArxiuResultat arxiuResultat = new ArxiuResultat();
		String carpetaUuid = null;
		boolean isCarpetaActive = carpetaAnnexos != null && !carpetaAnnexos.isEmpty();
		
		
		try {
			// CREATE EXPEDIENT IN ARXIU
			ContingutArxiu expedientCreat = iArxiuPlugin.expedientCrear(expedient);
			Expedient expedientDetalls = iArxiuPlugin.expedientDetalls(
					expedientCreat.getIdentificador(),
					null);
			arxiuResultat.setIdentificadorExpedient(expedientCreat.getIdentificador());
			
			// CREATE CARPETA IN ARXIU
			if (isCarpetaActive) {
				
				// check if already exists in arxiu
				boolean carpetaExistsInArxiu = false;
				carpetaUuid = null;
				if (expedientDetalls.getContinguts() != null) {
					for (ContingutArxiu contingutArxiu : expedientDetalls.getContinguts()) {
						String replacedNom = carpetaAnnexos.replace("/", "_");
						if (contingutArxiu.getTipus() == ContingutTipus.CARPETA && contingutArxiu.getNom().equals(
								replacedNom)) {
							carpetaExistsInArxiu = true;
							carpetaUuid = contingutArxiu.getIdentificador();
						}
					}
				}
				// if doesnt exist create it in arxiu
				if (!carpetaExistsInArxiu) {
					ContingutArxiu carpetaCreada = iArxiuPlugin.carpetaCrear(toArxiuCarpeta(null,
							carpetaAnnexos),
							expedientCreat.getIdentificador());
					carpetaUuid = carpetaCreada.getIdentificador();
				}
			}
			
			// MOVE DOCUMENTS IN ARXIU 
			for (Annex annex : anotacioRegistreEntrada.getAnnexos()) {
				
				if (isCarpetaActive) {
					Carpeta carpeta = iArxiuPlugin.carpetaDetalls(carpetaUuid);
					boolean documentExistsInArxiu = false;
					if (carpeta.getContinguts() != null) {
						for (ContingutArxiu contingutArxiu : carpeta.getContinguts()) {
							if (contingutArxiu.getTipus() == ContingutTipus.DOCUMENT && contingutArxiu.getNom().equals(
									annex.getNom())) {
								documentExistsInArxiu = true;
							}
						}
					}
					if (!documentExistsInArxiu) {
						ContingutArxiu nouDocumentDispatched = iArxiuPlugin.documentMoure(
								annex.getUuid(),
								carpetaUuid,
								expedientCreat.getIdentificador());
						
						// if document was dispatched, new docuement will be returned
						if (nouDocumentDispatched != null) {
							
						}
					}
				} else {
					
					boolean documentExistsInArxiu = false;
					if (expedientDetalls.getContinguts() != null) {
						for (ContingutArxiu contingutArxiu : expedientDetalls.getContinguts()) {
							if (contingutArxiu.getTipus() == ContingutTipus.DOCUMENT && contingutArxiu.getNom().equals(
									annex.getNom())) {
								documentExistsInArxiu = true;
							}
						}
					}
					if (!documentExistsInArxiu) {
						ContingutArxiu nouDocumentDispatched = iArxiuPlugin.documentMoure(
								annex.getUuid(),
								expedientCreat.getIdentificador(),
								expedientCreat.getIdentificador());
					}
				}
			}
			
		} catch (Exception e) {
			arxiuResultat.setException(e);
			arxiuResultat.setErrorCodi(DistribucioArxiuError.ARXIU_ERROR);
			arxiuResultat.setErrorMessage(e.getMessage());
		}
		
		arxiuResultat.setErrorCodi(DistribucioArxiuError.NO_ERROR);
		return arxiuResultat;
	}
	
	
	private Carpeta toArxiuCarpeta(
			String identificador,
			String nom) {
		Carpeta carpeta = new Carpeta();
		carpeta.setIdentificador(identificador);
		carpeta.setNom(nom);
		return carpeta;
	}

	

	public BackofficeUtilsImpl(
			IArxiuPlugin iArxiuPlugin) {
		super();
		this.iArxiuPlugin = iArxiuPlugin;
	}

	public IArxiuPlugin getIarxiuPlugin() {
		return iArxiuPlugin;
	}

	public void setIarxiuPlugin(IArxiuPlugin iArxiuPlugin) {
		this.iArxiuPlugin = iArxiuPlugin;
	}

	public String getCarpetaAnnexos() {
		return carpetaAnnexos;
	}
	public void setCarpetaAnnexos(String carpetaAnnexos) {
		this.carpetaAnnexos = carpetaAnnexos;
	}
	

}
