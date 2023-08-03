import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}

 // Line Chart
 Highcharts.chart('lineChart', {
  chart: {
    type: 'line'
  },
  // Your data and other chart options here
});

// Bar Chart
Highcharts.chart('barChart', {
  chart: {
    type: 'bar'
  },
  // Your data and other chart options here
});

// Pie Chart
Highcharts.chart('pieChart', {
  chart: {
    type: 'pie'
  },
  // Your data and other chart options here
});

// Area Chart
Highcharts.chart('areaChart', {
  chart: {
    type: 'area'
  },
  // Your data and other chart options here
});

// Column Chart
Highcharts.chart('columnChart', {
  chart: {
    type: 'column'
  },
  // Your data and other chart options here
});

// Scatter Plot
Highcharts.chart('scatterPlot', {
  chart: {
    type: 'scatter'
  },
  // Your data and other chart options here
});

// Bubble Chart
Highcharts.chart('bubbleChart', {
  chart: {
    type: 'bubble'
  },
  // Your data and other chart options here
});

  
const chartForm = document.getElementById('chartForm');
const valuesInput = document.getElementById('values');
const showLine = document.getElementById('showLine');
const showBar = document.getElementById('showBar');
const showPie = document.getElementById('showPie');
const showArea = document.getElementById('showArea');
const showColumn = document.getElementById('showColumn');
const showScatter = document.getElementById('showScatter');
const showBubble = document.getElementById('showBubble');

chartForm.addEventListener('submit', function (event) {
  event.preventDefault();
  const values = valuesInput.value.split(',').map(value => parseFloat(value.trim()));
  updateCharts(values);
});

function updateCharts(values) {
  const options = {
    title: {
      text: 'Chart Title'
    },
    xAxis: {
      categories: ['Category 1', 'Category 2', 'Category 3', 'Category 4', 'Category 5']
    },
    series: [{
      data: values
    }]
  };

  if (showLine.checked) {
    Highcharts.chart('lineChart', { ...options, chart: { type: 'line' } });
  } else {
    document.getElementById('lineChart').innerHTML = '';
  }

  if (showBar.checked) {
    Highcharts.chart('barChart', { ...options, chart: { type: 'bar' } });
  } else {
    document.getElementById('barChart').innerHTML = '';
  }

  if (showPie.checked) {
    Highcharts.chart('pieChart', { ...options, chart: { type: 'pie' } });
  } else {
    document.getElementById('pieChart').innerHTML = '';
  }

  if (showArea.checked) {
    Highcharts.chart('areaChart', { ...options, chart: { type: 'area' } });
  } else {
    document.getElementById('areaChart').innerHTML = '';
  }

  if (showColumn.checked) {
    Highcharts.chart('columnChart', { ...options, chart: { type: 'column' } });
  } else {
    document.getElementById('columnChart').innerHTML = '';
  }

  if (showScatter.checked) {
    Highcharts.chart('scatterPlot', { ...options, chart: { type: 'scatter' } });
  } else {
    document.getElementById('scatterPlot').innerHTML = '';
  }

  if (showBubble.checked) {
    Highcharts.chart('bubbleChart', { ...options, chart: { type: 'bubble' } });
  } else {
    document.getElementById('bubbleChart').innerHTML = '';
  }
}


updateCharts([10, 20, 30, 40, 50]);