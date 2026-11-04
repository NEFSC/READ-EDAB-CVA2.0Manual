gather_figures <- function(source_mapping, 
                                 target_dir = "./quarto_book/figures") {
  
  # 1. Clean the target directory
  if (dir.exists(target_dir)) {
    cat(sprintf("Cleaning out old figures in %s...\n", target_dir))
    old_files <- list.files(target_dir, 
                            pattern = "\\.(png|jpg|jpeg|svg|pdf|gif)$", 
                            ignore.case = TRUE, 
                            full.names = TRUE)
    if (length(old_files) > 0) file.remove(old_files)
  } else {
    dir.create(target_dir, recursive = TRUE, showWarnings = FALSE)
  }
  
  count <- 0
  
  # 2. Iterate directly through each configuration block
  for (config in source_mapping) {
    
    # Extract the requirements (directory is now inside the config)
    src_path <- path.expand(config$dir) 
    id_string <- config$id
    must_contain <- config$contains 
    
    cat(sprintf("\n----------------------------------------\n"))
    cat(sprintf("Checking Directory: %s\n", src_path))
    
    if (!dir.exists(src_path)) {
      cat("  [!] Warning: Directory does not exist. Skipping.\n")
      next
    }
    
    # Step 1: Grab EVERYTHING in the folder first
    all_files <- list.files(src_path, full.names = TRUE, recursive = TRUE)
    cat(sprintf("  -> Found %d total files in folder.\n", length(all_files)))
    
    if (length(all_files) == 0) next
    
    # Step 2: Filter by file extension
    ext_matches <- grepl("\\.(png|jpg|jpeg|svg|pdf|gif)$", basename(all_files), ignore.case = TRUE)
    files_to_copy <- all_files[ext_matches]
    cat(sprintf("  -> %d files passed the extension filter.\n", length(files_to_copy)))
    
    if (length(files_to_copy) == 0) next
    
    # Step 3: Filter by ID(s)
    id_regex <- paste(id_string, collapse = "|")
    id_matches <- grepl(id_regex, basename(files_to_copy), ignore.case = TRUE)
    files_to_copy <- files_to_copy[id_matches]
    cat(sprintf("  -> %d files passed the ID filter ('%s').\n", length(files_to_copy), id_regex))
    
    if (length(files_to_copy) == 0) next
    
    # Step 4: Filter by 'contains' keyword(s)
    if (!is.null(must_contain) && length(must_contain) > 0) {
      search_pattern <- paste(must_contain, collapse = "|")
      keyword_matches <- grepl(search_pattern, basename(files_to_copy), ignore.case = TRUE)
      files_to_copy <- files_to_copy[keyword_matches]
      
      keyword_msg <- paste(must_contain, collapse = " OR ")
      cat(sprintf("  -> %d files passed the keyword filter ('%s').\n", length(files_to_copy), keyword_msg))
    }
    
    # Step 5: Copy the filtered files
    for (file_path in files_to_copy) {
      file_name <- basename(file_path)
      dest_path <- file.path(target_dir, file_name)
      
      if (file.copy(from = file_path, to = dest_path, overwrite = TRUE)) {
        cat(sprintf("  [COPIED]: %s\n", file_name))
        count <- count + 1
      }
    }
  }
  
  cat(sprintf("\n========================================\n"))
  cat(sprintf("Successfully moved %d total figures.\n", count))
  return(invisible(count))
}