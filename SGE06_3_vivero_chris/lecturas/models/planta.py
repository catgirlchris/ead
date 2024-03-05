from odoo import api, fields, models, _

class CortesVariaciones(models.Model):
    _name = "lecturas.cortes.variaciones"

    CLAVE_SELECTION = [
        ('C', 'Corte de Agua'), ('R', 'Restablecer'), ('V', 'Revision Corte'), ('4N', 'No Dejan Cortar'), ('A', 'Anulacion'),
    ]

    fecha_hora = fields.Datetime(string="Fecha hora")
    poliza_contrato = fields.Many2one('res.partner', string="Poliza o Contrato")
    clave = fields.Selection(selection=CLAVE_SELECTION, string="Clave", default='C')
    lectura = fields.Float(string="Lectura")
    fontanero = fields.Many2one('hr.employee', string="Fontanero")