-- ======================================== [Preparación] ======================================== --
USE GD1C2026;
GO

--Borrar FKs
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_ciudad_pais')
    ALTER TABLE LA_MILA_COMPLETA.ciudad DROP CONSTRAINT fk_ciudad_pais;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_localidad_provincia')
    ALTER TABLE LA_MILA_COMPLETA.localidad DROP CONSTRAINT fk_localidad_provincia;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_cliente_localidad')
    ALTER TABLE LA_MILA_COMPLETA.cliente DROP CONSTRAINT fk_cliente_localidad;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_agencia_localidad')
    ALTER TABLE LA_MILA_COMPLETA.agencia DROP CONSTRAINT fk_agencia_localidad;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_agente_localidad')
    ALTER TABLE LA_MILA_COMPLETA.agente DROP CONSTRAINT fk_agente_localidad;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_agente_agencia')
    ALTER TABLE LA_MILA_COMPLETA.agente DROP CONSTRAINT fk_agente_agencia;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_solicitud_cliente')
    ALTER TABLE LA_MILA_COMPLETA.solicitud DROP CONSTRAINT fk_solicitud_cliente;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_solicitud_agente')
    ALTER TABLE LA_MILA_COMPLETA.solicitud DROP CONSTRAINT fk_solicitud_agente;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_detalle_solicitud_solicitud')
    ALTER TABLE LA_MILA_COMPLETA.detalle_solicitud DROP CONSTRAINT fk_detalle_solicitud_solicitud;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_detalle_solicitud_ciudad')
    ALTER TABLE LA_MILA_COMPLETA.detalle_solicitud DROP CONSTRAINT fk_detalle_solicitud_ciudad;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_aerolinea_pais')
    ALTER TABLE LA_MILA_COMPLETA.aerolinea DROP CONSTRAINT fk_aerolinea_pais;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_aeropuerto_ciudad')
    ALTER TABLE LA_MILA_COMPLETA.aeropuerto DROP CONSTRAINT fk_aeropuerto_ciudad;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_encuesta_cliente')
    ALTER TABLE LA_MILA_COMPLETA.encuesta DROP CONSTRAINT fk_encuesta_cliente;
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_encuesta_agente')
    ALTER TABLE LA_MILA_COMPLETA.encuesta DROP CONSTRAINT fk_encuesta_agente;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_encuesta_agencia')
    ALTER TABLE LA_MILA_COMPLETA.encuesta DROP CONSTRAINT fk_encuesta_agencia;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_puntaje_encuesta')
    ALTER TABLE LA_MILA_COMPLETA.puntaje DROP CONSTRAINT fk_puntaje_encuesta;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_aspecto_encuesta')
    ALTER TABLE LA_MILA_COMPLETA.aspecto DROP CONSTRAINT fk_aspecto_encuesta;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_estado_propuesta')
    ALTER TABLE LA_MILA_COMPLETA.propuesta DROP CONSTRAINT fk_propuesta_estado_propuesta;
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_agente')
    ALTER TABLE LA_MILA_COMPLETA.propuesta DROP CONSTRAINT fk_propuesta_agente;
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_solicitud')
    ALTER TABLE LA_MILA_COMPLETA.propuesta DROP CONSTRAINT fk_propuesta_solicitud;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_venta_agencia')
    ALTER TABLE LA_MILA_COMPLETA.venta DROP CONSTRAINT fk_venta_agencia;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_venta_agente')
    ALTER TABLE LA_MILA_COMPLETA.venta DROP CONSTRAINT fk_venta_agente;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_venta_cliente')
    ALTER TABLE LA_MILA_COMPLETA.venta DROP CONSTRAINT fk_venta_cliente;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_venta_propuesta')
    ALTER TABLE LA_MILA_COMPLETA.venta DROP CONSTRAINT fk_venta_propuesta;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_hospedaje_ciudad')
    ALTER TABLE LA_MILA_COMPLETA.hospedaje DROP CONSTRAINT fk_hospedaje_ciudad;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_Habitacion_Hospedaje')
    ALTER TABLE LA_MILA_COMPLETA.hospedaje DROP CONSTRAINT fk_Habitacion_Hospedaje;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_hospedaje_propuesta')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje DROP CONSTRAINT fk_propuesta_hospedaje_propuesta;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_hospedaje_hospedaje')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje DROP CONSTRAINT fk_propuesta_hospedaje_hospedaje;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_Habitacion_Hospedaje')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje DROP CONSTRAINT fk_Habitacion_Hospedaje;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_hospedaje_propuesta')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje DROP CONSTRAINT fk_propuesta_hospedaje_propuesta;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_hospedaje_hospedaje')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje DROP CONSTRAINT fk_propuesta_hospedaje_hospedaje;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_hospedaje_habitacion')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje DROP CONSTRAINT fk_propuesta_hospedaje_habitacion;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_vuelo_aeropuerto_destino')
    ALTER TABLE LA_MILA_COMPLETA.vuelo DROP CONSTRAINT fk_vuelo_aeropuerto_destino;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_vuelo_aeropuerto_origen')
    ALTER TABLE LA_MILA_COMPLETA.vuelo DROP CONSTRAINT fk_vuelo_aeropuerto_origen;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_item_vuelo_vuelo')
    ALTER TABLE LA_MILA_COMPLETA.item_vuelo DROP CONSTRAINT fk_item_vuelo_vuelo;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_pasaje_item_vuelo')
    ALTER TABLE LA_MILA_COMPLETA.pasaje DROP CONSTRAINT fk_pasaje_item_vuelo;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_pasaje_vuelo')
    ALTER TABLE LA_MILA_COMPLETA.pasaje DROP CONSTRAINT fk_pasaje_vuelo;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_propuesta_vuelo')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_vuelo DROP CONSTRAINT fk_propuesta_propuesta_vuelo;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_pasaje_id')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_vuelo DROP CONSTRAINT fk_propuesta_pasaje_id;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_vuelo')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_vuelo DROP CONSTRAINT fk_propuesta_vuelo;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_excursion_proveedor')
    ALTER TABLE LA_MILA_COMPLETA.excursion DROP CONSTRAINT fk_excursion_proveedor;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_tramo_aero:origen')
    ALTER TABLE LA_MILA_COMPLETA.tramo DROP CONSTRAINT fk_tramo_aero_origen;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_tramo_aero_destino')
    ALTER TABLE LA_MILA_COMPLETA.tramo DROP CONSTRAINT fk_tramo_aero_destino;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_item_excursion_excursion_excursion')
    ALTER TABLE LA_MILA_COMPLETA.item_excursion_excursion DROP CONSTRAINT fk_item_excursion_excursion_excursion;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_pasaje_tramo_pasaje')
    ALTER TABLE LA_MILA_COMPLETA.pasaje_tramo DROP CONSTRAINT fk_pasaje_tramo_pasaje;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_pasaje_tramo_tramo')
    ALTER TABLE LA_MILA_COMPLETA.pasaje_tramo DROP CONSTRAINT fk_pasaje_tramo_tramo;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_vuelo_tramo_vuelo')
    ALTER TABLE LA_MILA_COMPLETA.vuelo_tramo DROP CONSTRAINT fk_vuelo_tramo_vuelo;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_vuelo_tramo_tramo')
    ALTER TABLE LA_MILA_COMPLETA.vuelo_tramo DROP CONSTRAINT fk_vuelo_tramo_tramo;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_hospedaje_propuesta')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje_habitacion DROP CONSTRAINT fk_propuesta_hospedaje_propuesta;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_hospedaje_habitacion')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje_habitacion DROP CONSTRAINT fk_propuesta_hospedaje_habitacion;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_aspecto_puntaje_aspecto')
    ALTER TABLE LA_MILA_COMPLETA.aspecto_puntaje DROP CONSTRAINT fk_aspecto_puntaje_aspecto;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_aspecto_puntaje_puntaje')
    ALTER TABLE LA_MILA_COMPLETA.aspecto_puntaje DROP CONSTRAINT fk_aspecto_puntaje_puntaje;
  
