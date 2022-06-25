from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.response import Response
from login.models import User

# Create your views here.
class CustomObtainAuthToken(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
        response = super(CustomObtainAuthToken, self).post(request, *args, **kwargs)
        token = Token.objects.get(key=response.data['token'])
        user = User.objects.get(id=token.user_id)

        resp = {
            'email': user.email,
            'token': token.key,
            'first_name': user.first_name,
            'last_name': user.last_name
        }

        return Response(resp)
