#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title YouTube Transcript to Clipboard
# @raycast.mode silent
# @raycast.packageName YouTube Tools

# Optional parameters:
# @raycast.icon 📺
# @raycast.argument1 { "type": "text", "placeholder": "YouTube URL", "optional": false }

# Documentation:
# @raycast.description Extract YouTube transcript from URL and copy to clipboard
# @raycast.author Andy Dai
# @raycast.authorURL https://github.com/daikeren

# Function to extract YouTube ID from various URL formats
extract_youtube_id() {
  local url="$1"
  local youtube_id=""

  # Check if input is already just an ID (11 characters)
  if [[ "$url" =~ ^[a-zA-Z0-9_-]{11}$ ]]; then
    youtube_id="$url"
  # Standard youtube.com watch URL
  elif [[ "$url" =~ youtube\.com/watch\?v=([a-zA-Z0-9_-]{11}) ]]; then
    youtube_id="${BASH_REMATCH[1]}"
  # Shortened youtu.be URL
  elif [[ "$url" =~ youtu\.be/([a-zA-Z0-9_-]{11}) ]]; then
    youtube_id="${BASH_REMATCH[1]}"
  # YouTube shorts URL
  elif [[ "$url" =~ youtube\.com/shorts/([a-zA-Z0-9_-]{11}) ]]; then
    youtube_id="${BASH_REMATCH[1]}"
  # Embedded URL
  elif [[ "$url" =~ youtube\.com/embed/([a-zA-Z0-9_-]{11}) ]]; then
    youtube_id="${BASH_REMATCH[1]}"
  # Mobile URL
  elif [[ "$url" =~ m\.youtube\.com/watch\?v=([a-zA-Z0-9_-]{11}) ]]; then
    youtube_id="${BASH_REMATCH[1]}"
  fi

  echo "$youtube_id"
}

# Get the YouTube URL from the argument
youtube_url="$1"

# Extract the video ID
video_id=$(extract_youtube_id "$youtube_url")

if [ -z "$video_id" ]; then
  echo "Error: Could not extract YouTube video ID from URL"
  exit 1
fi

# Run the youtube_transcript_api command
echo "Extracting transcript for video ID: $video_id"
uvx youtube_transcript_api "$video_id" --format srt | pbcopy

if [ $? -eq 0 ]; then
  echo "✅ Transcript copied to clipboard!"
else
  echo "❌ Failed to extract transcript"
  exit 1
fi
