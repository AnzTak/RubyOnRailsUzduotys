class Pic
	private
	attr_accessor :mano_vardas
	
	public
	def initialize
		@mano_vardas = []
		for i in 0...128
			@mano_vardas[i] = i.chr
		end
	end

	def VardoSpausdinimas
		arr = [65,110,122,101,108,105,107,97,32,84,97,107,117,110]
		arr.each do |num|
			print "#{@mano_vardas[num]}"
		end
		print "\n"
	end

	def Paveikslelis(bg, pix)
		pic = Array.new
		pic << Array[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		pic << Array[0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0]
		pic << Array[0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0]
		pic << Array[0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0]
		pic << Array[0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0]
		pic << Array[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0]
		pic << Array[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0]
		pic << Array[0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0]
		pic << Array[0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0]
		pic << Array[0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0]
		pic << Array[0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
		pic << Array[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0]
		pic << Array[0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0]
		pic << Array[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0]
		pic << Array[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		pic.each do |line|
			line.each do |simbol|
				if simbol == 1
					print "#{@mano_vardas[pix.ord]}"
				else
					print "#{@mano_vardas[bg.ord]}"
				end
			end
			print "\n"
		end
	end
end

pic = Pic.new
pic.VardoSpausdinimas
pic.Paveikslelis(' ', '@')
