import ProfesionalVinculado.*
import asociacionProfesionales.*

class Universidad {
	var property nombre
	var honorariosRecomendados
	var property ubicacionProvincia
	var provinciasHabilitadas = #{}
	var profesionales = []
	
	var donacionesRecibidas = 0
	
	method donacionesRecibidas(){
		return donacionesRecibidas
	}
	
	method donacionesRecibidas(valor){
		donacionesRecibidas += valor 
	}
	
	method agregarProfesional(profesional){
		profesionales.add(profesional)
	}
	
	method quitarProfesional(profesional){
		profesionales.remove(profesional)
	}
	
	
	method provinciasHabilitadas(){
		var profVinculados = profesionales.filter({profesional => profesional.tipoProfesional () == "Vinculado"})
		profVinculados.forEach({profVinculados => profVinculados.provinciasHabilitadas(self.ubicacionProvincia())})
		return provinciasHabilitadas
		}

	method honorariosRecomendados(valor){
		honorariosRecomendados = valor
		var profVinculados = profesionales.filter({profesional => profesional.tipoProfesional () == "Vinculado"})
		profVinculados.forEach({profVinculados => profVinculados.honorarios(self.honorariosRecomendados())})
	}
	
	method honorariosRecomendados(){
		return honorariosRecomendados
	}
}

	