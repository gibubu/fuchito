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
		params.max = Math.min(params.max ? params.int('max') : 30, 100)
                def usuario = springSecurityService.currentUser
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
        def partidos = 0

        try {
            //genera todos los encuentros posibles
            for(i in 0..equipos.size()-1){
                if(i != equipos.size()-1){
                    for(j in i+1..equipos.size()-1){
                         rap(usuario.equipo.torneo, equipos[i], equipos[j], new Date(), (i*100+j))
                         partidos++
                    }
                } else {
                    break
                }
            }
        } catch (Exception e){
            log.debug "paso algo malo"
        }

        //trae la jornada con los encuentros disponibles
//        def encuentros = jornadas(partidos)

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
    def jornadas = { partidos ->
        def usuario = springSecurityService.currentUser
        def encuentros = Encuentro.findAllByTorneo(usuario.equipo.torneo, params)
        def semi = new ArrayList()

        //trae todos los encuentros que no se han jugado
        for(i in 0..encuentros.size()-1){
            if (encuentros[i].jugado == 0){
                semi.add(encuentros[i])
            }
        }

        //elimina todos los encuentros que no son posibles (por tener equipos repetidos)
        def ene = new ArrayList()
        def te = new HashMap()
        for(i in 0..semi.size()-1){
            if(!te.containsKey(semi[i].uno.nombre) & !te.containsKey(semi[i].dos.nombre)){
                te.put((semi[i].uno.nombre), i)
                te.put((semi[i].dos.nombre), i)
                log.debug semi[i].uno.nombre + " : " + semi[i].dos.nombre
                //guarda la lista de los encuentros limpios
                ene.add(semi[i])
            }
        }

        def random = new Random()
        def jorna = 1
        int count = 0

        log.debug ene.get(1)
        while(ene.size() != 0){
            log.debug "entro a ?"
            count ++
            def test = random.nextInt(ene.size())+1
            def dia = usuario.equipo.torneo.inicio

            while(ene[test] == 0){
                test = random.nextInt(ene.size())+1
            }

            switch (Date.parse("yyyy-MM-dd", dia.format("yyyy-MM-dd")).format("EEEE")){
                case 'domingo':
                    if(usuario.equipo.torneo.domingo == true){
//                        rpg(encuentros[test].id_encuentro, dia, 1, jorna)
                        log.debug ene[test]
                    }else{ break }
                case 'lunes':
                    if(usuario.equipo.torneo.lunes == true){
//                        rpg(encuentros[test].id_encuentro, dia, 1, jorna)
                        log.debug "lunes"
                    }else{ break }
                case 'martes':
                    if(usuario.equipo.torneo.martes == true){
//                        rpg(encuentros[test].id_encuentro, dia, 1, jorna)
                    }else{ break }
                case 'miércoles':
                    if(usuario.equipo.torneo.miercoles == true){
//                        rpg(encuentros[test].id_encuentro, dia, 1, jorna)
                    }else{ break }
                case 'jueves':
                    if(usuario.equipo.torneo.jueves == true){
//                        rpg(encuentros[test].id_encuentro, dia, 1, jorna)
                    }else{ break }
                case 'viernes':
                    if(usuario.equipo.torneo.viernes == true){
//                        rpg(encuentros[test].id_encuentro, dia, 1, jorna)
                    }else{ break }
                case 'sábado':
                    if(usuario.equipo.torneo.sabado == true){
//                        rpg(encuentros[test].id_encuentro, dia, 1, jorna)
                    }else{ break }
                default:
                    break
            }

            if(count == 2){
                jorna++
                dia = dia.next()
                ene = jornadas(partidos)
            }

            if(jorna >= partidos/ene.size()){
                break
            }
        }

        return ene
    }
}