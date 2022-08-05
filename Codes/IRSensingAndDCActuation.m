% IR Sensing and DC Motor Actuation
clear all
a = arduino('COM5', 'Uno', 'Libraries', 'Servo');
while(100)
    irVal = readDigitalPin(a,'D4');
    if(~irVal)
        disp('IR Sensed')
        writeDigitalPin(a,'D8',0);
        pause(10);
        disp('Motor turned')
    else
        writeDigitalPin(a,'D8',1);        
    end
end