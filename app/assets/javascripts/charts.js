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

        console.log('histogram values = ' + values);

        
    });
}  