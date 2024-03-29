% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract.R
\name{extract}
\alias{extract}
\title{Extract details from statistical models for table construction}
\usage{
extract(model, ...)
}
\arguments{
\item{model}{A statistical model object.}

\item{...}{Custom parameters, which are handed over to subroutines. The
arguments are usually passed to the \code{summary} function, but in some
cases to other functions.}
}
\value{
The function returns a \linkS4class{texreg} object.
}
\description{
Extract details from statistical models for table construction. The function
has methods for a range of statistical models.
}
\details{
The \code{\link{extract}} function serves to retrieve coefficients, standard
errors, p-values, confidence intervals, and goodness-of-fit statistics from
statistical models in \R. More than 100 \code{\link{extract}} methods
("extensions") for various statistical models are available. The function
returns a \linkS4class{texreg} object.

\code{\link{extract}} is a generic function, which extracts coefficients and
GOF measures from statistical model objects. \code{\link{extract}} methods
for the specific model types are called by the generic \code{\link{extract}}
function if it encounters a model known to be handled by the specific method.
The output is a \linkS4class{texreg} object, which is subsequently used by
the \code{\link{texreg}} function and related functions.

To list the model classes for which extract methods exist, type
\code{showMethods("extract")} or \code{methods("extract")}. To show the
method definition (i.e., the function body) of a specific extract method, use
the \code{getMethod} function, for example \code{getMethod("extract", "lm")}
for linear models. To get help on a specific extract method, type something
like \code{?`extract,lm-method`} (or something similar for other models,
where \code{"lm"} needs to be replaced by the class name of the respective
model). You can also list the available methods by displaying the
\link[=texreg-package]{texreg package} help index.

Users can contribute their own extensions for additional statistical models.
Examples are contained in the article in the Journal of Statistical Software
referenced below. Suggestions can be submitted as pull requests at
\url{https://github.com/leifeld/texreg/pulls} or through the issue tracker at
\url{https://github.com/leifeld/texreg/issues}.
}
\references{
Leifeld, Philip (2013). texreg: Conversion of Statistical Model
  Output in R to LaTeX and HTML Tables. Journal of Statistical Software
  55(8): 1-24. \doi{10.18637/jss.v055.i08}.
}
\seealso{
\code{\link{createTexreg}}, \code{\link{matrixreg}},
  \code{\link{screenreg}}, \code{\link{texreg}}
}
\author{
Philip Leifeld
}
