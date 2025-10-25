from django.db import models

class Listing(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    price = models.DecimalField(max_digits=12, decimal_places=2)
    address = models.CharField(max_length=255)
    image = models.URLField(help_text="URL da imagem do imóvel")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
