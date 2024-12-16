# Code Concoction

A series of scripts.

## Table of Contents

- [Code Concoction](#code-concoction)
  - [Table of Contents](#table-of-contents)
  - [Scripts](#scripts)
    - [Find Files](#find-files)
      - [Description](#description)
      - [Usage](#usage)
      - [Considerations](#considerations)

## Scripts

### Find Files

#### Description

The `File Modification Time Finder` script is a utility that searches for files with a specific name within a given directory, retrieves their modification times, and outputs the results in a human-readable markdown table format. This script can be useful for system administrators or users who need to quickly identify when certain files were last modified.

#### Usage

```bash
chmod +x find-files.sh
./find-files.sh /path/to/directory filename.txt
# option to output to file
./find-files.sh /path/to/directory filename.txt output.md

# other execution options
curl -sSL <URL> | sh
```

- `<directory>`: The directory to search within.
- `<filename>`: The filename pattern to match (supports wildcards).
- [output_file]: Optional. If provided, the output will be written to this file in Markdown format.

#### Considerations

- Ensure the script has execute permissions before running it (`chmod +x script-to-markdown.sh`).
- The script assumes that `stat` and `date` commands are available on your system, which should be standard on most Unix-like systems.
