import Profesional.*

class Universidad {
	var property nombre
	var property honorariosRecomendados
	var property ubicacionProvincia
	var profesionales = []
	var provinciasHabilitadasProfesional = #{}
	var property honorarios
	
	method agregarProfesional(profesional){
		profesionales.add(profesional)
	}
	
	method quitarProfesional(profesional){
		profesionales.remove(profesional)
	}
	
	method provinciasHabilitadas(profesional){
		
		if (profesional.tipoProfesional() == "Vinculado"){
			provinciasHabilitadasProfesional.add(self.ubicacionProvincia())
			return provinciasHabilitadasProfesional
		}
		
		else if (profesional.tipoProfesional() == "Litoral"){
			provinciasHabilitadasProfesional.add("Entre Ríos")
			provinciasHabilitadasProfesional.add("Santa Fe")
			provinciasHabilitadasProfesional.add("Corrientes")
			return provinciasHabilitadasProfesional
		}
		
		else return provinciasHabilitadasProfesional
	}

	method honorarios(profesional){
		if (profesional.tipoProfesional() == "Vinculado"){
			honorarios = self.honorariosRecomendados()
			return honorarios
		}
		else if (profesional.tipoProfesional() == "Litoral"){
			honorarios = 3000
			return honorarios
		}
		else return profesional.honorarios()
	}

//El conjunto de las universidades formadoras, es decir las universidades donde estudiaron sus
//profesionales contratados, sin repetidos.

	method formadoras(){
		return profesionales.filter({profesional => profesional.casaEstudios() == self.nombre() }).asSet()
	}

}