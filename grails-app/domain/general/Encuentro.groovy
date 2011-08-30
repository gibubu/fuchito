package general

class Encuentro {

    Torneo torneo
    Equipo uno
    Equipo dos
    Date fecha
    int jornada = 0
    String id_encuentro
    int jugado = 0

    static constraints = {
        id_encuentro unique:'torneo'
    }

    String toString() {
        return "$uno vs $dos"
    }
}

