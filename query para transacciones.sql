SELECT * FROM alke_wallet.transacciones;

delete from transacciones where transaccion_id = 3;

insert into transacciones(usuario_enviador_id, usuario_receptor_id, importe, fecha_transaccion, moneda_id) values(6,1,500,curdate(),1);

-- count apunta a la cantidad de registros de la consulta / where 
-- consulta para poder obtener saldo de usuario
select sum( 
case
	when t.usuario_enviador_id = t.usuario_receptor_id then t.importe
    when t.usuario_enviador_id = u.usuario_id and t.usuario_receptor_id != u.usuario_id then t.importe * -1
    when t.usuario_enviador_id != u.usuario_id and t.usuario_receptor_id = u.usuario_id then t.importe
    else 0
end
) as importe
from transacciones t, usuario u
where (t.usuario_enviador_id = u.usuario_id or t.usuario_receptor_id = u.usuario_id)
and u.usuario_id = 3;
select * from transacciones
where 1=1
-- and fecha_transaccion = curdate() // fecha_transaccion igual a "hoy"
-- and fecha_transaccion = '2024-04-07'
-- and fecha_transaccion = curdate() - interval 1 day // fecha_transaccion igual a "ayer"
-- and fecha_transaccion = '2024-04-06'
and fecha_transaccion > '2024-04-06'
 and importe >= 1000;
 
select 
	t.transaccion_id,
    t.fecha_transaccion,
    ue.nombre as usuario_enviador,
    ur.nombre as usuario_receptor,
    t.importe as monto,
    m.nombre_moneda as moneda
from alke_wallet.transacciones t
join alke_wallet.usuario ue on (t.usuario_enviador_id = ue.usuario_id)
join alke_wallet.usuario ur on (t.usuario_receptor_id = ur.usuario_id)
join alke_wallet.monedas m on (t.moneda_id = m.moneda_id)
where 1=1
order by t.transaccion_id desc -- orden de la tabla con desc para la entrega de informacion desendente