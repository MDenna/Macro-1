% Matthew Dennahower 103728472
% Problem 4

cd('C:\Users\Dennzy\Desktop\MA-Economics\Macro 1\HW1');

HC = xlsread('03800084.xlsx','G143:G283');  % Consumption (Household final consumption expenditure)
hc = log(HC);   % log of HC
[trhc,dehc] = hpfilter(hc,1600);    % Take trend and trended components of hc with lambda = 1600
[~,time,~] = xlsread('03800084.xlsx','A5027:A5167');  % Create a time counter for the x-axis
p = plot(datenum(time),trhc,'r',datenum(time),hc,'g'); % Plot trhc and hc
datetick('x','yyyy');   % Set x-axis to be the actual dates
p(1).LineWidth = 1.5;   % Specify line width of 1.5 for trhc
p(2).LineWidth = 1.5;   % Specify line width of 1.5 for hc
title('Trended component of Household consumption and log of Household consumption'); % Change title
legend('trhc','hc');    % Create legend

dehc_t    = dehc(4:141);                     % Detrended hc at time t
dehc_lag1 = dehc(3:140);                     % Detrended hc at time t t-1
dehc_lag2 = dehc(2:139);                     % Detrended hc at time t t-2
dehc_lag3 = dehc(1:138);                     % Detrended hc lagged at time t-3

X = [ones(size(dehc_lag1)) dehc_lag1 dehc_lag2 dehc_lag3];  % Create a 4x1 matrix of the regressors in the model, the first is the constant term

auto_coef = regress(dehc_t,X);      % Autocorrelation coefficient 