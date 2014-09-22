# deberìa ir esto? como bash? /usr/local/bin/ruby  -w

Symbols = { 1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M' }
Subtractors = [[1000, 100], [500, 100], [100, 10], [50, 10], [10, 1], [5, 1], [1, 0]]

def otherRoman(num)
  if Symbols.key?(num)
    return Symbols[num]
  end
  Subtractors.each do | cutPoint, subtractor |
    if num > cutPoint
      return otherRoman(cutPoint) + otherRoman(num - cutPoint)
    end
    if num >= cutPoint - subtractor && num < cutPoint
      return otherRoman(subtractor) + otherRoman(num + subtractor)
    end
  end
end

[1990, 3888, 3242, 5000].each do | i |
  puts otherRoman(i)
end

#  Otra version con los if estos raros
#
#  Symbols = { 1=>'I', 5=>'V', 10=>'X', 50=>'L', 100=>'C', 500=>'D', 1000=>'M' }
# Subtractors = [ [1000, 100], [500, 100], [100, 10], [50, 10], [10, 1], [5, 1], [1, 0] ]
#
# def roman(num)
#   return Symbols[num]  if Symbols.has_key?(num)
#   Subtractors.each do |cutPoint, subtractor|
#     return roman(cutPoint) + roman(num - cutPoint)      if num >  cutPoint
#     return roman(subtractor) + roman(num + subtractor)  if num >= cutPoint - subtractor and num < cutPoint
#   end
# end
#
# [1990, 2008, 1666].each do |i|
#   puts "%4d => %s" % [i, roman(i)]
# end
#
# FUENTE = http://rosettacode.org/wiki/Roman_numerals/Encode#Ruby
#
#
