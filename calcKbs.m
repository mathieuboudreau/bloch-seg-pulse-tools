function Kbs = calcKbs(B1, pulseLength, freqOffset)
%CALCKBS Bloch-Siegert coefficient
%   
    gamma=42.5657*2*pi*10^6; % From VQ-Engine (Tim Trio) System properties 
    Kbs=trapz(linspace(0,pulseLength,length(B1)),((gamma*B1).^2)./((2*pi*freqOffset)*2));
    Kbs=Kbs/(10000*10000);

end

