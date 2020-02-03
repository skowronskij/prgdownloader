#' Wygenerowanie klucza api
#'
#' @description Funkcja służąca do wygenerowania klucza api
#'
#' @param email twój adres e-mail, na który zostanie wysłany klucz
#'
#' @export
#'
#' @examples
#' get_key('email@email.com')
get_key = function(email){
  body = list(email = c(email))
  res = httr::POST('http://3.120.210.65/send_email', body=body, encode="json")
  answ = httr::content(res)
  message(answ$message)
}
