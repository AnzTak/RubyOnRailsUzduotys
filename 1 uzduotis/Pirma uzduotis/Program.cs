using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Iveskite staciakampio ilgi: ");
            double ilgis = double.Parse(Console.ReadLine());

            Console.Write("Iveskite staciakampio ploti: ");
            double plotis = double.Parse(Console.ReadLine());

            Console.Write("Iveskite kampo koordinate x: ");
            double x = double.Parse(Console.ReadLine());

            Console.Write("Iveskite kampo koordinate y: ");
            double y = double.Parse(Console.ReadLine());
            Console.WriteLine("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ");
            Console.WriteLine();

            Rectangle r = new Rectangle(ilgis, plotis, x, y);
            Console.WriteLine("Staciakampio plotas lygus: {0}", r.Plotas());
            Console.WriteLine("Staciakampio perimetras lygus: {0}", r.Perimetras());
            Console.WriteLine("Staciakampio istrizaines ilgis lygus: {0:0.00}", r.Istrizaine());
            Console.WriteLine("Staciakampio kampu koordinates lygios: {0}", r.Kampai());
            Console.WriteLine("Staciakampio istrizainiu susikirtimo tasko koordinates lygios: {0}", r.Centras());
            Console.ReadKey();
        }
    }
}
