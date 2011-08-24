package general

class Suceso {

    String nombre
    Date fecha
    Jugador jugador
    Encuentro encuentro
    Torneo torneo
    
    static constraints = {
        nombre inList:['GOL','AMARILLA','ROJA']
    }

    static mapping = {
        table 'sucesos'
    }

    String toString() {
        return nombre
    }

}

