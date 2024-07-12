function slider_crank_mechanism()
    % Crank angle in radians
    theta = deg2rad(45);
    
    % Define different lengths for the crank (l1) and connecting rod (l2)
    l1_values = [2, 3, 4];
    l2_values = [4, 5, 6];

    % Loop through different configurations
    for i = 1:length(l1_values)
        l1 = l1_values(i);
        for j = 1:length(l2_values)
            l2 = l2_values(j);
            
            % Compute position of slider
            [x_slider, y_slider] = slider_position(theta, l1, l2);
            
            % Plot mechanism
            plot_mechanism(theta, l1, l2, x_slider, y_slider);
        end
    end
end

function [x_slider, y_slider] = slider_position(theta, l1, l2)
    % Compute position of the slider given the crank angle and link lengths
    x_slider = l1 * cos(theta) + sqrt(l2^2 - (l1 * sin(theta))^2);
    y_slider = l1 * sin(theta);
end

function plot_mechanism(theta, l1, l2, x_slider, y_slider)
    % Plot the slider-crank mechanism
    crank_x = 0;
    crank_y = 0;

    % Plot crank
    plot([crank_x, crank_x + l1 * cos(theta)], [crank_y, crank_y + l1 * sin(theta)], 'b-', 'LineWidth', 2);
    hold on;

    % Plot connecting rod
    plot([crank_x + l1 * cos(theta), x_slider], [crank_y + l1 * sin(theta), y_slider], 'r-', 'LineWidth', 2);

    % Plot slider
    plot(x_slider, y_slider, 'go', 'MarkerSize', 10);

    hold off;
    axis equal;
    xlim([-1, l1 + l2 + 1]);
    ylim([-1, l1 + l2 + 1]);
    title('Slider-Crank Mechanism');
    xlabel('X');
    ylabel('Y');
    grid on;
    pause(1); % Pause to observe each configuration
   
end

% Call the function to start the simulation
%slider_crank_mechanism();
