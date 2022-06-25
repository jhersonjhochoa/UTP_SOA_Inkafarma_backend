from rest_framework import routers
from django.urls import include, path
from . import views


app_name = "client"

r = routers.DefaultRouter()
r.register('category', views.CategoryApi, 'categoryApi')
r.register('product', views.ProductApi, 'productApi')
r.register('order', views.OrderApi, 'orderApi')

urlpatterns = [
    path('api/order/<int:pk>/payment/', views.PaymentApi.as_view(), name='paymentApi'),
    path('api/', include(r.urls)),
]

