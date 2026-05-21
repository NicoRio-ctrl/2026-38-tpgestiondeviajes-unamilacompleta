-- ======================================== [Creación] ======================================== --

DROP DATABASE gestiondeviajes
GO

CREATE DATABASE gestiondeviajes
GO

USE gestiondeviajes
GO

CREATE TABLE pais (
    pais_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    pais_nombre NVARCHAR(255) NOT NULL
);

CREATE TABLE ciudad (
    ciud_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    ciud_pais_id BIGINT,
    ciud_nombre NVARCHAR(255),

    CONSTRAINT fk_ciudad_pais
        FOREIGN KEY (ciud_pais_id)
        REFERENCES pais(pais_id)
);

CREATE TABLE provincia (
    pcia_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    pcia_nombre NVARCHAR(255),
);

CREATE TABLE localidad (
    loca_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    loca_provincia_id BIGINT,
    loca_nombre NVARCHAR(255),

    CONSTRAINT fk_localidad_provincia
        FOREIGN KEY (loca_provincia_id)
        REFERENCES provincia(pcia_id)
);

CREATE TABLE cliente (
    clie_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    clie_localidad_id BIGINT,
    clie_dni INT UNIQUE NOT NULL,
    clie_nombre NVARCHAR(255) NOT NULL,
    clie_apellido NVARCHAR(255) NOT NULL,
    clie_telefono NVARCHAR(255),
    clie_mail NVARCHAR(255),
    clie_direccion NVARCHAR(255),
    clie_fecha_nacimiento DATE,

    CONSTRAINT fk_cliente_localidad
        FOREIGN KEY (clie_localidad_id)
        REFERENCES localidad(loca_id)
);

CREATE TABLE agencia (
    agcy_nro BIGINT IDENTITY(1,1) PRIMARY KEY,
    agcy_localidad_id BIGINT,
    agcy_direccion NVARCHAR(255),
    agcy_telefono NVARCHAR(255),
    agcy_mail NVARCHAR(255),

    CONSTRAINT fk_agencia_localidad
        FOREIGN KEY (agcy_localidad_id)
        REFERENCES localidad(loca_id)
);

CREATE TABLE agente (
    agen_legajo BIGINT IDENTITY(1,1) PRIMARY KEY,
    agen_agencia_numero BIGINT,
    agen_localidad_id BIGINT,
    agen_dni INT UNIQUE NOT NULL,
    agen_nombre NVARCHAR(255) NOT NULL,
    agen_apellido NVARCHAR(255) NOT NULL,
    agen_telefono NVARCHAR(255),
    agen_mail NVARCHAR(255),
    agen_direccion NVARCHAR(255),
    agen_fecha_nacimiento DATE,

    CONSTRAINT fk_agente_localidad
        FOREIGN KEY (agen_localidad_id)
        REFERENCES localidad(loca_id),

    CONSTRAINT fk_agente_agencia
        FOREIGN KEY (agen_agencia_numero)
        REFERENCES agencia(agcy_nro)
);

CREATE TABLE solicitud (
    soli_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    soli_cliente_id BIGINT,
    soli_agente_legajo BIGINT,
    soli_fecha_realizacion DATE NULL,
    soli_fecha_inicio_tentativa DATE NULL,
    soli_fecha_fin_tentativa DATE NULL,
    soli_cantidad_pasajeros INT,
    soli_observaciones NVARCHAR(MAX),
    soli_presupuesto_estimado DECIMAL(18,2),

    CONSTRAINT fk_solicitud_cliente
        FOREIGN KEY (soli_cliente_id)
        REFERENCES cliente(clie_id),

    CONSTRAINT fk_solicitud_agente
        FOREIGN KEY (soli_agente_legajo)
        REFERENCES agente(agen_legajo)
);

CREATE TABLE detalle_solicitud (
    deta_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    deta_solicitud_id BIGINT,
    deta_ciudad_id BIGINT,
    deta_cantidad_dias INT,
    deta_observaciones NVARCHAR(MAX),

    CONSTRAINT fk_detalle_solicitud_solicitud
        FOREIGN KEY (deta_solicitud_id)
        REFERENCES solicitud(soli_id),

    CONSTRAINT fk_detalle_solicitud_ciudad
        FOREIGN KEY (deta_ciudad_id)
        REFERENCES ciudad(ciud_id)
);

