#!/bin/bash
FILE_ID="구글드라이브_파일_ID"
FILE_NAME="문제_생성기.zip"

# gdown 설치 필요 (Python)
pip install gdown

# Google Drive에서 다운로드
gdown $FILE_ID -O $FILE_NAME
