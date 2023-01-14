from django.contrib import admin

from api.models import City, Person, PersonLikesCity

# Register your models here.
admin.site.register(City)
admin.site.register(Person)
admin.site.register(PersonLikesCity)
