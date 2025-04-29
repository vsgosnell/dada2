# 1. Sum total reads for each ASV across all samples
asv_sums <- colSums(seqtab.nochim)

# 2. Identify Top 5 ASVs (by total abundance)
top5_ids <- order(asv_sums, decreasing = TRUE)[1:5]

# 3. Extract Top 5 taxonomy
top5_taxa <- taxa[top5_ids, ]

# 4. Extract Top 5 counts
top5_counts <- asv_sums[top5_ids]

# 5. Total reads across all ASVs
total_reads <- sum(seqtab.nochim)

# 6. Calculate individual % for each Top 5 ASV
top5_percent_each <- (top5_counts / total_reads) * 100

# 7. Calculate combined total % for the Top 5 ASVs
top5_percent_total <- sum(top5_percent_each)

# 8. Print everything
cat("Top 5 most abundant ASVs, their taxonomy (Phylum to Genus), and individual % abundance:\n\n")
for (i in 1:5) {
  cat(paste0(
    "ASV ", i, ": ",
    paste(na.omit(top5_taxa[i, 1:6]), collapse = " ; "),
    "\n",
    "Reads: ", top5_counts[i],
    " (", sprintf("%.2f", top5_percent_each[i]), "% of total)\n\n"
  ))
}

cat(sprintf("Combined, the Top 5 ASVs account for %.2f%% of total reads.\n", top5_percent_total))
