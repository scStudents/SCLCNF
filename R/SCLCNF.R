# Load required libraries and source functions
source('/github/data/core_functions.R', chdir = TRUE)

 
data_path='/github/data/10X_rare_new11__ExprM.RData'
load(data_path) 

# Define the scLCNF function
SCLCNF <- function(data_name, neighbors = 15, max_dimension = 30,  n_cells_high = 20) {
  
  # Load data

  raw_counts <- data_name
  colna=c(1:dim(raw_counts)[2])
  colnames(raw_counts)<-colna
  # Perform cluster analysis
  data_analysis <- analysis_rare(raw_counts = raw_counts, neighbors = neighbors, max_dimension = max_dimension)
  data_clusters <- as.vector(data_analysis$seurat_clusters)
  norm_matrix <- as.matrix(GetAssayData(data_analysis, slot = "data", assay = "RNA"))
  knn_matrix <- as.matrix(data_analysis@graphs$RNA_nn)
  background_genes <- get_background_full(norm_matrix, n_cells_high = n_cells_high)
  gene_expression <- norm_matrix[background_genes, ]
  
  # Calculate HRG scores
  HRG_score <- calculate_HRG_score(gene_expression, knn_matrix)
  # Find significant genes
  significant_genes <- find_significant_genes(HRG_score)

  # Detect localized genes
  localized_genes <- detect_localized_genes(knn_matrix, norm_matrix, significant_genes, 100)
  # Identify rare cells
  rare_cells <- identify_rare_cells(data_analysis, localized_genes)
  
  # Result
 
  return(rare_cells)
}
result=SCLCNF(data_name = ExprM.RawCounts)

result$rare_cell_indices

















 