--Borrar PKs

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_Pais')
    ALTER TABLE LA_MILA_COMPLETA.propuesta DROP CONSTRAINT PK_Pais;



-- Borrar tablas
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'pais' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.pais;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'ciudad' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.ciudad;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'provincia' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.provincia;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'localidad' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.localidad;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'cliente' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.cliente;    
    
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'agencia' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.agencia;    

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'agente' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.agente; 
    
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'solicitud' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.solicitud;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'detalle_solicitud' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.detalle_solicitud;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'aerolinea' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.aerolinea;  

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'aeropuerto' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.aeropuerto; 

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'encuesta' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.encuesta;   

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'puntaje' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.puntaje;    

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'aspecto' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))   
    DROP TABLE LA_MILA_COMPLETA.aspecto;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'estado_propuesta' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))   
    DROP TABLE LA_MILA_COMPLETA.estado_propuesta;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'propuesta' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.propuesta;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'venta' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.venta;
    
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'hospedaje' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))
    DROP TABLE LA_MILA_COMPLETA.hospedaje;  

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'habitacion' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.habitacion; 

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'propuesta_hospedaje' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.propuesta_hospedaje;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'vuelo' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.vuelo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'item_vuelo' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.item_vuelo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'pasaje' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.pasaje;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'propuesta_vuelo' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.propuesta_vuelo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'proveedor' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.proveedor;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'excursion' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.excursion;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'item_excursion' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.item_excursion;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'item_hospedaje' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.item_hospedaje;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'tramo' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.tramo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'item_excursion_excursion' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.item_excursion_excursion;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'pasaje_tramo' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.pasaje_tramo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'vuelo_tramo' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.vuelo_tramo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'propuesta_hospedaje_habitacion' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.propuesta_hospedaje_habitacion;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'aspecto_puntaje' AND schema_id = SCHEMA_ID('LA_MILA_COMPLETA'))    
    DROP TABLE LA_MILA_COMPLETA.aspecto_puntaje;

--Borrar Stored Procedures


--Borrar Schema
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'LA_MILA_COMPLETA')
    DROP SCHEMA LA_MILA_COMPLETA;
