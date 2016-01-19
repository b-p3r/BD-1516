import re
import random


def eliminarepetidos(fich):
    f1 = open(fich + '.txt', 'r')
    f2 = open(fich + '_sem_repetidos.txt', 'w+')

    nomes = []

    for line in f1:
        if line not in nomes:
            nomes.append(line)
            f2.write(line)

    f1.close()
    f2.close()


def corrige_nomes():
    f1 = open('autores_sem_repetidos.txt', 'r')
    f2 = open('autores_final.txt', 'w')

    for line in f1:
        m = re.match(r"(?P<first_name>.*) (?P<last_name>.*$)", line)
        fname = m.group('first_name')
        lname = m.group('last_name')
        f2.write(lname + '\t' + fname + '\n')

    f1.close()
    f2.close()

def gera_ccs():
    f1 = open('ccs.txt', 'w+')
    count = 0
    ccs = []

    while count < 3000:
        n = random.randint(100000000, 999999999)
        if n not in ccs:
            count += 1
            ccs.append(n)
            f1.write(str(n) + '\n')

    f1.close()

def gera_telefones():
    f1 = open('telefones.txt', 'w+')
    count = 0
    telefs = []

    while count < 3000:
        telef = random.randint(210000000, 299999999)
        if telef not in telefs:
            count += 1
            telefs.append(telef)
            f1.write(str(telef) + '\n')

    f1.close()

gera_telefones()



