function f = fftaxis(nSamples, fs)

if nargin == 0
    f0 = 1
    
    figure(1)
    nSamples = 10
    fs = 10
    t = (0 : nSamples - 1) / fs;
    s = sin(2 * pi * f0 * t);
    f = fftaxis(nSamples, fs)
    f = fftshift(f)
    plot(f, abs(fftshift(fft(s) / fs)))
    
    figure(2)
    nSamples = 11
    fs = 11
    t = (0 : nSamples - 1) / fs;
    s = sin(2 * pi * f0 * t);
    f = fftaxis(nSamples, fs)
    f = fftshift(f)
    plot(f, abs(fftshift(fft(s) / fs)))
else
    %f = ifftshift(0 : nSamples - 1);
    %f = (f - f(1)) * fs / nSamples;
    nFftshift = fix(nSamples / 2);
    f = [0 : nSamples - nFftshift - 1, -nFftshift : -1] * fs / nSamples;
end

end
