"disjoin" <-
function(x) {
	# x must be a factor data, for instance obtained using cut()
	# Can be tested only in R
	if (exists("is.R") && is.function(is.R) && is.R()) {	# We are in R
		if (is.null(class(x)) || class(x) != "factor")
			stop("x must be a variable of class 'factor', use cut() to create classes")
	}
	n <- length(x)
	nf <- length(levels(x))
	pos <- split(1:n, cut(Z, breaks=cuts))
	for (i in 1:nf) {
		temp <- rep(0, n)
		temp[pos[[i]]] <- 1
		if (i == 1) res <- temp else res <- cbind(res, temp)
	}
	dimnames(res) <- list(names(x), levels(x))
	res
}
