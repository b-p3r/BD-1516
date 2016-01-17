f1 = open('autores.txt', 'r')
f2 = open('newEditoras.txt', 'w+')

nomes = []

for line in f1:
    print(line)

f1.close()
f2.close()