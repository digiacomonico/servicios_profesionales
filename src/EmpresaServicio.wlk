import Universidad.*
import ProfesionalVinculado.*
import ProfesionalLitoral.*
import ProfesionalLibre.*

class EmpresaServicio{
	
	var profesionales = #{}
	var universidades = #{}
	var property honorarioReferencia
	
	method honorarioReferencia(){
		return honorarioReferencia
	}
	
	method honorarioReferencia(honorario){
		honorarioReferencia = honorario
	}
	
	method agregarProfesional(profesional){
		profesionales.add(profesional)
	}
	
	method agregarProfesionales(losProfesionales){
		profesionales.addAll(losProfesionales)
	}
	
	method quitarProfesional(profesional){
		profesionales.remove(profesional)
	}
	
	method agregarUniversidad(universidad){
		universidades.add(universidad)
	}
	
	method agregarUniversidades(lasUniversidades){
		universidades.addAll(lasUniversidades)
	}
	
	method quitarUniversidad(universidad){
		universidades.remove(universidad)
	}
	
	method profesionalesCaros(){
		return profesionales.filter({profesional => profesional.honorarios() > self.honorarioReferencia() })
	}
	
	method profesionalMasBarato() {
		return profesionales.sortedBy({ profA , profB => profA.honorarios() < profB.honorarios() }).first()
	} 
	
	method universidadesFormadoras(){
		return profesionales.map({profesional => profesional.casaEstudios()}).asSet()
	}
	
	method provinciaCubierta(provincia){
		var provHab =  profesionales.map({profesional => profesional.provinciasHabilitadas()})
		return provHab.contains(provincia)
	}
	
	method cantidadProfEstudioEn(universidad){
		return profesionales.filter({profesional => profesional.casaEstudios() == universidad}).size()
	}
	
}