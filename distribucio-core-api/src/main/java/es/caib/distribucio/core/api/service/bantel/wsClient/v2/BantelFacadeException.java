
package es.caib.distribucio.core.api.service.bantel.wsClient.v2;

import javax.xml.ws.WebFault;


/**
 * This class was generated by Apache CXF 2.2.7
 * Tue Jul 06 12:26:22 CEST 2010
 * Generated source version: 2.2.7
 * 
 */

@WebFault(name = "fault", targetNamespace = "urn:es:caib:bantel:ws:v2:model:BantelFacade")
public class BantelFacadeException extends Exception {
    public static final long serialVersionUID = 20100706122622L;
    
    private es.caib.distribucio.core.api.service.bantel.wsClient.v2.model.BantelFacadeException fault;

    public BantelFacadeException() {
        super();
    }
    
    public BantelFacadeException(String message) {
        super(message);
    }
    
    public BantelFacadeException(String message, Throwable cause) {
        super(message, cause);
    }

    public BantelFacadeException(String message,es.caib.distribucio.core.api.service.bantel.wsClient.v2.model.BantelFacadeException fault) {
        super(message);
        this.fault = fault;
    }

    public BantelFacadeException(String message,es.caib.distribucio.core.api.service.bantel.wsClient.v2.model.BantelFacadeException fault, Throwable cause) {
        super(message, cause);
        this.fault = fault;
    }

    public es.caib.distribucio.core.api.service.bantel.wsClient.v2.model.BantelFacadeException getFaultInfo() {
        return this.fault;
    }
}
