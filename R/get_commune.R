#' Pobieranie granic gmin z PRG
#'
#' @description Funkcja służąca do pobierania granic wszystkich gmin
#'     UWAGA - JEST TO DUŻY ZESTAW DANYCH
#'
#' @param api_key twój klucz do API
#'
#' @return obiekt sf zawierający atrybuty i geometrię pobranych gmin
#' @export
#'
#' @examples
#' get_commune('jEarp1RvgA4SgU3lWv3_sQ')
get_commune = function(api_key){
  validation = httr::GET(
    base::sprintf('http://3.122.248.217/check_key?api-key=%s', api_key)
  )
  if (validation$status_code == 403){
    base::stop("Podany klucz jest nieprawidłowy. Nie posiadasz klucza? Wejdź na 3.122.248.217 i zdobądź go lub użyj funkcji get_key().")
  }
  prg_data = sf::st_read(
    base::sprintf("http://3.122.248.217/tables/gminy?api-key=%s", api_key),
    crs = 2180
  )
  return(prg_data)
}
