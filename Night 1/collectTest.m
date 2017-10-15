m.AccelerationSensorEnabled = 1;
m.Logging = 1;
pause(15);
m.Logging = 0;
[a, t] = accellog(m);
plot(t, a);