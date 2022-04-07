% IR Sensing and DC Motor Actuation
clear all
a = arduino('COM5', 'Uno', 'Libraries', 'Servo');
while(1)
    irVal = readDigitalPin(a,'D4');
    if(~irVal)
        writeDigitalPin(a,'D8',0);
        writeDigitalPin(a,'D9',1);
    else
        writeDigitalPin(a,'D8',0);
        writeDigitalPin(a,'D9',0);        
    end
end
