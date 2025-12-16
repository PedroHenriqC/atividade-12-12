create database DB7_1212;
use DB7_1212;

/*Parte 1*/
/*Questão 1*/

create table cliente (
codCliente int not null auto_increment,
nomeCliente varchar(45),
email varchar(45),
dataCadastro date,

constraint pkcodCliente primary key (codCliente)); 
select*from cliente;

create table fornecedor (
codFornecedor int not null auto_increment,
nomeFornecedor varchar(45),
cidade varchar(45),

constraint pkcodFornecedor primary key (codFornecedor));

create table transportadora (
codTransportadora int not null auto_increment,
nomeTransportadora varchar(45),
cnpj varchar(45),

constraint pkcodTransportadora primary key (codTransportadora));

create table produto (
codProduto int not null auto_increment,
nomeProduto varchar(45),
valorUnitario decimal(10,2),
codFornecedor int,

constraint pkcodProduto primary key (codProduto),
constraint fkcodFornecedor foreign key (codFornecedor) references fornecedor (codFornecedor));

create table pedido (
codPedido int not null auto_increment,
codCliente int,
dataPedido date,
valorTotal decimal(10,2),

constraint pkcodPedido primary key (codPedido),
constraint fkcodCliente foreign key (codCliente) references cliente (codCliente));

create table item_pedido (
codPedido int not null auto_increment,
codProduto int,
quantidade int,
precoVenda decimal(10,2),

constraint pkcodPedido primary key (codPedido, codProduto),
constraint fkcodPedido foreign key (codPedido) references pedido (codPedido),
constraint fkcodProduto foreign key (codProduto) references produto (codProduto));

create table entrega (
codEntrega int not null auto_increment,
codPedido int,
codTransportadora int,
statusEntrega varchar(45),
dataEnvio date,

constraint pkcodEntrega primary key (codEntrega),
constraint fkcodPedido_entrega foreign key (codPedido) references pedido (codPedido),
constraint fkcodTransportadora foreign key (codTransportadora) references transportadora (codTransportadora));

create table estoque (
codEstoque int not null auto_increment,
codProduto int,
quantidadeAtual int,
localizacao varchar(45),

constraint pkcodEstoque primary key (codEstoque),
constraint fkcodProduto_estoque foreign key (codProduto) references produto (codProduto));

/*Questão 2*/

INSERT INTO cliente (codCliente, nomeCliente, email, dataCadastro) VALUES
(1, 'Amanda', 'amanda@gmail.com', '2025-02-15'),
(2, 'Bruno Silva', 'bruno.silva@yahoo.com', '2025-01-08'),
(3, 'Carla Mendes', 'carla.mendes@hotmail.com', '2024-12-22'),
(4, 'Diego Rocha', 'diego.rocha@gmail.com', '2025-03-01'),
(5, 'Eduarda Lima', 'eduarda.lima@outlook.com', '2025-02-09'),
(6, 'Felipe Nunes', 'felipe.n@gmail.com', '2025-01-27'),
(7, 'Gabriela Torres', 'gabriela.torres@uol.com', '2024-11-30'),
(8, 'Henrique Alves', 'henrique.alves@gmail.com', '2025-03-15'),
(9, 'Isabela Duarte', 'isabela.drt@hotmail.com', '2025-01-12'),
(10, 'João Pedro', 'joao.pedro@gmail.com', '2024-12-05'),
(11, 'Karen Souza', 'karen.souza@outlook.com', '2025-02-03'),
(12, 'Leonardo Castro', 'leonardo.castro@hotmail.com', '2024-12-18'),
(13, 'Marina Carvalho', 'marina.c@gmail.com', '2025-03-10'),
(14, 'Nathan Ribeiro', 'nathan.rib@gmail.com', '2025-01-19'),
(15, 'Olívia Martins', 'olivia.martins@uol.com', '2024-11-25'),
(16, 'Paulo Henrique', 'paulo.henrique@gmail.com', '2025-02-21'),
(17, 'Queila Fernandes', 'queila.f@hotmail.com', '2025-03-05'),
(18, 'Rafael Monteiro', 'rafael.monteiro@yahoo.com', '2024-12-28'),
(19, 'Sabrina Costa', 'sabrina.costa@gmail.com', '2025-02-12'),
(20, 'Thiago Almeida', 'thiago.almeida@outlook.com', '2025-01-04');

