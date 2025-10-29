# 🏠 Django Real Estate Listings

Uma aplicação web desenvolvida em **Django** para gerenciar e exibir **anúncios imobiliários**.  
Cada anúncio pode conter **múltiplas imagens**, descrições, preços e outras informações.  
A interface utiliza **Bootstrap** para um visual moderno e responsivo.

---

## 🚀 Tecnologias Utilizadas

- **Python 3.12+**
- **Django 5+**
- **Bootstrap 5**
- **SQLite (ambiente local)**
- **PostgreSQL (Render.com)**
- **Gunicorn** (servidor de produção)
- **Render.com** (deploy automatizado)

---

## 🧩 Funcionalidades

✅ Cadastro de anúncios (título, descrição, preço, data)  
✅ Galeria de imagens (múltiplas imagens por anúncio)  
✅ Interface amigável com Bootstrap  
✅ Administração via Django Admin com suporte a upload múltiplo  
✅ Banco de dados adaptável (SQLite local, PostgreSQL em produção)  
✅ Deploy automatizado no Render

---

## ⚙️ Configuração Local

### 1️⃣ Clonar o repositório
```bash
git clone https://github.com/seuusuario/seuprojeto.git
cd seuprojeto
```

### 2️⃣ Criar e ativar ambiente virtual
```bash
python -m venv venv
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate     # Windows
```

### 3️⃣ Instalar dependências
```bash
pip install -r requirements.txt
```

### 4️⃣ Aplicar migrações
```bash
python manage.py migrate
```

### 5️⃣ Criar usuário administrador
```bash
python manage.py createsuperuser
```

### 6️⃣ Rodar o servidor local
```bash
python manage.py runserver
```

Acesse em:  
👉 http://127.0.0.1:8000/

---

## 💾 Banco de Dados

- **Local:** utiliza **SQLite** (arquivo `db.sqlite3`)
- **Produção (Render):** utiliza **PostgreSQL**, configurado automaticamente via variável de ambiente

---

## 📸 Upload de Imagens

Cada anúncio (`Listing`) pode ter várias imagens associadas (`ListingImage`).

### models.py
```python
class Listing(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    created_at = models.DateTimeField(auto_now_add=True)

class ListingImage(models.Model):
    listing = models.ForeignKey(Listing, on_delete=models.CASCADE, related_name='images')
    image = models.ImageField(upload_to='listings/')
    caption = models.CharField(max_length=255, blank=True)
```

### admin.py
```python
class ListingImageInline(admin.TabularInline):
    model = ListingImage
    extra = 1

@admin.register(Listing)
class ListingAdmin(admin.ModelAdmin):
    list_display = ('title', 'price', 'created_at')
    inlines = [ListingImageInline]
```

---

## 🌐 Deploy no Render

### 1️⃣ Suba o projeto no GitHub

### 2️⃣ Crie um novo serviço **Web Service** no Render  
- Escolha o repositório do GitHub  
- Configure o Build Command:
  ```bash
  ./build.sh
  ```
- Configure o Start Command:
  ```bash
  gunicorn core.wsgi:application
  ```

### 3️⃣ Adicione variáveis de ambiente:
| Variável | Descrição |
|-----------|------------|
| `SECRET_KEY` | Chave secreta Django |
| `DATABASE_URL` | URL do PostgreSQL (gerado pelo Render) |
| `DEBUG` | `False` |
| `ALLOWED_HOSTS` | `seuprojeto.onrender.com` |

---

## 🎨 Front-end

A aplicação usa **Bootstrap 5** via CDN nos templates.

---

## 🧑‍💻 Autor

**Cristiano Silva**  
Aplicação de exemplo desenvolvida para aprendizado e demonstração de boas práticas com Django, PostgreSQL e Render.

---

## 📜 Licença

MIT License — sinta-se à vontade para usar e modificar.
