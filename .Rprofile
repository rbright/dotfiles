.First <- function() {
  library(ggplot2)
  library(stats)
  library(colorout)

  local({
    # Use the US repository for CRAN.
    r <- getOption("repos")
    r["CRAN"] <- "http://cran.us.r-project.org"
    options(repos=r)
    rm(r)

    # Change the default prompt.
    options(prompt="R> ", digits=4, show.signif.stars=F)
    options(showWarnCalls=T, showErrorCalls=T)
    Sys.setenv(R_HISTSIZE='100000')

    # Use Quartz for GUI output.
    f = pipe("uname")
    if (.Platform$GUI == "X11" && readLines(f) == "Darwin") {
      options(device='quartz')
    }
    close(f); rm(f)
  })
}
