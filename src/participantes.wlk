import paises.*
import conocimientos.*

class Participante{
    const property pais
    const property conocimientos = #{}
    var commitsRealizados

    method commitsRealizados() = commitsRealizados

    method esCapo()

    method cumpleRequisitos(commitsRequeridos) = conocimientos.contains(programacionBasica) and self.requisitosEspecificos(commitsRequeridos)

    method requisitosEspecificos(commitsRequeridos)
}

class Programador inherits Participante{

    override method esCapo() = commitsRealizados > 500

    override method requisitosEspecificos(commitsRequeridos) =  commitsRealizados > commitsRequeridos
}

class Especialista inherits Participante{
    override method esCapo() = conocimientos.size() > 2

    override method requisitosEspecificos(commitsRequeridos) = commitsRealizados > (commitsRequeridos - 100) and conocimientos.contains(objetos)
}
