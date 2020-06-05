function [] = createPTA(fileName, pulseName, pulseComment, refGrad, minSlice, maxSlice, ampInt, powerInt, absInt, B1)
%CREATEPTA Summary of this function goes here
%   Detailed explanation goes here


    fid = fopen(fileName,'w');
    fprintf(fid,'PULSENAME: %s\n', pulseName);
    fprintf(fid,'COMMENT: %s\n', pulseComment);
    fprintf(fid,'REFGRAD: %.9f\n', refGrad);
    fprintf(fid,'MINSLICE: %.9f\n', minSlice);
    fprintf(fid,'MAXSLICE: %.9f\n', maxSlice);
    fprintf(fid,'AMPINT: %.9f\n', ampInt);
    fprintf(fid,'POWERINT: %.9f\n', powerInt);
    fprintf(fid,'ABSINT: %.9f\n\n', absInt);
    
    fprintf(fid,'0.000000000 0.000000000 ; (0)\n');
    for ii=1:length(B1)
        fprintf(fid,'%.9f %.9f ; (%i)\n', abs(B1(ii)), angle(B1(ii)),ii);
    end
    fprintf(fid,'0.000000000 0.000000000 ; (%i)\n',length(B1)+1);

    fclose(fid);
end

