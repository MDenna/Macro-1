% Matthew Dennahower 103728472
% Problem 3

cd('C:\Users\Dennzy\Desktop\MA-Economics\Macro 1\HW1');

Y = xlsread('03800084.xlsx','G5027:G5167'); % Nominal GDP
y = log(Y);                                 % Log of Nominal GDP

% Part A. Detrend y and calculate the autocorrelation coefficient

cy = detrend(y);                            % Detrended y
cy_t = cy(2:141);                           % Detrended y at time t
cy_lag = cy(1:140);                         % Detrended y lagged at time t-1
auto_coef1 = regress(cy_t,cy_lag);          % Autocorrelation coefficient 

% Part B. 

[~,cy1600] = hpfilter(y,1600);              % Detrended y with lambda=1600
cy1600_t = cy1600(2:141);                   % Detrended y at time t
cy1600_lag = cy1600(1:140);                 % Detrended y lagged at time t-1
auto_coef2 = regress(cy1600_t,cy1600_lag);  % Autocorrelation coefficient 

% Part C.

[~,cy10] = hpfilter(y,10);                  % Detrended y with lambda=10
cy10_t = cy10(2:141);                       % Detrended y at time t
cy10_lag = cy10(1:140);                     % Detrended y lagged at time t-1
auto_coef3 = regress(cy10_t,cy10_lag);      % Autocorrelation coefficient 

% Part D. Written portion of Part D found in pdf file
% Create a 4x1 subplot with 3 graphs for the variables separately and 1
% with all of the variables on the same graph.

[~,time,~] = xlsread('03800084.xlsx','A5027:A5167'); 

% Plot of cy as a time series
subplot(4,1,1);                             
plot(datenum(time),cy);
datetick('x','yyyy');
title('Detrended y over time');

% Plot of cy1600 as a time series
subplot(4,1,2);
plot(datenum(time),cy1600);
datetick('x','yyyy');
title('Detrended y (lambda=1600) over time');

% Plot of cy10 as a time series
subplot(4,1,3);
plot(datenum(time),cy10);
datetick('x','yyyy');
title('Detrended y (lambda=10) over time');

% Plot with cy, cy1600 and cy10 on the same graph
subplot(4,1,4);
plot(datenum(time),cy,datenum(time),cy1600,datenum(time),cy10);
datetick('x','yyyy');
title('Detrended y, y with lambda=1600 and y with lambda=10 over time');
