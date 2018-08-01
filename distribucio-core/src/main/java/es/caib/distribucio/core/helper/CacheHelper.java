/**
 * 
 */
package es.caib.distribucio.core.helper;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.acls.model.Permission;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import es.caib.distribucio.core.api.dto.EntitatDto;
import es.caib.distribucio.core.api.dto.MunicipiDto;
import es.caib.distribucio.core.api.dto.ProvinciaDto;
import es.caib.distribucio.core.api.dto.TipusViaDto;
import es.caib.distribucio.core.entity.BustiaEntity;
import es.caib.distribucio.core.entity.EntitatEntity;
import es.caib.distribucio.core.helper.PermisosHelper.ObjectIdentifierExtractor;
import es.caib.distribucio.core.repository.BustiaRepository;
import es.caib.distribucio.core.repository.EntitatRepository;
import es.caib.distribucio.core.security.ExtendedPermission;
import es.caib.distribucio.plugin.usuari.DadesUsuari;

/**
 * Utilitat per a accedir a les caches. Els mètodes cacheables es
 * defineixen aquí per evitar la impossibilitat de fer funcionar
 * l'anotació @Cacheable als mètodes privats degut a limitacions
 * AOP.
 * 
 * @author Limit Tecnologies <limit@limit.es>
 */
@Component
public class CacheHelper {

	@Resource
	private EntitatRepository entitatRepository;
	@Resource
	private BustiaRepository bustiaRepository;

	@Resource
	private ConversioTipusHelper conversioTipusHelper;
	@Resource
	private ContingutHelper contingutHelper;
	@Resource
	private PermisosHelper permisosHelper;
	@Resource
	private PermisosEntitatHelper permisosEntitatHelper;
	@Resource
	private PluginHelper pluginHelper;
	@Resource
	private UsuariHelper usuariHelper;

	private Map<String, Set<String>> usuarisElementsPendentsPerEntitat;



	@Cacheable(value = "entitatsUsuari", key="#usuariCodi")
	public List<EntitatDto> findEntitatsAccessiblesUsuari(String usuariCodi) {
		logger.debug("Consulta entitats accessibles (usuariCodi=" + usuariCodi + ")");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		List<EntitatEntity> entitats = entitatRepository.findByActiva(true);
		permisosHelper.filterGrantedAny(
				entitats,
				new ObjectIdentifierExtractor<EntitatEntity>() {
					public Long getObjectIdentifier(EntitatEntity entitat) {
						return entitat.getId();
					}
				},
				EntitatEntity.class,
				new Permission[] {
					ExtendedPermission.READ,
					ExtendedPermission.ADMINISTRATION},
				auth);
		List<EntitatDto> resposta = conversioTipusHelper.convertirList(
				entitats,
				EntitatDto.class);
		permisosEntitatHelper.omplirPermisosPerEntitats(
				resposta,
				false);
		return resposta;
	}
	@CacheEvict(value = "entitatsUsuari", key="#usuariCodi")
	public void evictEntitatsAccessiblesUsuari(String usuariCodi) {
	}

	@Cacheable(value = "usuariAmbCodi", key="#usuariCodi")
	public DadesUsuari findUsuariAmbCodi(
			String usuariCodi) {
		return pluginHelper.dadesUsuariFindAmbCodi(
				usuariCodi);
	}

	@Cacheable(value = "provinciesPerComunitat", key="#comunitatCodi")
	public List<ProvinciaDto> findProvinciesPerComunitat(String comunitatCodi) {
		return conversioTipusHelper.convertirList(
				pluginHelper.dadesExternesProvinciesFindAmbComunitat(comunitatCodi),
				ProvinciaDto.class);
	}
	
	@Cacheable(value = "tipusVia")
	public List<TipusViaDto	> findTipusVia() {
		return pluginHelper.dadesExternesTipusViaAll();
	}
	
	@Cacheable(value = "municipisPerProvincia", key="#provinciaCodi")
	public List<MunicipiDto> findMunicipisPerProvincia(String provinciaCodi) {
		return conversioTipusHelper.convertirList(
				pluginHelper.dadesExternesMunicipisFindAmbProvincia(provinciaCodi),
				MunicipiDto.class);
	}

	@Cacheable(value = "elementsPendentsBustiesUsuari", key="{#entitat.id, #usuariCodi}")
	public long countElementsPendentsBustiesUsuari(
			EntitatEntity entitat,
			String usuariCodi) {
		// Consulta les bústies de l'usuari a l'entitat
		List<BustiaEntity> busties = bustiaRepository.findByEntitatAndActivaTrueAndPareNotNull(
				entitat);
		// Filtra la llista de bústies segons els permisos
		permisosHelper.filterGrantedAll(
				busties,
				new ObjectIdentifierExtractor<BustiaEntity>() {
					@Override
					public Long getObjectIdentifier(BustiaEntity bustia) {
						return bustia.getId();
					}
				},
				BustiaEntity.class,
				new Permission[] {ExtendedPermission.READ},
				usuariHelper.generarUsuariAutenticat(usuariCodi, false));
		long count = 0;
		if (!busties.isEmpty()) {
			// Ompl els contadors de fills i registres
			long[] countFills = contingutHelper.countFillsAmbPermisReadByContinguts(
					entitat,
					busties,
					true);
			for (long c: countFills)
				count += c;
		}
		// Afegeix l'usuari a l'entitat
		afegirUsuariElementsPendentsPerEntitat(
				entitat,
				usuariCodi);
		return count;
	}
	@CacheEvict(value = "elementsPendentsBustiesUsuari", key="{#entitat.id, #usuariCodi}")
	public void evictElementsPendentsBustiesUsuari(
			EntitatEntity entitat,
			String usuariCodi) {
	}

	private void afegirUsuariElementsPendentsPerEntitat(
			EntitatEntity entitat,
			String usuariCodi) {
		String entitatCodi = entitat.getCodi();
		if (usuarisElementsPendentsPerEntitat == null) {
			usuarisElementsPendentsPerEntitat = new HashMap<String, Set<String>>();
		}
		Set<String> usuaris = usuarisElementsPendentsPerEntitat.get(entitatCodi);
		if (usuaris == null) {
			usuaris = new HashSet<String>();
			usuarisElementsPendentsPerEntitat.put(
					entitatCodi,
					usuaris);
		}
		usuaris.add(usuariCodi);
	}

	private static final Logger logger = LoggerFactory.getLogger(CacheHelper.class);

}
