FROM nikolaik/python-nodejs:python3.10-nodejs19

# Install dependencies (ffmpeg + aria2 + certificates)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ffmpeg \
       aria2 \
       ca-certificates \
       curl \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app/
WORKDIR /app/

# Upgrade pip and install requirements
RUN python -m pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir --upgrade -r requirements.txt

# Default start command
CMD ["python3", "-m", "ANNIEMUSIC"]
