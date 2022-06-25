
from itertools import product
from typing import Union
from django.db import models
from django.db.models import Q
from login.models import User


class Category(models.Model):
    created_by = models.ForeignKey(User, on_delete=models.PROTECT)
    created_at = models.DateTimeField(auto_now_add=True)
    name = models.CharField(max_length=500)
    description = models.TextField(blank=True)
    upper = models.ForeignKey('self', null=True, blank=True,
                              on_delete=models.CASCADE,
                              related_name="sub_categories")
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ['-id']

    def __str__(self):
        return '{} | {}'.format(self.id, self.name)

    def get_sub_categories_qs(self):
        return self.sub_categories.all()


class Product(models.Model):
    created_by = models.ForeignKey(User, on_delete=models.PROTECT)
    created_at = models.DateTimeField(auto_now_add=True)
    name = models.CharField(max_length=250)
    shrot_description = models.CharField(max_length=1250)
    description = models.TextField(blank=True)
    contraindications = models.TextField(blank=True)
    observations = models.TextField(blank=True)
    image = models.ImageField(upload_to='static/images/products')
    stock = models.PositiveIntegerField()
    price = models.DecimalField(decimal_places=2, max_digits=6)
    offer_price = models.DecimalField(decimal_places=2, max_digits=6)
    oh_price = models.DecimalField(decimal_places=2, max_digits=6)
    category = models.ForeignKey(Category, on_delete=models.PROTECT)

    class Meta:
        ordering = ['-id']

    @staticmethod
    def get_pre_search_qs(text: str):
        return Product.objects.filter(name__icontains=text)

    @staticmethod
    def get_search_qs(text: str):
        return Product.objects.filter(name__icontains=text)

    @staticmethod
    def get_by_category_qs(category: Union[int, Category]):
        return Product.objects.filter(category=category)


class PaymentMethod(models.Model):
    created_by = models.ForeignKey(User, on_delete=models.PROTECT)
    created_at = models.DateTimeField(auto_now_add=True)
    code = models.CharField(max_length=4, unique=True)
    name = models.CharField(max_length=250)
    image = models.ImageField(upload_to='static/images/payment_methods')

    class Meta:
        ordering = ['-id']
