from rest_framework import serializers as ser
from .models import Category, PaymentMethod


class CategorySer(ser.ModelSerializer):

    upper_name = ser.CharField(source='upper.name', read_only=True)

    class Meta:
        model = Category
        fields = '__all__'
        read_only_fields = ('created_by', )


class PaymentMethodSer(ser.ModelSerializer):

    class Meta:
        model = PaymentMethod
        fields = '__all__'
        read_only_fields = ('created_by', )
