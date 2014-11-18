#' Gets Shahname
#' @export
getShahnameh <- function () {

  book.id <- 4465
  book.codename <- "shahname"
  page.id <- 19667
  page.index <- c(1:674)

  getBook(libraryName="Tebyan", bookId = book.id, bookCodename=book.codename
          , pageId=page.id, pageIndex = page.index)

}
