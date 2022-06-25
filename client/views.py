
from time import sleep
from datetime import date
from django.shortcuts import get_object_or_404
from rest_framework import viewsets, views
from rest_framework.response import Response
from rest_framework.serializers import ValidationError
from rest_framework.pagination import PageNumberPagination
from client.models import Order
from . import serializers as ser
from internal.models import Category, Product


class CategoryApi(viewsets.ModelViewSet):

    serializer_class = ser.CategorySer
    http_method_names = ['get']  # can't post, put

    def get_queryset(self):

        qs = Category.objects.filter(upper=None)

        return qs


class ProductPagination(PageNumberPagination):
    page_size = 9
    max_page_size = 50


class ProductApi(viewsets.ModelViewSet):

    queryset = Product.objects.all()
    serializer_class = ser.ProductSer
    http_method_names = ['get']  # can't post, put
    pagination_class = ProductPagination


class OrderApi(viewsets.ModelViewSet):

    queryset = Order.objects.all()
    serializer_class = ser.OrderSer
    http_method_names = ['get']  # can't post, put


class PaymentApi(views.APIView):

    def get(self, request, pk):
        order = get_object_or_404(Order, pk=pk)
        return Response({
            'payed': order.payed,
            'amount': order.amount,
            'payment_method': order.payment_method.name,
            'payment_card': order.payment_card,
        })

    def put(self, request, pk):
        order = get_object_or_404(Order, pk=pk)
        card = request.data.get('payment_card', '')
        name = request.data.get('name', '')
        last_name = request.data.get('last_name', '')
        month = request.data.get('month', '')
        year = request.data.get('year', '')
        cvv = request.data.get('cvv', '')
        # Simulación conexión con un procesador de pagos
        # sleep(5)
        c_year = date.today().year
        if len(card) != 16 or not card.isdecimal():
            raise ValidationError({'detail': 'Tarjeta Inválida'})
        if name == '' or last_name == '':
            raise ValidationError({'detail': 'Nombre y Apellido inválidos'})
        if not( int(month) in range(1, 13) and int(year) in range(c_year, c_year +36) ):
            raise ValidationError({'detail': 'Vencimiento inválido'})
        if not int(cvv) in range(1, 10000):
            raise ValidationError({'detail': 'CVV inválido'})
        order.payment_card = card[-4:]
        order.payed = True
        order.save()

        return Response({'detail', 'ok'})
