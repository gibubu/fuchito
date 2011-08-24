class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        log.info("Inicializando aplicacion")

        def torneo
        if (general.Torneo.count() == 0) {
            torneo = new general.Torneo (
                nombre : 'OrangePark'
                ,inicio : '1973/07/09'
                ,fin : '2012/12/12'
            ).save()
        }

        def equipo
        if (general.Equipo.count() == 0) {
            if (!torneo) {
                def p = [:]
                p.max = 1
                def torneos = general.Torneo.list(p)
                torneo = torneos[0]
            }
            equipo = new general.Equipo (
                nombre : 'Admin'
                ,correo: 'test@spam.la'
                ,correo2: 'test@spam.la'
                , torneo : torneo
            ).save()
        }

        log.info "Validando roles"
        def rolAdmin = general.Rol.findByAuthority('ROLE_ADMIN')
        if (general.Rol.count() != 4) {
            if (!rolAdmin) {
                rolAdmin = new general.Rol(authority: 'ROLE_ADMIN').save(flush:true)
            }
            def rolOrg = general.Rol.findByAuthority('ROLE_ORG')
            if (!rolOrg) {
                rolOrg = new general.Rol(authority: 'ROLE_ORG').save(flush:true)
            }
            def rolEmp = general.Rol.findByAuthority('ROLE_EMP')
            if (!rolEmp) {
                rolEmp = new general.Rol(authority: 'ROLE_EMP').save(flush:true)
            }
            def rolUser = general.Rol.findByAuthority('ROLE_USER')
            if (!rolUser) {
                rolUser = new general.Rol(authority: 'ROLE_USER').save(flush:true)
            }
        }

        log.info "Validando usuarios"
        def admin = general.UsuarioRol.findByRol(rolAdmin)
        if (!admin) {
            if (!equipo) {
                def p = [:]
                p.max = 1
                def equipos = general.Equipo.list(p)
                equipo = equipos[0]
            }
            def password = springSecurityService.encodePassword('admin')
            admin = new general.Usuario(
                username:'admin'
                ,password:password
                ,nombre:'Jairo'
                ,apellido:'Lopez'
                ,equipo:equipo
            )
            admin.save(flush:true)
            general.UsuarioRol.create(admin, rolAdmin, true)
        }

        log.info("Aplicacion inicializada")
    }

    def destroy = {
    }
}
