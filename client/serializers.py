from rest_framework import serializers as ser
from internal.models import Category, Product
from .models import Order


class CategorySer(ser.ModelSerializer):

    class Meta:
        model = Category
        exclude = ('is_active', 'created_by', 'created_at')

    def get_fields(self):
        fields = super(CategorySer, self).get_fields()
        fields['sub_categories'] = CategorySer(many=True)
        return fields


class ProductSer(ser.ModelSerializer):

    class Meta:
        model = Product
        exclude = ('created_by', 'created_at')


class OrderSer(ser.ModelSerializer):

    created_at = ser.DateTimeField(format="%d/%m/%Y %H:%M", read_only=True)
    client_name = ser.SerializerMethodField(read_only=True)

    class Meta:
        model = Order
        exclude = ('client', 'status', 'delivered_at')

    def get_client_name(self, order):
        return order.client.first_name + ' ' + order.client.last_name

