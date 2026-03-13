#!/bin/bash
#
# Add a new talk to the website.
#
# Usage:
#   ./add-talk.sh "2026-03-27" "Speaker Name" "Talk Title" path/to/slides.pdf
#
# Example:
#   ./add-talk.sh "2026-03-27" "Jane Doe" "Scaling DynamoDB" ~/Downloads/scaling-dynamodb.pdf
#

set -euo pipefail

if [ $# -lt 4 ]; then
  echo ""
  echo "  Usage: ./add-talk.sh <date> <speaker> <title> <pdf-path>"
  echo ""
  echo "  Example:"
  echo "    ./add-talk.sh \"2026-03-27\" \"Jane Doe\" \"Scaling DynamoDB\" ~/Downloads/scaling-dynamodb.pdf"
  echo ""
  exit 1
fi

DATE="$1"
SPEAKER="$2"
TITLE="$3"
PDF_PATH="$4"

# Derive folder name from date (YYYYMMDD)
FOLDER=$(echo "$DATE" | tr -d '-')
DEST_DIR="public/meetups/$FOLDER"
PDF_NAME=$(basename "$PDF_PATH")

# Create destination folder
mkdir -p "$DEST_DIR"

# Copy PDF
cp "$PDF_PATH" "$DEST_DIR/$PDF_NAME"
echo "Copied: $PDF_PATH -> $DEST_DIR/$PDF_NAME"

# Build the JSON entry
URL="/meetups/$FOLDER/$PDF_NAME"
ENTRY=$(cat <<EOF
  {
    "date": "$DATE",
    "title": "$TITLE",
    "speaker": "$SPEAKER",
    "url": "$URL"
  }
EOF
)

# Insert at the top of the talks array (after the opening bracket)
TALKS_FILE="src/data/talks.json"
TMPFILE=$(mktemp)
head -1 "$TALKS_FILE" > "$TMPFILE"
echo "$ENTRY," >> "$TMPFILE"
tail -n +2 "$TALKS_FILE" >> "$TMPFILE"
mv "$TMPFILE" "$TALKS_FILE"

echo "Added to $TALKS_FILE:"
echo ""
echo "  $DATE — $SPEAKER: $TITLE"
echo "  PDF: $URL"
echo ""
echo "Done! Commit and push to deploy."
