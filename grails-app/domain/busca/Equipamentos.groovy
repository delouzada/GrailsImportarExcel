package busca

class Equipamentos {

    
    String tag
    String tipo
    String familia
    Date previsao_EO
    Date previsao_Lib_Civil
    String realizado
    
    static constraints = {
        tag(nullable:true)
        tipo(nullable:true)
        familia(nullable:true)
        previsao_EO(nullable:true)
        previsao_Lib_Civil(nullable:true)
        realizado(nullable:true)
    }
}
