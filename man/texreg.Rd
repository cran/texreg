% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/texreg.R
\name{texreg}
\alias{texreg}
\title{Convert regression output to a LaTeX table}
\usage{
texreg(
  l,
  file = NULL,
  single.row = FALSE,
  stars = c(0.001, 0.01, 0.05),
  custom.header = NULL,
  custom.model.names = NULL,
  custom.coef.names = NULL,
  custom.coef.map = NULL,
  custom.gof.names = NULL,
  custom.gof.rows = NULL,
  custom.note = NULL,
  digits = 2,
  leading.zero = TRUE,
  symbol = "\\\\cdot",
  override.coef = 0,
  override.se = 0,
  override.pvalues = 0,
  override.ci.low = 0,
  override.ci.up = 0,
  omit.coef = NULL,
  reorder.coef = NULL,
  reorder.gof = NULL,
  ci.force = FALSE,
  ci.force.level = 0.95,
  ci.test = 0,
  groups = NULL,
  custom.columns = NULL,
  custom.col.pos = NULL,
  bold = 0,
  center = TRUE,
  caption = "Statistical models",
  caption.above = FALSE,
  label = "table:coefficients",
  booktabs = FALSE,
  dcolumn = FALSE,
  siunitx = FALSE,
  lyx = FALSE,
  sideways = FALSE,
  longtable = FALSE,
  threeparttable = FALSE,
  use.packages = TRUE,
  table = TRUE,
  tabular = TRUE,
  no.margin = FALSE,
  fontsize = NULL,
  scalebox = NULL,
  float.pos = "",
  ...
)
}
\arguments{
\item{l}{A statistical model or a list of statistical models. Lists of
models can be specified as \code{l = list(model.1, model.2, ...)}.
Different object types can also be mixed.}

\item{file}{Using this argument, the resulting table is written to a file
rather than to the \R prompt. The file name can be specified as a character
string. Writing a table to a file can be useful for working with MS Office
or LibreOffice. For example, using the \code{\link{htmlreg}} function, an
HTML table can be written to a file with the extension \code{.doc} and
opened with MS Word. The table can then be simply copied into any Word
document, retaining the formatting of the table. Note that LibreOffice can
import only plain HTML; CSS decorations are not supported; the resulting
tables do not retain the full formatting in LibreOffice.}

\item{single.row}{By default, a model parameter takes up two lines of the
table: the standard error is listed in parentheses under the coefficient.
This saves a lot of horizontal space on the page and is the default table
format in most academic journals. If \code{single.row = TRUE} is activated,
however, both coefficient and standard error are placed in a single table
cell in the same line.}

\item{stars}{The significance levels to be used to draw stars. Between 0 and
4 threshold values can be provided as a numeric vector. For example,
\code{stars = numeric(0)} will not print any stars and will not print any
note about significance levels below the table. \code{stars = 0.05} will
attach one single star to all coefficients where the p value is below 0.05.
\code{stars = c(0.001, 0.01, 0.05, 0.1)} will print one, two, or three
stars, or a symbol as specified by the \code{symbol} argument depending on
the p-values.}

\item{custom.header}{An optional named list of multi-column headers that are
placed above the model names. For example,
\code{custom.header = list("abc" = 1:3, "ef" = 4:5)} will add the label
\code{"abc"} to the first three models and \code{"ef"} to the fourth and
fifth model. The column with coefficient names and any custom columns added
by the \code{"custom.columns"} argument are not counted towards these
positions. If \code{booktabs = TRUE}, \code{\\cmidrule} rules are added
below the respective labels; otherwise \code{\\cline} lines are used.}

\item{custom.model.names}{A character vector of labels for the models. By
default, the models are named "Model 1", "Model 2", etc. Specifying
\code{model.names = c("My name 1", "My name 2")} etc. overrides the default
behavior.}

\item{custom.coef.names}{By default, \pkg{texreg} uses the coefficient names
  which are stored in the models. The \code{custom.coef.names} argument can
  be used to replace them by other character strings in the order of
  appearance. For example, if a table shows a total of three different
  coefficients (including the intercept), the argument
  \code{custom.coef.names = c("Intercept", "variable 1", "variable 2")} will
  replace their names in this order.

  Sometimes it happens that the same variable has a different name in
  different models. In this case, the user can use this function to assign
  identical names. If possible, the rows will then be merged into a single
  row unless both rows contain values in the same column.

  Where the argument contains an \code{NA} value, the original name of the
  coefficient is kept. For example, \code{custom.coef.names = c(NA, "age",
  NA)} will only replace the second coefficient name and leave the first and
  third name as they are in the original model.

  See also \code{custom.coef.map} for an easier and more comprehensive way to
  rename, omit, and reorder coefficients.}

\item{custom.coef.map}{The \code{custom.coef.map} argument can be used to
  select, omit, rename, and reorder coefficients.

  Users must supply a named list of this form: \code{list("x" = "First
  variable", "y" = NA, "z" = "Third variable")}. With that particular example
  of \code{custom.coef.map},
  \enumerate{
   \item coefficients will be presented in order: \code{"x"}, \code{"y"},
     \code{"z"}.
   \item variable \code{"x"} will appear as \code{"First variable"}, variable
     \code{"y"} will appear as \code{"y"}, and variable \code{"z"} will
     appear as "Third variable".
   \item all variables not named \code{"x"}, \code{"y"}, or \code{"z"} will
     be omitted from the table.
  }}

\item{custom.gof.names}{A character vector which is used to replace the
names of the goodness-of-fit statistics at the bottom of the table. The
vector must have the same length as the number of GOF statistics in the
final table. The argument works like the \code{custom.coef.names} argument,
but for the GOF values. \code{NA} values can be included where the original
GOF name should be kept.}

\item{custom.gof.rows}{A named list of vectors for new lines at the
beginning of the GOF block of the table. For example, \code{list("Random
effects" = c("YES", "YES", "NO"), Observations = c(25, 25, 26))} would
insert two new rows into the table, at the beginning of the GOF block
(i.e., after the coefficients). The rows can contain integer, numeric, or
\code{character} objects. Note that this argument is processed after the
\code{custom.gof.names} argument (meaning \code{custom.gof.names} should
not include any of the new GOF rows) and before the \code{reorder.gof}
argument (meaning that the new GOF order specified there should contain
values for the new custom GOF rows). Arguments for custom columns are not
affected because they only insert columns into the coefficient block.}

\item{custom.note}{With this argument, a replacement text for the
  significance note below the table can be provided. If an empty
  \code{character} object is provided (\code{custom.note = ""}), the note
  will be omitted completely. If some character string is provided (e.g.,
  \code{custom.note = "My note"}), the significance legend is replaced by
  \code{My note}. The original significance legend can be included by
  inserting the \code{\%stars} wildcard. For example, a custom note can be
  added right after the significance legend by providing \code{custom.note =
  "\%stars. My note."}.

  If the \code{threeparttable} argument is used, any note should be preceded
  by \code{"\\\\item"}, for example
  \code{"\\\\item \%stars. \\\\item Second note. \\\\item Third note."}, and
  it is possible to create line breaks in the formatted table by including
  \code{"\\\\\\\\"} and line breaks in the LaTeX code by including
  \code{"\\n"}, for example
  \code{"\\n\\\\item \%stars.\\\\\\\\\\n\\\\item Second line.\\n"}.}

\item{digits}{Set the number of decimal places for coefficients, standard
errors and goodness-of-fit statistics. Do not use negative values! The
argument works like the \code{digits} argument in the
\code{\link[base:Round]{round}} function of the \pkg{base} package.}

\item{leading.zero}{Most journals require leading zeros of coefficients and
standard errors (for example, \code{0.35}). This is also the default texreg
behavior. Some journals, however, require omission of leading zeros (for
example, \code{.35}). This can be achieved by setting \code{leading.zero =
FALSE}.}

\item{symbol}{If four threshold values are handed over to the \code{stars}
argument, p-values smaller than the largest threshold value but larger than
the second-largest threshold value are denoted by this symbol. The default
symbol is \code{"\\\\cdot"} for the LaTeX dot, \code{"&middot;"} for the
HTML dot, or simply \code{"."} for the ASCII dot. If the
\code{\link{texreg}} function is used, any other mathematical LaTeX symbol
or plain text symbol can be used, for example \code{symbol = "\\\\circ"}
for a small circle (note that backslashes must be escaped). If the
\code{\link{htmlreg}} function is used, any other HTML character or symbol
can be used. For the \code{screenreg} function, only plain text characters
can be used.}

\item{override.coef}{Set custom values for the coefficients. New coefficients
are provided as a list of numeric vectors. The list contains vectors of
coefficients for each model. There must be as many vectors of coefficients
as there are models. For example, if there are two models with three model
terms each, the argument could be specified as \code{override.coef =
list(c(0.1, 0.2, 0.3), c(0.05, 0.06, 0.07))}. If there is only one model,
custom values can be provided as a plain vector (not embedded in a list).
For example: \code{override.coef = c(0.05, 0.06, 0.07)}.}

\item{override.se}{Set custom values for the standard errors. New standard
errors are provided as a list of numeric vectors. The list contains vectors
of standard errors for each model. There must be as many vectors of
standard errors as there are models. For example, if there are two models
with three coefficients each, the argument could be specified as
\code{override.se = list(c(0.1, 0.2, 0.3), c(0.05, 0.06, 0.07))}. If there
is only one model, custom values can be provided as a plain vector (not
embedded in a list).For example: \code{override.se = c(0.05, 0.06, 0.07)}.
Overriding standard errors can be useful for the implementation of robust
SEs, for example.}

\item{override.pvalues}{Set custom values for the p-values. New p-values are
provided as a list of numeric vectors. The list contains vectors of
p-values for each model. There must be as many vectors of p-values as there
are models. For example, if there are two models with three coefficients
each, the argument could be specified as \code{override.pvalues =
list(c(0.1, 0.2, 0.3), c(0.05, 0.06, 0.07))}. If there is only one model,
custom values can be provided as a plain vector (not embedded in a list).
For example: \code{override.pvalues = c(0.05, 0.06, 0.07)}. Overriding
p-values can be useful for the implementation of robust SEs and p-values,
for example.}

\item{override.ci.low}{Set custom lower confidence interval bounds. This
works like the other override arguments, with one exception: if confidence
intervals are provided here and in the \code{override.ci.up} argument, the
standard errors and p-values as well as the \code{ci.force} argument are
ignored.}

\item{override.ci.up}{Set custom upper confidence interval bounds. This
works like the other override arguments, with one exception: if confidence
intervals are provided here and in the \code{override.ci.low} argument, the
standard errors and p values as well as the \code{ci.force} argument are
ignored.}

\item{omit.coef}{A character string which is used as a regular expression to
remove coefficient rows from the table. For example, \code{omit.coef =
"group"} deletes all coefficient rows from the table where the name of the
coefficient contains the character sequence \code{"group"}. More complex
regular expressions can be used to filter out several kinds of model terms,
for example \code{omit.coef = "(thresh)|(ranef)"} to remove all model terms
matching either \code{"thresh"} or \code{"ranef"}. The \code{omit.coef}
argument is processed after the \code{custom.coef.names} argument, so the
regular expression should refer to the custom coefficient names. To omit
GOF entries instead of coefficient entries, use the custom arguments of the
extract functions instead (see the help entry of the \code{\link{extract}}
function.}

\item{reorder.coef}{Reorder the rows of the coefficient block of the
resulting table in a custom way. The argument takes a vector of the same
length as the number of coefficients. For example, if there are three
coefficients, \code{reorder.coef = c(3, 2, 1)} will put the third
coefficient in the first row and the first coefficient in the third row.
Reordering can be sensible because interaction effects are often added to
the end of the model output although they were specified earlier in the
model formula. Note: Reordering takes place after processing custom
coefficient names and after omitting coefficients, so the
\code{custom.coef.names} and \code{omit.coef} arguments should follow the
original order.}

\item{reorder.gof}{Reorder the rows of the goodness-of-fit block of the
resulting table in a custom way. The argument takes a vector of the same
length as the number of GOF statistics. For example, if there are three
goodness-of-fit rows, \code{reorder.gof = c(3, 2, 1)} will exchange the
first and the third row. Note: Reordering takes place after processing
custom GOF names and after adding new custom GOF rows, so the
\code{custom.gof.names} and \code{custom.gof.rows} arguments should follow
the original order, and the \code{reorder.gof} argument should contain
values for any rows that are added through the \code{custom.gof.rows}
argument.}

\item{ci.force}{Should confidence intervals be used instead of the default
standard errors and p-values? Most models implemented in the \pkg{texreg}
package report standard errors and p-values by default while few models
report confidence intervals. However, the functions in the \pkg{texreg}
package can convert standard errors and into confidence intervals using
z-scores if desired. To enforce confidence intervals instead of standard
errors, the \code{ci.force} argument accepts either a logical value
indicating whether all models or none of the models should be forced to
report confidence intervals (\code{ci.force = TRUE} for all and
\code{ci.force = FALSE} for none) or a vector of logical values indicating
for each model separately whether the model should be forced to report
confidence intervals (e.g., \code{ci.force = c(FALSE, TRUE, FALSE)}).
Confidence intervals are computed using the standard normal distribution
(z-values based on the \code{\link[stats:Normal]{qnorm}} function). The
t-distribution is currently not supported because this would require each
\code{\link{extract}} method to have an additional argument for the degrees
of freedom.}

\item{ci.force.level}{If the \code{ci.force} argument is used to convert
standard errors to confidence intervals, what confidence level should be
used? By default, \code{0.95} is used (i.e., an alpha value of 0.05).}

\item{ci.test}{If confidence intervals are reported, the \code{ci.test}
argument specifies the reference value to establish whether a
coefficient/CI is significant. The default value \code{ci.test = 0}, for
example, will attach a significance star to coefficients if the confidence
interval does not contain \code{0}. A value of \code{ci.test = 1} could be
useful if coefficients are provided on the odds-ratio scale, for example.
If no star should be printed at all, \code{ci.test = NA} can be used. It is
possible to provide a single value for all models or a vector with a
separate value for each model. The \code{ci.test} argument works both for
models with native support for confidence intervals and in cases where the
\code{ci.force} argument is used.}

\item{groups}{This argument can be used to group the rows of the table into
blocks. For example, there could be one block for hypotheses and another
block for control variables. Each group has a heading, and the row labels
within a group are indented. The partitions must be handed over as a list
of named numeric vectors, where each number is a row index and each name is
the heading of the group. Example: \code{groups = list("first group" = 1:4,
"second group" = 7:8)}.}

\item{custom.columns}{An optional list of additional text columns to be
inserted into the coefficient block of the table, for example coefficient
types. The list should contain one or more character vectors with as many
character or numeric elements as there are coefficients/model terms. If the
vectors in the list are named, the names are used as labels in the table
header. For example,
\code{custom.columns = list(type = c("a", "b", "c"), 1:3)} will add two
columns; the first one is labeled while the second one is not. Note that
the numeric elements of the second column will be converted to
\code{character} objects in this example. The consequence is that decimal
alignment with the \pkg{dcolumn} package is switched off in these columns.
Note that this argument is processed after any arguments that affect the
number of rows.}

\item{custom.col.pos}{An optional integer vector of positions for the columns
given in the \code{custom.columns} argument. For example, if there are
three custom columns, \code{custom.col.pos = c(1, 3, 3)} will insert the
first custom column before the first column of the original table and the
remaining two custom columns after the second column of the original table.
By default, all custom columns are placed after the first column, which
usually contains the coefficient names.}

\item{bold}{The p-value threshold below which the coefficient shall be
formatted in a bold font. For example, \code{bold = 0.05} will cause all
coefficients that are significant at the 95\% level to be formatted in
bold. Note that this is not compatible with the \code{dcolumn} or
\code{siunitx} arguments in the \code{\link{texreg}} function. If both
\code{bold} and \code{dcolumn} or \code{siunitx} are \code{TRUE},
\code{dcolumn} and \code{siunitx} are switched off, and a warning message
appears. Note also that it is advisable to use \code{stars = FALSE}
together with the \code{bold} argument because having both bolded
coefficients and significance stars usually does not make any sense.}

\item{center}{Should the table be horizontally aligned at the center of the
page?}

\item{caption}{Set the caption of the table.}

\item{caption.above}{Should the caption of the table be placed above the
table? By default, it is placed below the table.}

\item{label}{Set the label of the \code{table} environment.}

\item{booktabs}{Use the \pkg{booktabs} LaTeX package to get thick horizontal
rules in the output table (recommended).}

\item{dcolumn}{Use the \pkg{dcolumn} LaTeX package to get a nice alignment of
the coefficients at the decimal separator (recommended for use with the
\code{\link{texreg}} function). Note that only one of the three arguments
\code{bold}, \code{dcolumn}, and \code{siunitx} can be used at a time as
they are mutually incompatible.}

\item{siunitx}{Use the \pkg{siunitx} LaTeX package to get a nice alignment of
the coefficients at the decimal separator (recommended for use with the
\code{\link{texreg}} function). Note that only one of the three arguments
\code{bold}, \code{dcolumn}, and \code{siunitx} can be used at a time as
they are mutually incompatible.}

\item{lyx}{\code{logical}; if \code{TRUE}, each new line in the output is
doubled, which facilitates transferring the output into the LyX document
processor.}

\item{sideways}{If \code{sideways = TRUE} is set, the \code{table} floating
environment is replaced by a \code{sidewaystable} float, and the
\code{rotating} package is loaded in the preamble. The argument only has an
effect if \code{table = TRUE} is also set.}

\item{longtable}{If \code{longtable = TRUE} is set, the \code{longtable}
environment from the \code{longtable} LaTeX package is used to set tables
across multiple pages. Note that this argument is not compatible with the
\code{sideways} and \code{scalebox} arguments. These arguments will be
automatically switched off when \code{longtable = TRUE} is set.}

\item{threeparttable}{If \code{threeparttable = TRUE} is set, the
\code{threeparttable} environment will be used to enclose the
\code{tabular} environment in the LaTeX code, and the significance note
will be enclosed in a \code{tablenotes} environment. This permits word
wrapping of long table notes and adequate spacing between multiple notes.
See also the \code{custom.note} argument. If \code{longtable} is used,
the \code{threeparttablex} LaTeX package is used instead of the
\code{threeparttable} package.}

\item{use.packages}{If this argument is set to \code{TRUE} (= the default
behavior), the required LaTeX packages are loaded in the beginning. If set
to \code{FALSE}, the use package statements are omitted from the output.}

\item{table}{By default, \code{texreg} puts the actual \code{tabular} object
in a \code{table} floating environment. To get only the \code{tabular}
object without the whole table header, set \code{table = FALSE}.}

\item{tabular}{By default, the table contents are wrapped in a \code{tabular}
environment. To get only the contents for each row without the environment,
set \code{tabular = FALSE}. Note that if \code{tabular = FALSE}, the
\code{table} argument must also be \code{FALSE}, otherwise a warning is
printed. Switching off the tabular environment may be useful for designing
one's own table more flexibly, for example using \code{tabular*} or
\code{tabularx} environments in LaTeX.}

\item{no.margin}{In order to save space, inner margins of tables can be
switched off.}

\item{fontsize}{The \code{fontsize} argument serves to change the font size
used in the table. Valid values are \code{"tiny"}, \code{"scriptsize"},
\code{"footnotesize"}, \code{"small"}, \code{"normalsize"}, \code{"large"},
\code{"Large"}, \code{"LARGE"}, \code{"huge"}, and \code{"Huge"}. Note that
the \code{scalebox} argument often achieves better results when the goal is
to change the size of the table.}

\item{scalebox}{The \code{scalebox} argument serves to resize the table. For
example, \code{scalebox = 1.0} is equivalent to the normal size,
\code{scalebox = 0.5} decreases the size of the table by one half, and
\code{scalebox = 2.0} doubles the space occupied by the table. Note that
the \code{scalebox} argument does not work when the \code{longtable}
argument is used.}

\item{float.pos}{This argument specifies where the table should be located on
the page or in the document. By default, no floating position is specified,
and LaTeX takes care of the position automatically. Possible values include
\code{"h"} (here), \code{"p"} (page), \code{"t"} (top), \code{"b"}
(bottom), any combination thereof, e.g., \code{"tb"}, or any of these
values followed by an exclamation mark, e.g. \code{"t!"}, in order to
enforce this position. The square brackets do not have to be specified.}

\item{...}{Custom options to be passed on to the \code{\link{extract}}
function. For example, most extract methods provide custom options for the
inclusion or exclusion of specific goodness-of-fit statistics. See the help
entries of \code{\link{extract}} for more information.}
}
\value{
A \code{character} object with a regression table and LaTeX markup.
  The object has an additional \code{"texregTable"} class identifier, which
  causes the object to be formatted nicely on screen when printed.
}
\description{
Conversion of \R regression output to a LaTeX table.
}
\details{
The \code{\link{texreg}} function creates LaTeX code for inclusion in a LaTeX
document or for usage with \pkg{Sweave} or \pkg{knitr}, based on a list of
statistical models.
}
\examples{
# Linear mixed-effects models
library("nlme")
model.1 <- lme(distance ~ age, data = Orthodont, random = ~ 1)
model.2 <- lme(distance ~ age + Sex, data = Orthodont, random = ~ 1)
texreg(list(model.1, model.2), booktabs = TRUE, dcolumn = TRUE)

# Ordinary least squares model (example from the 'lm' help file)
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2,10,20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
table.string <- texreg(lm.D9, return.string = TRUE)
cat(table.string)

}
\references{
Leifeld, Philip (2013). texreg: Conversion of Statistical Model
  Output in R to LaTeX and HTML Tables. Journal of Statistical Software
  55(8): 1-24. \doi{10.18637/jss.v055.i08}.
}
\seealso{
\code{\link{texreg-package}} \code{\link{extract}}

Other texreg: 
\code{\link{htmlreg}()},
\code{\link{huxtablereg}()},
\code{\link{knitreg}()},
\code{\link{matrixreg}()},
\code{\link{plotreg}()},
\code{\link{screenreg}()},
\code{\link{wordreg}()}
}
\author{
Philip Leifeld
}
\concept{texreg}
\keyword{IO}
\keyword{misc}
\keyword{print}
\keyword{programming|interface}
\keyword{utilities}
