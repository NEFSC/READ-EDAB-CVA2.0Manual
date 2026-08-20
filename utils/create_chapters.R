species_names <- c(
  "American lobster",
  "Atlantic cod",
  "Atlantic croaker",
  "Atlantic halibut",
  "Atlantic herring",
  "Atlantic mackerel",
  "Atlantic menhaden",
  "Atlantic sea scallop",
  "Atlantic surfclam",
  "Atlantic wolffish",
  "Black sea bass",
  "Blue crab",
  "Bluefin tuna",
  "Bluefish",
  "Blueline tilefish",
  "Butterfish",
  "Chub mackerel",
  "Cobia",
  "Eastern oyster",
  "Golden tilefish",
  "Haddock",
  "Longfin squid",
  "Monkfish",
  "Northern Quahog",
  "Ocean pout",
  "Ocean quahog",
  "Pollock",
  "Red drum",
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

sci_names <- c(
  "Homarus americanus",
  "Gadus morhua",
  "Micropogonias undulates",
 "Hippoglossus hippoglossus",
  "Clupea harengus",
  'Scomber scombrus',
  'Brevoortia tyrannus',
  'Placopecten magellanicus',
  'Spisula solidissima',
  'Anarhichas lupus',
  'Centropristis striata',
  'Callinectes sapidus',
  'Thunnus thynnus',
  'Pomatomus saltatrix',
  'Caulolatilus microps',
  'Peprilus triacanthus',
  'Scomber colias',
  'Rachycentron canadum',
  'Crassostrea virginica',
  'Lopholatilus chamaeleonticeps',
  'Melanogrammus aeglefinus',
  'Doryteuthis (Amerigo) pealeii',
  'Lophius americanus',
  'Mercenaria mercenaria',
  'Zoarces americanus',
  'Arctica islandica',
  'Pollachius virens',
  'Sciaenops ocellatus',
  'Stenotomus chrysops',
  'Illex illecebrosus',
  'Mustelus canis',
  'Mya arenaria',
 'Scomberomorus maculatus',
  'Squalus acanthias',
  'Morone saxatilis',
  'Paralichthys dentatus',
  'Tautoga onitis',
  'Urophycis tenuis',
  'Scophthalmus aquosus',
  'Pseudopleuronectes americanus',
  'Glyptocephalus cynoglossus',
  'Limanda ferruginea'
)

create_child <- function(species_name, scientific_name) {
  filename <- here::here("chapters", paste0(species_name, ".qmd"))
  file.create(filename)

  # knit_expand accepts both variables as parameters
  content <- knitr::knit_expand(
    file = here::here("utils/child_doc.qmd"),
    species = species_name,
    scientific_name = scientific_name
  )
  
  # writeLines automatically creates/overwrites the file
  writeLines(text = content, con = filename)
}

purrr::walk2(.x = species_names,
           .y = sci_names, 
           ~ create_child(species_name = .x, scientific_name = .y))
