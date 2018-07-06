function [pyramid_lf_fourier_features] = generate_fourier_features(features)

    N = length(features);

    if (nargin == 1)

        frame_lengths = zeros(N,1);
        for i = 1:N
            frame_lengths(i) = size(features{i}, 2);
        end

        n_coeffs = max(frame_lengths);
    end

    pyramid_lf_fourier_features = cell(N,1);
    for j = 1:N
        pyramid_lf_fourier_features{j} =...
            get_fourier_coeffs_pyramid(features{j}, n_coeffs);
    end

end
