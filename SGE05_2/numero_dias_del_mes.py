def dias_mes(mes):
    meses_31 = [1, 3, 5, 7, 8, 10, 12]
    meses_30 = [4, 6, 9, 11]

    if mes in meses_31:
        return 31
    elif mes in meses_30:
        return 30
    else:
        return 28  # Consideraré q febrero siempre con 28 días

mes = int(input("Ingresa un número entre 1 y 12 para el mes: "))

if 1 <= mes <= 12:
    print(f"El mes {mes} tiene{dias_mes(mes)} días.")
else:
    print("El mes ingresado no es válido :(")
