
package es.indra.portafirmasws.cws;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.10
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "CwsService", targetNamespace = "http://www.indra.es/portafirmasws/cws", wsdlLocation = "file:/C:/Users/PereP/git/distribucio/distribucio-plugin-impl/wsdl/cws/CWS.wsdl")
public class CwsService
    extends Service
{

    private final static URL CWSSERVICE_WSDL_LOCATION;
    private final static WebServiceException CWSSERVICE_EXCEPTION;
    private final static QName CWSSERVICE_QNAME = new QName("http://www.indra.es/portafirmasws/cws", "CwsService");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("file:/C:/Users/PereP/git/distribucio/distribucio-plugin-impl/wsdl/cws/CWS.wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        CWSSERVICE_WSDL_LOCATION = url;
        CWSSERVICE_EXCEPTION = e;
    }

    public CwsService() {
        super(__getWsdlLocation(), CWSSERVICE_QNAME);
    }

    public CwsService(WebServiceFeature... features) {
        super(__getWsdlLocation(), CWSSERVICE_QNAME, features);
    }

    public CwsService(URL wsdlLocation) {
        super(wsdlLocation, CWSSERVICE_QNAME);
    }

    public CwsService(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, CWSSERVICE_QNAME, features);
    }

    public CwsService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public CwsService(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns Cws
     */
    @WebEndpoint(name = "CWS")
    public Cws getCWS() {
        return super.getPort(new QName("http://www.indra.es/portafirmasws/cws", "CWS"), Cws.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns Cws
     */
    @WebEndpoint(name = "CWS")
    public Cws getCWS(WebServiceFeature... features) {
        return super.getPort(new QName("http://www.indra.es/portafirmasws/cws", "CWS"), Cws.class, features);
    }

    private static URL __getWsdlLocation() {
        if (CWSSERVICE_EXCEPTION!= null) {
            throw CWSSERVICE_EXCEPTION;
        }
        return CWSSERVICE_WSDL_LOCATION;
    }

}
