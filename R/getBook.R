getBook <- function (libraryName="Tebyan", bookId, bookCodename, pageId, pageIndex = c(1)) {

  require(CSS)

  if (libraryName=="Tebyan") {

    base.url = "http://library.tebyan.net/index.aspx"
    # http://library.tebyan.net/newindex.aspx?pid=19667&BookID=4465&PageIndex=2&Language=1#p1

    book.id <- bookId
    book.codename <- bookCodename
    page.id <- pageId
    page.id <- pageIndex


    dir.raw.data <- paste("../raw.data", book.codename, sep="/")

    dir.create(dir.raw.data, recursive = T)

    for(page.index in page.index){

      pth.page.text <- sprintf("%s/%03s.text.txt", dir.raw.data, page.index)
      pth.page.title <- sprintf("%s/%03s.title.txt", dir.raw.data, page.index)

      doc <- sprintf("%s?pid=%s&BookID=%s&PageIndex=%s&Language=1"
                     , base.url, page.id, book.id, page.index)
      doc <- htmlParse(doc, encoding = "utf-8")

      doc.title <- cssApply(doc, "#BookPage>h1", cssCharacter)
      doc.rights <- cssApply(doc, ".RightPoem>nobr", cssCharacter)
      doc.lefts <- cssApply(doc, ".LeftPoem>nobr", cssCharacter)

      cat(file=pth.page.text, paste(doc.rights, doc.lefts, sep=" --- "), sep="\n")
      cat(file=pth.page.title, doc.title, sep="\n")

    }

  } else {

    message("Not implemented yet.")

  }

}
