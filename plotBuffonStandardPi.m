function [p,crossings] = plotBuffonStandardPi(ax,throws,length,width)
  angles = rand(1,throws) * 360;
  x1 = rand(1,throws) * 100;
  y1 = rand(1,throws) * 100;
  x2=0;
  y2=0;
  crossings=0;
  limit=0;
  cla(ax, 'reset');
  hold(ax,"on");
  for i=1:throws
      crossed=0;
      x2 = x1(i) + (length * cosd(angles(i)));
      y2 = y1(i) + (length * sind(angles(i)));
      if floor(y1(i)/width) ~= floor(y2/width)
          crossings = crossings + 1;
          crossed=1;
      end
      if limit<=1000
        if crossed>0
          plot(ax,[x1(i),x2],[y1(i),y2],"red",'ButtonDownFcn',@LineSelected);
        else
          plot(ax,[x1(i),x2],[y1(i),y2],"blue",'ButtonDownFcn',@LineSelected);
        end
        limit=limit+1;
      end
  end
  ylineplot = -(length):width:100 + length;
  yline(ax,ylineplot);
  p = (2*length*throws) / (width*crossings)
end
