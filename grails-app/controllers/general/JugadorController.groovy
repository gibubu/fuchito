package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class JugadorController {

    def springSecurityService

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    def index = {
        redirect(action: "lista", params: params)
    }

	def lista = {
		params.max = Math.min(params.max ? params.int('max') : 10, 15)
                def usuario = springSecurityService.currentUser
		[jugadores: Jugador.findAllByEquipo(usuario.equipo, params), totalDeJugadores: Jugador.countByEquipo(usuario.equipo)]
	}

    def nuevo = {
        def jugador = new Jugador()
        jugador.properties = params
        return [jugador: jugador]
    }

    def scaffold = Jugador

//    def crea = {
//        def jugador
//        def usuario = springSecurityService.currentUser
//        try {
//            Jugador.withTransaction {
//                jugador = new Jugador(params)
//
//                def archivo = request.getFile('archivo')
//                if (!archivo.empty) {
////                    imagen.nombre = archivo.originalFilename
////                    imagen.tipoContenido = archivo.contentType
//                    jugador.nombre = params.nombre
//                    jugador.apellido = params.apellido
//                    jugador.equipo = usuario.equipo
//                    jugador.torneo = usuario.equipo.torneo.toString()
//                    jugador.archivo = archivo.bytes
//                }
//
//                jugador.save()
//                flash.message = message(code: 'default.created.message', args: [message(code: 'jugador.label', default: 'Jugador'), jugador.nombre])
//                redirect(action: "nuevo")
//            }
//        } catch(Exception e) {
//            log.error "No se pudo crear el jugador", e
//            flash.message = "No se pudo crear el jugador"
//            render(view:'lista')
//        }
//    }

    def crea = {
        def usuario = springSecurityService.currentUser
        def archivo = request.getFile('jugador')
        def jugador = new Jugador(params)
        jugador.equipo = usuario.equipo
        jugador.torneo = usuario.equipo.torneo.toString()
        jugador.archivo = archivo.bytes
        if (jugador.save(flush: true)) {
            flash.message = message(code: 'default.created.message', args: [message(code: 'jugador.label', default: 'Jugador'), jugador.nombre])
//            redirect(action: "ver", id: jugador.id)
            redirect(action: "nuevo")
        }
        else {
            render(view: "nuevo", model: [jugador: jugador])
        }
    }

    def ver = {
        def jugador = Jugador.get(params.id)
        if (!jugador) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jugador.label', default: 'Jugador'), params.id])
            redirect(action: "lista")
        }
        else {
            [jugador: jugador]
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edita = {
        def jugador = Jugador.get(params.id)
        if (!jugador) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jugador.label', default: 'Jugador'), params.nombre])
            redirect(action: "lista")
        }
        else {
            return [jugador: jugador]
        }
    }

    @Secured(['ROLE_ADMIN'])
    def actualiza = {
        def jugador = Jugador.get(params.id)
        if (jugador) {
            if (params.version) {
                def version = params.version.toLong()
                if (jugador.version > version) {
                    
                    jugador.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'jugador.label', default: 'Jugador')] as Object[], "Another user has updated this Jugador while you were editing")
                    render(view: "edita", model: [jugador: jugador])
                    return
                }
            }
            jugador.properties = params
            if (!jugador.hasErrors() && jugador.save(flush: true)) {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'jugador.label', default: 'Jugador'), jugador.id])
                redirect(action: "ver", id: jugador.id)
            }
            else {
                render(view: "edita", model: [jugador: jugador])
            }
        }
        else {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jugador.label', default: 'Jugador'), params.id])
            redirect(action: "lista")
        }
    }

    @Secured(['ROLE_ADMIN'])
    def elimina = {
        def jugador = Jugador.get(params.id)
        if (jugador) {
            try {
                jugador.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'jugador.label', default: 'Jugador'), params.id])
                redirect(action: "lista")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'jugador.label', default: 'Jugador'), params.id])
                redirect(action: "ver", id: params.id)
            }
        }
        else {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jugador.label', default: 'Jugador'), params.id])
            redirect(action: "lista")
        }
    }

     def dias = {//def edita = { (equipo)
        def usuario = springSecurityService.currentUser
//        def jugador = new Jugador(params)
//        jugador.equipo = usuario.equipo
        def equipo = Equipo.get(params.id)
        equipo = usuario.equipo
        if (!equipo) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), params.id])
            redirect(action: "lista")
        }
        else {
            return [equipo: equipo]
        }
    }

    def refresh = {//def actualiza = { (equipo)
        Equipo.withTransaction {
            def equipo = Equipo.get(params.id)
            if (equipo) {
                if (params.version) {
                    def version = params.version.toLong()
                    if (equipo.version > version) {

                        equipo.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'equipo.label', default: 'Equipo')] as Object[], "Another user has updated this Equipo while you were editing")
                        render(view: "dias", model: [equipo: equipo])
                        return
                    }
                }
                equipo.properties = params
                def usuario = springSecurityService.currentUser
                equipo.torneo = usuario.equipo.torneo
                equipo.save()
                if (!equipo.hasErrors() && equipo.save(flush: true)) {
                    // Actualizando equipo del usuario
                    usuario.equipo = equipo
                    usuario.save()

                    session.equipo = equipo

                    flash.message = message(code: 'default.updated.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipo.nombre])
                    redirect(action: "lista", id: equipo.id)
                }
                else {
                    render(view: "dias", model: [equipo: equipo])
                }
            }
            else {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), params.id])
                redirect(action: "lista")
            }
        }
    }

    def mostrar = {
        def jugador = Jugador.get(params.id)
        if (jugador) {
            response.outputStream << jugador.archivo
            return;
        } else {
            throw new RuntimeException('No se encontro al jugador')
        }
    }

//    def imagen = {
//        try {
//            def producto = Producto.get(params.id)
//            def foto
//            for(x in producto?.imagenes) {
//                foto = x
//                break;
//            }
//            if (!foto) {
//                def directorio = servletContext.getRealPath("/images")
//                def file = new File("${directorio}/activo_fijo.jpg")
//                foto = new Imagen(
//                    nombre : 'activoFijo.jpg'
//                    , tipoContenido : 'image/jpeg'
//                    , tamano : file.size()
//                    , archivo : file.getBytes()
//                )
//            }
//            log.debug "Mostrando imagen ${foto.nombre}"
//            log.debug "TipoContenido: ${foto.tipoContenido}"
//            response.contentType = foto.tipoContenido
//            //response.setHeader("Content-disposition", "attachment; filename=${foto?.nombre}")
//            log.debug "Tamano: ${foto.tamano}"
//            response.contentLength = foto.tamano
//            response.outputStream << foto.archivo
//            //response.outputStream.flush()
//            //return;
//        } catch(Exception e) {
//            log.error("No se pudo obtener la imagen", e)
//        }
//    }

//    def test = {
//        def foto = Imagen.get(params.id)
//        log.debug "Mostrando imagen ${foto.nombre}"
//        log.debug "TipoContenido: ${foto.tipoContenido}"
//        response.contentType = foto.tipoContenido
//        //response.setHeader("Content-disposition", "attachment; filename=${foto?.nombre}")
//        log.debug "Tamano: ${foto.tamano}"
//        response.contentLength = foto.tamano
//        log.debug "Foto: ${foto.archivo}"
//        response.outputStream << foto.archivo
//        response.outputStream.flush()
//        return;
//    }
}