GO

-- ======================================== [Creación Esquema + Tablas] ======================================== --
CREATE SCHEMA LA_MILA_COMPLETA;
GO

CREATE TABLE LA_MILA_COMPLETA.pais (
    pais_id BIGINT IDENTITY(1,1),
    pais_nombre NVARCHAR(255) NOT NULL
    
    CONSTRAINT PK_pais PRIMARY KEY (pais_id)
);

CREATE TABLE LA_MILA_COMPLETA.ciudad (
    ciud_id BIGINT IDENTITY(1,1),
    ciud_pais_id BIGINT,
    ciud_nombre NVARCHAR(255),

    CONSTRAINT ciud_id PRIMARY KEY (ciud_id),
    
    CONSTRAINT fk_ciudad_pais
        FOREIGN KEY (ciud_pais_id)
        REFERENCES LA_MILA_COMPLETA.pais(pais_id)
);

CREATE TABLE LA_MILA_COMPLETA.provincia (
    pcia_id BIGINT IDENTITY(1,1),
    pcia_nombre NVARCHAR(255),
    
    CONSTRAINT PK_provincia PRIMARY KEY (pcia_id)
);

CREATE TABLE LA_MILA_COMPLETA.localidad (
    loca_id BIGINT IDENTITY(1,1),
    loca_provincia_id BIGINT,
    loca_nombre NVARCHAR(255),

    CONSTRAINT PK_localidad PRIMARY KEY (loca_id),

    CONSTRAINT fk_localidad_provincia
        FOREIGN KEY (loca_provincia_id)
        REFERENCES LA_MILA_COMPLETA.provincia(pcia_id)
);

CREATE TABLE LA_MILA_COMPLETA.cliente (
    clie_id BIGINT IDENTITY(1,1),
    clie_localidad_id BIGINT,
    clie_dni INT UNIQUE NOT NULL,
    clie_nombre NVARCHAR(255) NOT NULL,
    clie_apellido NVARCHAR(255) NOT NULL,
    clie_telefono NVARCHAR(255),
    clie_mail NVARCHAR(255),
    clie_direccion NVARCHAR(255),
    clie_fecha_nacimiento DATE,
    
    CONSTRAINT PK_cliente PRIMARY KEY (clie_id),

    CONSTRAINT fk_cliente_localidad
        FOREIGN KEY (clie_localidad_id)
        REFERENCES LA_MILA_COMPLETA.localidad(loca_id)
);

CREATE TABLE LA_MILA_COMPLETA.agencia (
    agcy_nro BIGINT IDENTITY(1,1),
    agcy_localidad_id BIGINT,
    agcy_direccion NVARCHAR(255),
    agcy_telefono NVARCHAR(255),
    agcy_mail NVARCHAR(255),
    
    CONSTRAINT PK_agencia PRIMARY KEY (agcy_nro),

    CONSTRAINT fk_agencia_localidad
        FOREIGN KEY (agcy_localidad_id)
        REFERENCES LA_MILA_COMPLETA.localidad(loca_id)
);

CREATE TABLE LA_MILA_COMPLETA.agente (
    agen_legajo BIGINT IDENTITY(1,1),
    agen_agencia_numero BIGINT,
    agen_localidad_id BIGINT,
    agen_dni INT UNIQUE NOT NULL,
    agen_nombre NVARCHAR(255) NOT NULL,
    agen_apellido NVARCHAR(255) NOT NULL,
    agen_telefono NVARCHAR(255),
    agen_mail NVARCHAR(255),
    agen_direccion NVARCHAR(255),
    agen_fecha_nacimiento DATE,

    CONSTRAINT agen_legajo PRIMARY KEY (agen_legajo),

    CONSTRAINT fk_agente_localidad
        FOREIGN KEY (agen_localidad_id)
        REFERENCES LA_MILA_COMPLETA.localidad(loca_id),

    CONSTRAINT fk_agente_agencia
        FOREIGN KEY (agen_agencia_numero)
        REFERENCES LA_MILA_COMPLETA.agencia(agcy_nro)
);

CREATE TABLE LA_MILA_COMPLETA.solicitud (
    soli_id BIGINT IDENTITY(1,1),
    soli_cliente_id BIGINT,
    soli_agente_legajo BIGINT,
    soli_fecha_realizacion DATE NULL,
    soli_fecha_inicio_tentativa DATE NULL,
    soli_fecha_fin_tentativa DATE NULL,
    soli_cantidad_pasajeros INT,
    soli_observaciones NVARCHAR(MAX),
    soli_presupuesto_estimado DECIMAL(18,2),

    CONSTRAINT soli_id PRIMARY KEY (soli_id),

    CONSTRAINT fk_solicitud_cliente
        FOREIGN KEY (soli_cliente_id)
        REFERENCES LA_MILA_COMPLETA.cliente(clie_id),

    CONSTRAINT fk_solicitud_agente
        FOREIGN KEY (soli_agente_legajo)
        REFERENCES LA_MILA_COMPLETA.agente(agen_legajo)
);

