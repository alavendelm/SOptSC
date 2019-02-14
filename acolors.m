function colors = acolors(Num_cluster)

    if(Num_cluster < 10)
        % nice colors
        c1 = hex2rgb('#D95319'); % Orange 
        c2 = hex2rgb('#EDB120'); % Yellow
        c3 = hex2rgb('#7E2F8E'); % Purple
        c4 = hex2rgb('#77AC30'); % Light green
        c5 = hex2rgb('#4DBEEE'); % Light blue
        c6 = hex2rgb('#A2142F'); % Maroon
        c7 = hex2rgb('#969980'); %
        c8 = hex2rgb('#AF7984'); %
        c9 = hex2rgb('#AA9739'); %
        colors = [c1;c2;c3;c4;c5;c6;c7;c8;c9];
    else
        % colormap jet;
        cmap1 = jet;
        mymap1 = cmap1(1:end,:);
        ncolor = size(mymap1,1);
        colors = mymap1(1:round(ncolor./Num_cluster):ncolor,:);
    end
end
