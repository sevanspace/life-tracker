window.onload = function() {  
   

    j('.consumable-object-hourly-data').each(function(idx, elem){
        var name = j(elem).data('name');
        var values = j(elem).data('values');

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

    j('.consumable-object-histogram-data').each(function(idx, elem){
        var name = j(elem).data('name');
        var values = j(elem).data('values');

        var paper = new Raphael(document.getElementById(name + '_histogram'), 700, 200);

        var chart_values = [];
        var chart_labels = [];

        var first_date = j(elem).data('first');

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

    j('.consumed-unit-timeline-data').each(function(idx,elem){
        var values = j(elem).data('values');

        var paper = new Raphael(document.getElementById('consumed-unit-timeline'), 700, 200);

        var type_colors = j('.consumable-type-data').data('values');

        var first_hr = j(elem).data('first');
        var last_hr = j(elem).data('last');
        var first_cutoff = first_hr - 1; //for 24-hr mode, first_cutoff = 0
        var last_cutoff = last_hr + 1;   //for 24-hr mode, last_cutoff = 24

        var timeline_length = 500;
        var node_radius = 5;
        var y = 20;
        var startx = 20;

        console.log("lasthr - firsthr: " + (last_hr - first_hr));

        var line = paper.path("M" + startx + " " + y + "H" + (timeline_length + startx) + " z");
        var node;
        var x;
        var val;

        //draw labels
        for (var i=first_cutoff; i <= last_cutoff; i++) {
          x = ~~( ( (60*60*(i - first_cutoff)) * timeline_length ) / (60*60*(last_cutoff - first_cutoff)));
          paper.text(startx + x, y + 20, i.toString());
        }

        //draw nodes
        for (var i=0, len=values.length; i < len; i++) {
            val = values[i];
            x = ~~( ( (60*60* (val["hour"] - first_cutoff) + 60*val["min"] + val["sec"]) * timeline_length ) / (60*60*(last_cutoff - first_cutoff)));
            node = paper.circle(startx + x, y, node_radius);
            node.attr("fill", Raphael.getRGB(type_colors[val["type"]]));
            console.log("node(" + x + ", " + y + ", " + node_radius + ")");
        }
    });
}  