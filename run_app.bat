@echo off
echo Starting Bird Sound Classification App...
echo.
echo Make sure you have:
echo - model.h5 file in the current directory
echo - prediction.json file in the current directory
echo.
echo The app will open in your browser automatically...
echo Press Ctrl+C to stop the server
echo.
python -m streamlit run app.py
