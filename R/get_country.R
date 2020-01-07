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
  validation = httr::GET(
    base::sprintf('http://3.122.248.217/check_key?api-key=%s', api_key)
  )
  if (validation$status_code == 403){
    base::stop("Podany klucz jest nieprawidłowy. Nie posiadasz klucza? Wejdź na 3.122.248.217 i zdobądź go lub użyj funkcji get_key().")
  }
  prg_data = sf::st_read(
    base::sprintf("http://3.122.248.217/tables/panstwo?api-key=%s", api_key),
    crs = 2180
  )
  return(prg_data)
}
