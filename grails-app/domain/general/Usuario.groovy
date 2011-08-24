package general

class Usuario {

	String username
	String password
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
    String nombre
    String apellido
    Equipo equipo

    static belongsTo = [Equipo]

	static constraints = {
		username blank: false, unique: true
		password blank: false
                nombre   blank: false, maxSize: 64
                apellido blank: false, maxSize: 128
	}

	static mappinng = {
        table 'usuarios'
		password column: '`password`'
	}

	Set<Rol> getAuthorities() {
		UsuarioRol.findAllByUsuario(this).collect { it.rol } as Set
	}

    String toString() {
        return "$apellido, $nombre"
    }
}
