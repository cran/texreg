% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract.R
\name{extract,lnam-method}
\alias{extract,lnam-method}
\alias{extract.lnam}
\title{\code{\link{extract}} method for \code{lnam} objects}
\usage{
\S4method{extract}{lnam}(
  model,
  include.rsquared = TRUE,
  include.adjrs = TRUE,
  include.aic = TRUE,
  include.bic = TRUE,
  include.loglik = TRUE,
  ...
)
}
\arguments{
\item{model}{A statistical model object.}

\item{include.rsquared}{Report R^2 in the GOF block?}

\item{include.adjrs}{Report adjusted R^2 in the GOF block?}

\item{include.aic}{Report Akaike's Information Criterion (AIC) in the GOF
block?}

\item{include.bic}{Report the Bayesian Information Criterion (BIC) in the GOF
block?}

\item{include.loglik}{Report the log likelihood in the GOF block?}

\item{...}{Custom parameters, which are handed over to subroutines, in this
case to the \code{coef} method for the object.}
}
\description{
\code{\link{extract}} method for \code{lnam} objects created by the
\code{lnam} function in the \pkg{sna} package.
}
