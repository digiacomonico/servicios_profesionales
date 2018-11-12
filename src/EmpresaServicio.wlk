import Universidad.*
import Profesional.*

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
	
	method agregarUniversidad(universidad){
		universidades.add(universidad)
	}
	
	method quitarProfesional(profesional){
		profesionales.remove(profesional)
	}
	
	method agregarProfesionales(losProfesionales){
		profesionales.addAll(losProfesionales)
	}
	
	method profesionalesCaros(){
		return profesionales.filter({profesional => profesional.honorarios() > self.honorarioReferencia() })
		//var honorariosUniversidades = universidades.filter({uni => uni.honorarios(profesional) > self.honorarioReferencia()})
		//.union(honorariosUniversidades)
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
	
	method provinciaCubiertaA(provincia){
		if (profesionales.map({profesional => profesional.provinciasHabilitadas()}).size() == 0){
			var provHab =  universidades.map({universidad => universidad.provinciasHabilitadas()})
			return provHab.contains(provincia)
		}
		else{
			return profesionales.map({profesional => profesional.provinciasHabilitadas()}).contains(provincia)
		}
	}
	
	method cantidadProfEstudioEn(universidad){
		return profesionales.filter({profesional => profesional.casaEstudios() == universidad}).size()
	}
	
	
	}