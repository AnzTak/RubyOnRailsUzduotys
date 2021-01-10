# frozen_string_literal: true

require 'test/unit'
require_relative 'staciakampis_klases.rb'

# TestRectangle
class TestRectangle < Test::Unit::TestCase
  def setup
    @rect = Rectangle.new(8, 8, 2, 2)
  end

  def test_plotas
    assert_equal(@rect.plotas, 64)
  end

  def test_perimetras
    assert_equal(@rect.perimetras, 32)
  end

  def test_istrizaine
    assert_equal(@rect.istrizaine, 11.31)
  end

  def test_kampai
    assert_equal(@rect.kampai, '(2,2) (10,2) (10,-6) (2,-6)')
  end

  def test_centras
    assert_equal(@rect.centras, '(6,-2)')
  end
end
