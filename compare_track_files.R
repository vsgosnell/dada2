# check if track_original and track_new are identical

# track_new has updated filtering parameters + minBoot = 50

# check if the tracks are identical
identical(track_original, track_new)

# get the difference between the sets
all.equal(track_original, track_new)
    # [1] "Mean relative difference: 0.538144"

# View both tables
View(track_original)
View(track_new)


# track_new2 has the same filtering parameters as track_original
# only change is minBoot = 50

identical(track_original, track_new2)
      # [1] TRUE

all.equal(track_original, track_new2)
      # [1] TRUE

View(track_original)
View(track_new2)
      # have the same values




# Count NAs for original taxonomy assignment
sum(is.na(taxa))
    # [1] 328

# Count NAs for new taxonomy assignment with minBoot = 50
sum(is.na(taxa_boot50))
    # [1] 330


# comparing NAs per taxonomic level
na_by_column_original <- colSums(is.na(taxa))
na_by_column_boot50 <- colSums(is.na(taxa_boot50))

na_comparison <- data.frame(
  TaxonomicLevel = colnames(taxa),
  NA_original = na_by_column_original,
  NA_boot50 = na_by_column_boot50
)

print(na_comparison)

#     TaxonomicLevel           NA_original NA_boot50
# Kingdom        Kingdom           0         0
# Phylum          Phylum           0         0
# Class            Class           0         0
# Order            Order           0         0
# Family          Family          22        22
# Genus            Genus         104       105
# Species        Species         202       203

