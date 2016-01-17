import re

f1 = open('D:/git-repos/BD-1516/Modelos/povoamento/autores.txt', 'r')
f2 = open('D:/git-repos/BD-1516/Modelos/povoamento/novosAutores.txt', 'w')


for line in f1:

    m = re.match(r"(?P<first_name>.*) (?P<last_name>.*$)", line)
    fname = m.group('first_name')
    lname = m.group('last_name')

    f2.write(lname + '\t' + fname+ '\n')

f1.close()
f2.close()
