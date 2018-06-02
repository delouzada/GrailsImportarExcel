package busca

import org.grails.plugins.excelimport.*

class EquipamentosExcelImporter extends AbstractExcelImporter  {

     
 public EquipamentosExcelImporter(fileName) {
    super(fileName);
  }
  
    
    //XXX:Campos são sensitivos se tiver maiusculo ou campo da planilha errados,  irá retornar  null
    static Map CONFIG_BOOK_CELL_MAP = [ 
     sheet:'Plan1', 
     cellMap: [ 
        'A3':'tag',
        'B4':'familia',
        'C4':'tipo',
        'D4':'previsao_EO',
        'E4':'previsao_Lib_Civil',
        'F4':'realizado',    
	  ]
  ]
    
    //XXX:Campos são sensitivos se tiver maiusculo ou campo da planilha errados,  irá retornar  null
    static Map CONFIG_BOOK_COLUMN_MAP = [
          sheet:'Plan1', 
			 startRow: 2,
          columnMap:  [
                  'A':'tag',
                  'B':'familia',
                  'C':'tipo',
                  'D':'previsao_EO',
                  'E':'previsao_Lib_Civil',
                  'F' :'realizado' ]
  ]

    //can also configure injection in resources.groovy

    def getExcelImportService() {
		ExcelImportService.getService()
	}

 
     List<Map> getEquipamentos() {
    List EquipamentoList = excelImportService.columns(workbook, CONFIG_BOOK_COLUMN_MAP)
  }

  

  Map getOneMoreEquipamentosParams() {
    Map bookParams = excelImportService.cells(workbook, CONFIG_BOOK_CELL_MAP )
  }
    
    
}






