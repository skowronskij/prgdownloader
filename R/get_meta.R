#' Pobieranie terytów wybranych jednostek
#'
#' @description Funkcja służąca do pobierania terytów i nazw wybranych jednostek PRG
#'
#' @param unit jednostka PRG
#'
#' @return dataframe zawierający nazwę oraz teryt wybranych jednostek
#' @export
#'
#' @examples
#' \dontrun{
#' get_meta('wojewodztwa')
#' }
get_meta = function(unit){
  api_key = Sys.getenv("PRG_API_KEY")
  if (api_key == ''){
    stop('Brak klucza PRG API. Zdobądz go używając funkcji `get_key()` bądź na stronie 3.122.248.217/getkey.
         Następnie zapisz klucz przez funkcję `save_key()`')
  }
  prg_data = jsonlite::fromJSON(
    sprintf("http://3.120.210.65/features_meta/%s?api-key=%s", unit, api_key)
  )
  return(prg_data)
}
