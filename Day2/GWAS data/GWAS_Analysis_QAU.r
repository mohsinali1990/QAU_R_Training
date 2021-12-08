#author: "Dr. Mohsin Ali"
#title: "GWAS analsyis with rMVP and mrMLM"
#date: "11/22/2021"

# Required R packages

# install.packages("rMVP", dependencies = T, quiet = T)
# install.packages("mrMLM.GUI", dependencies = T, quiet = T)

#Load R packages

library(rMVP)
library(mrMLM.GUI)

#GWAS analysis with rMVP package

# Note:
# If you have genotype data in Hapmap format:
# MVP.Data function will prepare input data files to run GWAS

MVP.Data(fileHMP="Genotypic.hmp.txt",
         sep.hmp="\t",
         SNP.effect="Add",
         fileKin=FALSE,
         filePC=FALSE,
         out="mvp",
)

#lets run GWAS analysis.
#if any error comes, please close the RStudio and run this code (i.e. line 12 and 13) just after loading R packages.

# Prepare input files for rMVP package

MVP.Data.Kin(TRUE, mvp_prefix='mvp', out='mvp')
genotype <- attach.big.matrix("mvp.geno.desc")
pheno <- read.delim("Pheno_193.txt", sep = "\t", na.strings = c("NA", "-999"))
map <- read.table("mvp.geno.map" , head = TRUE)
Kinship <- attach.big.matrix("mvp.kin.desc")


Ntraits <- length(2:ncol(pheno))
print(paste0("Number of traits=", Ntraits ))

dir.create("rMVP_outputs")
list.dirs()
setwd("./rMVP_outputs/")

for(i in 2:ncol(pheno)){
  imMVP  <- MVP(
  phe = pheno[, c(1, i)],
  geno = genotype,
  map = map,
  K = Kinship,
  method = c("GLM", "MLM", "FarmCPU"),
  nPC.GLM = 3,
  nPC.MLM = 3, 
  threshold=1, # i.e., 1/total number of SNPs
  nPC.FarmCPU=3,
  priority="speed"
  )
  gc()
}


#GWAS analysis with mrMLM package 
#GUI 
mrMLM.GUI()
