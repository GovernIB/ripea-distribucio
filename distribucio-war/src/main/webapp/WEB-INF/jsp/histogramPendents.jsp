<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/distribucio" prefix="dis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<title><spring:message code="histogram.pendents.title"/></title>
<dis:modalHead/>

<script src="<c:url value="/webjars/chartjs/2.9.3/Chart.min.js"/>"></script>
<script src="<c:url value="/js/webutil.common.js"/>"></script>
<script src="<c:url value="/js/webutil.datatable.js"/>"></script>
<script src="<c:url value="/js/webutil.modal.js"/>"></script>

<style>
.dl-horizontal dt {
	width: 220px;
}
.dl-horizontal dd {
    margin-left: 240px;
}
</style>


<script type="text/javascript">

function buildChartEntitat(chart) {
	
    $.getJSON('<c:url value="/registreUser/getHistogramPendents"/> ').done(function(response) {
    	//console.log(response);
    	if (response.length > 0) {

    		var darrerData = new Date(response[response.length-1].data).toLocaleTimeString('es-ES', {year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit'});
    		$('#dataConsulta').html(darrerData);
    		$('#numeroPendents').html(response[response.length-1].pendentArxiu);
    		
    		response.forEach(function(item){
        		item.data = new Date(item.data).toLocaleTimeString('es-ES', {hour: '2-digit', minute: '2-digit'})

			});
        	
        	var yLabels = response.map(item => item.data);
        	
            chart.data.labels = yLabels;

   			chart.data.datasets.push({
   				'data': response.map(item => item.pendentArxiu),
   				'label': '<spring:message code="histogram.pendents.PENDENTS"/>',
   				'backgroundColor': "rgba(0,0,0,0.0)",
   				'borderColor': '#4db8ff'
   			});		
   			
   			chart.data.datasets.push({
   				'data': response.map(item => item.processats),
   				'label': '<spring:message code="histogram.pendents.PROCESSATS"/>',
   				'backgroundColor': "rgba(0,0,0,0.0)",
   				'borderColor': '#79d279'
   			});		

   			chart.data.datasets.push({
   				'data': response.map(item => item.errors),
   				'label': '<spring:message code="histogram.pendents.ERRORS"/>',
   				'backgroundColor': "rgba(0,0,0,0.0)",
   				'borderColor': '#ff4d4d'
   			});	   	
   			
   			chart.data.datasets.push({
   				'data': response.map(item => item.processTimeAverage/1000),
   				'label': '<spring:message code="histogram.pendents.TEMPS_MITJA"/>',
   				'backgroundColor': "rgba(0,0,0,0.0)",
   				'borderColor': '#ecc6d9'
   			});	   				
				            	
    	}
    	
        chart.update(); 
    });
}


    $(document).ready(function() {

        $('#btnRefresh').click(function() {
            location.reload();
        });

		var ctx = 'chartEntitat';
		var chartEntitat = new Chart(ctx, {
		    type: 'line',
		    data: {
		        labels: [],
		        datasets: [], 
		        color: []
		    },
		    options: {
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero: true
		                }
		            }]
		        }
		    }
		});
	
		buildChartEntitat(chartEntitat);

	});
	


</script>
</head>

<body>

	<h3><spring:message code="histogram.pendents.ultim.titol"/></h3>
	<dl class="dl-horizontal">
		<dt><spring:message code="histogram.pendents.ultim.data.consulta"/></dt>
		<dd id="dataConsulta"></dd>
		<dt><spring:message code="histogram.pendents.ultim.numero.threads"/></dt>
		<dd>${numberThreads}</dd>
		<dt><spring:message code="histogram.pendents.ultim.numero.pendents"/></dt>
		<dd id="numeroPendents"></dd>
	</dl>
	<h3><spring:message code="histogram.pendents.ultim.histograma"/></h3>
	
	<canvas id="chartEntitat" width="400" height="100"></canvas>

	<div id="modal-botons" class="well">
		<button id="btnRefresh" type="button" class="btn btn-info"><span class="fa fa-refresh"></span>&nbsp;&nbsp;<spring:message code="comu.boto.refrescar"/></button>
		<button type="button" class="btn btn-default" data-modal-cancel="true"><spring:message code="comu.boto.tancar"/></button>
	</div>
</body>
</html>
