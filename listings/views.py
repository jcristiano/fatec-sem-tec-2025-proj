from django.shortcuts import render, get_object_or_404
from .models import Listing

def home(request):
    listings = Listing.objects.all().order_by('-created_at')
    return render(request, 'listings/home.html', {'listings': listings})

def detail(request, pk):
    listing = get_object_or_404(Listing, pk=pk)
    return render(request, 'listings/detail.html', {'listing': listing})
