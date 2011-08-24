package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class EstadisticaController {

    def springSecurityService

    def index = {
        log.debug "Mostrando estadisticas"
        redirect(action: "lista")
    }

        def lista = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def usuario = springSecurityService.currentUser
		[equipos: Equipo.findAllByTorneo(usuario.equipo.torneo, params), totalDeEquipos: Equipo.countByTorneo(usuario.equipo.torneo)]
//                [equipos: Equipo.list(params), totalDeEquipos: Equipo.count()]
	}
}
