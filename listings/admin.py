from django.contrib import admin
from .models import Listing, ListingImage

class AnuncioImageInline(admin.TabularInline):
    model = ListingImage
    extra = 1 

@admin.register(Listing)
class ListingAdmin(admin.ModelAdmin):
    list_display = ('title', 'price', 'created_at')
    inlines = [AnuncioImageInline]