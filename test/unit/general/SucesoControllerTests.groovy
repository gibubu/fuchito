package general



import org.junit.*
import grails.test.mixin.*


@TestFor(SucesoController)
@Mock(Suceso)
class SucesoControllerTests {


    @Test
    void testIndex() {
        controller.index()
        assert "/suceso/list" == response.redirectedUrl
    }

    @Test
    void testList() {

        def model = controller.list()

        assert model.sucesoInstanceList.size() == 0
        assert model.sucesoInstanceTotal == 0

    }

    @Test
    void testCreate() {
       def model = controller.create()

       assert model.sucesoInstance != null


    }

    @Test
    void testSave() {
        controller.save()

        assert model.sucesoInstance != null
        assert view == '/suceso/create'

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/suceso/show/1'
        assert controller.flash.message != null
        assert Suceso.count() == 1
    }


    @Test
    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/suceso/list'


        def suceso = new Suceso()

        // TODO: populate domain properties

        assert suceso.save() != null

        params.id = suceso.id

        def model = controller.show()

        assert model.sucesoInstance == suceso
    }

    @Test
    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/suceso/list'


        def suceso = new Suceso()

        // TODO: populate valid domain properties

        assert suceso.save() != null

        params.id = suceso.id

        def model = controller.edit()

        assert model.sucesoInstance == suceso
    }

    @Test
    void testUpdate() {

        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/suceso/list'

        response.reset()


        def suceso = new Suceso()

        // TODO: populate valid domain properties

        assert suceso.save() != null

        // test invalid parameters in update
        params.id = suceso.id

        controller.update()

        assert view == "/suceso/edit"
        assert model.sucesoInstance != null

        suceso.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/suceso/show/$suceso.id"
        assert flash.message != null
    }

    @Test
    void testDelete() {
        controller.delete()

        assert flash.message != null
        assert response.redirectedUrl == '/suceso/list'

        response.reset()

        def suceso = new Suceso()

        // TODO: populate valid domain properties
        assert suceso.save() != null
        assert Suceso.count() == 1

        params.id = suceso.id

        controller.delete()

        assert Suceso.count() == 0
        assert Suceso.get(suceso.id) == null
        assert response.redirectedUrl == '/suceso/list'


    }


}