INSERT INTO fornecedor (codFornecedor, nomeFornecedor, cidade) VALUES
(1, 'Comercial Andrade', 'Curitiba'),
(2, 'Distribuidora Ribeiro', 'Vassouras'),
(3, 'Fornecedora Vale Verde', 'Belo Horizonte'),
(4, 'Suprimentos Alfa', 'São Paulo'),
(5, 'Mercantil Horizonte', 'Fortaleza'),
(6, 'Global Trade Brasil', 'Manaus'),
(7, 'Atacado Sul Ltda', 'Porto Alegre'),
(8, 'Comércio Nova Era', 'Recife'),
(9, 'Fornecedora Diamante', 'Salvador'),
(10, 'Indústria Bela Vista', 'Florianópolis'),
(11, 'Atacadista Prime', 'Curitiba'),
(12, 'Serviços União', 'Goiânia'),
(13, 'Comercial Monte Azul', 'Vitória'),
(14, 'Logística Centro-Oeste', 'Campo Grande'),
(15, 'Fornecedora Atlântica', 'Natal'),
(16, 'Alpha Distribuidora', 'João Pessoa'),
(17, 'Master Suprimentos', 'Belém'),
(18, 'Nacional Atacado', 'São Luís'),
(19, 'Comercial Estrela', 'Aracaju'),
(20, 'Distribuidora Ponto Certo', 'Rio de Janeiro');

insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (1,'Transporte Brasil Sul','12.345.678/0001-90');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (2,'Logística Rápida','23.456.789/0001-81');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (3,'Expresso Horizonte','34.567.890/0001-72');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (4,'Via Cargas Nacional','45.678.901/0001-63');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (5,'Transvale Log','56.789.012/0001-54');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (6,'RodoNorte Transportes','67.890.123/0001-45');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (7,'Carga Expressa','78.901.234/0001-36');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (8,'LogMaster Brasil','89.012.345/0001-27');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (9,'TransGlobal Serviços','90.123.456/0001-18');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (10,'Rodocerto Transportes','11.234.567/0001-09');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (11,'União Logística','22.345.678/0001-90');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (12,'BrasilWay Cargas','33.456.789/0001-81');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (13,'Expresso Central','44.567.890/0001-72');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (14,'TransLeste Operações','55.678.901/0001-63');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (15,'Logística Prime','66.789.012/0001-54');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (16,'Rápido Oeste','77.890.123/0001-45');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (17,'MegaCargo Brasil','88.901.234/0001-36');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (18,'TransRio Serviços','99.012.345/0001-27');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (19,'Cargas Unidas','10.123.456/0001-18');
insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (20,'Rota Segura Logística','21.234.567/0001-09');

insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (1,'Teclado USB',50.50, 1);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (2,'Mouse Óptico',35.90, 2);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (3,'Monitor 21 Polegadas',899.99, 3);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (4,'Notebook i5',3899.00, 4);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (5,'Impressora Laser',1250.75, 5);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (6,'Pen Drive 64GB',79.90, 1);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (7,'HD Externo 1TB',420.00, 2);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (8,'SSD 512GB',510.60, 3);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (9,'Webcam Full HD',210.30, 4);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (10,'Headset Gamer',299.99, 5);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (11,'Fonte 600W',389.50, 6);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (12,'Placa de Vídeo RTX',4599.90, 7);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (13,'Memória RAM 16GB',480.00, 8);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (14,'Gabinete ATX',350.75, 9);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (15,'Cooler Processador',120.40, 10);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (16,'Placa-Mãe B550',899.90, 6);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (17,'Cabo HDMI',29.90, 7);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (18,'Roteador Wi-Fi',310.00, 8);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (19,'Switch 8 Portas',180.25, 9);
insert into produto (codProduto, nomeProduto, valorUnitario, codFornecedor) values (20,'Estabilizador',260.80, 10);

insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (1, 5, '2025-01-05', 200.50);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (2, 3, '2025-01-08', 450.90);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (3, 8, '2025-01-12', 120.75);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (4, 1, '2025-01-15', 980.00);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (5, 6, '2025-01-18', 315.40);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (6, 10, '2025-01-22', 1500.99);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (7, 2, '2025-01-25', 275.60);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (8, 9, '2025-01-28', 640.30);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (9, 4, '2025-02-02', 89.90);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (10, 7, '2025-02-05', 720.00);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (11, 12, '2025-02-08', 1340.45);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (12, 15, '2025-02-11', 560.80);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (13, 11, '2025-02-14', 230.25);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (14, 14, '2025-02-17', 980.60);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (15, 18, '2025-02-20', 410.10);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (16, 16, '2025-02-23', 1550.00);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (17, 20, '2025-02-26', 305.75);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (18, 13, '2025-03-01', 860.90);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (19, 17, '2025-03-04', 99.99);
insert into pedido (codPedido, codCliente, dataPedido, valorTotal) values (20, 19, '2025-03-07', 1240.30);

insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (1, 7, 2, 50.50);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (2, 15, 1, 35.90);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (3, 2, 1, 899.99);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (4, 18, 1, 3899.00);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (5, 9, 1, 1250.75);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (6, 1, 3, 79.90);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (7, 14, 1, 420.00);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (8, 6, 2, 510.60);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (9, 20, 1, 210.30);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (10, 4, 2, 299.99);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (11, 11, 1, 389.50);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (12, 3, 1, 4599.90);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (13, 17, 2, 480.00);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (14, 8, 1, 350.75);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (15, 12, 2, 120.40);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (16, 5, 1, 899.90);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (17, 10, 4, 29.90);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (18, 19, 1, 310.00);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (19, 13, 2, 180.25);
insert into item_pedido (codPedido, codProduto, quantidade, precoVenda) values (20, 16, 1, 260.80);

insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (1, 7, 4, 'Enviado', '2025-01-06');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (2, 12, 9, 'Em transporte', '2025-01-09');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (3, 3, 1, 'Entregue', '2025-01-13');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (4, 18, 6, 'Enviado', '2025-01-16');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (5, 1, 8, 'Em transporte', '2025-01-19');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (6, 15, 2, 'Entregue', '2025-01-23');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (7, 9, 10, 'Enviado', '2025-01-26');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (8, 20, 5, 'Em transporte', '2025-01-29');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (9, 4, 7, 'Entregue', '2025-02-03');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (10, 11, 3, 'Enviado', '2025-02-06');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (11, 6, 8, 'Em transporte', '2025-02-09');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (12, 14, 1, 'Entregue', '2025-02-12');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (13, 2, 9, 'Enviado', '2025-02-15');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (14, 19, 6, 'Em transporte', '2025-02-18');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (15, 10, 4, 'Entregue', '2025-02-21');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (16, 5, 2, 'Enviado', '2025-02-24');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (17, 17, 7, 'Em transporte', '2025-02-27');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (18, 8, 10, 'Entregue', '2025-03-02');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (19, 13, 3, 'Enviado', '2025-03-05');
insert into entrega (codEntrega, codPedido, codTransportadora, statusEntrega, dataEnvio) values (20, 16, 5, 'Entregue', '2025-03-08');

insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (1, 7, 120, 'Depósito A');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (2, 15, 80, 'Depósito B');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (3, 2, 45, 'Depósito C');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (4, 18, 30, 'Depósito A');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (5, 9, 60, 'Depósito D');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (6, 1, 200, 'Depósito B');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (7, 14, 90, 'Depósito C');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (8, 6, 150, 'Depósito A');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (9, 20, 25, 'Depósito D');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (10, 4, 40, 'Depósito B');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (11, 11, 110, 'Depósito C');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (12, 3, 55, 'Depósito A');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (13, 17, 70, 'Depósito D');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (14, 8, 95, 'Depósito B');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (15, 12, 20, 'Depósito C');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (16, 5, 35, 'Depósito A');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (17, 10, 85, 'Depósito D');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (18, 19, 50, 'Depósito B');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (19, 13, 65, 'Depósito C');
insert into estoque (codEstoque, codProduto, quantidadeAtual, localizacao) values (20, 16, 75, 'Depósito A');

