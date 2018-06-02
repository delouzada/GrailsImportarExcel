package busca
import groovy.sql.Sql

class EquipamentosService {

    static transactional = true
    
    def dataSource
    
    def serviceMethod() {




    }



    
    Map buscaPorPrevisaoEO(String dataInicial, String dataFinal ){
     
        
     
     def sql = new Sql(dataSource)   
     int count = 0
     Map retorno = [:]
     
     
        
      
       
    String  query = "SELECT "  
    query = query + " id AS id,tag AS tag, tipo AS tipo, " 
    query = query + " familia AS familia, previsao_eo AS previsao_EO, "  

    query = query + " previsao_Lib_Civil AS previsao_Lib_Civil, "
    query = query + " realizado AS realizado "
    query = query +   " FROM equipamentos "
    query = query + " WHERE previsao_EO "
    query = query + " BETWEEN  '${dataInicial}' "
    query = query + " AND  '${dataFinal}' "
    query = query + " AND realizado "
    query = query + "  LIKE  '%Não' "
    query = query +  "ORDER BY previsao_EO,tag,familia,tipo,id ASC";
     
        
     println(query)      
        
        sql.eachRow(query)
        { 
         row -> 
         
            String id = row.id
            String tag = row.tag
            String tipo = row.tipo
            String familia = row.familia
            String preveq = row.previsao_EO
            String prevLibCivil = row.previsao_Lib_Civil
           
            
            
            String prevEqAno = preveq.substring(0, 4)
            String prevEqMes = preveq.substring(5, 7)
            String prevEqDia = preveq.substring(8, 10)
            
            String previsao_EO = prevEqDia + "/" + prevEqMes + "/" + prevEqAno
            
            String prevLibAno = prevLibCivil.substring(0,4)
            String prevLibMes = prevLibCivil.substring(5,7)
            String prevLibDia = prevLibCivil.substring(8, 10)
            
            String previsao_Lib_Civil = prevLibDia +"/"+ prevLibMes +"/"+ prevLibAno
            
        
          
            
            
            Map lista = [:]
            
            lista["tag"] = tag
            lista["tipo"] = tipo
            lista["familia"] = familia
            lista["previsao_EO"] = previsao_EO
            lista["previsao_Lib_Civil"] = previsao_Lib_Civil
        
            
            retorno[id] = lista 
           
        }
      
        
        
        return retorno
        
    }
    
    
    
    Map buscaPorPrevisaoLibCivil(String dataInicial, String dataFinal ){
     
        
     
     def sql = new Sql(dataSource)   
     int count = 0
     Map retorno = [:]
     
       
        String  query = "SELECT "  
    query = query + " id AS id,tag AS tag, tipo AS tipo, " 
    query = query + " familia AS familia, previsao_eo AS previsao_EO, "
    query = query + " previsao_Lib_Civil AS previsao_Lib_Civil, "
    query = query + " realizado AS realizado "
    query = query +   " FROM equipamentos "
    query = query + " WHERE previsao_Lib_Civil "
    query = query + " BETWEEN  '${dataInicial}' "
    query = query + " AND  '${dataFinal}' "
    query = query + " AND realizado "
    query = query + "  LIKE  '%Não' "
    query = query +  "ORDER BY previsao_Lib_Civil,tag,familia,tipo,id ASC"; 
       
    
      
     println(query)   
     
        
       
        
        
        
        
        
        
        
        
        
        sql.eachRow(query)
        { 
         row -> 
         
            String id = row.id
            String tag = row.tag
            String tipo = row.tipo
            String familia = row.familia
            String preveq = row.previsao_EO
            String prevLibCivil = row.previsao_Lib_Civil
           
            
            
            String prevEqAno = preveq.substring(0, 4)
            String prevEqMes = preveq.substring(5, 7)
            String prevEqDia = preveq.substring(8, 10)
            
            String previsao_EO = prevEqDia + "/" + prevEqMes + "/" + prevEqAno
            
            String prevLibAno = prevLibCivil.substring(0,4)
            String prevLibMes = prevLibCivil.substring(5,7)
            String prevLibDia = prevLibCivil.substring(8, 10)
            
            String previsao_Lib_Civil = prevLibDia +"/"+ prevLibMes +"/"+ prevLibAno
            
            
            
            Map lista = [:]
            
            lista["tag"] = tag
            lista["tipo"] = tipo
            lista["familia"] = familia
            lista["previsao_EO"] = previsao_EO
            lista["previsao_Lib_Civil"] = previsao_Lib_Civil
          
           
            retorno[id] = lista 
           
        }
      
        
        
        println(count)
        return retorno
        
    }
    
    
   
    
    
    
}
