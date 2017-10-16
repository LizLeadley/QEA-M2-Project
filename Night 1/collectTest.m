name = 'Name';
m.AccelerationSensorEnabled = 1;
m.Logging = 1;
pause(1);
m.Logging = 0;
[a, t] = accellog(m);
save(name+'.mat', 'a', 't');
plot(t, a);
discardLogs(m);