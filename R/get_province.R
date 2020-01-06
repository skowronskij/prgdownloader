#' Pobieranie granic województw z PRG
#'
#' @description Funkcja służąca do pobierania granic wszystkich województw
#'     UWAGA - JEST TO DUŻY ZESTAW DANYCH
#'
#' @param api_key twój klucz do API
#'
#' @return obiekt sf zawierający atrybuty i geometrię pobranych województw
#' @export
#'
#' @examples
#' get_province('jEarp1RvgA4SgU3lWv3_sQ')
get_province = function(api_key){
  prg_data = sf::st_read(
    sprintf("http://3.122.248.217/tables/wojewodztwa?api-key=%s", api_key),
    crs = 2180
  )
  return(prg_data)
}
