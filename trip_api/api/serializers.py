from django.contrib.auth.models import User, Group
from rest_framework import serializers

from api.models import City, Person, PersonLikesCity


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']

class PersonSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Person
        fields = ['url', 'id', 'first_name', 'last_name', 'email', 'phone', 'longitude', 'latitude']

class CitySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = City
        fields = ['url', 'city_name', 'country']

class PersonLikesCitySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = PersonLikesCity
        fields = ['url', 'person', 'city']

