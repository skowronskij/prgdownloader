#' Pobieranie granic województw z PRG
#'
#' @description Funkcja służąca do pobierania granic wszystkich województw
#'     UWAGA - JEST TO DUŻY ZESTAW DANYCH
#'
#'
#' @return obiekt sf zawierający atrybuty i geometrię pobranych województw
#' @export
#'
#' @examples
#' \dontrun{
#' Pobranie wszystkich województw
#' get_province()
#' }
get_province = function(){
  api_key = Sys.getenv("PRG_API_KEY")
  if (api_key == ''){
    stop('Brak klucza PRG API. Zdobądz go używając funkcji `get_key()` bądź na stronie 3.122.248.217/getkey.
         Następnie zapisz klucz przez funkcję `save_key()`')
  }
  prg_data = sf::st_read(
    sprintf("http://3.120.210.65/tables/wojewodztwa?api-key=%s", api_key),
    crs = 4326
  )
  return(prg_data)
}
