package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class EncuentroController {

    def springSecurityService

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    def index = {
        redirect(action: "lista", params: params)
    }

    def lista = {
        def usuario = springSecurityService.currentUser
        //                def a = Equipo.findAllByTorneo(usuario.equipo.torneo).size()
        //                int b
        //                if(a == 0) {b = 10} else {b = a/2}
        //		params.max = Math.min(params.max ? params.int('max') : b, 100)
        params.max = Math.min(params.max ? params.int('max') : 100, 100)
        //                def c = Encuentro.findAllByTorneo(usuario.equipo.torneo, params)
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

    def ver = {
        def encuentro = Encuentro.get(params.id)
        if (!encuentro) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'encuentro.label', default: 'Encuentro'), params.id])
            redirect(action: "lista")
        }
        else {
            [encuentro: encuentro]
        }
    }

    def edita = {
        def encuentro = Encuentro.get(params.id)
        if (!encuentro) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'encuentro.label', default: 'Encuentro'), params.id])
            redirect(action: "lista")
        }
        else {
            return [encuentro: encuentro]
        }
    }

    def actualiza = {
        def encuentro = Encuentro.get(params.id)
        if (encuentro) {
            if (params.version) {
                def version = params.version.toLong()
                if (encuentro.version > version) {
                    
                    encuentro.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'encuentro.label', default: 'Encuentro')] as Object[], "Another user has updated this Encuentro while you were editing")
                    render(view: "edita", model: [encuentro: encuentro])
                    return
                }
            }
            encuentro.properties = params
            if (!encuentro.hasErrors() && encuentro.save(flush: true)) {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'encuentro.label', default: 'Encuentro'), encuentro.id])
                redirect(action: "ver", id: encuentro.id)
            }
            else {
                render(view: "edita", model: [encuentro: encuentro])
            }
        }
        else {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'encuentro.label', default: 'Encuentro'), params.id])
            redirect(action: "lista")
        }
    }

    def elimina = {
        def encuentro = Encuentro.get(params.id)
        if (encuentro) {
            try {
                encuentro.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'encuentro.label', default: 'Encuentro'), params.id])
                redirect(action: "lista")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'encuentro.label', default: 'Encuentro'), params.id])
                redirect(action: "ver", id: params.id)
            }
        }
        else {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'encuentro.label', default: 'Encuentro'), params.id])
            redirect(action: "lista")
        }
    }

    //genera las "jornadas"
    def genera = {
        def usuario = springSecurityService.currentUser
        def equipos = Equipo.findAllByTorneo(usuario.equipo.torneo, params)
        def epos = Encuentro.findAllByTorneo(usuario.equipo.torneo, params)
        def tama = Encuentro.countByTorneo(usuario.equipo.torneo)

        try {
            if(tama > 0){
                for(a in 0..tama){
                    def tro = Encuentro.get(epos[a].id)
                    if (tro != null) {
                        try {
                            tro.delete(flush: true)
                        } catch (Exception e){
                            log.debug "malo algo paso"
                        }
                    }
                }
            }
            
            //genera todos los encuentros posibles
            for(i in 0..equipos.size()-1){
                if(i != equipos.size()-1){
                    for(j in i+1..equipos.size()-1){
                        rap(usuario.equipo.torneo, equipos[i], equipos[j], new Date(), (equipos[i].nombre+" vs "+equipos[j].nombre))
                    }
                } else {
                    break
                }
            }
        } catch (Exception e){
            log.debug "paso algo malo"
        }

        //trae la jornada con los encuentros disponibles
//        def encuentros = jornadas()

        redirect(action: "lista")
    }

    //actualizar y guardar en DB
    def rpg = {id_encuentro, fecha, jugado, jornada ->
        def encuentro = Encuentro.findById_encuentro(id_encuentro)
        encuentro.fecha = fecha
        encuentro.jugado = jugado
        encuentro.jornada = jornada
        encuentro.save()
    }


    //guarda en la DB
    def rap = {torneo, uno, dos, fecha, id_encuentro ->
        def encuentro = new Encuentro()
        encuentro.torneo = torneo
        encuentro.uno = uno
        encuentro.dos = dos
        encuentro.fecha = fecha
        encuentro.id_encuentro = id_encuentro
        encuentro.save()
    }

    //regresa una lista de encuentros que se pueden jugar en una jornada especifica
    def jornadas = {
        def usuario = springSecurityService.currentUser
        def encuentros = Encuentro.findAllByTorneo(usuario.equipo.torneo, params)
        def semi = new ArrayList()
        def jorna = 1
        def jugao = 0
//        def te = new HashMap()

        //trae todos los encuentros que no se han jugado
        for(i in 0..encuentros.size()-1){
            if (encuentros[i].jornada == 0){
                semi.add(encuentros[i])
            }
        }
//        def mm = Equipo.countByTorneo(usuario.equipo.torneo)

        while(semi.size() != 0){
            //////////
            //////////
            //////////
            //////////
            //////////
            //////////
            //////////
            //elimina todos los encuentros que no son posibles (por tener equipos repetidos)
            //        def ene = new ArrayList()
//            if(jugao == mm/2){
//                te = new HashMap()
//            }
            for(i in 0..semi.size()-1){
//                if(te.isEmpty()){
//                    jugao++
//                    te.put((semi[i].uno.nombre), i)
//                    te.put((semi[i].dos.nombre), i)
//                    //guarda la lista de los encuentros limpios
//                    rpg((semi[i].uno.nombre+" vs "+semi[i].dos.nombre),new Date(),0,jorna)
//                }
//                if(!te.containsKey(semi[i].uno.nombre) && !te.containsKey(semi[i].dos.nombre)){
//                    if(jugao == mm/2){
//                        jugao = 1
                        jorna++
//                    }else{
//                        jugao++
//                    }
//                    te.put((semi[i].uno.nombre), i)
//                    te.put((semi[i].dos.nombre), i)
//                    log.debug semi[i].uno.nombre + " : " + semi[i].dos.nombre
                    //guarda la lista de los encuentros limpios
                    //                ene.add(semi[i])
                    rpg((semi[i].uno.nombre+" vs "+semi[i].dos.nombre),new Date(),0,jorna)
                    //                    log.debug semi[i].uno.nombre+" vs "+semi[i].dos.nombre
//                }
            }

            log.debug "x-x-x-x"
            //trae todos los encuentros que no se han jugado
            semi = new ArrayList()
            for(i in 0..encuentros.size()-1){
                if (encuentros[i].jornada == 0){
                    semi.add(encuentros[i])
                }
            }
        }
    }
}