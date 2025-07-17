const QuickChart = require('quickchart-js');
const myChart = new QuickChart();

myChart.setConfig({
  type: 'doughnut',
  data : {
    labels: [
      'Red',
      'Blue',
      'Yellow'
    ],
    datasets: [{
      label: 'My First Dataset',
      data: [50, 30, 20],
      backgroundColor: [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(255, 205, 86)'
      ],
      hoverOffset: 4
    }]
  }
});

myChart.toFile('./assets/mychart.png');

// bot.on('message', async (ctx) => {
//   await ctx.replyWithPhoto(Input.fromLocalFile('./assets/mychart.png'))
// })