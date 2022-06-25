from django.contrib import admin
from .models import Direction, Order


@admin.register(Direction)
class DirectionAdmin(admin.ModelAdmin):

    list_display = ('client', 'detail', 'reference', 'type')
    # search_fields = ('name',)
    ordering = ('-id',)


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):

    list_display = ('id', 'client', 'status', 'amount')
    # search_fields = ('name',)
    ordering = ('-id',)
