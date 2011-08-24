package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class TorneoController {

    def springSecurityService

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    def index = {
        redirect(action: "lista", params: params)
    }

	def lista = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[torneos: Torneo.list(params), totalDeTorneos: Torneo.count()]
	}

    def nuevo = {
        def torneo = new Torneo()
        torneo.properties = params
        return [torneo: torneo]
    }

    def crea = {
        Torneo.withTransaction {
            def torneo = new Torneo(params)
            if (torneo.save(flush: true)) {
                def equipo = new Equipo (
                    nombre : 'Admin'
                    ,correo: 'test@spam.la'
                    ,correo2: 'test@spam.la'
                    , torneo : torneo
                ).save(flush:true)

                def usuario = springSecurityService.currentUser
                usuario.equipo = equipo
                usuario.save()
                session.torneo = torneo
                session.equipo = equipo

                flash.message = message(code: 'default.created.message', args: [message(code: 'torneo.label', default: 'Torneo'), torneo.nombre])
                redirect(controller:'equipo', action: "edita", id: equipo.id)
            }
            else {
                render(view: "nueva", model: [torneo: torneo])
            }
        }
    }

    def ver = {
        def torneo = Torneo.get(params.id)
        if (!torneo) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'torneo.label', default: 'Torneo'), params.id])
            redirect(action: "lista")
        }
        else {
            [torneo: torneo]
        }
    }

    def edita = {
        def torneo = Torneo.get(params.id)
        if (!torneo) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'torneo.label', default: 'Torneo'), params.id])
            redirect(action: "lista")
        }
        else {
            return [torneo: torneo]
        }
    }

    def actualiza = {
        def torneo = Torneo.get(params.id)
        if (torneo) {
            if (params.version) {
                def version = params.version.toLong()
                if (torneo.version > version) {
                    
                    torneo.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'torneo.label', default: 'Torneo')] as Object[], "Another user has updated this Torneo while you were editing")
                    render(view: "edita", model: [torneo: torneo])
                    return
                }
            }
            torneo.properties = params
            if (!torneo.hasErrors() && torneo.save(flush: true)) {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'torneo.label', default: 'Torneo'), torneo.nombre])
                redirect(action: "ver", id: torneo.id)
            }
            else {
                render(view: "edita", model: [torneo: torneo])
            }
        }
        else {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'torneo.label', default: 'Torneo'), params.id])
            redirect(action: "lista")
        }
    }

    def elimina = {
        Torneo.withTransaction {
            def torneo = Torneo.get(params.id)
            if (torneo) {
                def nombre
                try {
                    nombre = torneo.nombre
                    torneo.delete(flush: true)
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'torneo.label', default: 'Torneo'), nombre])
                    redirect(action: "lista")
                }
                catch (org.springframework.dao.DataIntegrityViolationException e) {
                    flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'torneo.label', default: 'Torneo'), nombre])
                    redirect(action: "ver", id: params.id)
                }
            }
            else {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'torneo.label', default: 'Torneo'), params.id])
                redirect(action: "lista")
            }
        }
    }
}
