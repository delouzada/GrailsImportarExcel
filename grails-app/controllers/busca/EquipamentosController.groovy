package busca
import busca.Equipamentos
import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql
import net.sf.jasperreports.engine.JRDataSource
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import net.sf.jasperreports.engine.JasperRunManager

class EquipamentosController {
    
    def EquipamentosExcelImporter
    def EquipamentosService
    def ExcelImporterService
    def FileUploadService
    def dataSource
    
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
        
        
        
    }
    
     def relatorio() {
       
        
        
        
        //caminho para o relatorio
    String file =
        grailsAttributes.getApplicationContext().getResource("/reports/report1.jasper").getFile().toString()
 
    //cria uma o qual vai conter todas os parametros do relatório
    HashMap<String,String> parameters = new HashMap<String,String>();
 
    // a variavel dados vai conter todos os dados
    ArrayList<Equipamentos> dados = Equipamentos.list()
 
    //cria um datasource do jasper o qual vai armazenar todos os nossos dados
    JRDataSource jdatasource = new JRBeanCollectionDataSource(dados);
 
    //gera o relatório em pdf e o retorno vai em bytes
   
 
    //indica que a saída será um arquivo pdf
    response.setContentType("application/pdf");
    response.setHeader("Content-disposition", "inline; filename=teste.pdf");
    // redireciona para a saída o arquivo em memória
    response.outputStream << impressao
    }
    

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [equipamentosInstanceList: Equipamentos.list(params), equipamentosInstanceTotal: Equipamentos.count()]
    }

    def create() {
        [equipamentosInstance: new Equipamentos(params)]
    }

    def save() {
        def equipamentosInstance = new Equipamentos(params)
        if (!equipamentosInstance.save(flush: true)) {
            render(view: "create", model: [equipamentosInstance: equipamentosInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'equipamentos.label', default: 'Equipamentos'), equipamentosInstance.id])
        redirect(action: "show", id: equipamentosInstance.id)
    }

    def show() {
        def equipamentosInstance = Equipamentos.get(params.id)
        if (!equipamentosInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipamentos.label', default: 'Equipamentos'), params.id])
            redirect(action: "list")
            return
        }

        [equipamentosInstance: equipamentosInstance]
    }

    def edit() {
        def equipamentosInstance = Equipamentos.get(params.id)
        if (!equipamentosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipamentos.label', default: 'Equipamentos'), params.id])
            redirect(action: "list")
            return
        }

        [equipamentosInstance: equipamentosInstance]
    }

    def update() {
        def equipamentosInstance = Equipamentos.get(params.id)
        if (!equipamentosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipamentos.label', default: 'Equipamentos'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (equipamentosInstance.version > version) {
                equipamentosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'equipamentos.label', default: 'Equipamentos')] as Object[],
                          "Another user has updated this Equipamentos while you were editing")
                render(view: "edit", model: [equipamentosInstance: equipamentosInstance])
                return
            }
        }

        equipamentosInstance.properties = params

        if (!equipamentosInstance.save(flush: true)) {
            render(view: "edit", model: [equipamentosInstance: equipamentosInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'equipamentos.label', default: 'Equipamentos'), equipamentosInstance.id])
        redirect(action: "show", id: equipamentosInstance.id)
    }

    def delete() {
        def equipamentosInstance = Equipamentos.get(params.id)
        if (!equipamentosInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipamentos.label', default: 'Equipamentos'), params.id])
            redirect(action: "list")
            return
        }

        try {
            equipamentosInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipamentos.label', default: 'Equipamentos'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipamentos.label', default: 'Equipamentos'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    
    
        def erro(){
        
    }
    
    def buscaLibCivil(){
        
       
    }
    
    
    
    def buscaPrevEO(){
        
       
    }
    
    
    def etiquetaPrevEO(){
        
        String dtInicial = params.dataInicial
        String dtFinal = params.dataFinal
        
            String dIano = dtInicial.substring(6, 10)
            String dImes = dtInicial.substring(3, 5)
            String dIdia = dtInicial.substring(0, 2)

        
        
        
            String dataInicial = dIano +"-"+ dImes + "-" + dIdia
        
            println(dataInicial)
            String dFano = dtFinal.substring(6, 10)
            String dFmes = dtFinal.substring(3, 5)
            String dFdia = dtFinal.substring(0, 2)
            
        
            String dataFinal = dFano +"-"+ dFmes + "-" + dFdia
        
            println(dataFinal)

        Map equipamentos =  EquipamentosService.buscaPorPrevisaoEO(dataInicial, dataFinal)
   
        if(equipamentos){
       
        [equipamentos:equipamentos]
    }
    
        else{
            
             redirect(action: "erro", params: params)
            
        }
        
        
    }
    
    
    def importExcel(){
        
        
        
    }
    
    def fileUpload(){
        String fileName = params.name
        
        
        def file = request.getFile('file')
        
        if(!file.isEmpty()){
            
            def subirArquivo =  FileUploadService.uploadFile(file, "${fileName}.xls")
        
       
        
            String storagePath = servletContext.getRealPath('xls')
   
            
            
           String fileImp = storagePath +"\\" +"${fileName}.xls"
           
            
            
            
   EquipamentosExcelImporter  importer = new EquipamentosExcelImporter(fileImp)
   
             def sql = new Sql(dataSource)
            def equipamentos = importer.getEquipamentos();
    equipamentos.each { Map EquipamentosParams ->
	  
        String familia =    EquipamentosParams.familia
      
        String tag = EquipamentosParams.tag
        
        String tipo = EquipamentosParams.tipo   
        String previsao_EO = EquipamentosParams.previsao_EO
        String previsao_Lib_Civil = EquipamentosParams.previsao_Lib_Civil
       
         if(previsao_Lib_Civil == null){
             
                    //Defini uma data para que a mesma nao seja nula, na consulta das etiquetas
                    previsao_Lib_Civil = "'1900-03-01'"
         }       
         else{
           //Defini uma data para que a mesma não seja nula, na consulta da etiqueta  
           previsao_Lib_Civil = "'{EquipamentosParams.previsao_Lib_Civil}'"  
                    
         }
         if(previsao_EO == null){
             previsao_EO = "'1900-03-01'"
         }
         else{
             previsao_EO = "'${EquipamentosParams.previsao_EO}'"
                
         }
         
         String query = "INSERT INTO `equipamentos` ("
            query = query + "`id` ,"
            query = query + "`version` ,"
            query = query + "`familia` ,"
            query = query +"`previsao_eo`," 
            query = query +"`previsao_lib_civil` ,"
            query = query +"`tag` ,"
            query = query +"`tipo`)"
            query = query +"VALUES ("
            query = query +"NULL ,  '1',  '${familia}',  ${previsao_EO},  ${previsao_Lib_Civil},  '${tag}',  '${tipo}');"       
        
                //println(query)
           
          sql.execute(query)
               
	 }
        
            
        }else{
            redirect(action: "erro", params: params)
            
                                
        }
        
    }
    
        def etiquetaLibCivil(){
        
        String dtInicial = params.dataInicial
        String dtFinal = params.dataFinal
        
            String dIano = dtInicial.substring(6, 10)
            String dImes = dtInicial.substring(3, 5)
            String dIdia = dtInicial.substring(0, 2)

        
        
        
            String dataInicial = dIano +"-"+ dImes + "-" + dIdia
        
        
            String dFano = dtFinal.substring(6, 10)
            String dFmes = dtFinal.substring(3, 5)
            String dFdia = dtFinal.substring(0, 2)
            
        
            String dataFinal = dFano +"-"+ dFmes + "-" + dFdia
        

        Map equipamentos =  EquipamentosService.buscaPorPrevisaoLibCivil(dataInicial, dataFinal)
        
        if(equipamentos){
            
        println(equipamentos)
        
        [equipamentos:equipamentos]
         
        }
        else{
            
             redirect(action: "erro", params: params)
            
        }
       
    
    }
    
    
    

def listaporFamilia(){

String busca = params.familia
//EquipamentosParams.tag
        
        if(busca){

            def equipamentos = Equipamentos.findByfamilia(busca)

[equipamentos:equipamentos] 

}

else{
redirect(action: "erro", params: params)
 println(busca)
        }
        
}   
      
   def filter = {
 // def tipo = Tipo.get(params.id)
 //def equipamentos = Equipamentos.findByfamiliaAndtipo
  
 
        def equipamentos = Equipamentos.findAllByFamiliaAndTipo(params.familia,params.tipo)        
 
        
  render(view: "list", model: [equipamentosInstanceList: 
  equipamentos, equipamentosInstanceTotal: 
    Equipamentos.count()])

    
    
    }
    
    
    
    
    
    
    
    
    
    


def buscaPorFamilia(){
       
         
    }
    
    def listaPorFamilia(){
        
String familia = params.familia
println(familia)
def equipamentos = Equipamentos.findAllByFamiliaIlike("%${familia}%")
println(equipamentos)
   
def rowCount = Equipamentos.createCriteria().get(){
projections {
rowCount()
}
and{
eq("familia", params.familia)
}
}
println(rowCount)
if(equipamentos){
render(template:"listaPorFamilia", model: [equipamentosInstanceList:equipamentos, rowCount:rowCount])
}
else{
render("<span class='erro'>Nenhum ${params.familia} encontrado!</span>")
}
        
    }

    
    
    
}
