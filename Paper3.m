% Definir el vector de tiempo
t = 0:0.1:150;

% Función para generar curvas con variaciones
function y = species_curve(a, b, c, d, e, f, t)
    y = a + b*exp(-c*t).*sin(d*t + e) + f*t./(1+t);
end

% Crear la figura
figure('Position', [100, 100, 800, 600]);

% Colores para cada especie
colors = {'c', 'b', 'g', 'k', 'm', 'r'};

% Parámetros base para cada especie
params = {
    [30, 10, 0.05, 0.2, 0, 0.01],    % Species1 (cyan)
    [35, 25, 0.03, 0.15, pi/2, 0],   % Species2 (blue)
    [25, 5, 0.02, 0.1, pi/4, 0],     % Species3 (green)
    [5, 8, 0.04, 0.25, pi/3, 0],     % Male lampreys (black)
    [15, 10, 0.03, 0.2, pi/6, 0],    % Female lampreys (magenta)
    [90, 30, 0.02, 0.1, 0, 0.05]     % Total species (red)
};

% Generar múltiples curvas para cada especie
for i = 1:6
    base_params = params{i};
    for j = 1:5
        variation = randn(1,6)*0.1.*base_params; % Variación aleatoria
        y = species_curve(base_params(1)+variation(1), base_params(2)+variation(2), ...
                          base_params(3)+variation(3), base_params(4)+variation(4), ...
                          base_params(5)+variation(5), base_params(6)+variation(6), t);
        if j == 1
            plot(t, y, colors{i}, 'LineWidth', 2);
        else
            plot(t, y, colors{i}, 'LineStyle', ':', 'LineWidth', 1);
        end
        hold on;
    end
end

% Configurar el gráfico
xlabel('Time');
ylabel('Species density');
ylim([0 120]);
title('Species Density over Time');
legend({'Species1', 'Species2', 'Species3', 'Male lampreys', 'Female lampreys', 'Total species'}, ...
       'Location', 'northeast');

% Añadir flechas para resaltar puntos de interés
arrow_points = [20, 75; 50, 95; 75, 85; 100, 90; 125, 90];
for i = 1:size(arrow_points, 1)
    annotation('arrow', [arrow_points(i,1)/150, arrow_points(i,1)/150], ...
               [arrow_points(i,2)/120, (arrow_points(i,2)+5)/120], 'Color', 'r');
end