select*from cliente;
describe estoque;

set sql_safe_updates = 0;

/*Questão 3*/
alter table produto add column descontoMaximo decimal(5,2);

/*Questão 4*/
update produto set valorUnitario = valorUnitario *1.10 where codFornecedor = 5 and valorUnitario < 100.00;

/*Questão 5*/
delete from fornecedor where cidade LIKE 'A%' or nomeFornecedor LIKE 'B%'; 

/*Questão 6*/

select codCliente  as 'nome de clientes', email as 'email dos clientes' from cliente order by dataCadastro asc;

/*Questão 7*/

select nomeCliente , dataCadastro from cliente where dataCadastro between '2024-01-01'and '2024-12-31';
/*Questão 8*/

select nomeProduto, valorUnitario from produto where not nomeProduto like 'Notebook i5'and valorUnitario > 500.00;

/*Questão 9*/
select nomeFornecedor, cidade from fornecedor where cidade in ('São Paulo', 'Rio de Janeiro', 'Belo Horizonte');


/*Questão 10*/
select nomeTransportadora from transportadora where codTransportadora not in (1, 5, 10, 15);


/*Questão 11*/
SELECT nomeCliente, codPedido, valorTotal
FROM cliente
INNER JOIN pedido ON cliente.codCliente = pedido.codCliente
WHERE valorTotal > 500.00;


/*Questão 12*/
SELECT nomeProduto, nomeFornecedor, cidade
FROM produto
INNER JOIN fornecedor ON produto.codFornecedor = fornecedor.codFornecedor
ORDER BY nomeFornecedor DESC;




/*Questão 13*/
SELECT codPedido, nomeProduto, quantidade FROM pedido INNER JOIN item_pedido ON pedido.codPedido = item_pedido.codPedido INNER JOIN produto ON item_pedido.codProduto = produto.codProduto WHERE dataPedido > '2025-01-01' AND quantidade > 2;


/*Questão 14*/
SELECT c.nomeCliente,pr.nomeProduto,p.dataPedido FROM cliente c
INNER JOIN pedido p ON c.codCliente = p.codCliente
INNER JOIN item_pedido ip ON p.codPedido = ip.codPedido
INNER JOIN produto pr ON ip.codProduto = pr.codProduto
WHERE pr.codProduto = 15;



/*Questão 15*/
SELECT f.codFornecedor, COUNT(DISTINCT p.codProduto) AS ProdutosFornecidos
FROM fornecedor f
INNER JOIN produto p ON f.codFornecedor = p.codFornecedor
GROUP BY f.codFornecedor;


/*Questão 16*/
SELECT f.cidade, MIN(p.valorUnitario) AS ProdutoMaisBarato
FROM fornecedor f
INNER JOIN produto p ON f.codFornecedor = p.codFornecedor
GROUP BY f.cidade;


/*Questão 17*/
SELECT e.localizacao, MAX(e.quantidadeAtual) AS EstoqueMax
FROM estoque e
GROUP BY e.localizacao;


/*Questão 18*/
SELECT c.nomeCliente, t.nomeTransportadora
FROM cliente c
INNER JOIN pedido p ON c.codCliente = p.codCliente
INNER JOIN entrega e ON p.codPedido = e.codPedido
INNER JOIN transportadora t ON e.codTransportadora = t.codTransportadora
WHERE e.statusEntrega <> 'Entregue'
  AND t.codTransportadora <> 7;


