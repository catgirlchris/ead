def es_bisiesto(year):
    if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
        return True
    else:
        return False

year = int(input("Ingresa un año: "))

if es_bisiesto(year):
    print(f"{year} es un año bisiesto :)")
else:
    print(f"{year} no es un año bisiesto :(")
