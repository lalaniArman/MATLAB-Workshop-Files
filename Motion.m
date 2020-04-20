%Declaring function
function [flag] = Motion(frame)

%Set a refernce Image
%persistent - To retain the value in memory between calls to the function
persistent Irefer;
persistent IreferGray;

if isempty(Irefer)
    
    Irefer = frame;
    IreferGray = rgb2gray(Irefer);
    
end


%Store consecutive frames
I = frame;
Igray = rgb2gray(I);


%Find difference between the reference Image and current frame
%Resultant difference image 
diffIr = abs(IreferGray - Igray);


%Account for noise
diffIr(diffIr < 35) = 0;


%Convert to binary - 0s and 1s
binI = imbinarize(diffIr);

%No. of pixels in which change is detected
total = sum(sum(binI));
imageSize = size(Igray,1)*size(Igray,2);

%Threshold/Significant Change
if total >= 0.05 * imageSize
    flag = 1;
else
    flag = 0;
end

end
