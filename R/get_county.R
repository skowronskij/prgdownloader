#' Pobieranie granic powiatów z PRG
#'
#' @description Funkcja służąca do pobierania granic wszystkich powiatów
#'     UWAGA - JEST TO DUŻY ZESTAW DANYCH
#'
#' @param api_key twój klucz do API
#'
#' @return obiekt sf zawierający atrybuty i geometrię pobranych granic powiatów
#' @export
#'
#' @examples
#' get_county('jEarp1RvgA4SgU3lWv3_sQ')
get_county = function(api_key){
  prg_data = sf::st_read(
    sprintf("http://3.122.248.217/tables/powiaty?api-key=%s", api_key),
    crs = 2180
  )
  return(prg_data)
}
