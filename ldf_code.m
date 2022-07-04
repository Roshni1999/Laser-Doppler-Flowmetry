%% Dorsum data

fs = 1/0.001;
A1 = readmatrix('Shabina_dorsum1.txt');
time_dorsum = A1(3:end, 1);
dorsum_pu = A1(3:end, 2);

figure(1); hold on;
plot(time_dorsum, dorsum_pu, 'LineWidth', 1); 
xlabel('Time (seconds)'); ylabel ('LDF signal (Dorsum) (PU)')


A2 = readmatrix('Shabina_fingertip.txt');
time_fingertip = A2(3:end, 1);
fingertip_pu = A2(3:end, 2);
fingertip_filtered = smoothdata(fingertip_pu);
ind1 = find(time_fingertip>2);

min_fingertip = min(fingertip_filtered(ind1)); max_fingertip = max(fingertip_filtered(ind1));
figure(1);
plot(time_fingertip (ind1), fingertip_filtered(ind1), 'LineWidth', 1); 
xlabel('Time (seconds)'); ylabel ('LDF signal (PU)')
legend('Signal from the dorsum of the hand (bone)', 'Signal from the finger tip')

figure(3); 
Y = fft(fingertip_filtered(ind1));
P2 = abs(Y); 
P1 = P2(1:length(Y)/2+1); 
f = fs*(0:(length(Y)/2))/length(Y);
P1(1)= 1;
Mean_freq = meanfreq(fingertip_filtered,fs);
Med_freq = medfreq(fingertip_filtered,fs);
plot(f,P1); %xline(Mean_freq,'-r', LineWidth=2);  xline(Med_freq,'-g', LineWidth=2);
xlabel("Frequency [Hz]"); ylabel('Amplitude'); xlim([0.01 150]);
legend('LDF Figertip')

%%


A2 = readmatrix('ShabinaBP.txt');
time_BP = A2(3:end, 1);
BP_pu = A2(3:end, 2);

BP_filtered = smoothdata(BP_pu);
ind1 = find(time_BP>0);

figure(4);
plot(time_BP (ind1), BP_filtered(ind1), 'LineWidth', 1); 
xlabel('Time (seconds)'); ylabel ('LDF signal at finger tip with occlusion at the arm (PU)')

figure(5); 
Y = fft(BP_filtered);
P2 = abs(Y); 
P1 = P2(1:length(Y)/2+1); 
f = fs*(0:(length(Y)/2))/length(Y);
P1(1)= 1;
Mean_freq = meanfreq(BP_filtered,fs);
Med_freq = medfreq(BP_filtered,fs);
plot(f,P1); %xline(Mean_freq,'-r', LineWidth=2);  xline(Med_freq,'-g', LineWidth=2);
xlabel("Frequency [Hz]"); ylabel('Amplitude'); xlim([0 150]);
legend('LDF BP')

%%


A2 = readmatrix('ShabinaIR2.txt');
time_BP = A2(3:end, 1);
BP_pu = A2(3:end, 2);

BP_filtered = smoothdata(BP_pu);
ind1 = find(time_BP>0);

figure(2);
plot(time_BP (ind1), BP_filtered(ind1), 'LineWidth', 1); 
xlabel('Time (seconds)'); ylabel ('LDF signal at fingertip post exposure to IR (PU)')

figure(3); 
Y = fft(BP_filtered);
P2 = abs(Y); 
P1 = P2(1:length(Y)/2+1); 
f = fs*(0:(length(Y)/2))/length(Y);
P1(1)= 1;
Mean_freq = meanfreq(BP_filtered,fs);
Med_freq = medfreq(BP_filtered,fs);
plot(f,P1); %xline(Mean_freq,'-r', LineWidth=2);  xline(Med_freq,'-g', LineWidth=2);
xlabel("Frequency [Hz]"); ylabel('Amplitude'); xlim([0 150]);
legend('LDF IR')