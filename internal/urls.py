from rest_framework import routers
from django.urls import include, path
from . import views


app_name = "internal"

r = routers.DefaultRouter()
r.register('category', views.CategoryApi, 'categoryApi')
r.register('payment-method', views.PaymentMethodApi, 'paymentMethodApi')

urlpatterns = [
    path('api/', include(r.urls)),
]

