package general

class Jugador {

    String nombre
    String apellido
    Equipo equipo
//    Set imagenes
//    byte[] archivo

    static belongsTo = [Equipo]

//    static hasMany = [imagenes: Imagen]

    static constraints = {
        nombre   blank: false, maxSize: 64
        apellido blank: false, maxSize: 128
//        archivo maxSize:20000000
    }

    String toString() {
        return "$apellido, $nombre"
    }
}
