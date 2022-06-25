from django.contrib import admin
from .models import Category, PaymentMethod, Product


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):

    list_display = ('id', 'name', 'upper', 'is_active')
    search_fields = ('name',)
    ordering = ('-id',)


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):

    list_display = ('id', 'name', 'stock', 'price', 'offer_price', 'oh_price', 'category')
    search_fields = ('name',)
    ordering = ('-id',)


@admin.register(PaymentMethod)
class PaymentMethodAdmin(admin.ModelAdmin):

    list_display = ('id', 'code', 'name')
    search_fields = ('code', 'name',)
    ordering = ('-id',)
