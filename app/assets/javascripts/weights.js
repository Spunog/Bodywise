function init_datepicker(options){
    if(!options) options = {}
    if(!options.picker) alert('Datepicker selector cannot be blank');

    options.picker.each(function(){
        var $altField = $(this).parent().find(options.altField)
        $(this).datepicker({
             dateFormat: 'dd M y'
            ,altFormat: "yy-mm-dd"
            ,altField: $altField
        });
        options.picker.attr('readonly','readonly');
        //$altField.hide();
    });

}


$( document ).ready(function() {

    //
    // On Load
    //
    init_datepicker({
         picker : $(".datepicker")
        ,altField : '.datepicker-alt'
    });

    //
    // Graphs
    //

    var $graph = $('#js-main-graph');

    function updateChart(data){
        $graph.highcharts({
            title       :   {
                                text: 'Weight Over Time',
                                x: -20 //center
                            }
            ,credits    :   'disabled'
            ,xAxis      :   {
                                categories: data.xAxis
                            }
            ,yAxis      :   [{
                                    title   :   {
                                                    text: 'lbs'
                                                }
                                    ,plotLines: [{
                                                        value: 0,
                                                        width: 1,
                                                        color: '#808080'
                                                }
                                                ,{
                                                    value : data.goal,
                                                    color : 'red',
                                                    dashStyle : 'shortdash',
                                                    width : 2,
                                                    label : {
                                                        text : 'Goal'
                                                    }
                                                }]
                            }]
            ,tooltip    :   {
                                valueSuffix: 'lbs'
                            }
            ,legend     :   {
                                layout: 'vertical',
                                align: 'right',
                                verticalAlign: 'middle',
                                borderWidth: 0
                            }
            ,series     :   [{
                                name: '*Weight',
                                data : data.yAxis
                            }
                            ,{
                                 name: '*Goal',
                                 type: 'scatter',
                                 marker: {
                                      enabled: false
                                 },
                                 data: [data.goal]
                            }]

        });

    }

    if($graph.length > 0){

        //Load Chart
        $.ajax({
                type: "GET",
                url:$graph.data('url') + '.json',
                dataType:'json',
                cache: false,
                success: function( data, textStatus , jqXHR)
                        {
                            var graphData = {
                                                 xAxis : []
                                                ,yAxis : []
                                                ,goal : parseFloat(data.graph.goal)
                                            };

                            var weightData = data.graph.weights;

                            for(i=0;i < weightData.length;i++){
                                graphData.yAxis.push(parseFloat(weightData[i].weight_lbs));
                                graphData.xAxis.push(weightData[i].description);
                            }

                            updateChart(graphData);
                        },
                error: function( data, textStatus , jqXHR)
                       {
                            alert('Unable to retrieve information at this time. Please try again later.');
                       }
        });
    }
});