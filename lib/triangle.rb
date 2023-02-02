class Triangle
  # write code here
  def initialize(a, b, c)
    @a = a
    @b = b 
    @c = c
  end

  def sides_positive?
    [@a, @b, @c].all?(&:positive?)
  end

  def triangle_inequality?
    @a + @b > @c && @a + @c > @b && @c + @b > @a 
  end

  def valid_triangle?
    raise TriangleError unless triangle_inequality? && sides_positive?
  end

  def kind 
    valid_triangle?
    if (@a == @b && @b == @c) 
      :equilateral
    elsif (@a == @b || @a == @c || @b == @c)
      :isosceles
    else 
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
