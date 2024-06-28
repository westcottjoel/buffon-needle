function [gr,crossings] = plotBuffonPentagonsGR(ax,throws,length,width)
  angles = rand(1,throws) * 360;
  x1 = rand(1,throws) * 100;
  y1 = rand(1,throws) * 100;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
  x4 = 0;
  y4 = 0;
  x5 = 0;
  y5 = 0;
  crossings = 0;
  consecutive_crossings = 0;
  limit=0;
  cla(ax, 'reset');
  hold(ax,"on");
  for i=1:throws
    x2 = x1(i) + (length * cosd(angles(i)));
    y2 = y1(i) + (length * sind(angles(i)));
    x3 = x2 + (length * cosd(angles(i) +72));
    y3 = y2 + (length * sind(angles(i) + 72));
    x4 = x3 + (length * cosd(angles(i) +144));
    y4 = y3 + (length * sind(angles(i) + 144));
    x5 = x4 + (length * cosd(angles(i) + 216));
    y5 = y4 + (length * sind(angles(i) + 216));
    crossed=0;
    crossings1 = -1;
    crossings2 = -2;
    crossings3 = -3;
    crossings4 = -4;
    crossings5 = -5;
    if floor(y1(i)/width) ~= floor(y2/width)
        crossings = crossings + 1;
        crossings1=1;
        crossed=1;
    end
    if floor(y2/width) ~= floor(y3/width)
        crossings = crossings + 1;
        crossings2=1;
        crossed=1;
    end
    if floor(y3/width) ~= floor(y4/width)
        crossings = crossings + 1;
        crossings3=1;
        crossed=1;
    end
    if floor(y4/width) ~= floor(y5/width)
        crossings = crossings + 1;
        crossings4=1;
        crossed=1;
    end
    if floor(y5/width) ~= floor(y1(i)/width)
        crossings = crossings + 1;
        crossings5=1;
        crossed=1;
    end
      if crossings1 == crossings2 || crossings2 == crossings3 || crossings3==crossings4 || crossings4==crossings5 || crossings5 == crossings1
        consecutive_crossings = consecutive_crossings + 1;
      end
    if limit <=200
      if crossed>0
        plot(ax,[x1(i),x2],[y1(i),y2],"red");
        plot(ax,[x2,x3],[y2,y3],"red");
        plot(ax,[x3,x4],[y3,y4],"red");
        plot(ax,[x4,x5],[y4,y5],"red");
        plot(ax,[x5,x1(i)],[y5,y1(i)],"red");
      else
        plot(ax,[x1(i),x2],[y1(i),y2],"blue");
        plot(ax,[x2,x3],[y2,y3],"blue");
        plot(ax,[x3,x4],[y3,y4],"blue");
        plot(ax,[x4,x5],[y4,y5],"blue");
        plot(ax,[x5,x1(i)],[y5,y1(i)],"blue");
      end
      limit=limit+1;
    end
  end
  ylineplot = -(length * 2):width:100 + length * 2;
  yline(ax,ylineplot);
  crossings = crossings / 2
  gr = 2 - (consecutive_crossings / crossings);
end
