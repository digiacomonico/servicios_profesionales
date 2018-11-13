import Profesional.*
import Universidad.*
import asociacionProfesionales.*

class ProfesionalLitoral inherits Profesional {
	
	const tipoProfesional = "Litoral"
	const honorariosHora = 3000
	
	method tipoProfesional(){
		return tipoProfesional
	}
	
	override method provinciasHabilitadas(){
		provinciasHabilitadas.addAll(#{"Corrientes", "Entre Rios", "Santa Fe"})
		return provinciasHabilitadas
	}
	
	override method honorarios(horas){
		honorarios = honorariosHora * horas
	}
	
	override method honorarios(){
		return honorarios
	}
	
	method donar(asociacion){
		var donacion = honorarios
		asociacion.donacionesRecibidas(donacion)
		honorarios = 0
	}	
}
