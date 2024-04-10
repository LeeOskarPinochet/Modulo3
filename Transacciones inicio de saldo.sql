-- transacciones de usuarios inicio de saldo
INSERT INTO `alke_wallet`.`transacciones`
(`transaccion_id`,
`usuario_enviador_id`,
`usuario_receptor_id`,
`importe`,
`fecha_transaccion`,
`moneda_id`)
VALUES
(null,
1,
1,
1000,
curdate(),
1);
select usuario_enviador_id,sum(importe) from alke_wallet.transacciones group by usuario_enviador_id;
INSERT INTO `alke_wallet`.`transacciones`
(`transaccion_id`,
`usuario_enviador_id`,
`usuario_receptor_id`,
`importe`,
`fecha_transaccion`,
`moneda_id`)
VALUES
(null,
1,
2,
500,
curdate(),
1);
INSERT INTO `alke_wallet`.`transacciones`
(`transaccion_id`,
`usuario_enviador_id`,
`usuario_receptor_id`,
`importe`,
`fecha_transaccion`,
`moneda_id`)
VALUES
(null,
2,
1,
-500,
curdate(),
1);
select *from alke_wallet.transacciones