a = arduino('COM6', 'Uno', 'Libraries', 'Servo');
dc = 'D8';      %DC motor pin 
pwm1 = 'D10';    %PWM pins

writeDigitalPin(a,'D8',1); 
writePWMDutyCycle(a,pwm1,0.7);