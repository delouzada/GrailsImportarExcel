package busca



import org.junit.*
import grails.test.mixin.*

@TestFor(EquipamentosController)
@Mock(Equipamentos)
class EquipamentosControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/equipamentos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.equipamentosInstanceList.size() == 0
        assert model.equipamentosInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.equipamentosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.equipamentosInstance != null
        assert view == '/equipamentos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/equipamentos/show/1'
        assert controller.flash.message != null
        assert Equipamentos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/equipamentos/list'


        populateValidParams(params)
        def equipamentos = new Equipamentos(params)

        assert equipamentos.save() != null

        params.id = equipamentos.id

        def model = controller.show()

        assert model.equipamentosInstance == equipamentos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/equipamentos/list'


        populateValidParams(params)
        def equipamentos = new Equipamentos(params)

        assert equipamentos.save() != null

        params.id = equipamentos.id

        def model = controller.edit()

        assert model.equipamentosInstance == equipamentos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/equipamentos/list'

        response.reset()


        populateValidParams(params)
        def equipamentos = new Equipamentos(params)

        assert equipamentos.save() != null

        // test invalid parameters in update
        params.id = equipamentos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/equipamentos/edit"
        assert model.equipamentosInstance != null

        equipamentos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/equipamentos/show/$equipamentos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        equipamentos.clearErrors()

        populateValidParams(params)
        params.id = equipamentos.id
        params.version = -1
        controller.update()

        assert view == "/equipamentos/edit"
        assert model.equipamentosInstance != null
        assert model.equipamentosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/equipamentos/list'

        response.reset()

        populateValidParams(params)
        def equipamentos = new Equipamentos(params)

        assert equipamentos.save() != null
        assert Equipamentos.count() == 1

        params.id = equipamentos.id

        controller.delete()

        assert Equipamentos.count() == 0
        assert Equipamentos.get(equipamentos.id) == null
        assert response.redirectedUrl == '/equipamentos/list'
    }
}
