
% This code:

%  - Loads the tests with .bin format located in folder 'data'

%  - Saves them in .mat format along with their doppler frequency (reduntant) in
% the matrices folder

% - Plots the time/velocity plot for all the tests in the 'data' folder

close all;
% Sensor setting parameters
N_frame=40000; % Number of frames used 
N_sample=256; % Number of samples per frame
periodicity = 0.00025; % frame-to-frame interval

S=80*10^12; % Frequency slope [Hz/s] 
Fs=6250*10^3; % ADC Sampling rate [sps]
c=299792458; % Speed of light [m/s]

f_start = 77*10^9; % Start frequency of chirp [Hz]
t_window = (N_sample-1)*(1/Fs); % The length of the fast time window
B=S*t_window;  % Bandwidth
delta_f = 1/t_window; % Frequency interval of sampled signal [Hz]
f_range = 0:delta_f:(N_sample-1)*delta_f;  % Frequency axis of the fast time signal
d_range = (f_range*c)/(S*2);    % Distance calculated from frequency [m]
lambda = c/f_start; % Wavelength [m]

% Get all the TestN.bin files in the data folder
filePattern = fullfile('data', 'Test*_*.bin'); % Look for TestN.bin files in the data folder
binFiles = dir(filePattern); % Get details of all matching files

outputFolder = 'matrices';

if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Loop over each file in the directory
for fileIdx = 1:length(binFiles)
    % Construct the full filename
    baseFileName = binFiles(fileIdx).name;
    fullFileName = fullfile(binFiles(fileIdx).folder, baseFileName);
    
    % Display progress
    fprintf('Processing file %s\n', fullFileName);

    ADCdata=readDCA1000(fullFileName,256);
    
    Data=zeros(N_frame,N_sample);


    for p=1:N_frame
        Data(p,:)=ADCdata((p-1)*(2*N_sample)+1:2:p*(2*N_sample)); 
    end
    
    FD_Data=fft(Data,[],2);
    
    
    slow_time = 0:periodicity:(N_frame-1)*periodicity; % time axis of slow time
    
    
    
    %%
    
    %% Generating of Doppler Signature
    
    s_obj=zeros(1024,1247);
    
      wind = hamming(128);  % window for calculating stft
        nlap = 96;  % overlapp length
        nfft = 1024;  % window size for calculating stft
    
    fs_spect=1/(1*periodicity);
    rangebin=[3 4 5];
              
    for k=1:length(rangebin)
    
    
        bin=rangebin(k);
    
        [s,f_doppler,t] = stft(FD_Data(:,bin), fs_spect,  'Window', wind, 'OverlapLength', nlap, 'FFTLength',nfft);  % short time fourier transform of the subject measurement
        
        s_obj=s_obj+abs(s);
                
     end

    % Save the s_obj matrix in the 'matrices' folder with a unique name
    save(fullfile(outputFolder, [baseFileName '.mat']), 's_obj',"f_doppler");


    %% Thresholding and digitalization to an image
    p_spect = periodicity*N_frame/(size(s_obj,2)-1);
    time_peaks = 0:p_spect:(size(s_obj,2)-1)*p_spect;
    uD = (-1).*(c*f_doppler/(2*f_start));
    
    f_sample = 1 / p_spect;
        
    
    figure;
    
    imagesc(time_peaks,uD,s_obj);
    xlabel('Time [s]','FontSize',14);
    ylabel('Velocity [m/s]','FontSize',14);
    shading flat;
    set(gca, 'YDir','normal');
    fontsize(gca,14,"pixels");
    
    title(['Plot for ', baseFileName]);


