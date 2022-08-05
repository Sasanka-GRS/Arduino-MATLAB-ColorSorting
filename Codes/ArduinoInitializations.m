% Arduino Stuff
clear all

a = arduino('COM7', 'Uno', 'Libraries', 'Servo'); %Initialize arduino at COM PORT 3

s1 = servo(a, 'D3');                %Initialize servo1 at Digital pin 3 of arduino Uno
writePosition(s1,0);
s2 = servo(a, 'D5');                %Initialize servo2 at Digital pin 5 of arduino Uno
writePosition(s2,0);

s3 = servo(a, 'D6');                %Initialize servo3 at Digital pin 6 of arduino Uno
writePosition(s3,0);

dc1 = 'D10';
dc2 = 'D11';
ir = 'D4';