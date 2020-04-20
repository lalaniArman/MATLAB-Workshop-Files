clear cam
cam = webcam(1);

while(1)



img = snapshot(cam);

flag = Motion(img);

display(flag);

end