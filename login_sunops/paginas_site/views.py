from django.shortcuts import render

def home(request):
    return render(request, 'paginas_site/index.html')
# Create your views here.