CREATE TABLE aerolinea (
    arol_codigo NVARCHAR(255) PRIMARY KEY,
    arol_pais_id BIGINT,
    arol_nombre NVARCHAR(255),
    arol_alianza NVARCHAR(255),

    CONSTRAINT fk_aerolinea_pais
        FOREIGN KEY (arol_pais_id)
        REFERENCES pais(pais_id)
);

CREATE TABLE aeropuerto (
    aero_codigo NVARCHAR(10) PRIMARY KEY,
    aero_ciudad_id BIGINT,
    aero_descripcion NVARCHAR(200),

    CONSTRAINT fk_aeropuerto_ciudad
        FOREIGN KEY (aero_ciudad_id)
        REFERENCES ciudad(ciud_id)
);

CREATE TABLE encuesta (
    encu_codigo BIGINT IDENTITY(1,1) PRIMARY KEY,
    encu_cliente_id BIGINT,
    encu_agente_legajo BIGINT,
    encu_agencia_nro BIGINT,
    encu_fecha DATE,
    encu_comentario NVARCHAR(MAX),

    CONSTRAINT fk_encuesta_cliente
        FOREIGN KEY (encu_cliente_id)
        REFERENCES cliente(clie_id),
    CONSTRAINT fk_encuesta_agente
        FOREIGN KEY (encu_agente_legajo)
        REFERENCES agente(agen_legajo),
    CONSTRAINT fk_encuesta_agencia
        FOREIGN KEY (encu_agencia_nro)
        REFERENCES agencia(agcy_nro)
);

CREATE TABLE puntaje (
    punt_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    punt_encuesta_codigo BIGINT,
    punt_puntaje INT,

    CONSTRAINT fk_puntaje_encuesta
        FOREIGN KEY (punt_encuesta_codigo)
        REFERENCES encuesta(encu_codigo)
);

CREATE TABLE aspecto (
    aspe_codigo BIGINT IDENTITY(1,1) PRIMARY KEY,
    aspe_encuesta_codigo BIGINT,
    aspe_aspecto NVARCHAR(255),

    CONSTRAINT fk_aspecto_encuesta
        FOREIGN KEY (aspe_encuesta_codigo)
        REFERENCES encuesta(encu_codigo)
);

CREATE TABLE estado_propuesta (
    espr_codigo BIGINT IDENTITY(1,1) PRIMARY KEY,
    espr_nombre NVARCHAR(255)
);

CREATE TABLE propuesta (
    prop_id BIGINT PRIMARY KEY,
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

    CONSTRAINT fk_propuesta_estado_propuesta
        FOREIGN KEY (prop_estado)
        REFERENCES estado_propuesta(espr_codigo),

    CONSTRAINT fk_propuesta_agente
        FOREIGN KEY (prop_agente_legajo)
        REFERENCES agente(agen_legajo),

    CONSTRAINT fk_propuesta_solicitud
        FOREIGN KEY (prop_solicitud_id)
        REFERENCES solicitud(soli_id)
);

CREATE TABLE venta (
    vent_nro BIGINT PRIMARY KEY,
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

    CONSTRAINT fk_venta_agencia
        FOREIGN KEY (vent_agencia_nro)
        REFERENCES agencia(agcy_nro),

    CONSTRAINT fk_venta_agente
        FOREIGN KEY (vent_agente_legajo)
        REFERENCES agente(agen_legajo),

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (vent_cliente_id)
        REFERENCES cliente(clie_id),

    CONSTRAINT fk_venta_propuesta
        FOREIGN KEY (vent_propuesta_id)
        REFERENCES propuesta(prop_id)
);

CREATE TABLE hospedaje (
    hosp_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    hosp_check_in NVARCHAR(255),
    hosp_check_out NVARCHAR(255),
    hosp_ciudad_id BIGINT,
    hosp_nombre NVARCHAR(255),
    hosp_direccion NVARCHAR(255),
    hosp_incluye_desayuno BIT

    CONSTRAINT fk_hospedaje_ciudad
        FOREIGN KEY (hosp_ciudad_id)
        REFERENCES ciudad(ciud_id)
);

