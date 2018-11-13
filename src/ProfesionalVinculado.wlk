import Profesional.*
import Universidad.*

class ProfesionalVinculado inherits Profesional{
	const tipoProfesional = "Vinculado"
	
	method tipoProfesional(){
		return tipoProfesional
	}

	method provinciasHabilitadas(provincia){
		provinciasHabilitadas.add(provincia)
	}
	

	override method honorarios(valor){
		honorarios = valor
	}
	
	override method honorarios(){
		return honorarios
	}
	
	method donar(universidad){
			var donacion = (honorarios / 2)
			universidad.donacionesRecibidas(donacion)
			honorarios = 0
		}
}
