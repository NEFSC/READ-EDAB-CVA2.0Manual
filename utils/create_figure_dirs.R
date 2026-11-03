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

here::i_am('utils/create_figure_dirs.R')

for (x in 1:length(species_names)) {
  dir.create(
    file.path(
      here::here('figures'),
      species_names[x]
    ),
    showWarnings = T
  ) #main folder
}
