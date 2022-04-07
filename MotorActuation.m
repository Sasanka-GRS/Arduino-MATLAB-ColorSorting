% Motor Activation

if((R>G) && (R>B))
    disp('RED');
    writePosition(s1,(2/3));
 elseif((G>R) && (G>B))
    disp('GREEN');
    writePosition(s2,(2/3));
 elseif((B>R) && (B>G))
    disp('BLUE');  
    writePosition(s3,(2/3));                  
  else
    disp('NONE');
end