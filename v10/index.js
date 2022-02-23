const { SerialPort } = require('serialport');

const version = require('./package').dependencies.serialport;
console.log(`Using serialport ${version}`);

const port = new SerialPort({
  baudRate: 115200,
  rtscts: false,
  autoOpen: false,
  path: '/dev/ttyUSB0',
})

port.open((err) => {
  if (err) {
    console.log('Error opening port: ', err.message);
  }
});

port.on('open', () => {
  console.log('port successfully opened');
});

(async () => {
  await new Promise(resolve => setTimeout(resolve, 2000));
})();