CREATE TABLE habitacion (
    habi_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    habi_hospedaje_id BIGINT,
    habi_nombre NVARCHAR(255),
    habi_descripcion NVARCHAR(MAX),
    habi_precio_noche DECIMAL(18,2),

    CONSTRAINT fk_Hospedaje_Habitacion
        FOREIGN KEY (habi_hospedaje_id)
        REFERENCES hospedaje(hosp_id)
);

CREATE TABLE propuesta_hospedaje (
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
        REFERENCES propuesta(prop_id),

    CONSTRAINT fk_propuesta_hospedaje_hospedaje
        FOREIGN KEY (prho_hospedaje_id)
        REFERENCES hospedaje(hosp_id),

    CONSTRAINT fk_propuesta_hospedaje_habitacion
        FOREIGN KEY (prho_habitacion_id)
        REFERENCES habitacion(habi_id)
);

CREATE TABLE vuelo (
    vuel_aerolinea_codigo NVARCHAR(255),
    vuel_numero BIGINT,
    vuel_fecha DATE,
    vuel_aerolinea_destino NVARCHAR(10),
    vuel_aerolinea_origen NVARCHAR(10),
    vuel_duracion INT,
    PRIMARY KEY (vuel_aerolinea_codigo, vuel_numero, vuel_fecha),

    CONSTRAINT fk_vuelo_aeropuerto_destino
        FOREIGN KEY (vuel_aerolinea_destino)
        REFERENCES aeropuerto(aero_codigo),

    CONSTRAINT fk_vuelo_aeropuerto_origen
        FOREIGN KEY (vuel_aerolinea_origen)
        REFERENCES aeropuerto(aero_codigo)
);

