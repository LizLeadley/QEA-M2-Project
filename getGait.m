    function gait = getGait()
        m = mobiledev;
        m.SampleRate = 50;
        discardlogs(m);
        m.AccelerationSensorEnabled = 1;
        m.Logging = 1;
        pause(3);
        m.Logging = 0;
        [a, t] = accellog(m);
        discardlogs(m);
        clear m
        A = fft(a,140,1);
        A(1,:) = 0;
        A = fftshift(A,1);
        gait = abs(reshape(A, 140*3, 1));
    end