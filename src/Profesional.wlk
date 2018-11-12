import Universidad.*
import EmpresaServicio.*
import asociacionProfesionales.*

class Profesional {
	var property casaEstudios
	var property tipoProfesional
	var provinciasHabilitadas = #{}
	var property honorarios
	var totalRecaudado = 0
	
	method totalRecaudado(valor){
		totalRecaudado += valor
	}
	
	method totalRecaudado(){
		return totalRecaudado
	}
		
	method provHab(provincias){
		
	if (self.tipoProfesional() == "Libre" ){
		provinciasHabilitadas.addAll(provincias)
		return provinciasHabilitadas
	}
	else if (self.tipoProfesional() == "Litoral"){
		provinciasHabilitadas.addAll(#{"Corrientes", "Entre Rios", "Santa Fe"})
		return provinciasHabilitadas
	}
	
	else return provinciasHabilitadas
	
	}
	
	method provinciasHabilitadas(){
		return provinciasHabilitadas
	}
	
	method honorarios(universidad,profesional){
	
	if(self.tipoProfesional() == "Libre" ){
		honorarios = self.honorarios()
		return honorarios
	}
	else if (self.tipoProfesional() == "Vinculado"){
		honorarios = universidad.honorarios(profesional)
		return honorarios
		
	}
	else if (self.tipoProfesional() == "Litoral"){
		honorarios =  universidad.honorarios(profesional)
		return honorarios
	}
	else return honorarios
	}

	method donarUniversidad(universidad){
		if(self.tipoProfesional() == "Vinculado"){
			var donacion = (honorarios / 2)
			universidad.donacionesRecibidas(donacion)
			honorarios = 0
			return honorarios
		}
		else return honorarios
	}
	
	method donarAsociacion(asociacion){
		if(self.tipoProfesional() == "Litoral"){
			var donacion = honorarios
			asociacion.donacionesRecibidas(donacion)
			honorarios = 0
			return honorarios
		}
		else return honorarios
	}
	
	method donarLibre(prof,donacion){
		if(self.tipoProfesional() == "Libre"){
			totalRecaudado = self.honorarios()
			prof.totalRecaudado(donacion)
			totalRecaudado -= donacion
			return totalRecaudado
		}
		else return honorarios
	}
	

}




