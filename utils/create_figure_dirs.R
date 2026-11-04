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
