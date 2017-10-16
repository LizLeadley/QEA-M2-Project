function collectData(name)
    if ~exist('name', 'var')
        name = 'Test';
    end
    m = mobiledev;
    m.SampleRate = 50;
    discardlogs(m);
    m.AccelerationSensorEnabled = 1;
    m.Logging = 1;
    pause(15);
    m.Logging = 0;
    [a, t] = accellog(m);
    discardlogs(m);
    save(strcat(name,'.mat'), 'a', 't');
    plot(t, a);
    figure
    clear m
    stem(t);
end

%Annie
%Colvin
%Maggie
%Connor
%Missoury
%Kai
%Kian
%SamE
%PaulR
%Will
%Minju