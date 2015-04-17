function y = si( x )

    y = sin(x)./x;
    y(x==0) = 1;
end

