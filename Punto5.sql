CREATE TABLE  tipo_mascota
(
    id_tipo SERIAL NOT NULL,
    descripcion character varying(45),
    CONSTRAINT "Tipó mascota_pkey" PRIMARY KEY (id_tipo)
);
CREATE TABLE propietario
(
    id_propietario SERIAL NOT NULL,
    nombre character varying(45),
    direccion character varying(45) ,
    telefono character varying(10) ,
    correo character varying(60) ,
    comentarios text,
    CONSTRAINT propietario_pkey PRIMARY KEY (id_propietario)
);
CREATE TABLE  mascota
(
    id_mascota SERIAL NOT NULL,
    nombre character varying(45) ,
    tipo_mascota integer NOT NULL,
    propietario integer,
    CONSTRAINT mascota_pkey PRIMARY KEY (id_mascota),
    CONSTRAINT fkmascota_tipomascota FOREIGN KEY (tipo_mascota)
        REFERENCES public.tipo_mascota (id_tipo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkmascota_propietario FOREIGN KEY (propietario)
        REFERENCES public.propietario (id_propietario) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO public.tipo_mascota(descripcion)VALUES ('Tasita de te');
INSERT INTO public.tipo_mascota(descripcion)VALUES ('Gran danes');
INSERT INTO public.tipo_mascota(descripcion)VALUES ('Golden');

INSERT INTO public.propietario(id_propietario, nombre, direccion, telefono, correo, comentarios)VALUES (12,'carlos', 'mz 23', '31212231', 'qwe@mail.com', 'asdqweasdadadasdasdad2wgsfwf');
INSERT INTO public.propietario ( nombre, direccion, telefono, correo, comentarios)VALUES ('Juan', 'Mz 23 ca 12 topac', '2312312', 'asd@mail.com', 'zxcasdqweasdzcasdqwe');
INSERT INTO public.propietario( nombre, direccion, telefono, correo, comentarios)VALUES ('Raul Gomez', 'mz 98 cs 12 belen','444444','rgomez@mail.com', 'no tiene  perro');
INSERT INTO public.propietario( nombre, direccion, telefono, correo, comentarios)VALUES ('Raul Gonzalez',  'mz 98 cs 12 belen', '555555', 'rgomez@mail.com','no tiene  perro');

INSERT INTO public.mascota(nombre, tipo_mascota)VALUES ('Rosita','1');
INSERT INTO public.mascota(nombre, tipo_mascota, propietario)VALUES ('ACE','1', 12);
INSERT INTO public.mascota(nombre, tipo_mascota)VALUES ('ACE','1');
INSERT INTO public.mascota(nombre, tipo_mascota)VALUES ('ACE BEYOND','2');
INSERT INTO public.mascota(nombre, tipo_mascota)VALUES ('Caiser', 3);
INSERT INTO public.mascota(nombre, tipo_mascota, propietario)VALUES ('LORENZO',3, 1);
INSERT INTO public.mascota(nombre, tipo_mascota, propietario)VALUES ('Lorenzo',3, 1);
INSERT INTO public.mascota(nombre, tipo_mascota, propietario)VALUES ('lorenzo',3, 1);


SELECT * FROM public.mascota;
SELECT * FROM public.mascota where propietario is NULL ;
SELECT tipo.descripcion,count (*) as cantidad FROM public.mascota as masco,public.tipo_mascota as tipo where masco.tipo_mascota = tipo.id_tipo group by tipo.descripcion;
SELECT propi.nombre, count (*) as numero FROM public.mascota as masco, public.propietario as propi where masco.propietario = propi.id_propietario  group by propi.nombre having count(*) > 2;
SELECT propi.nombre,tipo.descripcion, count (*) FROM public.mascota as masco, public.propietario as propi, public.tipo_mascota as tipo where masco.propietario = propi.id_propietario and masco.tipo_mascota = tipo.id_tipo group by propi.nombre,tipo.descripcion
SELECT propi.nombre FROM public.propietario as propi  where not exists(SELECT null FROM public.mascota as masco where  masco.propietario =propi.id_propietario)