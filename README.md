# Audio Server - AI Music Generation

A production-ready Docker container that deploys [AudioCraft](https://github.com/facebookresearch/audiocraft)'s MusicGen model for AI-powered music generation.

## Overview

This project provides a self-hosted audio generation server using Meta's MusicGen model. It packages the entire ML inference pipeline into Docker containers with GPU acceleration support, making it easy to deploy and scale.

## Features

- **AI Music Generation** - Generate music from text prompts using state-of-the-art generative AI
- **GPU Acceleration** - NVIDIA GPU passthrough for fast inference (configured for RTX A6000)
- **Production-Ready** - Containerized deployment with automatic restart policies
- **Persistent Storage** - Model caching and output directory mounts for data persistence

## Tech Stack

| Component | Technology |
|-----------|------------|
| Container Runtime | Docker & Docker Compose |
| ML Framework | PyTorch 2.4.0 |
| AI Model | Meta MusicGen (AudioCraft) |
| Web Interface | Gradio 3.45.0 |
| GPU Acceleration | CUDA 12.4 |

## Getting Started

### Prerequisites

- Docker Engine 20.10+
- Docker Compose 2.0+
- NVIDIA GPU with CUDA drivers
- NVIDIA Container Toolkit

### Quick Start

```bash
# Clone and navigate to project
cd audio_server

# Start the server
docker compose up --build -d

# Access the web interface
open http://localhost:7860
```

### Configuration

The default configuration uses:
- **Port**: 7860
- **GPU**: NVIDIA RTX A6000 (device 0)
- **Output Directory**: `./output`
- **Model Cache**: `./models`

Modify `docker-compose.yaml` to change GPU device or other settings.

## Architecture

```
┌─────────────────────────────────────┐
│         Docker Host                 │
│  ┌───────────────────────────────┐  │
│  │    audiocraft_server          │  │
│  │  ┌─────────────────────────┐  │  │
│  │  │   Gradio UI (7860)      │  │  │
│  │  └─────────────────────────┘  │  │
│  │  ┌─────────────────────────┐  │  │
│  │  │   MusicGen Model        │  │  │
│  │  │   (GPU Accelerated)     │  │  │
│  │  └─────────────────────────┘  │  │
│  └───────────────────────────────┘  │
└─────────────────────────────────────┘
```

## Project Structure

```
audio_server/
├── Dockerfile            # Multi-stage build for AudioCraft
├── docker-compose.yaml  # Service orchestration with GPU config
├── output/              # Generated audio files (created at runtime)
└── models/              # HuggingFace model cache (created at runtime)
```

## Key Technical Skills Demonstrated

- **Docker Containerization** - Building optimized images with proper layer caching
- **GPU Passthrough** - NVIDIA Docker integration for ML workloads
- **MLOps** - Deploying and serving generative AI models at scale
- **System Configuration** - CUDA environment setup and optimization

## License

This project uses [AudioCraft](https://github.com/facebookresearch/audiocraft) which is MIT licensed.
