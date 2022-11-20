import pandas as pd

df = pd.read_csv('C:\practica\dataset_final.csv')
df.head()

# Importamos el dataset de los datos de los pokemon
'''
1. ¿Cuántos pokémon hay en el dataset? 
'''
print(df.count()) # 800 rows x 13 coluns
'''
Muestra las cabeceras del dataframe df
'''
list(df.columns)
'''
2. ¿Cuántos pokémon hay de tipo Poison? (Type 1)
'''
df[df['Type 1'] == 'Poison']
print(df[df['Type 1'] == 'Poison'])
'''
3. ¿Cuántos tipos diferentes de pokémon hay? (Type 1)
'''
uniqueValues = df['Type 1'].nunique()
print(uniqueValues)

'''
2. ¿Cuántos pokémon hay de cada tipo? (Type 1)
'''
Contador_Type1 = df['Type 1'].count() # revisar
print('Num por Type 1 ',Contador_Type1)
'''
2.1 ¿cual es el tipo de pokémon con más pokémon? (Type 1)
'''
Max_valor_T1 = df['Type 1'].max()
print('pokémon con más pokémon', Max_valor_T1)
'''
3. ¿Cuál es el pokémon más rápido?
'''
i = df['Speed'].idxmax() # Obtnemos el indice del dataframe con Speed Max
#Mostramosel pokemon de ese indice
print(df['Name'][i])

'''
4. ¿Cuántos pokemon tiene una defensa superior a 100?
'''
DEF_SUP_100 = df[df['Defense'] > 100]
print(DEF_SUP_100)
'''
4.1 ¿Cuántos pokemon tiene una defensa superior a 100?
'''
# Este ejercico es igual al anterior (punto 4)
# DEF_SUP_100 = df[df['Defense'] > 100]
# print(DEF_SUP_100)
'''
5. ¿Cuántos pokemon tiene una defensa superior a 100 y una velocidad superior a 100?
'''
DEF_SUP_100 = df[df['Defense'] > 100]
VELOC = DEF_SUP_100[DEF_SUP_100['Speed'] > 100]
print(VELOC)

'''
6. Ordena el dataset por el tipo 1 y por el tipo 2
'''
ordenacion = df.sort_values(['Type 1','Type 2'])
print(ordenacion)
'''
7. Crea un nuevo dataset con los pokémon de tipo Water y Fire como primer tipo
'''
new_dataset_wf = df[(df['Type 1'] == 'Water') | (df['Type 1'] == 'Fire')]
print(new_dataset_wf)
'''
8. Crea un nuevo dataset con los pokemon Legendary
'''
new_dataset_lg = df[(df['Legendary'] == True)]
print(new_dataset_lg)

'''
9. Calcula el promedio de stats de los pokemon Legendary (HP, Attack, Defense, Sp. Atk, Sp. Def, Speed) y los no Legendary
'''
dfl = df[(df['Legendary'] == True)]
hp_prom_lg = dfl.groupby('Legendary')['HP'].sum()/dfl.groupby('Legendary')['HP'].count()
Attack_prom_lg = dfl.groupby('Legendary')['Attack'].sum()/dfl.groupby('Legendary')['Attack'].count()
Defense_prom_lg = dfl.groupby('Legendary')['Defense'].sum()/dfl.groupby('Legendary')['Defense'].count()
Spatk_prom_lg = dfl.groupby('Legendary')['Sp. Atk'].sum()/dfl.groupby('Legendary')['Sp. Atk'].count()
Spdef_prom_lg = dfl.groupby('Legendary')['Sp. Def'].sum()/dfl.groupby('Legendary')['Sp. Def'].count()
speed_prom_lg = dfl.groupby('Legendary')['Speed'].sum()/dfl.groupby('Legendary')['Speed'].count()

dfnl = df[(df['Legendary'] == False)]
hp_prom_lg_f = dfnl.groupby('Legendary')['HP'].sum()/dfnl.groupby('Legendary')['HP'].count()
Attack_prom_lg_f = dfnl.groupby('Legendary')['Attack'].sum()/dfnl.groupby('Legendary')['Attack'].count()
Defense_prom_lg_f = dfnl.groupby('Legendary')['Defense'].sum()/dfnl.groupby('Legendary')['Defense'].count()
Spatk_prom_lg_f = dfnl.groupby('Legendary')['Sp. Atk'].sum()/dfnl.groupby('Legendary')['Sp. Atk'].count()
Spdef_prom_lg_f = dfnl.groupby('Legendary')['Sp. Def'].sum()/dfnl.groupby('Legendary')['Sp. Def'].count()
speed_prom_lg_f = dfnl.groupby('Legendary')['Speed'].sum()/dfnl.groupby('Legendary')['Speed'].count()
'''
print('Legendary')
print('HP: ',hp_prom_lg)
print('Attack: ',Attack_prom_lg)
print('Defense: ',Defense_prom_lg)
print('Sp. Atk: ',Spatk_prom_lg)
print('Sp. Def: ',Spdef_prom_lg)
print('Speed: ',speed_prom_lg)

print('No Legendary')
print('HP: ',hp_prom_lg_f)
print('Attack: ',Attack_prom_lg_f)
print('Defense: ',Defense_prom_lg_f)
print('Sp. Atk: ',Spatk_prom_lg_f)
print('Sp. Def: ',Spdef_prom_lg_f)
print('Speed: ',speed_prom_lg_f)
'''
'''
10. Crea un nuevo dataframe con el resultado del anterior ejercicio comparando ambos promedios

ejemplo:
                HP  Attack  Defense  Sp. Atk  Sp. Def  Speed
Legendary       99      90       89       91       94     90
No Legendary    80      95       75       12       43     87

'''
# creamos las filas
data = [['Legendary',hp_prom_lg, Attack_prom_lg, Defense_prom_lg,Spatk_prom_lg,Spdef_prom_lg,speed_prom_lg], 
        ['No Legendary',hp_prom_lg_f, Attack_prom_lg_f, Defense_prom_lg_f,Spatk_prom_lg_f,Spdef_prom_lg_f,speed_prom_lg_f],]
 
