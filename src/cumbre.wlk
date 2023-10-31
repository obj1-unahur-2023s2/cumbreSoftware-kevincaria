import paises.*
import participantes.*
import conocimientos.*

object cumbre{
    const property paisesAuspiciantes = #{}
    const property participantes = #{}
    
    var property commitsRequeridos = 300

    method agregarParticipante(unParticipante){
        if(not self.puedeIngresar(unParticipante)){
            self.error("No cumple con los requisitos para participar de la cumbre")
        }
        participantes.add(unParticipante)
    }

    method puedeIngresar(unParticipante) = self.cumpleConLosRequisitosDeLaCumbre(unParticipante) and not self.tieneAccesoRestringido(unParticipante)

    method cumpleConLosRequisitosDeLaCumbre(unParticipante) = unParticipante.cumpleRequisitos(commitsRequeridos)

    method tieneAccesoRestringido(unParticipante) = self.perteneceAUnPaisConflictivo(unParticipante) or not paisesAuspiciantes.contains(unParticipante.pais()) or self.hayMasDe2ParticipantesDelMismoPais(unParticipante)

    method perteneceAUnPaisConflictivo(unParticipante) = self.esConflictivoParaLaCumbre(unParticipante.pais())

    method hayMasDe2ParticipantesDelMismoPais(unParticipante) = self.cantidadParticipantesDePais(unParticipante.pais()) > 2

    method agregarPaisAuspiciante(unPais){
        paisesAuspiciantes.add(unPais)
    }

    method esConflictivoParaLaCumbre(unPais) = paisesAuspiciantes.any({pais => pais.esConflictivoCon(unPais)})

    method cantidadParticipantes() = participantes.size()

    method paisesDeParticipantes() = participantes.map({participante => participante.pais()})

    method cantidadParticipantesDePais(unPais) = self.paisesDeParticipantes().count({pais => pais == unPais})

    method paisesDeParticipantesConjunto() = self.paisesDeParticipantes().asSet()

    method paisConMasParticipantes() = self.paisesDeParticipantesConjunto().max({pais => self.cantidadParticipantesDePais(pais)})

    method paisesExtranjeros() = self.paisesDeParticipantesConjunto().filter({pais => not paisesAuspiciantes.contains(pais)})

    method esRelevante() = participantes.all({participante => participante.esCapo()})

    method esSegura() = participantes.all({participante => self.puedeIngresar(participante)})
}

