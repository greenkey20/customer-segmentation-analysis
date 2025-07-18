#!/bin/bash
# 터미널 상태 확인 스크립트

echo "======================================"
echo "🔍 현재 실행 중인 Python 프로세스"
echo "======================================"
ps aux | grep python | grep -v grep

echo ""
echo "======================================"
echo "🌐 현재 열려있는 포트"
echo "======================================"
lsof -i :8000 2>/dev/null || echo "포트 8000: 사용 중이지 않음"
lsof -i :8501 2>/dev/null || echo "포트 8501: 사용 중이지 않음"

echo ""
echo "======================================"
echo "📁 현재 디렉토리"
echo "======================================"
pwd

echo ""
echo "======================================"
echo "🎯 실행 중인 서버 접속 방법"
echo "======================================"
if lsof -i :8000 >/dev/null 2>&1; then
    echo "✅ FastAPI 서버 실행 중"
    echo "   - API 문서: http://localhost:8000/docs"
    echo "   - 상태 확인: http://localhost:8000/api/v1/health"
    echo "   - 통계: http://localhost:8000/api/v1/stats"
else
    echo "❌ FastAPI 서버 실행 중이지 않음"
fi

if lsof -i :8501 >/dev/null 2>&1; then
    echo "✅ Streamlit 앱 실행 중"
    echo "   - 웹 앱: http://localhost:8501"
else
    echo "❌ Streamlit 앱 실행 중이지 않음"
fi
