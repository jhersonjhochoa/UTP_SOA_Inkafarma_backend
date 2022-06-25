from django.db.models import Value
from django.db.models.functions import Concat
from django.contrib.auth.models import BaseUserManager


class UserManager(BaseUserManager):
    def get_queryset(self):
        return super().get_queryset().annotate(
                    full_name=Concat('first_name', Value(' '), 'last_name', Value(' '), 'second_last_name')
                )

    def create_user(self, first_name, email, password=None):
        """
        Creates users...
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            first_name=first_name,
            email=self.normalize_email(email)
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, first_name, email, password=None):
        """
        create admins...
        """
        user = self.create_user(
            first_name,
            email,
            password=password
        )
        user.rol = 1
        user.save(using=self._db)
        return user
