% Definir el vector de tiempo
t = 0:0.1:150;

% Función para generar curvas con variaciones
function y = species_curve(a, b, c, d, e, t)
    y = a + b*exp(-c*t).*sin(d*t + e);
end

% Generar subplots
figure('Position', [100, 100, 1200, 900]);

for subplot_idx = 1:4
    subplot(2,2,subplot_idx)
    
    % Parámetros base para cada especie
    params = {
        [30, 5, 0.05, 0.2, 0], % Species1
        [35, 25, 0.03, 0.15, pi/2], % Species2
        [25, 5, 0.02, 0.1, pi/4], % Species3
        [5, 8, 0.04, 0.25, pi/3], % Male lampreys
        [15, 10, 0.03, 0.2, pi/6], % Female lampreys
    };
    
    % Generar múltiples curvas para cada especie
    for i = 1:5
        base_params = params{i};
        for j = 1:3
            variation = randn(1,5)*0.1.*base_params; % Pequeña variación aleatoria
            y = species_curve(base_params(1)+variation(1), base_params(2)+variation(2), ...
                              base_params(3)+variation(3), base_params(4)+variation(4), ...
                              base_params(5)+variation(5), t);
            if j == 1
                plot(t, y, 'LineWidth', 2);
            else
                plot(t, y, ':', 'LineWidth', 1);
            end
            hold on;
        end
    end
    
    % Calcular y graficar el total
    total = zeros(size(t));
    for i = 1:5
        total = total + species_curve(params{i}(1), params{i}(2), params{i}(3), params{i}(4), params{i}(5), t);
    end
    plot(t, total, 'r', 'LineWidth', 2);
    
    % Configurar el gráfico
    xlabel('Time');
    ylabel('Species density');
    ylim([0 120]);
    title(['(' char(96+subplot_idx) ')']);
    legend({'Species1', 'Species2', 'Species3', 'Male lampreys', 'Female lampreys', 'Total species'}, ...
           'Location', 'northeast');
    
    % Ajustar leyenda según el subplot
    if subplot_idx == 1
        legend({'Species1', 'Species2', 'Species3', 'Male lampreys-3', 'Female lampreys-7', 'Total species'});
    elseif subplot_idx == 2
        legend({'Species1', 'Species2', 'Species3', 'Male lampreys-5', 'Female lampreys-5', 'Total species'});
    elseif subplot_idx == 3
        legend({'Species1', 'Species2', 'Species3', 'Male lampreys-7', 'Female lampreys-3', 'Total species'});
    elseif subplot_idx == 4
        legend({'Species1', 'Species2', 'Species3', 'Male lampreys-8', 'Female lampreys-2', 'Total species'});
    end
end