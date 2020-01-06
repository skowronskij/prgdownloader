#' Pobieranie wybranych jednostek PRG
#'
#' @description Funkcja słóżąca do pobierania wybranych
#'   jednostek PRG z api
#'
#' @param api_key twój klucz do API
#' @param unit jednostka PRG
#' @param teryt kod teryt lub lista terytów
#'
#' @return obiekt sf zawierający atrybuty i geometrię wybranych jednostek PRG
#' @export
#'
#' @examples
#' get_prg('jEarp1RvgA4SgU3lWv3_sQ', 'gminy', '3064011,2602042')
#' get_prg('jEarp1RvgA4SgU3lWv3_sQ', 'powiaty', '1815')
#' get_prg('jEarp1RvgA4SgU3lWv3_sQ', 'wojewodztwa', '24,16,30')
get_prg = function(api_key, unit, teryt){
  prg_data = sf::st_read(
    sprintf("http://3.122.248.217/features/%s?api-key=%s&teryt=%s", unit, api_key, teryt),
    crs = 2180
    )
  return(prg_data)
}
