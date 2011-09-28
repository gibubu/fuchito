package general

class Jugador {

    String nombre
    String apellido
    int goles = 0
    Equipo equipo
    String torneo
    Set imagenes


    static belongsTo = [Equipo]

    static hasMany = [imagenes: Imagen]

    static constraints = {
        nombre   blank: false, maxSize: 64
        apellido blank: false, maxSize: 128

    }

    static mapping = {
        table 'jugadores'
        imagenes cascade:'all-delete-orphan'
    }

    String toString() {
        return "$apellido, $nombre"
    }
}
