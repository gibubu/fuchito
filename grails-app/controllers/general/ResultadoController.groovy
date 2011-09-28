package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class ResultadoController {

    def springSecurityService

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    def index = {
//        redirect(action: "lista", params: params)
    }

    def lista = {
        def usuario = springSecurityService.currentUser
	params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [encuentros: Encuentro.findAllByTorneo(usuario.equipo.torneo, params), totalDeEncuentros: Encuentro.countByTorneo(usuario.equipo.torneo)]
    }

    def nuevo = {
        def encuentro = new Encuentro()
        encuentro.properties = params
        return [encuentro: encuentro]
    }

    def crea = {
        def usuario = springSecurityService.currentUser
        def encuentro = new Encuentro(params)
        encuentro.torneo = usuario.equipo.torneo
        if (encuentro.save(flush: true)) {
            flash.message = message(code: 'default.created.message', args: [message(code: 'encuentro.label', default: 'Encuentro'), encuentro.id])
            redirect(action: "ver", id: encuentro.id)
        }
        else {
            render(view: "nuevo", model: [encuentro: encuentro])
        }
    }
}
