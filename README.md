# Wayback Machine PDF Downloader

This repository contains a Bash script that retrieves archived versions of PDF files from the **Wayback Machine**.  
It checks whether a URL has been archived, and if available, downloads the most recent snapshot.

## Requirements

- A Unix-like environment (Linux, macOS, or WSL on Windows).  
- `curl` installed.  

## Usage

1. Download or clone the repository

```
git clone https://github.com/shauntdergrigorian/Wayback-PDF-Downloader.git
```

2. Make the script executable:

```
cd Wayback-PDF-Downloader
chmod +x download_wayback_pdfs.sh
```

3. Prepare a text file (e.g., `urls.txt`) containing URLs of PDFs (one per line).  

Example `urls.txt`:

```
https://example.com/report1.pdf
https://example.com/report2.pdf
```

4. Run the script with your input file:  

```bash
./download_wayback_pdfs.sh urls.txt
```

## Behavior

- The script queries the **Wayback Machine CDX API** for each URL in the list.  
- If an archived version is found, it downloads the most recent snapshot.  
- Downloaded files are saved into a folder called `wayback_pdfs/`.  
- If no archived version is found, the script prints a warning message.  

## Example Output

```
[*] Checking Wayback Machine for: https://example.com/report1.pdf
[+] Found archived version. Downloading to wayback_pdfs/report1.pdf
[*] Checking Wayback Machine for: https://example.com/report2.pdf
[!] No archived version found.
```

## Notes

- Only the **latest archived snapshot** is retrieved.  
- Downloads are named based on the original filename in the URL.  
- If multiple different files share the same name (e.g., `index.pdf`), later downloads may overwrite earlier ones.  

## License

This script is provided under the MIT License. See the [LICENSE](LICENSE) file for details.
