from django.db import models
from internal.models import PaymentMethod, Product
from login.models import User


DIRECTION_TYPE = {
    1: 'Casa',
    2: 'Oficina',
    3: 'Otros'
}


class Direction(models.Model):
    client = models.ForeignKey(User, on_delete=models.PROTECT, related_name='directions')
    detail = models.CharField(max_length=750)
    reference = models.CharField(max_length=1250)
    type = models.PositiveSmallIntegerField(choices=DIRECTION_TYPE.items(), default=1)

    class Meta:
        ordering = ['-id']


ORDER_STATUS = {
    1: 'Registrado',
    2: 'Pagado',
    # 3: 'Aprobado'
    4: 'En preparación',
    6: 'En camino',
    8: 'Entregado',
    9: 'Cancelado'
}

class Order(models.Model):
    client = models.ForeignKey(User, on_delete=models.PROTECT, related_name='orders')
    created_at = models.DateTimeField(auto_now_add=True)
    direction = models.ForeignKey(Direction, on_delete=models.PROTECT, related_name='orders')
    status = models.PositiveSmallIntegerField(choices=ORDER_STATUS.items(), default=1)
    delivered_at = models.DateTimeField(null=True, blank=True)
    payed = models.BooleanField(default=False)
    payment_card = models.PositiveSmallIntegerField()
    payment_method = models.ForeignKey(PaymentMethod, on_delete=models.PROTECT)
    amount = models.DecimalField(decimal_places=2, max_digits=6)
    req_bill = models.BooleanField(default=False)

    class Meta:
        ordering = ['-id']

    @staticmethod
    def get_pendientes_qs():
        return Order.objects.exclude(Q(status=8) | Q(status=9))

    @staticmethod
    def get_entregados_qs():
        return Order.objects.filter(status=8)

    @staticmethod
    def get_cancelados_qs():
        return Order.objects.filter(status=9)


class OrderStatus(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    order = models.ForeignKey(Order, on_delete=models.PROTECT,related_name='status_history')
    status = models.PositiveSmallIntegerField(choices=ORDER_STATUS.items(), default=1)

    class Meta:
        ordering = ['-id']


class OrderDetail(models.Model):
    order = models.ForeignKey(Order, on_delete=models.PROTECT, related_name='detail')
    product = models.ForeignKey(Product, on_delete=models.PROTECT)
    qty = models.PositiveSmallIntegerField()
    sale_price = models.DecimalField(decimal_places=2, max_digits=6)

    class Meta:
        ordering = ['-id']


