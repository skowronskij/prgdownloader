#' Pobieranie granic gmin z PRG
#'
#' @description Funkcja służąca do pobierania granic wszystkich gmin.
#'     UWAGA - JEST TO DUŻY ZESTAW DANYCH
#'
#' @param filter filtr danych np. gminy dla danego powiatu (kod teryt)
#'
#' @return obiekt sf zawierający atrybuty i geometrię pobranych gmin
#' @export
#'
#' @examples
#' \dontrun{
#' #Pobranie wszystkich gmin
#' get_commune()
#' #Pobranie gmin dla powiatu chodzieskiego
#' get_commune('3001')
#' #Pobranie gmin dla województwa wielkopolskiego
#' get_commune('30')
#' }
get_commune = function(filter){
  api_key = Sys.getenv("PRG_API_KEY")
  if (api_key == ''){
    stop('Brak klucza PRG API. Zdobądz go używając funkcji `get_key()` bądź na stronie 3.122.248.217/getkey.
         Następnie zapisz klucz przez funkcję `save_key()`')
  }
  endpoint = sprintf("http://3.122.248.217/tables/gminy?api-key=%s", api_key)
  if (!missing(filter)){
    endpoint = paste(endpoint, filter, sep = '&filter=')
  }
  prg_data = sf::st_read(
    endpoint,
    crs = 2180
  )
  return(prg_data)
}
