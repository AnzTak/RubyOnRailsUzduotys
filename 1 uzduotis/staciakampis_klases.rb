# frozen_string_literal: true

# Rectangle
class Rectangle
  private

  attr_accessor :ilgis, :plotis, :x, :y

  public

  def initialize(ilgis, plotis, x_pox, y_pox)
    @ilgis = ilgis
    @plotis = plotis
    @x = x_pox
    @y = y_pox
  end

  def plotas
    (@ilgis * @plotis).round
  end

  def perimetras
    (2 * (@ilgis + @plotis)).round
  end

  def istrizaine
    Math.sqrt(@ilgis * @ilgis + @plotis * @plotis).round(2)
  end

  def kampai
    bx = (@x + @ilgis).round
    by = @y.round
    cx = (@x + @ilgis).round
    cy = (@y - @plotis).round
    dx = @x.round
    dy = (@y - @plotis).round
    "(#{@x.round},#{@y.round}) (#{bx},#{by}) (#{cx},#{cy}) (#{dx},#{dy})"
  end

  def centras
    px = (@ilgis / 2) + @x
    py = @y - (@plotis / 2)
    "(#{px.round},#{py.round})"
  end
end

# rubocop:disable Metrics/AbcSize

# PrintRectangle
class PrintRectangle
  private

  attr_accessor :ilgis, :plotis, :x, :y

  public

  def data_input
    print 'Iveskite staciakampio ilgi: '
    @ilgis = gets.chomp
    print 'Iveskite staciakampio ploti: '
    @plotis = gets.chomp
    print 'Iveskite kampo koordinate x: '
    @x = gets.chomp
    print 'Iveskite kampo koordinate y: '
    @y = gets.chomp
    print "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ \n\n"
  end

  def data_print
    r = Rectangle.new(ilgis.to_f, plotis.to_f, x.to_f, y.to_f)
    puts "Staciakampio plotas lygus: #{r.plotas}"
    puts "Staciakampio perimetras lygus: #{r.perimetras}"
    puts "Staciakampio istrizaines ilgis lygus: #{r.istrizaine}"
    puts "Staciakampio kampu koordinates lygios: #{r.kampai}"
    txt = 'Staciakampio istrizainiu susikirtimo'
    puts "#{txt} tasko koordinates lygios: #{r.centras}"
  end
end

# rubocop:enable Metrics/AbcSize
