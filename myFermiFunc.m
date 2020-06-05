function [B1, pulseWidth, ampInt, powerInt, absInt] = myFermiFunc(peakAmplitude, rfOffResAngFreq, pulseWidthParam, transitionWidthParam, time)
%MYFERMIFUNC Returns the Fermi equation amplitude and other valuable information for a given time range. 
%   Taken from the book "Handbook of MRI pulse sequences" by Matt A.
%   Bernstein, page 111, and Siemens Memorandum (November 17 2004) called 
%   RF_amplitude_integral_in_pulse_sequences.doc under
%   Documents/Siemens/FAQ.
%
%   B1 - Eq. 4.14 Bernstein p.111
%   pulseWidth - Eq. 4.15 Bernstein p.111
%   ampInt - Siemens document
%   powerInt - Sum of squares of B1 values
%   absInt - Sum of absolute B1 values

    gamma = 267513000;

    B1=(peakAmplitude.*exp(i.*rfOffResAngFreq.*time)) ...
                        ./                    ...
       ( 1+exp(  (abs(time)-pulseWidthParam) ./ transitionWidthParam  ) );
    
    pulseWidth = 2.*pulseWidthParam + 13.81.*transitionWidthParam;
    
    
    magB1 = abs(B1);
    phaseB1 = angle(B1);
    
    ampInt_R_Component = sum(magB1.*cos(phaseB1));
    ampInt_I_Component = sum(magB1.*sin(phaseB1));

    ampInt = sqrt(ampInt_R_Component^2 + ampInt_I_Component^2);
    
    %powerInt = trapz(([0,magB1,0].^2));
    %absInt = trapz([0,magB1,0]);
    powerInt = sum( (magB1.*cos(phaseB1)).^2 + (magB1.*sin(phaseB1)).^2 );
    absInt = sum(magB1);
    
end

