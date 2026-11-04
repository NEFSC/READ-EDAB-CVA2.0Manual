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

source(here::here("READ-EDAB-CVA2.0Manual", 'utils', 'gather_figures.R'))

for(x in species_names){

  # 1. Define the configurations (the right side) as an unnamed list
  my_sources <- list(
    # Vulnerability
    list(dir = here::here("Vulnerability", gsub(' ', '', x), "Figures"),
           id = c("r20250715_20142023_r20250925_i202501"), 
         contains = c("combined_table")),
    
    list(dir = here::here("Vulnerability", gsub(' ', '', x), "Figures"),
         id = c("r20250925_i202501_r20250715_20142023"), 
         contains = c('map_only_all_var')),
    
    # Exposure
    list(dir = here::here("Exposure", gsub(' ', '', x), "Figures"),
         id = "r20250925_i202501_r20250715_20142023", 
         contains = c('map_only_all_var', 'timeseries_only_all_var', 'variable_exposure', 'map_timeseries_imp_var')),
    
    # Sensitivity
    list(dir = here::here("Sensitivity", 'Final', 'rasters'),
         id = "2.0", 
         contains = gsub(' ', '', x)),
    
    # Dist shifts 
    list(dir = here::here("AdditionalMetrics", 'DistributionChange', gsub(' ', '', x)),
         id = 'r20250715_r20250925_i202501', 
         contains = 'distribution_shift')
  )

# Run the function
gather_figures(
  source_mapping = my_sources,
  target_dir = here::here('READ-EDAB-CVA2.0Manual', 'figures', x)
)

print(x)

}
