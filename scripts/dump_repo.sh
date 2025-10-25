#!/usr/bin/env bash
# save as dump_repo.sh and make executable with chmod +x dump_repo.sh

# Generate a timestamp like 2025-10-04_22-45-03
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Make a directory for this dump
outdir="repo_dump/${timestamp}"
mkdir -p "$outdir"

# Output file path
outfile="${outdir}/repo_dump.txt"

echo "Creating dump at: $outfile"

# Dump all tracked files (respects .gitignore)
git ls-files | while read -r f; do
  echo -e "\n==================== $f ====================\n" >> "$outfile"
  cat "$f" >> "$outfile"
done

echo "Done. Repo dump saved in: $outfile"
