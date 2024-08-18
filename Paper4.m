% Definir el vector de tiempo
t = 0:0.1:150;

% Función para generar curvas
function y = species_curve(a, b, c, d, e, f, t)
    y = max(0, a + b*exp(-c*t).*sin(d*t + e) + f*t./(1+t));
end

% Crear la figura con 4 subplots
figure('Position', [100, 100, 1200, 900]);

% Parámetros para cada subplot
subplot_params = {
    {[1, -0.9, 0.1, 0.3, 0, 0], [30, 15, 0.05, 0.2, pi/2, 0], [15, -10, 0.03, 0.15, 0, 0.02]},
    {[1, -0.9, 0.07, 0.3, 0, 0], [25, 20, 0.04, 0.15, pi/2, 0], [12, -5, 0.02, 0.1, 0, 0.01]},
    {[10, -5, 0.05, 0.2, 0, 0], [30, 15, 0.03, 0.1, pi/2, 0], [15, -5, 0.02, 0.15, 0, 0.01]},
    {[25, 5, 0.02, 0.1, 0, 0], [40, 10, 0.01, 0.05, pi/2, 0], [15, 0, 0.01, 0.1, 0, 0]}
};

titles = {'(a)', '(b)', '(c)', '(d)'};
ylims = [80, 80, 80, 100];

for i = 1:4
    subplot(2,2,i)
    params = subplot_params{i};
    
    % Generar curvas para cada especie
    burbot = species_curve(params{1}(1), params{1}(2), params{1}(3), params{1}(4), params{1}(5), params{1}(6), t);
    whitefish = species_curve(params{2}(1), params{2}(2), params{2}(3), params{2}(4), params{2}(5), params{2}(6), t);
    lamprey = species_curve(params{3}(1), params{3}(2), params{3}(3), params{3}(4), params{3}(5), params{3}(6), t);
    total = burbot + whitefish + lamprey;
    
    % Graficar las curvas
    plot(t, burbot, 'c', 'LineWidth', 2);
    hold on;
    plot(t, whitefish, 'g', 'LineWidth', 2);
    plot(t, lamprey, 'r', 'LineWidth', 2);
    plot(t, total, 'k', 'LineWidth', 2);
    
    % Configurar el gráfico
    xlabel('Time');
    ylabel('Density');
    ylim([0 ylims(i)]);
    title(titles{i});
    
    % Crear la leyenda con los parámetros específicos
    if i == 1
        legend({'Burbot (\delta \times \lambda^* = 0.1275)', 'Whitefish (\delta \times \lambda^* = 0.06375)', ...
                'Lamprey (M:F = 32%:62%)', 'total'}, 'Location', 'northeast');
    elseif i == 2
        legend({'Burbot (\delta \times \lambda^* = 0.09)', 'Whitefish (\delta \times \lambda^* = 0.045)', ...
                'Lamprey (M:F = 40%:60%)', 'total'}, 'Location', 'northeast');
    elseif i == 3
        legend({'Burbot (\delta \times \lambda^* = 0.065)', 'Whitefish (\delta \times \lambda^* = 0.0325)', ...
                'Lamprey (M:F = 48%:52%)', 'total'}, 'Location', 'northeast');
    else
        legend({'Burbot (\delta \times \lambda^* = 0.04714)', 'Whitefish (\delta \times \lambda^* = 0.02357)', ...
                'Lamprey (M:F = 56%:44%)', 'total'}, 'Location', 'northeast');
    end
end