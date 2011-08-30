package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class SucesoController {

    def springSecurityService

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    def index = {
        redirect(action: "lista", params: params)
    }

	def lista = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
                def usuario = springSecurityService.currentUser
		[sucesos: Suceso.findAllByTorneo(usuario.equipo.torneo, params), totalDeSucesos: Suceso.countByTorneo(usuario.equipo.torneo)]
	}

    def nuevo = {
        def suceso = new Suceso()
        suceso.properties = params
        return [suceso: suceso]
    }

    def crea = {
        def usuario = springSecurityService.currentUser
        def suceso = new Suceso(params)
        suceso.torneo = usuario.equipo.torneo
        if (suceso.save(flush: true)) {
            flash.message = message(code: 'default.created.message', args: [message(code: 'suceso.label', default: 'Suceso'), suceso.id])
            redirect(action: "ver", id: suceso.id)
        }
        else {
            render(view: "nuevo", model: [suceso: suceso])
        }
    }

    def ver = {
        def suceso = Suceso.get(params.id)
        if (!suceso) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'suceso.label', default: 'Suceso'), params.id])
            redirect(action: "lista")
        }
        else {
            [suceso: suceso]
        }
    }

    def edita = {
        def suceso = Suceso.get(params.id)
        if (!suceso) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'suceso.label', default: 'Suceso'), params.id])
            redirect(action: "lista")
        }
        else {
            return [suceso: suceso]
        }
    }

    def actualiza = {
        def suceso = Suceso.get(params.id)
        if (suceso) {
            if (params.version) {
                def version = params.version.toLong()
                if (suceso.version > version) {
                    
                    suceso.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'suceso.label', default: 'Suceso')] as Object[], "Another user has updated this Suceso while you were editing")
                    render(view: "edita", model: [suceso: suceso])
                    return
                }
            }
            suceso.properties = params
            if (!suceso.hasErrors() && suceso.save(flush: true)) {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'suceso.label', default: 'Suceso'), suceso.id])
                redirect(action: "ver", id: suceso.id)
            }
            else {
                render(view: "edita", model: [suceso: suceso])
            }
        }
        else {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'suceso.label', default: 'Suceso'), params.id])
            redirect(action: "list")
        }
    }

    def elimina = {
        def suceso = Suceso.get(params.id)
        if (suceso) {
            try {
                suceso.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'suceso.label', default: 'Suceso'), params.id])
                redirect(action: "lista")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'suceso.label', default: 'Suceso'), params.id])
                redirect(action: "ver", id: params.id)
            }
        }
        else {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'suceso.label', default: 'Suceso'), params.id])
            redirect(action: "lista")
        }
    }

    def suceso = {
//        def usuario = springSecurityService.currentUser
        def equipo = new Equipo()
//        equipo = usuario.equipo
        equipo.properties = params
        return [equipo: equipo]
    }

    def creados = {
        Equipo.withTransaction {
            def equipo = new Equipo(params)
            def usuario = springSecurityService.currentUser
            equipo.torneo = usuario.equipo.torneo
            if (equipo.save(flush: true)) {
                // Actualizando equipo del usuario
                usuario.equipo = equipo
                usuario.save()

                session.equipo = equipo

                flash.message = message(code: 'default.created.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipo.nombre])
//                redirect(action: "ver", id: equipo.id)
                redirect(action: "nuevo")
            }
            else {
                render(view: "lista", model: [equipo: equipo])
            }
        }
    }
}
