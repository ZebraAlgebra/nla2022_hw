function C_new = inverse_update(C,a,i)
    % <---Here the tolerance is set to 1e-18; this can be changed--->
    tol = 1e-18;
    % <---Define the vector e_i--->
    m = size(C,1);
    e_i = zeros(m,1);
    e_i(i,1) = 1;
    % <---Prevent division by small number--->
    val = a'*C*e_i;
    disp(val)
    if val < tol % <---Outputs error if intolerable--->
        error(strcat("Error in inverse_update formula : " + ...
            "division by small number." + ...
            " tolerance : ",num2str(tol)));
    end
    % <---If tolerable, update using the explicit formula--->
    C_new = C*(eye(m)+inv(val)*e_i*(e_i'-a'*C));
end