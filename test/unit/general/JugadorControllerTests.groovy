package general



import org.junit.*
import grails.test.mixin.*


@TestFor(JugadorController)
@Mock(Jugador)
class JugadorControllerTests {


    @Test
    void testIndex() {
        controller.index()
        assert "/jugador/list" == response.redirectedUrl
    }

    @Test
    void testList() {

        def model = controller.list()

        assert model.jugadorInstanceList.size() == 0
        assert model.jugadorInstanceTotal == 0

    }

    @Test
    void testCreate() {
       def model = controller.create()

       assert model.jugadorInstance != null


    }

    @Test
    void testSave() {
        controller.save()

        assert model.jugadorInstance != null
        assert view == '/jugador/create'

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/jugador/show/1'
        assert controller.flash.message != null
        assert Jugador.count() == 1
    }


    @Test
    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/jugador/list'


        def jugador = new Jugador()

        // TODO: populate domain properties

        assert jugador.save() != null

        params.id = jugador.id

        def model = controller.show()

        assert model.jugadorInstance == jugador
    }

    @Test
    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/jugador/list'


        def jugador = new Jugador()

        // TODO: populate valid domain properties

        assert jugador.save() != null

        params.id = jugador.id

        def model = controller.edit()

        assert model.jugadorInstance == jugador
    }

    @Test
    void testUpdate() {

        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/jugador/list'

        response.reset()


        def jugador = new Jugador()

        // TODO: populate valid domain properties

        assert jugador.save() != null

        // test invalid parameters in update
        params.id = jugador.id

        controller.update()

        assert view == "/jugador/edit"
        assert model.jugadorInstance != null

        jugador.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/jugador/show/$jugador.id"
        assert flash.message != null
    }

    @Test
    void testDelete() {
        controller.delete()

        assert flash.message != null
        assert response.redirectedUrl == '/jugador/list'

        response.reset()

        def jugador = new Jugador()

        // TODO: populate valid domain properties
        assert jugador.save() != null
        assert Jugador.count() == 1

        params.id = jugador.id

        controller.delete()

        assert Jugador.count() == 0
        assert Jugador.get(jugador.id) == null
        assert response.redirectedUrl == '/jugador/list'


    }


}