function plotData(name)
    load(strcat(name,'.mat'));
    plot(t,a);
end