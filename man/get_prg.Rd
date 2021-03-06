% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_prg.R
\name{get_prg}
\alias{get_prg}
\title{Pobieranie wybranych jednostek PRG}
\usage{
get_prg(unit, teryt)
}
\arguments{
\item{unit}{jednostka PRG}

\item{teryt}{kod teryt lub lista terytów}
}
\value{
obiekt sf zawierający atrybuty i geometrię wybranych jednostek PRG
}
\description{
Funkcja słóżąca do pobierania wybranych
jednostek PRG z api
}
\examples{
\dontrun{
get_prg('123ads', 'gminy', '3064011,2602042')
get_prg('123ads', 'powiaty', '1815')
get_prg('123ads', 'wojewodztwa', '24,16,30')
}
}
