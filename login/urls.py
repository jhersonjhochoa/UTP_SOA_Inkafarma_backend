from django.urls import path
from .views import CustomObtainAuthToken


app_name = "login"

urlpatterns = [

    path('get-token/', CustomObtainAuthToken.as_view(), name='get_token'),

]
