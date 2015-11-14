library(rvest)
library(XML)

html <- read_html("http://arxiv.org/list/cs.AI/pastweek?skip=0&show=10")
sg_articletitles <- '.list-title'
AI_titles <- html_nodes(html, sg_articletitles)
html_text(AI_titles)

sg_arxlink <- '.list-identifier a:nth-child(1) , dt:nth-child(5) a:nth-child(2)'
AI_arxlink <- html_nodes(html, sg_arxlink)
html_text(AI_arxlink)


sg_pdf <- '.list-identifier a:nth-child(2)'
AI_pdf <- html_nodes(html, sg_pdf)
html_text(AI_pdf)

sg_abstract <- '.list-identifier a:nth-child(1)'
AI_abstract <- html_nodes(html, sg_abstract)
html_text(AI_abstract)
cleanFun(AI_abstract)
dearxiv(cleanFun(AI_abstract))

# from Scott Ritchie in an answer on SO
# http://stackoverflow.com/questions/17227294/removing-html-tags-from-a-string-in-r
cleanFun <- function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}

dearxiv <- function(htmlString) {
  return(gsub("arXiv:", "", htmlString))
}

detitlejunk <- function(junkyTitle) {
  
}