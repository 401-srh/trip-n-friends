from django.contrib.auth.models import User, Group
from django.shortcuts import get_object_or_404
from rest_framework import viewsets
from rest_framework import permissions
from rest_framework.response import Response
from api.serializers import UserSerializer, GroupSerializer, CitySerializer, PersonSerializer, PersonLikesCitySerializer
from api.models import City, Person, PersonLikesCity


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [permissions.AllowAny]


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.AllowAny]

class CityViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = City.objects.all()
    serializer_class = CitySerializer
    permission_classes = [permissions.AllowAny]

class PersonViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Person.objects.all()
    serializer_class = PersonSerializer
    permission_classes = [permissions.AllowAny]

class PersonLikesCityViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = PersonLikesCity.objects.all()
    serializer_class = PersonLikesCitySerializer
    permission_classes = [permissions.AllowAny]

class CitiesLikedByPersonViewSet(viewsets.ViewSet):

    queryset = City.objects.all()
    permission_classes = [permissions.AllowAny]

    def retrieve(self, request, pk=None):
        cities = City.objects.filter(personlikescity__person_id=pk)
        serializer = CitySerializer(cities, many=True, context={'request': request})
        return Response(serializer.data)

class CloseToMeViewSet(viewsets.ViewSet):

    queryset = Person.objects.all()
    permission_classes = [permissions.AllowAny]

    def retrieve(self, request, pk=None):
        person = get_object_or_404(self.queryset, pk=pk)

        lat = person.latitude
        lon = person.longitude

        items = list(self.queryset)
        items.sort(key=lambda x: x.distance(lat, lon))

        serializer = PersonSerializer(items, many=True, context={'request': request})
        return Response(serializer.data)

