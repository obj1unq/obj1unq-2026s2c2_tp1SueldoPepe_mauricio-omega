# Sueldo de Pepe

<img src="img/money.jpg" height="150" width="250">


## Consigna

Implementar en Wollok los objetos necesarios para calcular el sueldo de pepe, a partir de la siguiente fórmula: 

</br>
**sueldo = SN + BR + BP**

donde SN es el sueldo neto, BR es un bono por resultados y BP es un bono por presentismo. En las siguientes secciones se detalla el cálculo de estos componentes.


### Sueldo Neto

El _neto_ depende de la categoría de la persona, y se tienen al menos: las personas gerente que ganan $15000 de sueldo neto, y las personas cadete cuyo sueldo neto es de $20000 (tener en cuenta que puede haber más categorías).


### Bono por resultados

Pepe tiene un bono por resultados que va cambiando a lo largo del tiempo. Ser tienen tres formas de calcular el **bono por resultados**:  
* _Porcentaje_: 10% sobre el neto.  
* _Monto fijo_: $800 fijos.
* _Nulo_: nada.


### Bono por presentismo

Al igual que el bono por resultados, Pepe posee un bono por presentismo que puede variar mes a mes. Existen varias formas de calcularlo:</br>

* _Normal_: $2000 pesos si la persona a quien se aplica no faltó nunca, $1000 si faltó sólo un día, $0 en cualquier otro caso. 
* _Ajuste_: $100 pesos si el empleado no faltón nunca, $0 en cualquier otro caso. 
* _Demagógico_: $500 pesos si el neto es menor a 18000, $300 en caso contrario. Para este bono no importa cuántas veces faltó el emplado.
* _Nulo_: no se aplica bono. 


<br>

## Casos de prueba 


1. Si pepe es cadete, tiene el bono resultado de monto fijo, y bono presentismo normal. Simular que faltó 3 días.
Debería tener $20800 de sueldo.

1. Si pepe es gerente, tiene el bono resultado por porcentaje, y bono de presentismo nulo. El sueldo debe dar $16500.

1. Si pepe es cadete,  tiene bono de resultados por porcentaje, bono por presentismo normal, nunca faltó. Debería tener $24000 de sueldo.

1. Si pepe es cadete, tiene bono de resultados por porcentaje, bono por presentismo normal, falto 1 día. Debería tener $23000 de sueldo.


# Segunda parte

Suponer que se necesita incorporar a la solución mas personas y categorías. 

## El sueldo de Moria

Definir a **Moria**, otra persona a quien se le debe calcular el sueldo. Moria solamente tiene bono por resultados, o sea que su sueldo se calcula como `sueldo = SN + BR`

A su vez, su neto es un 30% superior a lo que indica su categoría. P.ej. si Moria es una cadete, su sueldo neto es $26000.


**Aclaraciones**

* Si Pepe, o cualquier otra persona que se agregue, es cadete, su neto es 20000. El incremento del 30% se aplica _solamente_ a Moria. 
* Para obtener un valor con un aumento del 30%, se lo multiplica por 1.3.

## Más categorías

Se necesita agregar las siguientes categorías

* **vendedor**: su sueldo neto es de $ 16000. Si hay muchas ventas, se aplica un aumento de 25%. El objeto que representa a esta categoría tiene que entender los mensajes `activarAumentoPorMuchasVentas()` y `desactivarAumentoPorMuchasVentas()`.
  
* **medio tiempo**: Este es un modificador sobre otra categoría, que se asigna enviando el mensaje `medioTiempo.categoriaBase(categoria)`. Indica que la persona trabaja medio tiempo, por lo tanto su neto es la mitad (dividir por dos) de lo que indica la categoría base. <br>
P.ej. si definimos `medioTiempo.categoriaBase(gerente)`, entonces el neto de `medioTiempo` es 7500 (la mitad de 15000).
  
    
## Mas personas

Agregar dos personas más, según lo que se detalla a continuación.

* **Roque**, que en lugar de asignársele una categoría, se establece un neto de 28000 pesos. <br> 
	El sueldo se calcula como ```neto + bono por resultados + 9000 pesos```. <br> 
	Para el bono por resultados, se usan las mismas opciones que para Pepe.

* **Ernesto**, que trabaja junto con un compañero, que puede cambiar. El neto de Ernesto es igual al de su compañero. <br> 
	Su sueldo se calcula como ```neto + bono por presentismo```. <br> 
	Para el bono por presentismo, usar las mismas opciones que para Pepe. Se sabe que Ernesto no falta nunca.
	
	
### Casos de prueba:
	- La categoría base de _medio tiempo_ es _cadete_.
	- Pepe tiene categoría medio tiempo (o sea, es cadete y trabaja medio tiempo), tiene bono por resultados de porcentaje, y bono por presentismo demagógico. Hacer que falte una vez.
	- Roque tiene bono por resultados monto fijo. 
	- Ernesto tiene como compañero a Pepe, y bono por presentismo de ajuste.
	
	Verificar que el sueldo de Pepe es 11500, el de Roque es 37800, y el de Ernesto es 10100.
	
	Dibujar el diagrama de referencias que queda al final de este test. Recordar que deben incluirse los objetos definidos por nosotros, _y también_ los números y booleanos.
	
	
## Ejercicios de reflexión y documentación

- Describir los polimorfismos en tu solución, detallando:
  - el **tipo** de los objetos polimórficos
  - los mensajes que componen ese tipo
  - los **emisores** de los mensajes polimórficos
    
- Dibujar un diagrama estático donde se vea la relación entre los objetos y los tipos polimórficos
- Encontrar (en toda la solución) un mensaje que sea una orden y otro que sea una consulta
