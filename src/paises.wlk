class Pais{
    const property paisesConConflictos = #{}

    method registrarConflicto(unPais){
        paisesConConflictos.add(unPais)
    }

    method esConflictivoCon(unPais) = paisesConConflictos.contains(unPais)
}