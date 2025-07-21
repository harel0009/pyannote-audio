FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    ffmpeg git curl python3-pip python3-dev build-essential

# התקנת torch לגרסת CUDA תואמת
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# התקנת pyannote וכל שאר התלויות
RUN pip3 install pyannote.audio==2.1.1 flask wget

WORKDIR /app
COPY . /app

CMD ["python3", "app.py"]
