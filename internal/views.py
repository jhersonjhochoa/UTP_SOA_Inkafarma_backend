from rest_framework import viewsets

from login.models import User
from .models import Category, PaymentMethod
from . import serializers as ser

class CategoryApi(viewsets.ModelViewSet):

    serializer_class = ser.CategorySer

    def get_queryset(self):

        qs = Category.objects.all()

        return qs

    def perform_create(self, serializer):
        user = User.objects.first()
        serializer.save(
            created_by=user
        )


class PaymentMethodApi(viewsets.ModelViewSet):

    serializer_class = ser.PaymentMethodSer

    def get_queryset(self):
        qs = PaymentMethod.objects.all()
        return qs

    def perform_create(self, serializer):
        user = User.objects.first()
        serializer.save(
            created_by=user
        )
