\name{turnpoints}
\alias{turnpoints}
\alias{extract.turnpoints}
\alias{lines.turnpoints}
\alias{plot.turnpoints}
\alias{print.summary.turnpoints}
\alias{print.turnpoints}
\alias{summary.turnpoints}
\title{ Analyze turning points (peaks or pits) }
\description{
  Determine the number and the position of extrema (turning points, either peaks or pits) in a regular time series. Calculate the quantity of information associated to the observations in this series, according to Kendall's information theory
}
\synopsis{
turnpoints(x)
extract.turnpoints(e, n, no.tp=0, peak=1, pit=-1, ...)
lines.turnpoints(x, max=TRUE, min=TRUE, median=TRUE, col=c(4, 4, 2), lty=c(2, 2, 1), ...)
plot.turnpoints(x, level=0.05, lhorz=TRUE, lcol=2, llty=2, type="l", xlab="data number", ylab=paste("I (bits), level = ", level * 100, "\%", sep = ""), main=paste("Information (turning points) for:", x$data), ...)
print.summary.turnpoints(x, ...)
print.turnpoints(x, ...)
summary.turnpoints(object, ...)
}
\usage{
turnpoints(x)
\method{summary}{turnpoints}(turnp)
\method{plot}{turnpoints}(turnp, level=0.05, lhorz=TRUE, lcol=2, llty=2, \dots)
\method{lines}{turnpoints}(turnp, max=TRUE, min=TRUE, median=TRUE,
        col=c(4, 4, 2), lty=c(2, 2, 1), \dots)
\method{extract}{turnpoints}(turnp, n, no.tp=0, peak=1, pit=-1)
}
\arguments{
  \item{x}{ a vector or a time series }
  \item{turnp}{ a 'turnpoints' object, as returned by the function \code{turnpoints()} }
  \item{level}{ the significant level to draw on the graph if \code{lhorz=TRUE}. By default, \code{level=0.05}, which corresponds to a 5\% p-value for the test }
  \item{lhorz}{ if \code{lhorz=TRUE} (by default), an horizontal line indicating significant level is drawn on the graph }
  \item{lcol}{ the color to use to draw the significant level line, by default, color 2 is used }
  \item{llty}{ the style to use for the significant level line. By default, style 2 is used (dashed line) }
  \item{\dots}{ Additional graph parameters }
  \item{max}{ do we plot the maximum envelope line (by default, yes) }
  \item{min}{ do we plot the minimum envelope line (by default, yes) }
  \item{median}{ do we plot the median line inside the envelope (by default, yes) }
  \item{col}{ a vector of three values for the color of the max, min, median lines, respectively. By default \code{col=c(4,4,2)} }
  \item{lty}{ a vector of three values for the style of the max, min, median lines, respectively. By default \code{lty=c(2,2,1)}, that is: dashed, dashed and plain lines }
  \item{n}{ the number of points to extract. By default \code{n=length(turnp)}, all points are extracted }
  \item{no.tp}{ extract gives a vector representing the position of extrema in the original series. \code{no.tp} represents the code to use for points that are not an extremum, by default '0' }
  \item{peak}{ the code to use to flag a peak, by default '1' }
  \item{pit}{ the code to use to flag a pit, by default '-1' }
}
\details{
  This function tests if the time series is purely random or not. Kendall (1976) proposed a series of tests for this. Moreover, graphical methods using the position of the turning points to draw automatically envelopes around the data are implemented, and also the drawing of median points between these envelopes
}
\value{
  An object of type 'turnpoints' is returned. It has methods \code{print()}, \code{summary()}, \code{plot()}, \code{lines()} and \code{extract()}.
}
\references{ 
Kendall, M.G., 1976. \emph{Time-series, 2nd ed.} Charles Griffin & Co, London.
}
\author{ Frédéric Ibanez (\email{ibanez@obs-vlfr.fr}), Philippe Grosjean (\email{phgrosjean@sciviews.org}) }

\section{WARNING }{ the \code{lines()} method should be used to draw lines on the graph of the \emph{original} dataset (\code{plot(data, type="l")} for instance), \emph{not} on the graph of turning points (\code{plot(turnp)})! }

\seealso{ \code{\link{turnogram}}, \code{\link{stat.slide}} }

\examples{
data(marbio)
plot(marbio[, "Nauplii"], type="l")
# Calculate turning points for this series
Nauplii.tp <- turnpoints(marbio[, "Nauplii"])
summary(Nauplii.tp)
plot(Nauplii.tp)
# Add envelope and median line to original data
plot(marbio[, "Nauplii"], type="l")
lines(Nauplii.tp)
# Note that lines() applies to the graph of original dataset!!!
title("Raw data, envelope maxi., mini. and median line")
}
\keyword{ ts }
