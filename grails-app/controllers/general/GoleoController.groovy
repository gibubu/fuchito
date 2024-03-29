package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class GoleoController {

    def springSecurityService

    def index = {
        log.debug "Mostrando goleo individual"
        redirect(action: "lista")
    }

        def lista = {
		params.max = Math.min(params.max ? params.int('max') : 100, 100)
        def usuario = springSecurityService.currentUser
        [jugadores: Jugador.listOrderByGoles(Jugador.findAllByTorneo(usuario.equipo.torneo.toString()), order: "desc"), totalDeJugadores: Equipo.countByTorneo(usuario.equipo.torneo)]
//                [equipos: Equipo.list(params), totalDeEquipos: Equipo.count()]
	}
}
