#
# 9.  Un número (capicúa) palíndromo se lee igual al derecho y al revés.
# El número palíndromo más grande obtenido de la multiplicación de dos
# números de 2 dígitos es 9009 (91 x 99 = 9009).
# Encontrá el palíndromo más grande obtenido a través de la multiplicación de dos
# números de 3 dígitos.
#

def palindromo(num)
  # num deberìa ser un string?
  num.to_s.reverse == num.to_s
end

max = [0, 0, 0]
999.downto(100) do |e|
  e.downto(100) do |x|
    if palindromo(x * e) && max[0] < x * e
      max = [x * e, x, e]
      break
    elsif x * e < max[0]
      break
    end
  end
end

print "#{max}\n"
