# Generated by Django 4.0.2 on 2022-02-13 01:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='doc_type',
            field=models.PositiveSmallIntegerField(choices=[(1, 'DNI'), (2, 'Pasaporte')], default=1),
        ),
    ]