CREATE TABLE LA_MILA_COMPLETA.detalle_solicitud (
    deta_id BIGINT IDENTITY(1,1),
    deta_solicitud_id BIGINT,
    deta_ciudad_id BIGINT,
    deta_cantidad_dias INT,
    deta_observaciones NVARCHAR(MAX),

    CONSTRAINT deta_id PRIMARY KEY (deta_id),

    CONSTRAINT fk_detalle_solicitud_solicitud
        FOREIGN KEY (deta_solicitud_id)
        REFERENCES LA_MILA_COMPLETA.solicitud(soli_id),

    CONSTRAINT fk_detalle_solicitud_ciudad
        FOREIGN KEY (deta_ciudad_id)
        REFERENCES LA_MILA_COMPLETA.ciudad(ciud_id)
);

CREATE TABLE LA_MILA_COMPLETA.aerolinea (
    arol_codigo NVARCHAR(255),
    arol_pais_id BIGINT,
    arol_nombre NVARCHAR(255),
    arol_alianza NVARCHAR(255),

    CONSTRAINT arol_codigo PRIMARY KEY (arol_codigo),
    
    CONSTRAINT fk_aerolinea_pais
        FOREIGN KEY (arol_pais_id)
        REFERENCES LA_MILA_COMPLETA.pais(pais_id)
);

CREATE TABLE LA_MILA_COMPLETA.aeropuerto (
    aero_codigo NVARCHAR(10),
    aero_ciudad_id BIGINT,
    aero_descripcion NVARCHAR(200),

    CONSTRAINT aero_codigo PRIMARY KEY (aero_codigo),

    CONSTRAINT fk_aeropuerto_ciudad
        FOREIGN KEY (aero_ciudad_id)
        REFERENCES LA_MILA_COMPLETA.ciudad(ciud_id)
);

CREATE TABLE LA_MILA_COMPLETA.encuesta (
    encu_codigo BIGINT IDENTITY(1,1),
    encu_cliente_id BIGINT,
    encu_agente_legajo BIGINT,
    encu_agencia_nro BIGINT,
    encu_fecha DATE,
    encu_comentario NVARCHAR(MAX),

    CONSTRAINT PK_encuesta PRIMARY KEY (encu_codigo),

    CONSTRAINT fk_encuesta_cliente
        FOREIGN KEY (encu_cliente_id)
        REFERENCES LA_MILA_COMPLETA.cliente(clie_id),
    CONSTRAINT fk_encuesta_agente
        FOREIGN KEY (encu_agente_legajo)
        REFERENCES LA_MILA_COMPLETA.agente(agen_legajo),
    CONSTRAINT fk_encuesta_agencia
        FOREIGN KEY (encu_agencia_nro)
        REFERENCES LA_MILA_COMPLETA.agencia(agcy_nro)
);

CREATE TABLE LA_MILA_COMPLETA.puntaje (
    punt_id BIGINT IDENTITY(1,1),
    punt_encuesta_codigo BIGINT,
    punt_puntaje INT,
    
    CONSTRAINT punt_id PRIMARY KEY (punt_id),

    CONSTRAINT fk_puntaje_encuesta
        FOREIGN KEY (punt_encuesta_codigo)
        REFERENCES LA_MILA_COMPLETA.encuesta(encu_codigo)
);

CREATE TABLE LA_MILA_COMPLETA.aspecto (
    aspe_codigo BIGINT IDENTITY(1,1),
    aspe_encuesta_codigo BIGINT,
    aspe_aspecto NVARCHAR(255),

    CONSTRAINT aspe_codigo PRIMARY KEY (aspe_codigo),

    CONSTRAINT fk_aspecto_encuesta
        FOREIGN KEY (aspe_encuesta_codigo)
        REFERENCES LA_MILA_COMPLETA.encuesta(encu_codigo)
);

CREATE TABLE LA_MILA_COMPLETA.estado_propuesta (
    espr_codigo BIGINT IDENTITY(1,1),
    espr_nombre NVARCHAR(255)

    CONSTRAINT espr_codigo PRIMARY KEY (es),
);

CREATE TABLE LA_MILA_COMPLETA.propuesta (
    prop_id BIGINT,
    prop_estado BIGINT,
    prop_agente_legajo BIGINT,
    prop_solicitud_id BIGINT,
    prop_fecha_emision DATE,
    prop_fecha_vigencia DATE,
    prop_fecha_inicio_viaje DATE,
    prop_fecha_fin_viaje DATE,
    prop_subtotal DECIMAL(18,2),
    prop_descuento DECIMAL(18,2),
    prop_importe_total DECIMAL(18,2),
    
    CONSTRAINT prop_id PRIMARY KEY (prop_id), 

    CONSTRAINT fk_propuesta_estado_propuesta
        FOREIGN KEY (prop_estado)
        REFERENCES LA_MILA_COMPLETA.estado_propuesta(espr_codigo),

    CONSTRAINT fk_propuesta_agente
        FOREIGN KEY (prop_agente_legajo)
        REFERENCES LA_MILA_COMPLETA.agente(agen_legajo),

    CONSTRAINT fk_propuesta_solicitud
        FOREIGN KEY (prop_solicitud_id)
        REFERENCES LA_MILA_COMPLETA.solicitud(soli_id)
);

