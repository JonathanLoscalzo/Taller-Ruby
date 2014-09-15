#
# 10.  2520 es el número más chico que puede ser dividido por cada uno de los números
# del 1 al 10 sin obtener resto. ¿Cual es el número
# más chico que puede ser dividido por cada uno de los números del 1 al 20?
#
#
# 1.step(10, 2).to_a para darle por pasos
# 10.step(1,-1).to_a para hacer para atras
# 10.downto(1)
# (1..5).to_a.reverse
#

(1..20).reduce(1)  { |mem, var|  mem.lcm(var) } # => deberìa dar 232792560
# (1..20).inject(1)  { & :lcm(&)}
