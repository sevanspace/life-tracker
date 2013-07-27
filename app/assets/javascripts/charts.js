window.onload = function() {  
    

    $('.consumable-object-hourly-data').each(function(idx, elem){
        var name = $(elem).data('name');
        var values = $(elem).data('values');

        var paper = new Raphael(document.getElementById(name + '_consumed_units_chart'), 700, 200);
//        var paper = new Raphael(document.getElementById('canvas_container'), 700, 200);


        console.log('Values = ' + values);

        var start = 0;
        while(values[start] == 0) {
           start++;
       }

       values.splice(0, start);

       while(values[values.length - 1] == 0) {
           values.splice(values.length - 1, 1);
       }

       hr_labels = [];
       for(var i=0; i<values.length;i++){
           if(start + i > 12){
              start = -i + 1;
          }
          hr_labels.push(start + i);
      }

      var by_hour_chart = paper.barchart(20, 20, 600, 100, [values]).label([hr_labels], true);
    });

    $('.consumable-object-histogram-data').each(function(idx, elem){
        var name = $(elem).data('name');
        var values = $(elem).data('values');

        var paper = new Raphael(document.getElementById(name + '_histogram'), 700, 200);

        var chart_values = [];
        var chart_labels = [];

        var first_date = $(elem).data('first');

        var first = new Date();
        first.setFullYear(first_date["year"], first_date["month"] - 1, first_date["day"]);
        var now = new Date(Date.now());
        var daysOfYear = [];
        for (var d = new Date(first); d <= now; d.setDate(d.getDate() + 1)) {
            if (d.getFullYear() in values &&
                (d.getMonth() + 1) in values[d.getFullYear()] &&
                d.getDate() in values[d.getFullYear()][d.getMonth() + 1]) {
                chart_values.push(values[d.getFullYear()][d.getMonth() + 1][d.getDate()]);
            } else {
                chart_values.push(0);
            }
            chart_labels.push((d.getMonth() + 1) + "/" + d.getDate())
        }

        var by_day_chart = paper.barchart(20, 20, 600, 100, [chart_values]).label([chart_labels], true);

    });

    $('.consumed-unit-timeline-data').each(function(idx,elem){
        var values = $(elem).data('values');

        var paper = new Raphael(document.getElementById('consumed-unit-timeline'), 700, 200);

        var type_colors = $('.consumable-type-data').data('values');

        var timeline_length = 500;
        var node_radius = 5;
        var y = 20;

        var line = paper.path("M" + y + " " + y + "H" + timeline_length + " z");
        var node;
        var x;
        var val;

        for (var i=0, len=values.length; i < len; i++) {
            val = values[i];
            x = ~~(((60*60*val["hour"] + 60*val["min"] + val["sec"]) * timeline_length ) / (60*60*24));
            node = paper.circle(x, y, node_radius);
            node.attr("fill", Raphael.getRGB(type_colors[val["type"]]));
            console.log("node(" + x + ", " + y + ", " + node_radius + ")");
        }
    });
}  