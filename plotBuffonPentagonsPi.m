function [p,crossings] = plotBuffonPentagonsPi(ax,throws,length,width)
  angles = rand(1,throws) * 360;
  x1arr = rand(1,throws) * 100;
  y1arr = rand(1,throws) * 100;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
  x4 = 0;
  y4 = 0;
  x5 = 0;
  y5 = 0;
  crossings = 0;
  limit=0;
  cla(ax, 'reset');
  hold(ax,"on");
  for i=1:throws
    x1=x1arr(i);
    y1=y1arr(i);
    angle = angles(i);
    x2 = x1 + (length * cosd(angle));
    y2 = y1 + (length * sind(angle));
    x3 = x2 + (length * cosd(angle +72));
    y3 = y2 + (length * sind(angle + 72));
    x4 = x3 + (length * cosd(angle +144));
    y4 = y3 + (length * sind(angle + 144));
    x5 = x4 + (length * cosd(angle + 216));
    y5 = y4 + (length * sind(angle + 216));
    crossed=0;
    if floor(y1/width) ~= floor(y2/width)
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
    if floor(y4/width) ~= floor(y5/width)
        crossings = crossings + 1;
        crossed=1;
    end
    if floor(y5/width) ~= floor(y1/width)
        crossings = crossings + 1;
        crossed=1;
    end
    if limit <=200
      if crossed>0
        colour="red";
      else
        colour="blue";
      end
      plot(ax,[x1,x2],[y1,y2],colour);
      plot(ax,[x2,x3],[y2,y3],colour);
      plot(ax,[x3,x4],[y3,y4],colour);
      plot(ax,[x4,x5],[y4,y5],colour);
      plot(ax,[x5,x1],[y5,y1],colour);
      limit=limit+1;
    end
  end
  ylineplot = -(length * 2):width:100 + length * 2;
  yline(ax,ylineplot);
  p = (10*length*throws) / (width*crossings);
end
