#' Pobieranie terytów wybranych jednostek
#'
#' @description Funkcja służąca do pobierania terytów i nazw wybranych jednostek PRG
#'
#' @param api_key twój klucz do API
#' @param unit jednostka PRG
#'
#' @return dataframe zawierający nazwę oraz teryt wybranych jednostek
#' @export
#'
#' @examples
#' get_meta('jEarp1RvgA4SgU3lWv3_sQ', 'wojewodztwa')
get_meta = function(api_key, unit){
  validation = httr::GET(
    base::sprintf('http://3.122.248.217/check_key?api-key=%s', api_key)
    )
  if (validation$status_code == 403){
    base::stop("Podany klucz jest nieprawidłowy. Nie posiadasz klucza? Wejdź na 3.122.248.217 i zdobądź go lub użyj funkcji get_key().")
  }
  prg_data = jsonlite::fromJSON(
    base::sprintf("http://3.122.248.217/features_meta/%s?api-key=%s", unit, api_key)
  )
  return(prg_data)
}