CREATE TABLE LA_MILA_COMPLETA.venta (
    vent_nro BIGINT,
    vent_agencia_nro BIGINT,
    vent_agente_legajo BIGINT,
    vent_cliente_id BIGINT,
    vent_propuesta_id BIGINT,
    vent_fecha DATE,
    vent_canal_venta NVARCHAR(255),
    vent_subtotal DECIMAL(18,2),
    vent_descuento DECIMAL(18,2),
    vent_importe_total DECIMAL(18,2),
    vent_medio_pago NVARCHAR(255),

    CONSTRAINT vent_nro PRIMARY KEY (vent_nro),

    CONSTRAINT fk_venta_agencia
        FOREIGN KEY (vent_agencia_nro)
        REFERENCES LA_MILA_COMPLETA.agencia(agcy_nro),

    CONSTRAINT fk_venta_agente
        FOREIGN KEY (vent_agente_legajo)
        REFERENCES LA_MILA_COMPLETA.agente(agen_legajo),

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (vent_cliente_id)
        REFERENCES LA_MILA_COMPLETA.cliente(clie_id),

    CONSTRAINT fk_venta_propuesta
        FOREIGN KEY (vent_propuesta_id)
        REFERENCES LA_MILA_COMPLETA.propuesta(prop_id)
);

CREATE TABLE LA_MILA_COMPLETA.hospedaje (
    hosp_id BIGINT IDENTITY(1,1),
    hosp_check_in NVARCHAR(255),
    hosp_check_out NVARCHAR(255),
    hosp_ciudad_id BIGINT,
    hosp_nombre NVARCHAR(255),
    hosp_direccion NVARCHAR(255),
    hosp_incluye_desayuno BIT

    CONSTRAINT PK_hospedaje PRIMARY KEY (hosp_id),

    CONSTRAINT fk_hospedaje_ciudad
        FOREIGN KEY (hosp_ciudad_id)
        REFERENCES LA_MILA_COMPLETA.ciudad(ciud_id)
);

CREATE TABLE LA_MILA_COMPLETA.habitacion (
    habi_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    habi_hospedaje_id BIGINT,
    habi_nombre NVARCHAR(255),
    habi_descripcion NVARCHAR(MAX),
    habi_precio_noche DECIMAL(18,2),

    CONSTRAINT PK_habi PRIMARY KEY (habi_id),
    CONSTRAINT fk_Habitacion_Hospedaje
        FOREIGN KEY (habi_hospedaje_id)
        REFERENCES LA_MILA_COMPLETA.hospedaje(hosp_id)
);

CREATE TABLE LA_MILA_COMPLETA.propuesta_hospedaje (
    prho_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    prho_propuesta_id BIGINT,
    prho_hospedaje_id BIGINT,
    prho_habitacion_id BIGINT,
    prho_fecha_ingreso DATE,
    prho_fecha_egreso DATE,
    prho_cantidad_habitaciones INT,
    prho_precio_hospedaje DECIMAL(18,2),
    prho_subtotal_hospedaje DECIMAL(18,2),

    CONSTRAINT fk_propuesta_hospedaje_propuesta
        FOREIGN KEY (prho_propuesta_id)
        REFERENCES LA_MILA_COMPLETA.propuesta(prop_id),

    CONSTRAINT fk_propuesta_hospedaje_hospedaje
        FOREIGN KEY (prho_hospedaje_id)
        REFERENCES LA_MILA_COMPLETA.hospedaje(hosp_id),

    CONSTRAINT fk_propuesta_hospedaje_habitacion
        FOREIGN KEY (prho_habitacion_id)
        REFERENCES LA_MILA_COMPLETA.habitacion(habi_id)
);

CREATE TABLE LA_MILA_COMPLETA.vuelo (
    vuel_aerolinea_codigo NVARCHAR(255),
    vuel_numero BIGINT,
    vuel_fecha DATE,
    vuel_aerolinea_destino NVARCHAR(10),
    vuel_aerolinea_origen NVARCHAR(10),
    vuel_duracion INT,
    PRIMARY KEY (vuel_aerolinea_codigo, vuel_numero, vuel_fecha),

    CONSTRAINT fk_vuelo_aeropuerto_destino
        FOREIGN KEY (vuel_aerolinea_destino)
        REFERENCES LA_MILA_COMPLETA.aeropuerto(aero_codigo),

    CONSTRAINT fk_vuelo_aeropuerto_origen
        FOREIGN KEY (vuel_aerolinea_origen)
        REFERENCES LA_MILA_COMPLETA.aeropuerto(aero_codigo)
);

