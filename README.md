# YouTube Transcript to Clipboard - Raycast Extension

A Raycast script command that extracts YouTube video transcripts and copies them to your clipboard in SRT format.

## Features

- Extract transcripts from YouTube videos using various URL formats
- Supports multiple YouTube URL types:
  - Standard: `https://youtube.com/watch?v=VIDEO_ID`
  - Shortened: `https://youtu.be/VIDEO_ID`
  - Shorts: `https://youtube.com/shorts/VIDEO_ID`
  - Embedded: `https://youtube.com/embed/VIDEO_ID`
  - Mobile: `https://m.youtube.com/watch?v=VIDEO_ID`
  - Direct video ID input
- Automatically copies transcript to clipboard in SRT format
- Silent mode execution for seamless workflow

## Requirements

- [Raycast](https://raycast.com/) installed
- `uvx` (part of [uv](https://docs.astral.sh/uv/) package manager)
- `youtube_transcript_api` Python package

## Installation

1. Install uv package manager if not already installed:
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

2. Clone or download this repository to your Raycast scripts directory

3. Make the script executable:
   ```bash
   chmod +x youtube-transcript.sh
   ```

4. The script will automatically install `youtube_transcript_api` via `uvx` when first run

## Usage

1. Open Raycast 
2. Type "YouTube Transcript to Clipboard"
3. Paste or type a YouTube URL
4. The transcript will be extracted and automatically copied to your clipboard

## Supported URL Formats

- `https://www.youtube.com/watch?v=dQw4w9WgXcQ`
- `https://youtu.be/dQw4w9WgXcQ`
- `https://www.youtube.com/shorts/dQw4w9WgXcQ`
- `https://www.youtube.com/embed/dQw4w9WgXcQ`
- `https://m.youtube.com/watch?v=dQw4w9WgXcQ`
- `dQw4w9WgXcQ` (direct video ID)

## Author

Andy Dai - [@daikeren](https://github.com/daikeren)
