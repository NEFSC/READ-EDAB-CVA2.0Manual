gather_figures <- function(source_mapping, 
                           target_dir) {
  
  # 1. Clean the target directory
  if (dir.exists(target_dir)) {
    cat(sprintf("Cleaning out old figures in %s...\n", target_dir))
    old_files <- list.files(target_dir, 
                            pattern = "\\.(png|pdf|gif)$", 
                            ignore.case = TRUE, 
                            full.names = TRUE)
    if (length(old_files) > 0) file.remove(old_files)
  } else {
    dir.create(target_dir, recursive = TRUE, showWarnings = FALSE)
  }
  
  count <- 0
  
  # 2. Iterate over the named list 
  for (src in names(source_mapping)) {
    
    # Extract the requirements for this specific directory
    id_string <- source_mapping[[src]]$id
    must_contain <- source_mapping[[src]]$contains 
    
    src_path <- path.expand(src) 
    
    if (!dir.exists(src_path)) {
      cat(sprintf("Warning: Source directory %s does not exist. Skipping.\n", src_path))
      next
    }
    
    # Step 1: Find all files matching the model version
    file_pattern <- paste0(".*_", id_string, ".*\\.(png|pdf|gif)$")
    files_to_copy <- list.files(src_path, 
                                pattern = file_pattern, 
                                ignore.case = TRUE, 
                                full.names = TRUE, 
                                recursive = TRUE)
    
    # Step 2: Filter further if a specific string is required
    if (!is.null(must_contain) && must_contain != "") {
      # grepl checks if the 'must_contain' string exists in the filename
      matches <- grepl(must_contain, basename(files_to_copy), ignore.case = TRUE)
      files_to_copy <- files_to_copy[matches]
    }
    
    cat(sprintf("Scanning %s for ID '%s' and keyword '%s'... Found %d files.\n", 
                src_path, id_string, ifelse(is.null(must_contain), "NONE", must_contain), length(files_to_copy)))
    
    # Step 3: Copy the filtered files
    for (file_path in files_to_copy) {
      file_name <- basename(file_path)
      dest_path <- file.path(target_dir, file_name)
      
      if (file.copy(from = file_path, to = dest_path, overwrite = TRUE)) {
        count <- count + 1
      }
    }
  }
  
  cat(sprintf("\nSuccessfully moved %d new figures.\n", count))
  return(invisible(count))
}