/*Questão 19*/
SELECT t.nomeTransportadora,e.statusEntrega FROM entrega e
INNER JOIN transportadora t ON e.codTransportadora = t.codTransportadora
WHERE t.nomeTransportadora LIKE 'T%' AND e.codEntrega BETWEEN 100 AND 200;



/*Questão 20*/
SELECT c.nomeCliente, pr.nomeProduto, p.dataPedido, e.statusEntrega
FROM cliente c
INNER JOIN pedido p ON c.codCliente = p.codCliente
INNER JOIN item_pedido ip ON p.codPedido = ip.codPedido
INNER JOIN produto pr ON ip.codProduto = pr.codProduto
INNER JOIN entrega e ON p.codPedido = e.codPedido
WHERE pr.codProduto IN (2, 4, 6)
ORDER BY e.dataEnvio DESC;




/*Questão 21*/
SELECT p.codPedido,
       SUM(ip.precoVenda * ip.quantidade) AS FaturamentoBruto
FROM pedido p
INNER JOIN item_pedido ip ON p.codPedido = ip.codPedido
GROUP BY p.codPedido;


/*Questão 22*/
SELECT codCliente, AVG(valorTotal) AS TicketMedio
FROM pedido
GROUP BY codCliente;


/*Questão 23*/
SELECT c.nomeCliente, p.dataPedido, e.statusEntrega
FROM cliente c
INNER JOIN pedido p ON c.codCliente = p.codCliente
INNER JOIN entrega e ON p.codPedido = e.codPedido
WHERE c.nomeCliente NOT LIKE '%Junior%'
   OR e.statusEntrega <> 'Enviado';


/*Questão 24*/
SELECT pr.nomeProduto, f.nomeFornecedor, e.quantidadeAtual
FROM produto pr
INNER JOIN fornecedor f ON pr.codFornecedor = f.codFornecedor
INNER JOIN estoque e ON pr.codProduto = e.codProduto
ORDER BY f.nomeFornecedor ASC, e.quantidadeAtual DESC;


/*Questão 25*/
SELECT c.nomeCliente, pr.nomeProduto, ip.precoVenda
FROM cliente c
INNER JOIN pedido p ON c.codCliente = p.codCliente
INNER JOIN item_pedido ip ON p.codPedido = ip.codPedido
INNER JOIN produto pr ON ip.codProduto = pr.codProduto
WHERE p.dataPedido BETWEEN '2025-03-01' AND '2025-05-31'
  AND ip.precoVenda > 200.00;


/*Questão 26*/
SELECT MONTH(p.dataPedido) AS Mes,
       COUNT(DISTINCT p.codCliente) AS TotalClientes
FROM pedido p
GROUP BY MONTH(p.dataPedido);


/*Questão 27*/
UPDATE estoque e
INNER JOIN produto p ON e.codProduto = p.codProduto
SET e.quantidadeAtual = 0
WHERE p.codProduto IN (7, 8, 9, 11);


/*Questão 28*/
SELECT c.nomeCliente, p.dataPedido
FROM cliente c
INNER JOIN pedido p ON c.codCliente = p.codCliente
WHERE c.email LIKE '%@gmail.com'
  AND c.codCliente NOT IN (1, 2, 3);


/*Questão 29*/
SELECT pr.nomeProduto, MIN(ip.precoVenda) AS MenorPrecoHistorico
FROM produto pr
INNER JOIN item_pedido ip ON pr.codProduto = ip.codProduto
GROUP BY pr.nomeProduto;


/*Questão 30*/
SELECT c.nomeCliente, pr.nomeProduto, t.nomeTransportadora, e.statusEntrega
FROM cliente c
INNER JOIN pedido p ON c.codCliente = p.codCliente
INNER JOIN item_pedido ip ON p.codPedido = ip.codPedido
INNER JOIN produto pr ON ip.codProduto = pr.codProduto
INNER JOIN entrega e ON p.codPedido = e.codPedido
INNER JOIN transportadora t ON e.codTransportadora = t.codTransportadora
WHERE e.statusEntrega = 'Cancelado'
   OR t.nomeTransportadora = 'Entrega Rápida';

