# docker-dev-base

Base development environment in Docker with essential Linux tools pre-installed.

# Build Docker
```bash
docker build -t project-name .
```

# Run docker
```bash
docker run -it --rm -v $(pwd):/workspace project-name bash
```
