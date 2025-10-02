#!/usr/bin/env bash
set -e

# ===== 설정: 여기에 Google Drive 파일 ID와 출력 파일명 쓰기 =====
FILE_ID="1EVf5-Our9h5Cd8XH2WquE8bDDBtvi0VJ"
OUTFILE="과제_생성기.zip"
# =============================================================

# 1) gdown 있는지 확인, 없으면 설치 시도
if ! command -v gdown >/dev/null 2>&1; then
  echo "gdown not found. Installing..."
  pip install --user gdown || { echo "pip install failed. Please install gdown manually."; exit 1; }
fi

# 2) 다운로드
echo "Downloading ${OUTFILE} from Google Drive (id=${FILE_ID})..."
gdown "${FILE_ID}" -O "${OUTFILE}"

# 3) 압축 풀기 (원하면)
if command -v unzip >/dev/null 2>&1; then
  echo "Unzipping ${OUTFILE}..."
  unzip -o "${OUTFILE}"
else
  echo "unzip not found. Please unzip ${OUTFILE} manually."
fi

echo "Done."