CREATE TABLE LA_MILA_COMPLETA.item_vuelo (
    itvu_codigo_reserva BIGINT IDENTITY(1,1) PRIMARY KEY,
    itvu_vuelo_aerolinea_codigo NVARCHAR(255),
    itvu_vuelo_numero BIGINT,
    itvu_vuelo_fecha DATE,
    itvu_cantidad_pasajes INT,
    itvu_precio_subtotal DECIMAL(18,2),


    CONSTRAINT fk_item_vuelo_vuelo
        FOREIGN KEY (itvu_vuelo_aerolinea_codigo, itvu_vuelo_numero, itvu_vuelo_fecha)
        REFERENCES LA_MILA_COMPLETA.vuelo(vuel_aerolinea_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE LA_MILA_COMPLETA.pasaje (
    pasa_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    pasa_item_vuelo_codigo_reserva BIGINT,
    pasa_vuelo_aerolinea_codigo NVARCHAR(255),
    pasa_vuelo_numero BIGINT,
    pasa_vuelo_fecha DATE,
    pasa_precio_unitario DECIMAL(18,2),
    pasa_inlcuye_carry BIT,
    pasa_incluye_valija BIT,

    CONSTRAINT fk_pasaje_item_vuelo
        FOREIGN KEY (pasa_item_vuelo_codigo_reserva)
        REFERENCES LA_MILA_COMPLETA.item_vuelo(itvu_codigo_reserva),

    CONSTRAINT fk_pasaje_vuelo
        FOREIGN KEY (pasa_vuelo_aerolinea_codigo, pasa_vuelo_numero, pasa_vuelo_fecha)
        REFERENCES LA_MILA_COMPLETA.vuelo(vuel_aerolinea_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE LA_MILA_COMPLETA.propuesta_vuelo (
    prvu_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    prvu_propuesta_nro BIGINT,
    prvu_vuelo_aerolinea_codigo NVARCHAR(255),
    prvu_vuelo_numero BIGINT,
    prvu_vuelo_fecha DATE,
    prvu_pasaje_id BIGINT,
    prvu_cantidad_pasajes INT,
    prvu_precio_vuelo DECIMAL(18,2),
    prvu_subtotal_vuelo DECIMAL(18,2),

    CONSTRAINT fk_propuesta_propuesta_vuelo
        FOREIGN KEY (prvu_propuesta_nro)
        REFERENCES LA_MILA_COMPLETA.propuesta(prop_id),

    CONSTRAINT fk_propuesta_pasaje_id
        FOREIGN KEY (prvu_pasaje_id)
        REFERENCES LA_MILA_COMPLETA.pasaje(pasa_id),

    CONSTRAINT fk_propuesta_vuelo
        FOREIGN KEY (prvu_vuelo_aerolinea_codigo, prvu_vuelo_numero, prvu_vuelo_fecha)
        REFERENCES LA_MILA_COMPLETA.vuelo(vuel_aerolinea_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE LA_MILA_COMPLETA.proveedor (
    prov_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    prov_nombre NVARCHAR(255),
    prov_mail NVARCHAR(255),
    prov_telefono NVARCHAR(255)
);

CREATE TABLE LA_MILA_COMPLETA.excursion (
    excu_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    excu_proveedor_id BIGINT,
    excu_nombre NVARCHAR(255),
    excu_descripcion NVARCHAR(255),
    excu_horario NVARCHAR(MAX),
    excu_duracion INT,
    excu_precio_unitario DECIMAL(18,2),

    CONSTRAINT fk_excursion_proveedor
        FOREIGN KEY (excu_proveedor_id)
        REFERENCES LA_MILA_COMPLETA.proveedor(prov_id)
);

CREATE TABLE LA_MILA_COMPLETA.item_excursion (
    itex_codigo_reserva NVARCHAR(255) PRIMARY KEY,
    itex_fecha_venta DATE,
    itex_cantidad INT,
    itex_precio_subtotal DECIMAL(18,2),
);

CREATE TABLE LA_MILA_COMPLETA.item_hospedaje (
    itho_codigo_reserva BIGINT IDENTITY(1,1) PRIMARY KEY,
    itho_fecha_ingreso DATE,
    itho_fecha_egreso DATE,
    itho_cantidad_habitaciones INT,
    itho_precio_subtotal DECIMAL(18,2)
);

CREATE TABLE LA_MILA_COMPLETA.tramo(
    tram_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    tram_aerolinea_origen NVARCHAR(10),
    tram_aerolinea_destino NVARCHAR(10),
    tram_fecha_salida DATE,
    tram_horario_salida NVARCHAR(50),
    tram_fecha_llegada DATE,
    tram_horario_llegada NVARCHAR(50),

    CONSTRAINT fk_tramo_aero_origen
        FOREIGN KEY (tram_aerolinea_origen)
        REFERENCES LA_MILA_COMPLETA.aeropuerto(aero_codigo),

    CONSTRAINT fk_tramo_aero_destino
        FOREIGN KEY (tram_aerolinea_destino)
        REFERENCES LA_MILA_COMPLETA.aeropuerto(aero_codigo)
);

-- ==========================================
-- TABLAS TRANSACCIONALES
-- ==========================================

CREATE TABLE LA_MILA_COMPLETA.item_excursion_excursion(
    itee_excursion_id BIGINT,
    itee_item_codigo_reserva NVARCHAR(255),

    CONSTRAINT fk_item_excursion_excursion_item_excursion
        FOREIGN KEY (itee_item_codigo_reserva)
        REFERENCES LA_MILA_COMPLETA.item_excursion(itex_codigo_reserva),

    CONSTRAINT fk_item_excursion_excursion_excursion
        FOREIGN KEY (itee_excursion_id)
        REFERENCES LA_MILA_COMPLETA.excursion(excu_id),

    PRIMARY KEY (itee_excursion_id, itee_item_codigo_reserva)
);

CREATE TABLE LA_MILA_COMPLETA.pasaje_tramo (
    patr_pasaje_id BIGINT,
    patr_tramo_id BIGINT,

    CONSTRAINT fk_pasaje_tramo_pasaje
        FOREIGN KEY (patr_pasaje_id)
        REFERENCES LA_MILA_COMPLETA.pasaje(pasa_id),

    CONSTRAINT fk_pasaje_tramo_tramo
        FOREIGN KEY (patr_tramo_id)
        REFERENCES LA_MILA_COMPLETA.tramo(tram_id),

    PRIMARY KEY (patr_pasaje_id, patr_tramo_id)
);

CREATE TABLE LA_MILA_COMPLETA.vuelo_tramo (
    vutr_vuelo_aerolinea_codigo NVARCHAR(255),
    vutr_vuelo_numero BIGINT,
    vutr_vuelo_fecha DATE,
    vutr_tramo_id BIGINT,

    CONSTRAINT fk_vuelo_tramo_vuelo
        FOREIGN KEY (vutr_vuelo_aerolinea_codigo, vutr_vuelo_numero, vutr_vuelo_fecha)
        REFERENCES LA_MILA_COMPLETA.vuelo(vuel_aerolinea_codigo, vuel_numero, vuel_fecha),

    CONSTRAINT fk_vuelo_tramo_tramo
        FOREIGN KEY (vutr_tramo_id)
        REFERENCES LA_MILA_COMPLETA.tramo(tram_id),

    PRIMARY KEY (vutr_vuelo_aerolinea_codigo, vutr_vuelo_numero, vutr_vuelo_fecha, vutr_tramo_id)
);

CREATE TABLE LA_MILA_COMPLETA.propuesta_hospedaje_habitacion (
    prhh_habitacion_id BIGINT,
    prhh_propuesta_hospedaje_id BIGINT,

    CONSTRAINT fk_propuesta_hospedaje_habitacion_habitacion
        FOREIGN KEY (prhh_habitacion_id)
        REFERENCES LA_MILA_COMPLETA.habitacion(habi_id),
    CONSTRAINT fk_propuesta_hospedaje_habitacion_propuesta_hospedaje
        FOREIGN KEY (prhh_propuesta_hospedaje_id)
        REFERENCES LA_MILA_COMPLETA.propuesta_hospedaje(prho_id),

    PRIMARY KEY (prhh_habitacion_id, prhh_propuesta_hospedaje_id)
);

CREATE TABLE LA_MILA_COMPLETA.aspecto_puntaje (
    asde_detalle_id BIGINT,
    asde_aspecto_codigo BIGINT,

    CONSTRAINT fk_aspecto_puntaje_aspecto
        FOREIGN KEY (asde_detalle_id)
        REFERENCES LA_MILA_COMPLETA.aspecto(aspe_codigo),

    CONSTRAINT fk_aspecto_puntaje_puntaje
        FOREIGN KEY (asde_aspecto_codigo)
        REFERENCES LA_MILA_COMPLETA.puntaje(punt_id),

    PRIMARY KEY (asde_detalle_id, asde_aspecto_codigo)
);

-- ======================================== [Migración] ======================================== --



--Stored Procedures de las tablas maestras.
GO
CREATE PROCEDURE LA_MILA_COMPLETA.MIGRA_PAIS
AS
BEGIN
    --Evita que salgan mensajes de que se creó un registro.
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.pais (pais_nombre)
        --No usamos DISTINCT porque UNION ya elimina los repetidos
        SELECT Aeropuerto_Salida_Pais FROM GD1C2026.gd_esquema.Maestra WHERE Aeropuerto_Salida_Pais IS NOT NULL
        UNION
        SELECT Aeropuerto_Llegada_Pais FROM GD1C2026.gd_esquema.Maestra WHERE Aeropuerto_Llegada_Pais IS NOT NULL
        UNION
        SELECT Aerolinea_Pais FROM GD1C2026.gd_esquema.Maestra WHERE Aerolinea_Pais IS NOT NULL
        UNION
        SELECT Hospedaje_Pais FROM GD1C2026.gd_esquema.Maestra WHERE Hospedaje_Pais IS NOT NULL;
END

GO
CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROVINCIA
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.provincia (pcia_nombre)

        SELECT Agencia_Provincia FROM GD1C2026.gd_esquema.Maestra WHERE Agencia_Provincia IS NOT NULL
        UNION
        SELECT Agente_Provincia FROM GD1C2026.gd_esquema.Maestra WHERE Agente_Provincia IS NOT NULL
        UNION
        SELECT Cliente_Provincia FROM GD1C2026.gd_esquema.Maestra WHERE Cliente_Provincia IS NOT NULL;
END

GO
CREATE PROCEDURE LA_MILA_COMPLETA.proveedor
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.proveedor (prov_nombre)
        SELECT DISTINCT Proveedor_Nombre FROM GD1C2026.gd_esquema.Maestra WHERE Proveedor_Nombre IS NOT NULL;

END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ESTADO_PROPUESTA
AS
BEGIN

    SET NOCOUNT ON;
    INSERT INTO LA_MILA_COMPLETA.estado_propuesta (espr_nombre)
        SELECT DISTINCT Propuesta_Estado FROM GD1C2026.gd_esquema.Maestra WHERE Propuesta_Estado IS NOT NULL;
END


GO
CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ITEM_EXCURSION
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.item_excursion (itex_codigo_reserva,itex_fecha_venta, itex_cantidad, itex_precio_subtotal)
    SELECT DISTINCT Detalle_Venta_Excursion_Cod_Reserva, Detalle_Venta_Excursion_Fecha_Reserva, Detalle_Venta_Excursion_Cant, Detalle_Venta_Excursion_Subtotal FROM GD1C2026.gd_esquema.Maestra WHERE Detalle_Venta_Excursion_Cod_Reserva IS NOT NULL;

END

GO
CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ITEM_HOSPEDAJE
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.item_hospedaje (itho_codigo_reserva, itho_fecha_ingreso, itho_fecha_egreso, itho_cantidad_habitaciones, itho_precio_subtotal)
    SELECT DISTINCT Detalle_Venta_Hospedaje_Cod_Reserva, Detalle_Venta_Hospedaje_Fecha_Desde, Detalle_Venta_Hospedaje_Fecha_Hasta, Detalle_Venta_Hospedaje_Cantidad, Detalle_Venta_Hospedaje_Subtotal
    FROM GD1C2026.gd_esquema.Maestra WHERE Detalle_Venta_Hospedaje_Cod_Reserva IS NOT NULL;
END
GO

-- Stored Procedures de las otras tablas (menos transaccionales)
CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_CIUDAD
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.ciudad (ciud_nombre, ciud_pais_id)
        --m es identificador de la tabla maestra y p el de la nuestra
        SELECT m.Aeropuerto_Salida_Ciudad, p.pais_id
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.pais p ON m.Aeropuerto_Salida_Pais = p.pais_nombre
        WHERE m.Aeropuerto_Salida_Ciudad IS NOT NULL

        UNION

        SELECT DISTINCT m.Aeropuerto_Llegada_Ciudad, p.pais_id
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.pais p ON m.Aeropuerto_Llegada_Pais = p.pais_nombre
        WHERE m.Aeropuerto_Llegada_Ciudad IS NOT NULL

        UNION

        SELECT DISTINCT m.Hospedaje_Ciudad, p.pais_id
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.pais p ON m.Hospedaje_Pais = p.pais_nombre
        WHERE m.Hospedaje_Ciudad IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_LOCALIDAD
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.localidad (loca_nombre, loca_provincia_id)

    SELECT DISTINCT m.Agencia_Localidad, p.pcia_id
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.provincia p ON m.Agencia_Provincia = p.pcia_nombre
    WHERE m.Agencia_Localidad IS NOT NULL

    UNION

    SELECT DISTINCT m.Agente_Localidad, p.pcia_id
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN dbo.provincia p ON m.Agente_Provincia = p.pcia_nombre
    WHERE m.Agente_Localidad IS NOT NULL

    UNION

    SELECT DISTINCT m.Cliente_Localidad, p.pcia_id
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN dbo.provincia p ON m.Cliente_Provincia = p.pcia_nombre
    WHERE m.Cliente_Localidad IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_AEROLINEA
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.aerolinea (arol_codigo, arol_nombre, arol_pais_id, arol_alianza)
    SELECT DISTINCT m.Aerolinea_Codigo, m.Aerolinea_Nombre, p.pais_id, m.Aerolinea_Alianza
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.pais p ON m.Aerolinea_Pais = p.pais_nombre
    WHERE m.Aerolinea_Codigo IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_EXCURSIONES
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.excursion (excu_id, excu_proveedor_id, excu_nombre, excu_descripcion, excu_horario, excu_duracion, excu_precio_unitario)
    SELECT DISTINCT
        pr.prov_id, m.Excursion_Nombre, m.Excursion_Descripcion, m.Excursion_Horario, m.Excursion_Duracion, m.Excursion_Precio
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.proveedor pr ON m.Proveedor_Nombre = pr.prov_nombre
    WHERE m.Excursion_Codigo IS NOT NULL;
END;
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_HABITACIONES
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.habitacion (habi_hospedaje_id, habi_nombre, habi_descripcion, habi_precio_noche)
    SELECT DISTINCT h.hosp_id, m.Habitacion_Nombre, m.Habitacion_Descripcion, m.Habitacion_Precio
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.hospedaje h ON m.Hospedaje_Nombre = h.hosp_nombre AND m.Hospedaje_Ciudad = (SELECT ciud_nombre FROM LA_MILA_COMPLETA.ciudad WHERE ciud_id = h.hosp_ciudad_id)
    WHERE m.Habitacion_Nombre IS NOT NULL;
END;
GO






