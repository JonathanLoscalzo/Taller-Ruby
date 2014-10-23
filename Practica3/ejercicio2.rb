=begin
¿Qué sucede si intenta abrir con File.open un archivo que no existe?



"r"  Read-only, starts at beginning of file  (default mode).

"r+" Read-write, starts at beginning of file.

"w"  Write-only, truncates existing file
     to zero length or creates a new file for writing.

"w+" Read-write, truncates existing file to zero length
     or creates a new file for reading and writing.

"a"  Write-only, each write call appends data at end of file.
     Creates a new file for writing if file does not exist.

"a+" Read-write, each write call appends data at end of file.
     Creates a new file for reading and writing if file does
     not exist.



=end

File.open(filename, 'r') #=>Errno::ENOENT: No such file or directory @ rb_sysopen. Error del SO
File.open(filename, 'w') #=> si no existe lo prueba
File.open(filename, 'a') #=> igual que el de arriba
# el mas le agrega que se pueda leer y escribir en el caso de que lo cree. r y r+ es lo mismo (no hay diferencia)
