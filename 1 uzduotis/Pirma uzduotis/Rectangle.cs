using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    class Rectangle
    {
        private double ilgis;
        private double plotis;
        private double x;
        private double y;

        public Rectangle(double ilgis, double plotis, double x, double y)
        {
            this.ilgis = ilgis;
            this.plotis = plotis;
            this.x = x;
            this.y = y;
        }

        public double Plotas()
        {
            return ilgis * plotis;
        }

        public double Perimetras()
        {
            return 2 * (ilgis + plotis);
        }

        public double Istrizaine()
        {
            return Math.Sqrt(ilgis * ilgis + plotis * plotis);
        }

        public string Kampai()
        {
            double bx = x + ilgis;
            double by = y;
            double cx = x + ilgis;
            double cy = y - plotis;
            double dx = x;
            double dy = y - plotis;

            return string.Format("({0},{1}) ({2},{3}) ({4},{5}) ({6},{7})", 
                x, y, bx, by, cx, cy, dx, dy);
        }

        public string Centras()
        {
            double x = (ilgis / 2) + this.x;
            double y = this.y - (plotis / 2);

            return string.Format("({0},{1})", x, y);
        }
    }
}
