function [p,crossings] = plotBuffonSquaresPi(ax,throws,length,width)
  angles = rand(1,throws) * 360;
  x1 = rand(1,throws) * 100;
  y1 = rand(1,throws) * 100;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
  x4 = 0;
  y4 = 0;
  crossings = 0;
  limit=0;
  cla(ax, 'reset');
  hold(ax,"on");
  for i=1:throws
    x2 = x1(i) + (length * cosd(angles(i)));
    y2 = y1(i) + (length * sind(angles(i)));
    x3 = x2 + (length * cosd(angles(i) +90));
    y3 = y2 + (length * sind(angles(i) + 90));
    x4 = x3 + (length * cosd(angles(i) +180));
    y4 = y3 + (length * sind(angles(i) + 180));
    crossed=0;
    if floor(y1(i)/width) ~= floor(y2/width)
        crossings = crossings + 1;
        crossed=1;
    end
    if floor(y2/width) ~= floor(y3/width)
        crossings = crossings + 1;
        crossed=1;
    end
    if floor(y3/width) ~= floor(y4/width)
        crossings = crossings + 1;
        crossed=1;
    end
    if floor(y4/width) ~= floor(y1(i)/width)
        crossings = crossings + 1;
        crossed=1;
    end
    if limit <=250
      if crossed>0
        plot(ax,[x1(i),x2],[y1(i),y2],"red");
        plot(ax,[x2,x3],[y2,y3],"red");
        plot(ax,[x3,x4],[y3,y4],"red");
        plot(ax,[x4,x1(i)],[y4,y1(i)],"red");
      else
        plot(ax,[x1(i),x2],[y1(i),y2],"blue");
        plot(ax,[x2,x3],[y2,y3],"blue");
        plot(ax,[x3,x4],[y3,y4],"blue");
        plot(ax,[x4,x1(i)],[y4,y1(i)],"blue");
      end
      limit=limit+1;
    end
  end
  ylineplot = -(length * 2):width:100 + length * 2;
  yline(ax,ylineplot);
  p = (8*length*throws) / (width*crossings)
end
