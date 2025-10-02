#!/usr/bin/env bash
set -e

# Google Drive 파일 ID
FILE_ID="1EVf5-Our9h5Cd8XH2WquE8bDDBtvi0VJ"
OUTFILE="문제_생성기.zip"

# gdown 설치 확인 / 설치
if ! command -v gdown >/dev/null 2>&1; then
  echo "gdown not found. Installing..."
  pip install --user gdown || {
    echo "Failed to install gdown. Please install it manually."
    exit 1
  }
fi

# 다운로드
echo "Downloading ${OUTFILE} from Google Drive (id=${FILE_ID})..."
gdown "${FILE_ID}" -O "${OUTFILE}"

# 압축 해제 (unzip이 있을 경우)
if command -v unzip >/dev/null 2>&1; then
  echo "Unzipping ${OUTFILE}..."
  unzip -o "${OUTFILE}"
else
  echo "unzip not found. Please unzip ${OUTFILE} manually."
fi

echo "Done."
