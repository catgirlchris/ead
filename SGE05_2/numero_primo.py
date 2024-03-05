def es_primo(numero):
    # si es 0 no lo es
    if numero <= 1:
        return False
    # Si es entre 1 y 3 inlcuidos, es primo
    elif numero <= 3:
        return True
    # Si es divisible entre 2 o 3, no es primo
    elif numero % 2 == 0 or numero % 3 == 0:
        return False
    # a partir de 5 va en bucle buscando divisores
    i = 5
    while i * i <= numero:
        if numero % i == 0 or numero % (i + 2) == 0:
            return False
        i += 6
    return True

numero = int(input("Ingresa un número para verificar si es primo porfi ^^: "))

if es_primo(numero):
    print(f"{numero} es un número primo :)")
else:
    print(f"{numero} no es un número primo :(")
