here::i_am("READ-EDAB-CVA2.0Manual/utils/get_narrative_figures.R")

species_names <- c(
  "American Lobster",
  "Atlantic cod",
  "Atlantic croaker",
  "Atlantic halibut",
  "Atlantic herring",
  "Atlantic mackerel",
  "Atlantic Menhaden",
  "Atlantic sea scallop",
  "Atlantic surfclam",
  "Atlantic wolffish",
  "Black sea bass",
  "Blue Crab",
  "Bluefin Tuna",
  "Bluefish",
  "Blueline tilefish",
  "Butterfish",
  "Chub mackerel",
  "Cobia",
  "Eastern Oyster",
  "Golden tilefish",
  "Haddock",
  "Longfin squid",
  "Monkfish",
  "Northern Quahog",
  "Ocean pout",
  "Ocean quahog",
  "Pollock",
  "Red Drum",
  "Scup",
  "Shortfin squid",
  "Smooth dogfish",
  "Softshell clam",
  "Spanish mackerel",
  "Spiny dogfish",
  "Striped bass",
  "Summer flounder",
  "Tautog",
  "White hake",
  "Windowpane flounder",
  "Winter flounder",
  "Witch flounder",
  "Yellowtail flounder"
)

source(here::here('utils', 'gather_figures.R'))

for(x in species_names){

# Define which ID string applies to which external directory
my_sources <- list(
  # Vulnerability 
  here::here("Vulnerability", gsub(' ', '', x), "Figures") = list(id = "r20250715_20142023_r20250925_i202501", contains = c('total_vulnerability_map_only_all_var', "combined_table")),
  
  #Exposure
  here::here("Exposure", gsub(' ', '', x), "Figures") = list(id = "r20250715_20142023_r20250925_i202501", contains = c('total_exposure_map_only_all_var', 'total_exposure_timeseries_only_all_var', 'variable_exposure', 'total_exposure_map_timeseries_imp_var')),
  
  #Sensitivity
  here::here("Sensitivity", 'Final', 'rasters') = list(id = "2.0", contains = gsub(' ', '', x)),
  
  #Dist shifts 
  here::here("AdditionalMetrics", 'DistributionChange', gsub(' ', '', x)) = list(id = "2.0", contains = 'r20250715_r20250925_i202501')
)

# Run the function
gather_figures(
  source_mapping = my_sources,
  target_dir = here::here('READ-EDAB-CVA2.0Manual', 'figures', x)
)

}