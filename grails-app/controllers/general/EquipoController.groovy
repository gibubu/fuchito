package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ORG'])
class EquipoController {

    def springSecurityService

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    def index = {
        redirect(action: "lista", params: params)
    }

	def lista = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def usuario = springSecurityService.currentUser
		[equipos: Equipo.findAllByTorneo(usuario.equipo.torneo, params), totalDeEquipos: Equipo.countByTorneo(usuario.equipo.torneo)]
//                [equipos: Equipo.list(params), totalDeEquipos: Equipo.count()]
	}

    def nuevo = {
        def equipo = new Equipo()
        equipo.properties = params
        return [equipo: equipo]
    }

    def crea = {
        Equipo.withTransaction {
            def equipo = new Equipo(params)
            def usuario = springSecurityService.currentUser
            equipo.torneo = usuario.equipo.torneo
            if (equipo.save(flush: true)) {
                // Actualizando equipo del usuario
//                usuario.equipo = equipo
                usuario.save()

                session.equipo = equipo

                flash.message = message(code: 'default.created.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipo.nombre])
//                redirect(action: "ver", id: equipo.id)
                redirect(action: "nuevo")
            }
            else {
                render(view: "nuevo", model: [equipo: equipo])
            }
        }
    }

    def ver = {
        def equipo = Equipo.get(params.id)
        if (!equipo) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), params.id])
            redirect(action: "lista")
        }
        else {
            [equipo: equipo]
        }
    }

    def edita = {
        def equipo = Equipo.get(params.id)
        if (!equipo) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), params.id])
            redirect(action: "lista")
        }
        else {
            return [equipo: equipo]
        }
    }

    def actualiza = {
        Equipo.withTransaction {
            def equipo = Equipo.get(params.id)
            if (equipo) {
                if (params.version) {
                    def version = params.version.toLong()
                    if (equipo.version > version) {

                        equipo.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'equipo.label', default: 'Equipo')] as Object[], "Another user has updated this Equipo while you were editing")
                        render(view: "edita", model: [equipo: equipo])
                        return
                    }
                }
                equipo.properties = params
                def usuario = springSecurityService.currentUser
                equipo.torneo = usuario.equipo.torneo
                if (!equipo.hasErrors() && equipo.save(flush: true)) {
                    // Actualizando equipo del usuario
                    usuario.equipo = equipo
                    usuario.save()

                    session.equipo = equipo

                    flash.message = message(code: 'default.updated.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipo.nombre])
                    redirect(action: "ver", id: equipo.id)
                }
                else {
                    render(view: "edita", model: [equipo: equipo])
                }
            }
            else {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), params.id])
                redirect(action: "lista")
            }
        }
    }

    def elimina = {
        Equipo.withTransaction {
            def equipo = Equipo.get(params.id)
            if (equipo) {
                def usuario = springSecurityService.currentUser
                if (usuario.equipo.torneo == equipo.torneo) {
                    def nombre
                    try {
                        // Cambiar de equipo al usuario
                        if (usuario.equipo == equipo) {
                            def equipos = Equipo.findAllByTorneo(equipo.torneo)
                            for (x in equipos) {
                                if (x != equipo) {
                                    usuario.equipo = x
                                    break
                                }
                            }

                            if (usuario.equipo == equipo) {
                                flash.message = message(code:'equipo.noEliminada.message', args: [equipo.nombre])
                                redirect(action:'ver',id:equipo.id)
                            }
                        }

                        nombre = equipo.nombre
                        equipo.delete(flush: true)
                        flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipo.label', default: 'Equipo'), nombre])
                        redirect(action: "lista")
                    }
                    catch (org.springframework.dao.DataIntegrityViolationException e) {
                        flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipo.label', default: 'Equipo'), nombre])
                        redirect(action: "ver", id: params.id)
                    }
                }
            }
            else {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), params.id])
                redirect(action: "lista")
            }
        }
    }
}
