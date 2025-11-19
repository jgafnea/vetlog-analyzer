FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /app

# Copy project files
COPY \
	pyproject.toml \
	uv.lock \
	.env \
	./

# TODO: 
# COPY src/ ./src/
COPY py_vetlog_analyzer/ ./py_vetlog_analyzer/
COPY tests/ ./tests/

# Install dependencies using uv
RUN uv sync --frozen --no-dev

# Set up entrypoint for tests
CMD ["uv", "run", "pytest", "tests/", "-v"]
