import random

# aleatorio
numero_secreto = random.randint(1, 100)
intentos = 0

# bucle hasta que se adivine
while True:
    intento = int(input("Intenta adivinar el número secreto (entre 1 y 100): "))
    intentos += 1

    if intento == numero_secreto:
        print(f"Yayyy, ¡adivinaste el número en {intentos} intentos!")
        break
    elif intento < numero_secreto:
        print("El numero secreto es mayor.")
    else:
        print("El número secreto es menor")
