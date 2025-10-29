#!/usr/bin/env bash
# build.sh

set -o errexit  # para parar em caso de erro

echo "🚀 Instalando dependências..."
pip install -r requirements.txt

echo "📦 Coletando arquivos estáticos..."
python manage.py collectstatic --noinput

echo "🧩 Executando migrações..."
python manage.py migrate --noinput

echo "👤 Criando superusuário (se não existir)..."
python manage.py shell << END
from django.contrib.auth import get_user_model
import os

User = get_user_model()
username = os.getenv("DJANGO_SUPERUSER_USERNAME")
email = os.getenv("DJANGO_SUPERUSER_EMAIL")
password = os.getenv("DJANGO_SUPERUSER_PASSWORD")

if username and password:
    if not User.objects.filter(username=username).exists():
        User.objects.create_superuser(username=username, email=email, password=password)
        print(f"✅ Superusuário '{username}' criado com sucesso!")
    else:
        print(f"ℹ️  Superusuário '{username}' já existe — ignorando criação.")
else:
    print("⚠️  Variáveis de superusuário não configuradas — ignorando criação.")
END
