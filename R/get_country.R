#' Pobieranie granic Polski z PRG
#'
#' @description Funkcja służąca do pobrania granic Polski
#'
#' @param api_key twój klucz do API
#'
#' @return obiekt sf zawierający atrybuty i geometrię dla Polski
#' @export
#'
#' @examples
#' get_country('jEarp1RvgA4SgU3lWv3_sQ')
get_country = function(api_key){
  prg_data = sf::st_read(
    sprintf("http://3.122.248.217/tables/panstwo?api-key=%s", api_key),
    crs = 2180
  )
  return(prg_data)
}
