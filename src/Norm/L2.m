classdef L2 < NormAPI
    % Norm L2
    
    properties
        norm
    end
        
    methods 
        %------------------------------------------------------------------
        % Norm L2
        function A = normalize_columns(obj, A)
            n = sqrt(sum(A.*A, 1));
            n(n == 0) = 1;
            A = (A * obj.norm) ./ repmat(n,size(A,1),1);            
        end

        function A = normalize_lines(obj, A)
            n = sqrt(sum(A.*A, 2));
            n(n == 0) = 1;
            A = (A * obj.norm) ./ repmat(n,1,size(A,2));            
        end

        %------------------------------------------------------------------
        % Construtor
        function obj = L2(norm)
            if nargin == 0
                norm = 1;
            end
            obj.norm = norm;
        end
        
        %------------------------------------------------------------------
        % Describe parameters as text or filename:
        function str = toString(obj)
            str = sprintf('L2 (norm = %s)', num2str(obj.norm));
        end
        function str = toFileName(obj)
            if obj.norm == 1
                str = 'L2';
            else
                str = sprintf('L2[%s]', num2str(obj.norm));
            end
        end
        function str = toName(obj)
            str = 'L2';
        end           
    end
end
