extractSQLquery <- function(file, nameQuery, beginMarker= paste0("^-- <",nameQuery,">$"), endMarker= paste0("^-- <",nameQuery," END>$"),maketmpfile=F)
{
  allFile <- readLines(file)
  lineBegin <- which(grepl(beginMarker,allFile))
  stopifnot(length(lineBegin) == 1)
  lineEnd <- grep(endMarker,allFile)
  stopifnot(length(lineEnd) ==1)
  stopifnot(lineEnd>lineBegin)
  if(!maketmpfile)
  {return(paste(allFile[(lineBegin+1):(lineEnd-1)],collapse = "\n"))}else{
    tmp <- tempfile(fileext = ".sql")
    writeLines(allFile[(lineBegin+1):(lineEnd-1)],tmp)
    return(tmp)
  }
}
