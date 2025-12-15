create database DB7_1212;
use DB7_1212;

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

insert into transportadora (codTransportadora, nomeTransportadora, cnpj) values (1,'','');

select*from transportadora;
