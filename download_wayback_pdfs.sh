#!/bin/bash

# Usage: ./download_wayback_pdfs.sh urls.txt

if [ $# -ne 1 ]; then
    echo "Usage: $0 <url_list.txt>"
    exit 1
fi

input_file="$1"
output_dir="wayback_pdfs"

mkdir -p "$output_dir"

while IFS= read -r original_url; do
    [ -z "$original_url" ] && continue

    echo "[*] Checking Wayback Machine for: $original_url"

    # Query the latest archived snapshot from Wayback Machine CDX API
    archive_url=$(curl -s "http://archive.org/wayback/available?url=${original_url}" | \
        grep -oP '"url":\s*"\K[^"]+' | head -n1)

    if [[ -n "$archive_url" ]]; then
        filename=$(basename "$original_url")
        echo "[+] Found archived version. Downloading to $output_dir/$filename"
        curl -sL "$archive_url" -o "$output_dir/$filename" -k
    else
        echo "[!] No archived version found."
    fi

done < "$input_file"
