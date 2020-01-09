#' Zapisanie klucza api
#'
#' @description Funkcja służąca do zapisania klucza api
#'
#' @param api_key klucz dla api prg
#'
#' @export
#'
#' @examples
#' \dontrun{
#' save_key('123asd')
#' }
save_key = function(api_key){
  validation = httr::GET(
    sprintf('http://3.122.248.217/check_key?api-key=%s', api_key)
  )
  if (validation$status_code == 403){
    stop("Podany klucz jest nieprawidłowy. Nie posiadasz klucza? Wejdź na 3.122.248.217 i zdobądź go lub użyj funkcji get_key().")
  }
  home = Sys.getenv('HOME')
  renv = file.path(home, ".Renviron")
  if(file.exists(renv)){
    file.copy(renv, file.path(home, ".Renviron_backup"))
  }
  else{
    file.create(renv)
  }
  key_var = paste0("PRG_API_KEY='", api_key, "'")
  write(key_var, renv, sep = "\n", append = TRUE)
  message('Twój klucz api prg został zapisany w pliku .Renviron. Dostęp do niego można uzyskać
          przez `Sys.getenv("PRG_API_KEY")`. \nAby użyć go teraz, zrestartuj R lub uruchom `readRenviron("~/.Renviron")`')
}