CREATE TABLE item_vuelo (
    itvu_codigo_reserva BIGINT IDENTITY(1,1) PRIMARY KEY,
    itvu_vuelo_aerolinea_codigo NVARCHAR(255),
    itvu_vuelo_numero BIGINT,
    itvu_vuelo_fecha DATE,
    itvu_cantidad_pasajes INT,
    itvu_precio_subtotal DECIMAL(18,2),


    CONSTRAINT fk_item_vuelo_vuelo
        FOREIGN KEY (itvu_vuelo_aerolinea_codigo, itvu_vuelo_numero, itvu_vuelo_fecha)
        REFERENCES vuelo(vuel_aerolinea_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE pasaje (
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
        REFERENCES item_vuelo(itvu_codigo_reserva),

    CONSTRAINT fk_pasaje_vuelo
        FOREIGN KEY (pasa_vuelo_aerolinea_codigo, pasa_vuelo_numero, pasa_vuelo_fecha)
        REFERENCES vuelo(vuel_aerolinea_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE propuesta_vuelo (
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
        REFERENCES propuesta(prop_id),

    CONSTRAINT fk_propuesta_pasaje_id
        FOREIGN KEY (prvu_pasaje_id)
        REFERENCES pasaje(pasa_id),

    CONSTRAINT fk_propuesta_vuelo
        FOREIGN KEY (prvu_vuelo_aerolinea_codigo, prvu_vuelo_numero, prvu_vuelo_fecha)
        REFERENCES vuelo(vuel_aerolinea_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE proveedor (
    prov_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    prov_nombre NVARCHAR(255),
    prov_mail NVARCHAR(255),
    prov_telefono NVARCHAR(255)
);

CREATE TABLE excursion (
    excu_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    excu_proveedor_id BIGINT,
    excu_nombre NVARCHAR(255),
    excu_descripcion NVARCHAR(255),
    excu_horario NVARCHAR(MAX),
    excu_duracion INT,
    excu_precio_unitario DECIMAL(18,2),

    CONSTRAINT fk_excursion_proveedor
        FOREIGN KEY (excu_proveedor_id)
        REFERENCES proveedor(prov_id)
);

CREATE TABLE item_excursion (
    itex_codigo_reserva BIGINT IDENTITY(1,1) PRIMARY KEY,
    itex_fecha_venta DATE,
    itex_cantidad INT,
    itex_precio_subtotal DECIMAL(18,2),
);

CREATE TABLE item_hospedaje (
    itho_codigo_reserva BIGINT IDENTITY(1,1) PRIMARY KEY,
    itho_fecha_ingreso DATE,
    itho_fecha_egreso DATE,
    itho_cantidad_habitaciones INT,
    itho_precio_subtotal DECIMAL(18,2)
);

CREATE TABLE tramo(
    tram_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    tram_aerolinea_origen NVARCHAR(10),
    tram_aerolinea_destino NVARCHAR(10),
    tram_fecha_salida DATE,
    tram_horario_salida NVARCHAR(50),
    tram_fecha_llegada DATE,
    tram_horario_llegada NVARCHAR(50),

    CONSTRAINT fk_tramo_aero_origen
        FOREIGN KEY (tram_aerolinea_origen)
        REFERENCES aeropuerto(aero_codigo),

    CONSTRAINT fk_tramo_aero_destino
        FOREIGN KEY (tram_aerolinea_destino)
        REFERENCES aeropuerto(aero_codigo)
);

-- ==========================================
-- TABLAS TRANSACCIONALES
-- ==========================================

CREATE TABLE item_excursion_excursion(
    itee_excursion_id BIGINT,
    itee_item_codigo_reserva BIGINT,

    CONSTRAINT fk_item_excursion_excursion_item_excursion
        FOREIGN KEY (itee_item_codigo_reserva)
        REFERENCES item_excursion(itex_codigo_reserva),

    CONSTRAINT fk_item_excursion_excursion_excursion
        FOREIGN KEY (itee_excursion_id)
        REFERENCES excursion(excu_id),

    PRIMARY KEY (itee_excursion_id, itee_item_codigo_reserva)
);

CREATE TABLE pasaje_tramo (
    patr_pasaje_id BIGINT,
    patr_tramo_id BIGINT,

    CONSTRAINT fk_pasaje_tramo_pasaje
        FOREIGN KEY (patr_pasaje_id)
        REFERENCES pasaje(pasa_id),

    CONSTRAINT fk_pasaje_tramo_tramo
        FOREIGN KEY (patr_tramo_id)
        REFERENCES tramo(tram_id),

    PRIMARY KEY (patr_pasaje_id, patr_tramo_id)
);

CREATE TABLE vuelo_tramo (
    vutr_vuelo_aerolinea_codigo NVARCHAR(255),
    vutr_vuelo_numero BIGINT,
    vutr_vuelo_fecha DATE,
    vutr_tramo_id BIGINT,

    CONSTRAINT fk_vuelo_tramo_vuelo
        FOREIGN KEY (vutr_vuelo_aerolinea_codigo, vutr_vuelo_numero, vutr_vuelo_fecha)
        REFERENCES vuelo(vuel_aerolinea_codigo, vuel_numero, vuel_fecha),

    CONSTRAINT fk_vuelo_tramo_tramo
        FOREIGN KEY (vutr_tramo_id)
        REFERENCES tramo(tram_id),

    PRIMARY KEY (vutr_vuelo_aerolinea_codigo, vutr_vuelo_numero, vutr_vuelo_fecha, vutr_tramo_id)
);

CREATE TABLE propuesta_hospedaje_habitacion (
    prhh_habitacion_id BIGINT,
    prhh_propuesta_hospedaje_id BIGINT,

    CONSTRAINT fk_propuesta_hospedaje_habitacion_habitacion
        FOREIGN KEY (prhh_habitacion_id)
        REFERENCES habitacion(habi_id),
    CONSTRAINT fk_propuesta_hospedaje_habitacion_propuesta_hospedaje
        FOREIGN KEY (prhh_propuesta_hospedaje_id)
        REFERENCES propuesta_hospedaje(prho_id),

    PRIMARY KEY (prhh_habitacion_id, prhh_propuesta_hospedaje_id)
);

CREATE TABLE aspecto_puntaje (
    asde_detalle_id BIGINT,
    asde_aspecto_codigo BIGINT,

    CONSTRAINT fk_aspecto_puntaje_aspecto
        FOREIGN KEY (asde_detalle_id)
        REFERENCES aspecto(aspe_codigo),

    CONSTRAINT fk_aspecto_puntaje_puntaje
        FOREIGN KEY (asde_aspecto_codigo)
        REFERENCES puntaje(punt_id),

    PRIMARY KEY (asde_detalle_id, asde_aspecto_codigo)
);

-- ======================================== [Migración] ======================================== --

-- PASO 1: SIN FOREIGN KEYS !!!!!

INSERT INTO pais (pais_nombre)
    SELECT DISTINCT Aeropuerto_Salida_Pais
        FROM GD1C2026.gd_esquema.Maestra
        WHERE Aeropuerto_Salida_Pais IS NOT NULL
    UNION
    SELECT DISTINCT Aeropuerto_Llegada_Pais
        FROM GD1C2026.gd_esquema.Maestra
        WHERE Aeropuerto_Llegada_Pais IS NOT NULL
    UNION
    SELECT DISTINCT Aerolinea_Pais
        FROM GD1C2026.gd_esquema.Maestra
        WHERE Aerolinea_Pais IS NOT NULL
    UNION
    SELECT DISTINCT Hospedaje_Pais
        FROM GD1C2026.gd_esquema.Maestra
        WHERE Hospedaje_Pais IS NOT NULL;

INSERT INTO provincia (pcia_nombre)
    SELECT DISTINCT Agencia_Provincia
        FROM GD1C2026.gd_esquema.Maestra
        WHERE Agencia_Provincia IS NOT NULL
    UNION
    SELECT DISTINCT Agente_Provincia
        FROM GD1C2026.gd_esquema.Maestra
        WHERE Agente_Provincia IS NOT NULL
    UNION
        SELECT DISTINCT Cliente_Provincia
        FROM GD1C2026.gd_esquema.Maestra
    WHERE Cliente_Provincia IS NOT NULL;

INSERT INTO proveedor (prov_nombre)
    SELECT DISTINCT Proveedor_Nombre
        FROM GD1C2026.gd_esquema.Maestra
        WHERE Proveedor_Nombre IS NOT NULL;

INSERT INTO estado_propuesta (espr_nombre)
    SELECT DISTINCT Propuesta_Estado
        FROM GD1C2026.gd_esquema.Maestra
        WHERE Propuesta_Estado IS NOT NULL;

INSERT INTO item_excursion (itex_fecha_venta, itex_cantidad, itex_precio_subtotal)
    SELECT DISTINCT
        Detalle_Venta_Excursion_Fecha_Reserva,
        Detalle_Venta_Excursion_Cant,
        Detalle_Venta_Excursion_Subtotal
    FROM GD1C2026.gd_esquema.Maestra
    WHERE Detalle_Venta_Excursion_Cod_Reserva IS NOT NULL;

INSERT INTO item_hospedaje (itho_fecha_ingreso, itho_fecha_egreso, itho_cantidad_habitaciones, itho_precio_subtotal)
    SELECT DISTINCT
        Detalle_Venta_Hospedaje_Fecha_Desde,
        Detalle_Venta_Hospedaje_Fecha_Hasta,
        Detalle_Venta_Hospedaje_Cantidad,
        Detalle_Venta_Hospedaje_Subtotal
    FROM GD1C2026.gd_esquema.Maestra
    WHERE Detalle_Venta_Hospedaje_Cod_Reserva IS NOT NULL;

-- PASO 1: DEPENDEN SOLO DE LA FASE 1

INSERT INTO ciudad (ciud_nombre, ciud_pais_id)
    SELECT DISTINCT
        origen.Ciudad,
        p.pais_id
    FROM (
        SELECT DISTINCT Aeropuerto_Salida_Ciudad AS Ciudad, Aeropuerto_Salida_Pais AS Pais
            FROM GD1C2026.gd_esquema.Maestra
            WHERE Aeropuerto_Salida_Ciudad IS NOT NULL
        UNION
        SELECT DISTINCT Aeropuerto_Llegada_Ciudad, Aeropuerto_Llegada_Pais
            FROM GD1C2026.gd_esquema.Maestra
            WHERE Aeropuerto_Llegada_Ciudad IS NOT NULL
        UNION
            SELECT DISTINCT Hospedaje_Ciudad, Hospedaje_Pais
            FROM GD1C2026.gd_esquema.Maestra
        WHERE Hospedaje_Ciudad IS NOT NULL
    ) AS origen
    JOIN pais p ON origen.Pais = p.pais_nombre;