function collectData(name)
    m = mobiledev;
    m.AccelerationSensorEnabled = 1;
    m.Logging = 1;
    pause(15);
    m.Logging = 0;
    [a, t] = accellog(m);
    save(strcat(name,'.mat'), 'a', 't');
    plot(t, a);
    discardlogs(m);
    clear m
end