# Create the pandas DataFrame
dfr = pd.DataFrame(data, columns = ['Tipo','HP', 'Attack', 'Defense','Sp. Atk','Sp. Def','Speed'])

print(dfr)
'''
list_of_dates = ['2019-11-20', '2020-01-02', '2020-02-05','2020-03-10','2020-04-16','2020-05-01']
employees = ['Hisila', 'Shristi','Zeppy','Alina','Jerry','Kevin']
salary = [200,400,300,500,600,300]
df = pd.DataFrame({"Name":employees,'Joined date': pd.to_datetime(list_of_dates),"Salary":salary})
df['Status'] = ["Senior" if s >=400 else "Junior" for s in df['Salary']] 
print(df)
'''
'''
11. Añade una nueva colunma ['Doble tipo'] al dataframe inicial que inndique si el pokemo tiene dos tipos o no
'''

df['Doble tipo'] = ["SI" if s != None else "NO" for s in df['Type 2']]
print(df)
'''
12. Muestra las columas Name, Type 1, Type 2 de los pokémon que tienen dos tipos y ordenalos por Type 1 , Type 2 y Name
'''
from functools import reduce

'''
13. Dada una lista de Artículos con sus precio. Define las siguientes funciones:
Puedes definir más funciones si lo consideras necesario.
'''
articulos = {
    'Camisa': 20,
    'Pantalón': 30,
    'Calcetines': 5,
    'Zapatos': 50,
    'Gorra': 10,
    'Bufanda': 15,
    'Gafas': 25,
    'Reloj': 35,
    'Corbata': 40,
}

compra = ['Camisa', 'Pantalón', 'Pantalón', 'Gorra', 'Gafas', 'Corbata']


# A. Una función que calcule el precio total de la compra
def precio_total():
   
    suma = 0
    for art in compra: 
        for clav,valor in  articulos.items(): 
            if art == clav:
                suma += valor
    return suma

# B. Una función que calcule el precio total de la compra con un descuento del 10%
def precio_total_descuento():
   
    suma = 0
    descuento = 0
    for art in compra: 
        for clav,valor in  articulos.items(): 
            if art == clav:
                suma += valor
    descuento = suma*10/100            
    return suma-descuento

# C. Una función que calcule el precio total de la compra con un descuento del 10% si la compra supera los 100€
def precio_total_sup():
   
    suma = 0
    descuento = 0
    for art in compra: 
        for clav,valor in  articulos.items(): 
            if art == clav:
                suma += valor
    if suma > 100:
        descuento = suma*10/100            
    return suma-descuento

# D. Una función que calcule el precio total aplicando el IVA (21%)
def precio_total_iva():
   
    suma = 0
    descuento = 0
    for art in compra: 
        for clav,valor in  articulos.items(): 
            if art == clav:
                suma += valor
    IVA = suma*21/100            
    return suma+IVA


# E.lista los artículos cuyo precio es superior a 20€
def articulos_may20():
   
    product = []
    for clav,valor in  articulos.items(): #for usuario, dict2 in students.items():
        if valor > 20:
            print(clav)
            product.append(clav)           
    return product


'''
14. Dada una lista de tuplas con el nombre de un alumno, apellidos, curso y sus notas. 

 Define una funcion que reciba el curso y saque una lista en la que aparezca e nombre y apellidos y el promedio de sus notas.
 Puedes definir más funciones si lo consideras necesario.
'''

alumnos = [('Juan', 'Pérez', '1', [5, 6, 7, 8, 9]),
            ('Ana', 'García', '2', [5, 6, 7, 8, 9]),
            ('Luis', 'González', '1', [5, 6, 7, 8, 9]),
            ('María', 'Martínez', '2', [5, 6, 7, 8, 9]),
            ('Pedro', 'Rodríguez', '1', [5, 6, 7, 8, 9]),
            ('Lucía', 'Hernández', '2', [5, 6, 7, 8, 9]),
            ('Marta', 'López', '1', [5, 6, 7, 8, 9]),
            ('Sara', 'Díaz', '2', [5, 6, 7, 8, 9]),
            ('Javier', 'Sánchez', '1', [5, 6, 7, 8, 9]),
            ('Miguel', 'Fernández', '2', [5, 6, 7, 8, 9]),
            ('Sergio', 'Jiménez', '1', [5, 6, 7, 8, 9]),
            ('Sandra', 'Ruiz', '2', [5, 6, 7, 8, 9]),
            ('Pablo', 'Álvarez', '1', [5, 6, 7, 8, 9]),
            ('María', 'Gómez', '2', [5, 6, 7, 8, 9]),
]
