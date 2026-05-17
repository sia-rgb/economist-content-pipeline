@echo off
python -m uvicorn app:APP --app-dir src --host 127.0.0.1 --port 8000
