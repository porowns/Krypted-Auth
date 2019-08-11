import uuid
from django.db import models
from django.contrib.auth.models import User
from django_countries.fields import CountryField


class UserInfo(models.Model):
    user = models.OneToOneField(
        User, on_delete=models.CASCADE, related_name="info")
    country = CountryField(default="US")
    age = models.IntegerField(default=18)
    secret = models.UUIDField(default=uuid.uuid4)