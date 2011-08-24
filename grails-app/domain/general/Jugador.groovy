package general

class Jugador {

    String nombre
    String apellido
    Equipo equipo

    static belongsTo = [Equipo]

    static constraints = {
        nombre   blank: false, maxSize: 64
        apellido blank: false, maxSize: 128
    }

    String toString() {
        return "$apellido, $nombre"
    }
}
