from django.db import models
import geopy.distance

# Create your models here.

# People can insert their information and cities they want to visit


class City(models.Model):
    city_name = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    def __str__(self):
        return self.city_name

class Person(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    phone = models.CharField(max_length=50)
    longitude = models.DecimalField(max_digits=10, decimal_places=7)
    latitude = models.DecimalField(max_digits=10, decimal_places=7)
    def __str__(self):
        return self.first_name + " " + self.last_name

    def distance(self, lat2, long2):
        return geopy.distance.geodesic((self.latitude, self.longitude), (lat2, long2)).km

class PersonLikesCity(models.Model):
    person = models.ForeignKey('Person', on_delete=models.CASCADE)
    city = models.ForeignKey('City', on_delete=models.CASCADE)