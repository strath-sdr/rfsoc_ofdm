%% System parameters

fs = 1e6; 

R_HB = 2;           % Rate change undertaken by Halfband filter(s)
R_CICcomp = 2;      % Rate change undertaken by CIC compensator
R_CIC = 48;         % Rate change undertaken by CIC filter


% sampling rates at OUTPUTs of the filter sections
fHB = fs * R_HB;
fCICcomp = fHB * R_CICcomp;
fCIC = fCICcomp * R_CIC;
fHB_ssr = fCIC * R_HB;

f = fHB_ssr;

%% Half-Band

% Coefficients
HB_Tw = 0.1;    % Normalised transition bandwidth
HB_Ast = 60;    % Attenuation in the stopband

% design a halfband filter response with parameters specified above
dHB = fdesign.halfband('Tw,Ast', HB_Tw, HB_Ast);
hHB = design(dHB,'equiripple');

HB = dsp.FIRInterpolator(R_HB, hHB.numerator);
W_HB = coeffs(HB);

% Analysis 
fvtool(HB);

coeff_type = numerictype(1,16,15);
out_type = numerictype(1,16,14);


%% CIC interpolator - final stage (CIC compensator comes first - see next)

% These parameters must be altered to match CIC filter being compensated - 
% need to check against the parameters set in the System Generator block. 

N_CIC = 5;      % Number of CIC stages
D_CIC = 1;      % Differential delay

CIC = dsp.CICInterpolator(R_CIC, D_CIC, N_CIC, 'FixedPointDataType', 'Full precision');

% Use a scaling factor to compensate for CIC gain - create an FIR with one
% weight equal to the scaling factor
K = 1/(R_CIC^N_CIC);                        % gain compensation value
K_CIC = dsp.FIRFilter('Numerator', K);      % 1 weight filter (gain K)

% Visualise as scaled filter response
CICsc = cascade(K_CIC,CIC);                 % casade scaling and CIC
fvtool(CICsc);

% For System Generator design... scale by arithmetic shift and fine gain if
% not a power of 2 interpolation / decimation ratio
CIC_right_shift = log2(R_CIC^N_CIC);
CIC_left_shift = log2(R_CIC);

CIC_shift_Tx = floor(CIC_right_shift - CIC_left_shift);

CIC_fine_Tx = 2^-(CIC_right_shift - CIC_left_shift - CIC_shift_Tx);


%% CIC compensator - precedes final stage CIC filter (derives some parameters from it so appears last).

% CIC compensator is generated as system object 'CICcomp' for analysis / 
% FVtool plotting using 'dsp.CICCompensationInterpolator'

CICcomp = dsp.CICCompensationInterpolator(CIC,'InterpolationFactor',2, ...
    'PassbandFrequency',0.3*fCICcomp, 'StopbandFrequency',0.4*fCICcomp, ...
    'StopbandAttenuation',80, 'PassbandRipple',0.1, 'SampleRate',fCICcomp);

% Use a scaling factor to compensate for CIC compensator gain - create an FIR with one
% weight equal to the scaling factor

V = 1/R_CICcomp;                                % gain compensation value
K_CICcomp = dsp.FIRFilter('Numerator', V);      % 1 weight filter (gain V)

CICcompsc = cascade(K_CICcomp,CICcomp);         % casade scaling and CICcomp

% Access coefficient values for use in System Generator.
WComp = coeffs(CICcomp);
%hdCICcomp = design(fdesign.ciccomp(D_CIC, N_CIC,0.3*fCICcomp/2,0.4*fCICcomp/2,0.1,80,fCICcomp),'SystemObject',true);

% Visualise response
fvc = fvtool(CICcompsc);%, WComp.Numerator);

%% Half-Band

% Coefficients
HB_Tw_ssr = 0.995;    % Normalised transition bandwidth
HB_Ast_ssr = 60;    % Attenuation in the stopband

% design a halfband filter response with parameters specified above
dHB_ssr = fdesign.halfband('Tw,Ast', HB_Tw_ssr, HB_Ast_ssr);
hHB_ssr = design(dHB_ssr,'equiripple');

HB_ssr = dsp.FIRInterpolator(R_HB, hHB_ssr.numerator);
W_HB_ssr = coeffs(HB_ssr);

% Analysis 
fvtool(HB_ssr);


%% Tx Analysis

fvtool(cascade(HB, HB, CICcompsc, CICsc, HB_ssr))

%% CIC decimator

R_CIC_Rx = 48;
CIC_right_shift_Rx = log2(R_CIC_Rx^N_CIC);    

CIC_Rx = dsp.CICDecimator(R_CIC_Rx, D_CIC, N_CIC, 'FixedPointDataType', 'Full precision');

% Use a scaling factor to compensate for CIC gain - create an FIR with one
% weight equal to the scaling factor
K = 1/(R_CIC_Rx^N_CIC);                        % gain compensation value
K_CIC = dsp.FIRFilter('Numerator', K);      % 1 weight filter (gain K)

% Visualise as scaled filter response
CICsc = cascade(K_CIC,CIC_Rx);                 % casade scaling and CIC
fvtool(CICsc);

CIC_shift_Rx = floor(CIC_right_shift_Rx);      
CIC_fine_Rx = 2^(-(CIC_right_shift_Rx-CIC_shift_Rx)); 

fCICcomp_Rx = 384e6 / (2*R_CIC_Rx);

CICcomp_Rx = dsp.CICCompensationDecimator(R_CIC_Rx,'DecimationFactor',2, ...
    'PassbandFrequency',0.3*fCICcomp_Rx, 'StopbandFrequency',0.4*fCICcomp_Rx, ...
    'StopbandAttenuation',80, 'PassbandRipple',0.1, 'SampleRate',fCICcomp_Rx);

WComp_Rx = coeffs(CICcomp_Rx);

CICcompsc = cascade(K_CICcomp,CICcomp_Rx);
fvc = fvtool(CICcompsc);