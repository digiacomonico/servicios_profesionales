import Profesional.*

class ProfesionalLibre inherits Profesional {
	
	var property totalRecaudado = 0
	const tipoProfesional = "Libre"
	
	method tipoProfesional(){
		return tipoProfesional
	}
	
	method provinciasHabilitadas(provincias){
		provinciasHabilitadas.addAll(provincias)
		return provinciasHabilitadas
	}
	
	override method honorarios(valor){
		honorarios = valor
		self.totalRecaudado(valor)
	}
	
	override method honorarios(){
		return honorarios
	}
	
	method totalRecaudado(valor){
		totalRecaudado += valor
	}
	
	
	method donar(prof,donacion){
		prof.totalRecaudado(donacion)
		totalRecaudado -= donacion
		return totalRecaudado
		}
	
	
}
