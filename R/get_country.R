#' Pobieranie granic Polski z PRG
#'
#' @description Funkcja służąca do pobrania granic Polski
#'
#'
#' @return obiekt sf zawierający atrybuty i geometrię dla Polski
#' @export
#'
#' @examples
#' \dontrun{
#' get_country()
#' }
get_country = function(){
  api_key = Sys.getenv("PRG_API_KEY")
  if (api_key == ''){
    stop('Brak klucza PRG API. Zdobądz go używając funkcji `get_key()` bądź na stronie 3.122.248.217/getkey.
         Następnie zapisz klucz przez funkcję `save_key()`')
  }
  prg_data = sf::read_sf(
    sprintf("http://3.120.210.65/tables/panstwo?api-key=%s", api_key),
    crs = 4326
  )
  return(prg_data)
}
