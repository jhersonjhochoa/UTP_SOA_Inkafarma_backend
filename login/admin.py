from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User



@admin.register(User)
class UserAdmin(BaseUserAdmin):


    list_display = ('email', 'first_name', 'last_name', 'rol')
    list_filter = ('rol',)
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'second_last_name', 'birthdate', 'doc_type', 'doc_number')}),
        ('Permissions', {'fields': ('rol',)}),

    )
    add_fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('first_name',)}),
        ('Permissions', {'fields': ('rol',)}),
    )
    search_fields = ('email', 'first_name', 'last_name', 'rol')
    ordering = ('-id',)
    filter_horizontal = ()

