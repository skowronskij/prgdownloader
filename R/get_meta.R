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
  prg_data = jsonlite::fromJSON(
    sprintf("http://3.122.248.217/features_meta/%s?api-key=%s", unit, api_key)
  )
  return(prg_data)
}
