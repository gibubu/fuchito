package general



import org.junit.*
import grails.test.mixin.*


@TestFor(DiasController)
@Mock(Dias)
class DiasControllerTests {


    @Test
    void testIndex() {
        controller.index()
        assert "/dias/list" == response.redirectedUrl
    }

    @Test
    void testList() {

        def model = controller.list()

        assert model.diasInstanceList.size() == 0
        assert model.diasInstanceTotal == 0

    }

    @Test
    void testCreate() {
       def model = controller.create()

       assert model.diasInstance != null


    }

    @Test
    void testSave() {
        controller.save()

        assert model.diasInstance != null
        assert view == '/dias/create'

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/dias/show/1'
        assert controller.flash.message != null
        assert Dias.count() == 1
    }


    @Test
    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dias/list'


        def dias = new Dias()

        // TODO: populate domain properties

        assert dias.save() != null

        params.id = dias.id

        def model = controller.show()

        assert model.diasInstance == dias
    }

    @Test
    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dias/list'


        def dias = new Dias()

        // TODO: populate valid domain properties

        assert dias.save() != null

        params.id = dias.id

        def model = controller.edit()

        assert model.diasInstance == dias
    }

    @Test
    void testUpdate() {

        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dias/list'

        response.reset()


        def dias = new Dias()

        // TODO: populate valid domain properties

        assert dias.save() != null

        // test invalid parameters in update
        params.id = dias.id

        controller.update()

        assert view == "/dias/edit"
        assert model.diasInstance != null

        dias.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/dias/show/$dias.id"
        assert flash.message != null
    }

    @Test
    void testDelete() {
        controller.delete()

        assert flash.message != null
        assert response.redirectedUrl == '/dias/list'

        response.reset()

        def dias = new Dias()

        // TODO: populate valid domain properties
        assert dias.save() != null
        assert Dias.count() == 1

        params.id = dias.id

        controller.delete()

        assert Dias.count() == 0
        assert Dias.get(dias.id) == null
        assert response.redirectedUrl == '/dias/list'


    }


}