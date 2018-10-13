#! /usr/bin/Rscript
print("Running get_adjacencies.R subprocess")
args = commandArgs(trailingOnly=TRUE)

con_a = DBI::dbConnect(RSQLite::SQLite(), dbname=args[1])
con_b = DBI::dbConnect(RSQLite::SQLite(), dbname=args[2])
query_a <- DBI::dbSendQuery(con_a, "SELECT * FROM map")
query_b <- DBI::dbSendQuery(con_b, "SELECT * FROM map")
df_a <- DBI::dbFetch(query_a, n = -1)
df_b <- DBI::dbFetch(query_b, n = -1)

dupsBetweenGroups <- function (df, idcol) {
  datacols <- setdiff(names(df), idcol)
  sortorder <- do.call(order, df)
  df <- df[sortorder,]
  dupWithin <- duplicated(df)
  dupBetween = rep(NA, nrow(df))
  dupBetween[!dupWithin] <- duplicated(df[!dupWithin,datacols])
  dupBetween[!dupWithin] <- duplicated(df[!dupWithin,datacols], fromLast=TRUE) | dupBetween[!dupWithin]
  goodIdx <- !is.na(dupBetween)
  goodVals <- c(NA, dupBetween[goodIdx])
  fillIdx <- cumsum(goodIdx)+1
  dupBetween <- goodVals[fillIdx]
  dupBetween[sortorder] <- dupBetween
  return(dupBetween)
}

df_fake_merge <- rbind(df_a, df_b)
dupRows <- dupsBetweenGroups(df_fake_merge, "tile_id")
dupRows_eval <-cbind(df_fake_merge, dup=dupRows)
dupRows_eval_trueonly <- subset(dupRows_eval, dup==TRUE)
print(paste0(nrow(dupRows_eval_trueonly), " duplicates found."))
write.csv(dupRows_eval_trueonly, file = "temp_adj.csv",row.names=FALSE)