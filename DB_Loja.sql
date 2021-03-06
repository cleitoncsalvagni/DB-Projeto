PGDMP         8                y            Loja_Informatica    12.7    13.2     ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            /           1262    16393    Loja_Informatica    DATABASE     r   CREATE DATABASE "Loja_Informatica" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
 "   DROP DATABASE "Loja_Informatica";
                postgres    false            ?            1259    16422    clientes    TABLE     ?   CREATE TABLE public.clientes (
    cod_cliente integer NOT NULL,
    tel_cliente numeric(11,0),
    end_cliente text,
    cpf_cliente numeric(11,0),
    nome_cliente text NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            ?            1259    16573    compra    TABLE     ^   CREATE TABLE public.compra (
    numero_nf integer NOT NULL,
    data_compra date NOT NULL
);
    DROP TABLE public.compra;
       public         heap    postgres    false            ?            1259    16414    fornecedores    TABLE     ?   CREATE TABLE public.fornecedores (
    cod_fornecedor integer NOT NULL,
    tel_fornecedor numeric(11,0),
    end_fornecedor text,
    nome_fornecedor text NOT NULL
);
     DROP TABLE public.fornecedores;
       public         heap    postgres    false            ?            1259    16406    funcionarios    TABLE     2  CREATE TABLE public.funcionarios (
    cod_funcionario integer NOT NULL,
    nome_funcionario text NOT NULL,
    data_ad date NOT NULL,
    tel_funcionario numeric(11,0),
    end_funcionario text NOT NULL,
    rg_funcionario numeric,
    data_nascimento date NOT NULL,
    cpf_funcionario numeric(11,0)
);
     DROP TABLE public.funcionarios;
       public         heap    postgres    false            ?            1259    16430    produto    TABLE     ?   CREATE TABLE public.produto (
    cod_produto integer NOT NULL,
    descricao text NOT NULL,
    valor_unitario numeric NOT NULL,
    quantidade_estoque numeric NOT NULL
);
    DROP TABLE public.produto;
       public         heap    postgres    false            ?            1259    16596    venda    TABLE     ~   CREATE TABLE public.venda (
    cod_venda integer NOT NULL,
    meio_pagamento text NOT NULL,
    data_venda date NOT NULL
);
    DROP TABLE public.venda;
       public         heap    postgres    false            &          0    16422    clientes 
   TABLE DATA           d   COPY public.clientes (cod_cliente, tel_cliente, end_cliente, cpf_cliente, nome_cliente) FROM stdin;
    public          postgres    false    204   2       (          0    16573    compra 
   TABLE DATA           8   COPY public.compra (numero_nf, data_compra) FROM stdin;
    public          postgres    false    206   ?       %          0    16414    fornecedores 
   TABLE DATA           g   COPY public.fornecedores (cod_fornecedor, tel_fornecedor, end_fornecedor, nome_fornecedor) FROM stdin;
    public          postgres    false    203   	       $          0    16406    funcionarios 
   TABLE DATA           ?   COPY public.funcionarios (cod_funcionario, nome_funcionario, data_ad, tel_funcionario, end_funcionario, rg_funcionario, data_nascimento, cpf_funcionario) FROM stdin;
    public          postgres    false    202   ?       '          0    16430    produto 
   TABLE DATA           ]   COPY public.produto (cod_produto, descricao, valor_unitario, quantidade_estoque) FROM stdin;
    public          postgres    false    205   ?        )          0    16596    venda 
   TABLE DATA           F   COPY public.venda (cod_venda, meio_pagamento, data_venda) FROM stdin;
    public          postgres    false    207   ?        ?
           2606    16429    clientes clientes_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cod_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    204            ?
           2606    16577    compra compra_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (numero_nf);
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
       public            postgres    false    206            ?
           2606    16421    fornecedores fornecedores_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (cod_fornecedor);
 H   ALTER TABLE ONLY public.fornecedores DROP CONSTRAINT fornecedores_pkey;
       public            postgres    false    203            ?
           2606    16413    funcionarios funcionarios_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (cod_funcionario);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public            postgres    false    202            ?
           2606    16437    produto produto_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (cod_produto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public            postgres    false    205            ?
           2606    16603    venda venda_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (cod_venda);
 :   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_pkey;
       public            postgres    false    207            ?
           2606    16604    venda cod_cliente_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT cod_cliente_fk FOREIGN KEY (cod_venda) REFERENCES public.clientes(cod_cliente);
 >   ALTER TABLE ONLY public.venda DROP CONSTRAINT cod_cliente_fk;
       public          postgres    false    204    207    2715            ?
           2606    16578    compra cod_funcionario_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT cod_funcionario_fk FOREIGN KEY (numero_nf) REFERENCES public.funcionarios(cod_funcionario);
 C   ALTER TABLE ONLY public.compra DROP CONSTRAINT cod_funcionario_fk;
       public          postgres    false    202    2711    206            ?
           2606    16609    venda cod_funcionario_venda_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT cod_funcionario_venda_fk FOREIGN KEY (cod_venda) REFERENCES public.funcionarios(cod_funcionario);
 H   ALTER TABLE ONLY public.venda DROP CONSTRAINT cod_funcionario_venda_fk;
       public          postgres    false    2711    207    202            ?
           2606    16583    compra cod_produto_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT cod_produto_fk FOREIGN KEY (numero_nf) REFERENCES public.produto(cod_produto);
 ?   ALTER TABLE ONLY public.compra DROP CONSTRAINT cod_produto_fk;
       public          postgres    false    2717    206    205            &   ?   x?M?1?0???=E`L?چ?c????iR!?????U?????}?秘qΡ? X?It?????N??i?w???? j??d???q???????@T8#Y9?>l?e??? V? ?4?rXD??}?q?#??ʢ?e|?߾?/:??A?Y?_9m?+?Hc???Μ?H;?      (      x?????? ? ?      %   ?   x?Uͽ?0?ṽ?^ !?Ҙ?dp?h?\N? ?)??????7~y?L?eZ;?Y'?=U%?SP5???މ???e??5???x??:??\'g??1??}u]W?@P5c?{?D]?O?'Bq?? ?4?׹??3?T̩???q?0???Q#ѿ?J??_Le:?      $   ?   x?-??J1ϝ??D?'????I??e/?	3??????B??+????}m?u?I?DU?H?ed??͟?^Z??????A?p??":??????\?S???SNc?t(??	?????????T?????`??Pb4'?8???????쥛??P?521F??\{_?C?Ƕ??E??굄???YY?]n?s?"???      '   P   x?3???/-NUJ?J-?425?4?2?IM?IL?Wp6qu??46?4?2???/IM???V?/?,?,??445 i????? ?f      )      x?????? ? ?     