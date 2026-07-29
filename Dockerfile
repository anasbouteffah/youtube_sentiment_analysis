FROM python:3.11-slim-bookworm

WORKDIR /app

# Installation de la bibliothèque système requise par LightGBM
RUN apt-get update && apt-get install -y libgomp1 && rm -rf /var/lib/apt/lists/*

COPY . /app

# Installation des dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Téléchargement des ressources NLP requises
RUN python -m nltk.downloader stopwords wordnet

# Exposition du port
EXPOSE 5000

CMD ["python3", "app.py"]