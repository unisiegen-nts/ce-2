function y = rect(x)

tolerance = 1e-12;
y = double(abs(x) <= 0.5 + tolerance);
y(abs(x)==0.5) = 0.5;

end
