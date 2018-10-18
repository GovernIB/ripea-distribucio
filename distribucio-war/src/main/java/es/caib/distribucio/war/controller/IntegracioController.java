/**
 * 
 */
package es.caib.distribucio.war.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import es.caib.distribucio.core.api.dto.IdiomaEnumDto;
import es.caib.distribucio.core.api.dto.IntegracioAccioDto;
import es.caib.distribucio.core.api.dto.IntegracioDto;
import es.caib.distribucio.core.api.dto.IntegracioEnumDto;
import es.caib.distribucio.core.api.service.AplicacioService;
import es.caib.distribucio.war.helper.DatatablesHelper;
import es.caib.distribucio.war.helper.EnumHelper;
import es.caib.distribucio.war.helper.EnumHelper.HtmlOption;
import es.caib.distribucio.war.helper.DatatablesHelper.DatatablesResponse;
import es.caib.distribucio.war.helper.RequestSessionHelper;

/**
 * Controlador per a la consulta d'accions de les integracions.
 * 
 * @author Limit Tecnologies <limit@limit.es>
 */
@Controller
@RequestMapping("/integracio")
public class IntegracioController extends BaseUserController {

	private static final String SESSION_ATTRIBUTE_FILTRE = "IntegracioController.session.filtre";

	@Autowired
	private AplicacioService aplicacioService;



	@RequestMapping(method = RequestMethod.GET)
	public String get(
			HttpServletRequest request,
			Model model) {
		return getAmbCodi(request, null, model);
	}
	@RequestMapping(value = "/{codi}", method = RequestMethod.GET)
	public String getAmbCodi(
			HttpServletRequest request,
			@PathVariable String codi,
			Model model) {
		List<IntegracioDto> integracions = aplicacioService.integracioFindAll();
		
		for (IntegracioDto integracio : integracions) {
			for (IntegracioEnumDto integracioEnum : IntegracioEnumDto.values()) {
				if (integracio.getCodi() == integracioEnum.name()) {
					integracio.setNom(
							EnumHelper.getOneOptionForEnum(IntegracioEnumDto.class,
							"integracio.list.pipella." + integracio.getCodi()).getText());
				}
			}
		}
		model.addAttribute(
				"integracions",
				integracions);
		if (codi != null) {
			RequestSessionHelper.actualitzarObjecteSessio(
					request,
					SESSION_ATTRIBUTE_FILTRE,
					codi);
		} else if (integracions.size() > 0) {
			RequestSessionHelper.actualitzarObjecteSessio(
					request,
					SESSION_ATTRIBUTE_FILTRE,
					integracions.get(0).getCodi());
		}
		model.addAttribute(
				"codiActual",
				RequestSessionHelper.obtenirObjecteSessio(
						request,
						SESSION_ATTRIBUTE_FILTRE));
		return "integracioList";
	}

	@RequestMapping(value = "/datatable", method = RequestMethod.GET)
	@ResponseBody
	public DatatablesResponse datatable(
			HttpServletRequest request) {
		String codi = (String)RequestSessionHelper.obtenirObjecteSessio(
				request,
				SESSION_ATTRIBUTE_FILTRE);
		List<IntegracioAccioDto> accions = null;
		if (codi != null) {
			accions = aplicacioService.integracioFindDarreresAccionsByCodi(codi);
		} else {
			accions = new ArrayList<IntegracioAccioDto>();
		}
		DatatablesResponse dtr = DatatablesHelper.getDatatableResponse(
				request,
				accions);
		return dtr;
	}

	@RequestMapping(value = "/{codi}/{index}", method = RequestMethod.GET)
	public String detall(
			HttpServletRequest request,
			@PathVariable String codi,
			@PathVariable int index,
			Model model) {
		List<IntegracioAccioDto> accions = aplicacioService.integracioFindDarreresAccionsByCodi(codi);
		if (index < accions.size()) {
			model.addAttribute(
					"integracio",
					accions.get(index));
		}
		model.addAttribute("codiActual", codi);
		return "integracioDetall";
	}

}
