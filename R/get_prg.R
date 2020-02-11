#' Pobieranie wybranych jednostek PRG
#'
#' @description Funkcja słóżąca do pobierania wybranych
#'   jednostek PRG z api
#'
#' @param unit jednostka PRG
#' @param teryt kod teryt lub lista terytów
#'
#' @return obiekt sf zawierający atrybuty i geometrię wybranych jednostek PRG
#' @export
#'
#' @examples
#' \dontrun{
#' get_prg('123ads', 'gminy', '3064011,2602042')
#' get_prg('123ads', 'powiaty', '1815')
#' get_prg('123ads', 'wojewodztwa', '24,16,30')
#' }
get_prg = function(unit, teryt){
  api_key = Sys.getenv("PRG_API_KEY")
  if (api_key == ''){
    stop('Brak klucza PRG API. Zdobądz go używając funkcji `get_key()` bądź na stronie 3.122.248.217/getkey.
         Następnie zapisz klucz przez funkcję `save_key()`')
  }
  prg_data = sf::read_sf(
    sprintf("http://3.120.210.65/features/%s?api-key=%s&teryt=%s", unit, api_key, teryt),
    crs = 4326
    )
  return(prg_data)
}
