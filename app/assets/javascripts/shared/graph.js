$( document ).ready(function() {

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
                                                }]
                            }]
            ,tooltip:       {
                                formatter: function() {
                                    var htmlToolTip = '<div>' +  this.y + ' lbs on ' + this.x + '</div>';

                                    if(this.point.note.length > 0){
                                        htmlToolTip += '<div class="margin_top">Note:</div>'
                                        htmlToolTip += '<div><em>' + this.point.note + '</em></div>'
                                    }

                                    return htmlToolTip;
                                }
                                ,useHTML: true
                            }
            ,legend     :   {
                                layout: 'vertical',
                                align: 'right',
                                verticalAlign: 'middle',
                                borderWidth: 0
                            }
            ,plotOptions: {
                                series: {
                                    point: {
                                        events: {
                                            mouseOver: function() {
                                                
                                            }
                                        }
                                    },
                                    events: {
                                        mouseOut: function() {                        
                                            
                                        }
                                    }
                                }
                            }
            ,series     :   [{
                                name: '*Weight',
                                data : data.yAxis
                            }]

        });

        //Add Goal Weight if present
        if(data.goal && data.goal > 0){
            $graph.highcharts().yAxis[0].addPlotLine({
                                            value : data.goal,
                                            color : 'red',
                                            dashStyle : 'shortdash',
                                            width : 2,
                                            label : {
                                                text : 'Goal'
                                            }
                                        });
            

            $graph.highcharts().addSeries({
                                             name: '*Goal',
                                             type: 'scatter',
                                             marker: {
                                                  enabled: false
                                             },
                                             data: [data.goal]
                                          });  
        }

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
                                
                                var pointY = {
                                                 y    : parseFloat(weightData[i].weight_lbs)
                                                ,note : weightData[i].note
                                              }

                                graphData.yAxis.push(pointY);
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