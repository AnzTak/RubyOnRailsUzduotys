class Rectangle
	private
	attr_accessor :ilgis, :plotis, :x, :y
	
	public
	def initialize(ilgis, plotis, x, y)
		@ilgis = ilgis
		@plotis = plotis
		@x = x
		@y = y
	end

	def Plotas
		return (@ilgis * @plotis).round()
	end

	def Perimetras
		return (2 * (@ilgis + @plotis)).round()
	end

	def Istrizaine
		return Math.sqrt(@ilgis * @ilgis + @plotis * @plotis).round(2)
	end

	def Kampai
		bx = (@x + @ilgis).round()
		by = (@y).round()
		cx = (@x + @ilgis).round()
		cy = (@y - @plotis).round()
		dx = (@x).round()
		dy = (@y - @plotis).round()
		return "(#{@x.round()},#{@y.round()}) (#{bx},#{by}) (#{cx},#{cy}) (#{dx},#{dy})"
	end

	def Centras
		px = (@ilgis / 2) + @x
		py = @y - (@plotis / 2)
		return "(#{px.round()},#{py.round()})"
	end
end

print "Iveskite staciakampio ilgi: "
ilgis = gets.chomp
print "Iveskite staciakampio ploti: "
plotis = gets.chomp
print "Iveskite kampo koordinate x: "
x = gets.chomp
print "Iveskite kampo koordinate y: "
y = gets.chomp
print "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ \n\n"


r = Rectangle.new(ilgis.to_f, plotis.to_f, x.to_f, y.to_f)
puts "Staciakampio plotas lygus: #{r.Plotas}"
puts "Staciakampio perimetras lygus: #{r.Perimetras}"
puts "Staciakampio istrizaines ilgis lygus: #{r.Istrizaine}"
puts "Staciakampio kampu koordinates lygios: #{r.Kampai}"
puts "Staciakampio istrizainiu susikirtimo tasko koordinates lygios: #{r.Centras}"

