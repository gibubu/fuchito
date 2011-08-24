package general



import org.junit.*
import grails.test.mixin.*


@TestFor(EquipoController)
@Mock(Equipo)
class EquipoControllerTests {


    @Test
    void testIndex() {
        controller.index()
        assert "/equipo/list" == response.redirectedUrl
    }

    @Test
    void testList() {

        def model = controller.list()

        assert model.equipoInstanceList.size() == 0
        assert model.equipoInstanceTotal == 0

    }

    @Test
    void testCreate() {
       def model = controller.create()

       assert model.equipoInstance != null


    }

    @Test
    void testSave() {
        controller.save()

        assert model.equipoInstance != null
        assert view == '/equipo/create'

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/equipo/show/1'
        assert controller.flash.message != null
        assert Equipo.count() == 1
    }


    @Test
    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/equipo/list'


        def equipo = new Equipo()

        // TODO: populate domain properties

        assert equipo.save() != null

        params.id = equipo.id

        def model = controller.show()

        assert model.equipoInstance == equipo
    }

    @Test
    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/equipo/list'


        def equipo = new Equipo()

        // TODO: populate valid domain properties

        assert equipo.save() != null

        params.id = equipo.id

        def model = controller.edit()

        assert model.equipoInstance == equipo
    }

    @Test
    void testUpdate() {

        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/equipo/list'

        response.reset()


        def equipo = new Equipo()

        // TODO: populate valid domain properties

        assert equipo.save() != null

        // test invalid parameters in update
        params.id = equipo.id

        controller.update()

        assert view == "/equipo/edit"
        assert model.equipoInstance != null

        equipo.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/equipo/show/$equipo.id"
        assert flash.message != null
    }

    @Test
    void testDelete() {
        controller.delete()

        assert flash.message != null
        assert response.redirectedUrl == '/equipo/list'

        response.reset()

        def equipo = new Equipo()

        // TODO: populate valid domain properties
        assert equipo.save() != null
        assert Equipo.count() == 1

        params.id = equipo.id

        controller.delete()

        assert Equipo.count() == 0
        assert Equipo.get(equipo.id) == null
        assert response.redirectedUrl == '/equipo/list'


    }


}