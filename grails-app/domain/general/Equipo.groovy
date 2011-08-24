package general

class Equipo {
    String nombre
    String correo
    String correo2
    Torneo torneo
    
    int jj
    int jg
    int je
    int jp //= jj - (je+jg)
    int gf
    int gc
    int dif //= gf -gc
    int pts //= (3*jg) + je

    boolean domingo = true
    boolean lunes = true
    boolean martes = true
    boolean miercoles = true
    boolean jueves = true
    boolean viernes = true
    boolean sabado = true

    static belongsTo = [Torneo]

    static constraints = {
        nombre blank:false, unique:'torneo', maxSize:32
        correo email:true, maxSize: 128, blank:false
        correo nullable:true, email:true, maxSize: 128
    }

    String toString() {
        return nombre
    }

    String getNombreCanonico() {
        return "${torneo.nombre} | ${nombre}"
    }
}
