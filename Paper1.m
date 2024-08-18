% Definir el vector de tiempo
t = 0:0.1:150;

% Gráfico (a)
figure;

% Simular datos para cada especie
species1 = 50 - 30*exp(-0.1*t);
species2 = 240 - 200*exp(-0.05*t);
species3 = 20*exp(-0.02*t);
total = species1 + species2 + species3;

% Graficar los datos
plot(t, species1, 'c', t, species2, 'b', t, species3, 'g', t, total, 'r', 'LineWidth', 2);

% Personalizar el gráfico
title('(a)');
xlabel('Time');
ylabel('Species density');
legend('Species1', 'Species2', 'Species3', 'Total species', 'Location', 'southeast');
ylim([0 300]);

% Gráfico (b)
figure;

% Simular datos para cada especie (usando funciones oscilatorias para este ejemplo)
species1 = 30 + 5*sin(0.1*t);
species2 = 35 + 10*sin(0.15*t);
species3 = 25 + 3*sin(0.05*t);
male_lampreys = 5 + 2*sin(0.2*t);
female_lampreys = 15 + 5*sin(0.1*t);
total = species1 + species2 + species3 + male_lampreys + female_lampreys;

% Graficar los datos
plot(t, species1, 'c', t, species2, 'b', t, species3, 'g', t, male_lampreys, 'k', t, female_lampreys, 'm', t, total, 'r', 'LineWidth', 2);

% Personalizar el gráfico
title('(b)');
xlabel('Time');
ylabel('Species density');
legend('Species1', 'Species2', 'Species3', 'Male lampreys-2', 'Female lampreys-8', 'Total species', 'Location', 'northeast');
ylim([0 120]);