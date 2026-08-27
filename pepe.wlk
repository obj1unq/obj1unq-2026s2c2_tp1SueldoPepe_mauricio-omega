//PRIMERA PARTE:
object pepe {
	var categoria = gerente
	var bonoDeResultado = bonoResultadoNulo
	var bonoDePresentismo = bonoPresentismoNulo
	var diasFaltados = 0
	
	method categoria () = categoria
	method categoria (_categoria){
		categoria = _categoria
	}
	
	method bonoDeResultado () = bonoDeResultado
	method bonoDeResultado(_bonoDeResultado){
		bonoDeResultado = _bonoDeResultado
	}
	
	method bonoDePresentismo(_bonoDePresentismo){
		bonoDePresentismo = _bonoDePresentismo
	}
	
	method diasFaltados() = diasFaltados
	method diasFaltados(_diasFaltados){
		diasFaltados = _diasFaltados
	}
	
	method sueldo() = 
		categoria.sueldoNeto() + 
		bonoDeResultado.calcularBono(self) + 
		bonoDePresentismo.calcularBono(self)
		
	method sueldoNetoRecibido() = categoria.sueldoNeto()
}	

object cadete{
	const sueldoNeto = 20000
	
	method sueldoNeto() = sueldoNeto
}

object gerente{
	const sueldoNeto = 15000
	
	method sueldoNeto() = sueldoNeto
}

object bonoResultadoNulo{
	method calcularBono(empleado) = 0
}
object bonoResultadoMontoFijo{
	method calcularBono(empleado) = 800
}
object bonoResultadoPorcentaje{
	method calcularBono(empleado) = empleado.sueldoNetoRecibido() * 0.1
}


object bonoPresentismoAjuste{
	method calcularBono(empleado) = if(empleado.diasFaltados() == 0){100}else{0}
}
object bonoPresentismoDemagogico{
	method calcularBono(empleado) = if(empleado.sueldoNetoRecibido() < 18000){500}else{300}
}
object bonoPresentismoNormal{
	method calcularBono(empleado){
		return if(empleado.diasFaltados() == 0){
					2000
				}else{
					if(empleado.diasFaltados() == 1){
						1000
					}else{
						0
					}
				}
	}
}
object bonoPresentismoNulo{
	method calcularBono(empleado) = 0
}

//SEGUNDA PARTE:

object moria{
	var categoria = gerente
	var bonoDeResultado = bonoResultadoNulo
	
	method categoria () = categoria
	method categoria (_categoria){
		categoria = _categoria
	}
	
	method bonoDeResultado () = bonoDeResultado
	method bonoDeResultado(_bonoDeResultado){
		bonoDeResultado = _bonoDeResultado
	}
	
	method sueldo() = self.sueldoNetoRecibido() + bonoDeResultado.calcularBono(self)	
	
	method sueldoNetoRecibido() = categoria.sueldoNeto() * self.cantidadDeAumento()

	method cantidadDeAumento() = 1.3
}

//nuevas categorias
object vendedor{
	const sueldoNeto = 16000
	var tuvoMuchasVentas = false
	
	method sueldoNeto(){
		return sueldoNeto * if(tuvoMuchasVentas){1.25}else{1}
	}
	method activarAumentoPorMuchasVentas(){
		tuvoMuchasVentas = true
	}
	method desactivarAumentoPorMuchasVentas(){
		tuvoMuchasVentas = false
	}
}

object medioTiempo{
	var categoriaBase = gerente

	method sueldoNeto() =  categoriaBase.sueldoNeto() / 2

	method categoriaBase(_categoriaBase){
		categoriaBase = _categoriaBase
	}
}

//nuevas personas
object roque{
	const sueldoNeto = 28000
	var bonoDeResultado = bonoResultadoNulo

	method bonoDeResultado () = bonoDeResultado
	method bonoDeResultado(_bonoDeResultado){
		bonoDeResultado = _bonoDeResultado
	}
	
	method sueldo() = sueldoNeto + bonoDeResultado.calcularBono(self) + self.cantidadDePesosFijos()
	
	method cantidadDePesosFijos() = 9000
	
	method sueldoNetoRecibido() = sueldoNeto
}

object ernesto{
	const diasFaltados = 0 
	var bonoDePresentismo = bonoPresentismoNulo
	var compañero = pepe
	
	method diasFaltados() = diasFaltados 

	method bonoDePresentismo(_bonoDePresentismo){
		bonoDePresentismo = _bonoDePresentismo
	}

	method compañero(_compañero){
		compañero = _compañero
	}
	
	method sueldo() = compañero.sueldoNetoRecibido() + bonoDePresentismo.calcularBono(self)

	method sueldoNetoRecibido() = compañero.sueldoNetoRecibido() 
}