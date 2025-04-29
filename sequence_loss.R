# How to calculate % loss:
# Each row of out shows input and filtered reads for each sample.

percent_loss <- (1 - (out[,2] / out[,1])) * 100
                               # out[,1] = input reads
                    # out[,2] = filtered reads that passed


loss_percentage <- (1 - (out[,2] / out[,1])) * 100
loss_table <- data.frame(Sample = rownames(out),
                         Input = out[,1],
                         Filtered = out[,2],
                         LossPercent = round(loss_percentage, 2))

print(loss_table)

print(out)



# Compare the number of ASVs (at the end) to the original pipeline.

# count final ASVs:
dim(seqtab.nochim)[2]
    # [1] 202
    # original pipeline was 232
