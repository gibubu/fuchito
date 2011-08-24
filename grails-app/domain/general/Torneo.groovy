package general

class Torneo {
    String nombre
    Set equipos
    Date inicio
    Date fin
    
    boolean domingo = true
    boolean lunes = true
    boolean martes = true
    boolean miercoles = true
    boolean jueves = true
    boolean viernes = true
    boolean sabado = true

    static hasMany = [equipos: Equipo]

    static constraints = {
        nombre(blank:false, unique:true, maxSize:32)
    }

    static mapping = {
        table 'torneos'
    }

    String toString() {
        //return "$nombre  : $inicio - $fin"
        return "$nombre"
    }
}
