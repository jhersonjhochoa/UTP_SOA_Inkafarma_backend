from django.db import models
from django.contrib.auth.models import AbstractBaseUser

from . import managers

USER_ROLES = {
    1: 'admin',
    2: 'delivery',
    3: 'client'
}

DOC_TYPES = {
    1: 'DNI',
    2: 'Pasaporte'
}

class User(AbstractBaseUser):

    email = models.EmailField(unique=True, blank=True)
    first_name = models.CharField(max_length=150, default='', blank=True)
    last_name = models.CharField(max_length=150, default='', blank=True)
    second_last_name = models.CharField(max_length=150, default='', blank=True)
    doc_type = models.PositiveSmallIntegerField(choices=DOC_TYPES.items(), default=1)
    doc_number = models.CharField(max_length=15, default='', blank=True)
    birthdate = models.DateField(default=None, null=True, blank=True)
    rol = models.PositiveSmallIntegerField(choices=USER_ROLES.items(), default=3)
    date_joined = models.DateTimeField(auto_now_add=True)
    is_active = models.BooleanField(default=True)
    objects = managers.UserManager()
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name']

    class Meta:
        base_manager_name = 'objects'

    def __str__(self):
        return self.email

    def is_admin(self):
        return self.rol == 1

    def is_delivery(self):
        return self.rol == 2

    def is_client(self):
        return self.rol == 3

    def has_perm(self, perm, obj=None):  # field required by django
        return self.rol == 1 or str(perm) == self.rol

    def has_module_perms(self, app_label):  # field required by django
        return self.rol == 1

    @property
    def is_staff(self):  # access to django admin
        return self.rol == 1

    @property
    def is_superuser(self):  # field required by django
        return self.rol == 1
