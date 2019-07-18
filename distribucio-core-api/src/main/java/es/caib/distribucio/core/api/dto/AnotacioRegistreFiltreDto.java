/**
 * 
 */
package es.caib.distribucio.core.api.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;

import es.caib.distribucio.core.api.registre.RegistreProcesEstatEnum;


/**
 * Informació del filtre de continguts.
 * 
 * @author Limit Tecnologies <limit@limit.es>
 */
public class AnotacioRegistreFiltreDto implements Serializable {

	private String unitatOrganitzativa;
	private String bustia;
	private Date dataCreacioInici;
	private Date dataCreacioFi;
	private RegistreProcesEstatEnum estat;
	private String nom;
	private String numeroOrigen;
	private boolean nomesAmbErrors;

	
	public boolean isNomesAmbErrors() {
		return nomesAmbErrors;
	}
	public void setNomesAmbErrors(boolean nomesAmbErrors) {
		this.nomesAmbErrors = nomesAmbErrors;
	}
	public String getNumeroOrigen() {
		return numeroOrigen;
	}
	public void setNumeroOrigen(String numeroOrigen) {
		this.numeroOrigen = numeroOrigen;
	}	

	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getUnitatOrganitzativa() {
		return unitatOrganitzativa;
	}

	public void setUnitatOrganitzativa(String unitatOrganitzativa) {
		this.unitatOrganitzativa = unitatOrganitzativa;
	}

	public String getBustia() {
		return bustia;
	}

	public void setBustia(String bustia) {
		this.bustia = bustia;
	}

	public Date getDataCreacioInici() {
		return dataCreacioInici;
	}

	public void setDataCreacioInici(Date dataCreacioInici) {
		this.dataCreacioInici = dataCreacioInici;
	}

	public Date getDataCreacioFi() {
		return dataCreacioFi;
	}

	public void setDataCreacioFi(Date dataCreacioFi) {
		this.dataCreacioFi = dataCreacioFi;
	}

	public RegistreProcesEstatEnum getEstat() {
		return estat;
	}

	public void setEstat(RegistreProcesEstatEnum estat) {
		this.estat = estat;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	private static final long serialVersionUID = -139254994389509932L;

}

