# SCLCNF1
## Follow-up work will be added in the future

## Data
### Data could find at  https://support.10xgenomics.com/single-cell-gene-expression/datasets and https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE151658

## Compare methods and codes
| Year | Title                                                        | Paper    |Code    |
| ---- | ------------------------------------------------------------ | -------- | -------- |
| 2024 | Self-supervised deep clustering of single-cell RNA-seq data to hierarchically detect rare cell populations                         | [paper](https://academic.oup.com/bib/article/24/6/bbad335/7283019?searchresult=1)|[Code](https://github.com/shaoqiangzhang/DeepScena)
| 2024 | scSID: A lightweight algorithm for identifying rare cell types by capturing differential expression from single-cell sequencing data  | [paper](https://www.sciencedirect.com/science/article/pii/S2001037023005184)|[Code](https://github.com/lgmzfl/scSID)
| 2023 | CAKE: a flexible self-supervised framework for enhancing cell visualization, clustering and rare cell identification| [paper](https://doi.org/10.1093/bib/bbad475) |[code](https://github.com/CSUBioGroup/CAKE)
| 2022 | Learning discriminative and structural samples for rare cell types with deep generative model | [paper](https://academic.oup.com/bib/article/23/5/bbac317/6652812?login=false)|[code](https://github.com/xkmaxidian/scLDS2)  
| 2020 | Revealing Dynamics of Gene Expression Variability in Cell State Space |[paper](https://www.nature.com/articles/s41592-019-0632-3)|[code](https://github.com/dgrun/RaceID3_StemID2_package) 
| 2019 | CellSIUS provides sensitive and specific detection of rare cell populations from complex single-cell RNA-seq data| [paper](https://link.springer.com/article/10.1186/s13059-019-1739-7)|[code](https://github.com/Novartis/CellSIUS) 
| 2018| Discovery of rare cells from voluminous single cell expression data| [paper](https://www.nature.com/articles/s41467-018-07234-6)        |[code](https://github.com/princethewinner/FiRE) 
| 2018 | GiniClust2: a cluster-aware, weighted ensemble clustering method for cell-type detection |[paper](https://link.springer.com/article/10.1186/s13059-018-1431-3)|[code](https://github.com/dtsoucas/GiniClust2) 

## Installation
### Required R modules
```
R >= 4.1.0
```
## R packages prerequisites
```
library(Seurat)
library(parallel)
library(Matrix)
library(ggplot2)
library(KneeArrower)
library(irlba)
library(e1071)
```

## Overview
scLCNF is a new method for identifying rare cells by analyzing the features that are uniquely expressed in these cells. scLCNF creates a network of cellular connections that takes into account the relationship of each cell to its neighbors. The network helps pinpoint co-expression patterns unique to rare cells, using rarity scores to confirm their presence.

Demo
----

Run:

```bash
# Load required libraries and source functions
data_path='/github/data/10X_rare_new11__ExprM.RData'
load(data_path)
result=SCLCNF(data_name = ExprM.RawCounts)
result$rare_cell_indices

```
