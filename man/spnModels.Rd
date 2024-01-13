\name{spnModels}
\alias{spnModels}
\alias{LV}
\alias{ID}
\alias{BD}
\alias{Dimer}
\alias{MM}
\alias{LVV}
\alias{SIR}
\alias{SEIR}
\docType{data}
\title{Example SPN models}
\description{
Collection of example stochastic Petri net (SPN) models. Includes \code{LV}, a Lotka--Volterra
model, \code{ID}, an immigration--death process, \code{BD}, a birth--death
process, \code{SIR}, a simple SIR model, \code{SEIR}, an SEIR epidemic model, \code{Dimer}, a simple dimerisation kinetics model, and
\code{MM}, a Michaelis--Menten enzyme kinetic model.
}
\usage{data(spnModels)}
\format{Each model is a list, with components \code{Pre}, \code{Post},
  and \code{h}. Some models also include an initial state, \code{M}. See
  \code{\link{gillespie}} and \code{\link{StepGillespie}} for further details, and
  examples of use.}
\keyword{smfsb}
\keyword{data}
\keyword{models}
\keyword{datasets}

