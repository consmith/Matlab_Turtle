classdef Turtle
    %TURTLE Turtle with a pen
    %   Turtle with a pen
    
    properties
        x
        y
        %0 = E, 90 = N, 180 = W, 270 = S
        heading
        %pen status
        pen_on_paper
        %pretty stuff
        pen
        
    end
    
    methods
        function obj = Turtle()
            obj.x = 0;
            obj.y = 0;
            obj.heading = 90;
            obj.pen_on_paper = true;
            obj.pen = Pen('black',1);
        end
        
        function obj = forward(obj,distance)
            x2 = obj.x + distance*cosd(obj.heading);
            y2 = obj.y + distance*sind(obj.heading);
            if obj.pen_on_paper
                % draw a line
                 hold on
                 l = line([obj.x x2],[obj.y y2]);
                 l.Color = obj.pen.color;
                 l.LineWidth = obj.pen.width;
                 hold off
                 pause(0.1)
            end
            obj.x = x2;
            obj.y = y2;
        end
        
        function obj = rotate(obj,angle)
            % rotate CCW by given angle
            obj.heading = mod(obj.heading + angle,360);
        end
        
        function obj = penUp(obj) 
            obj.pen_on_paper = false;
        end
        
        function obj = penDown(obj) 
            obj.pen_on_paper = true;
        end
        
        function obj = square(obj,sidelength)
            for i = 1:4
                obj = obj.forward(sidelength);
                obj = obj.rotate(90);
            end
                
        end
        
        % not needed anymore(below)s
        
        function obj = new_pen_width(obj,new_width)
            obj.pen_width = new_width;
        end
        
        function obj = new_pen_color(obj,new_color)
            obj.pen_color = new_color;
        end
        
        %not needed anymore^
        
        function obj = set_Pen(obj,pen)
            obj.pen.color = pen.color;
            obj.pen.width = pen.width;
        end
        
        function obj = goHome(obj)
            obj.x = 0;
            obj.y = 0;
            obj.heading = 90;
        end
        
    end
    

end

