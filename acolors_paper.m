function colors = acolors_paper(Num_cluster)

    if(Num_cluster < 10)
        % nice colors
        c1 = hex2rgb('#0072BD'); % Dark blue
        c2 = hex2rgb('#D95319'); % Orange 
        c3 = hex2rgb('#EDB120'); % Yellow
        c4 = hex2rgb('#7E2F8E'); % Purple
        c5 = hex2rgb('#77AC30'); % Light green
        c6 = hex2rgb('#4DBEEE'); % Light blue
        c7 = hex2rgb('#A2142F'); % Maroon   
        c8 = hex2rgb('#969980'); %
        c9 = hex2rgb('#AF7984'); %
        colors = [c1;c2;c3;c4;c5;c6;c7;c8;c9];
    else
        % colormap jet;
        cmap1 = jet;
        mymap1 = cmap1(1:end,:);
        ncolor = size(mymap1,1);
        colors = mymap1(1:round(ncolor./Num_cluster):ncolor,:);
    end
end
