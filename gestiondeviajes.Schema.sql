--DROP DATABASE gestiondeviajes
--GO

CREATE DATABASE gestiondeviajes
GO

USE gestiondeviajes
GO

CREATE TABLE pais (
    pais_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    pais_nombre NVARCHAR(255) NOT NULL
);

CREATE TABLE provincia (
    prov_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    prov_pais_id BIGINT,
    prov_nombre NVARCHAR(255),

    CONSTRAINT fk_provincia_pais
        FOREIGN KEY (prov_pais_id)
        REFERENCES pais(pais_id)
);

CREATE TABLE ciudad (
    ciud_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    ciud_prov_id BIGINT,
    ciud_nombre NVARCHAR(255),

    CONSTRAINT fk_ciudad_provincia
        FOREIGN KEY (ciud_prov_id)
        REFERENCES provincia(prov_id)
);

CREATE TABLE localidad (
    loca_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    loca_ciud_id BIGINT,
    loca_nombre NVARCHAR(255),

    CONSTRAINT fk_localidad_ciudad
        FOREIGN KEY (loca_ciud_id)
        REFERENCES ciudad(ciud_id)
);

CREATE TABLE cliente (
    clie_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    clie_localidad_id BIGINT,
    clie_dni NVARCHAR(255) UNIQUE NOT NULL,
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
    agen_agcy_nro BIGINT,
    agen_localidad_id BIGINT,
    agen_dni NVARCHAR(255) UNIQUE NOT NULL,
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
        FOREIGN KEY (agen_agcy_nro)
        REFERENCES agencia(agcy_nro)
);

CREATE TABLE solicitud (
    soli_nro BIGINT IDENTITY(1,1) PRIMARY KEY,
    soli_clie_id BIGINT,
    soli_agen_legajo BIGINT,
    soli_fecha_realizacion DATE NULL,
    soli_fecha_inicio_tentativa DATE NULL,
    soli_fecha_fin_tentativa DATE NULL,
    soli_cantidad_pasajeros INT,
    soli_observaciones NVARCHAR(MAX),
    soli_presupuesto_estimado DECIMAL(18,2),

    CONSTRAINT fk_solicitud_cliente
        FOREIGN KEY (soli_clie_id)
        REFERENCES cliente(clie_id),

    CONSTRAINT fk_solicitud_agente
        FOREIGN KEY (soli_agen_legajo)
        REFERENCES agente(agen_legajo)
);

CREATE TABLE detalle_solicitud (
    deta_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    deta_soli_nro BIGINT,
    deta_ciud_id BIGINT,
    deta_cantidad_dias_aprox INT,
    deta_observaciones NVARCHAR(MAX),

    CONSTRAINT fk_detalle_solicitud_solicitud
        FOREIGN KEY (deta_soli_nro)
        REFERENCES solicitud(soli_nro),

    CONSTRAINT fk_detalle_solicitud_ciudad
        FOREIGN KEY (deta_ciud_id)
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
    encu_clie_id BIGINT,
    encu_agen_legajo BIGINT,
    encu_agcy_nro BIGINT,
    encu_fecha DATE,
    encu_comentarios NVARCHAR(MAX),

    CONSTRAINT fk_encuesta_cliente
        FOREIGN KEY (encu_clie_id)
        REFERENCES cliente(clie_id),
    CONSTRAINT fk_encuesta_agente
        FOREIGN KEY (encu_agen_legajo)
        REFERENCES agente(agen_legajo),
    CONSTRAINT fk_encuesta_agencia
        FOREIGN KEY (encu_agcy_nro)
        REFERENCES agencia(agcy_nro)
);

CREATE TABLE puntaje (
    punt_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    punt_encu_codigo BIGINT,
    punt_puntaje INT,

    CONSTRAINT fk_puntaje_encuesta
        FOREIGN KEY (punt_encu_codigo)
        REFERENCES encuesta(encu_codigo)
);

CREATE TABLE aspecto (
    aspe_codigo BIGINT IDENTITY(1,1) PRIMARY KEY,
    aspe_encu_codigo BIGINT,
    aspe_aspecto NVARCHAR(255),

    CONSTRAINT fk_aspecto_encuesta
        FOREIGN KEY (aspe_encu_codigo)
        REFERENCES encuesta(encu_codigo)
);

CREATE TABLE estado_propuesta (
    espr_cod BIGINT IDENTITY(1,1) PRIMARY KEY,
    espr_nombre NVARCHAR(255),
    espr_descripcion NVARCHAR(255)
);

CREATE TABLE propuesta (
    prop_nro BIGINT PRIMARY KEY,
    prop_estado BIGINT,
    prop_agen_legajo BIGINT,
    prop_soli_nro BIGINT,
    prop_fecha_emision DATE,
    prop_fecha_vigencia DATE,
    prop_fecha_inicio_viaje DATE,
    prop_fecha_fin_viaje DATE,
    prop_subtotal DECIMAL(18,2),
    prop_descuento DECIMAL(18,2),
    prop_importe_total DECIMAL(18,2),

    CONSTRAINT fk_propuesta_estado_propuesta
        FOREIGN KEY (prop_estado)
        REFERENCES estado_propuesta(espr_cod),

    CONSTRAINT fk_propuesta_agente
        FOREIGN KEY (prop_agen_legajo)
        REFERENCES agente(agen_legajo),

    CONSTRAINT fk_propuesta_solicitud
        FOREIGN KEY (prop_soli_nro)
        REFERENCES solicitud(soli_nro)
);

CREATE TABLE venta (
    vent_nro BIGINT PRIMARY KEY,
    vent_agcy_nro BIGINT,
    vent_agen_legajo BIGINT,
    vent_clie_id BIGINT,
    vent_prop_nro BIGINT,
    vent_fecha DATE,
    vent_canal_venta NVARCHAR(255),
    vent_subtotal DECIMAL(18,2),
    vent_descuento DECIMAL(18,2),
    vent_importe_total DECIMAL(18,2),
    vent_medio_pago NVARCHAR(255),

    CONSTRAINT fk_venta_agencia
        FOREIGN KEY (vent_agcy_nro)
        REFERENCES agencia(agcy_nro),

    CONSTRAINT fk_venta_agente
        FOREIGN KEY (vent_agen_legajo)
        REFERENCES agente(agen_legajo),

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (vent_clie_id)
        REFERENCES cliente(clie_id),

    CONSTRAINT fk_venta_propuesta
        FOREIGN KEY (vent_prop_nro)
        REFERENCES propuesta(prop_nro)
);

CREATE TABLE hospedaje (
    hosp_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    hosp_check_in NVARCHAR(255),
    hosp_check_out NVARCHAR(255),
    hosp_ciudad_id BIGINT,
    hosp_nombre NVARCHAR(255),
    hosp_direccion NVARCHAR(255),
    hosp_incluye_desayuno BIT
);

CREATE TABLE habitacion (
    habi_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    habi_hosp_id BIGINT,
    habi_nombre NVARCHAR(255),
    habi_descripcion NVARCHAR(MAX),
    habi_precio_noche DECIMAL(18,2),

    CONSTRAINT fk_Hospedaje_Habitacion
        FOREIGN KEY (habi_hosp_id)
        REFERENCES hospedaje(hosp_id)
);

CREATE TABLE propuesta_hospedaje (
    prho_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    prho_prop_nro BIGINT,
    prho_hosp_id BIGINT,
    prho_habi_id BIGINT,
    prho_fecha_ingreso DATE,
    prho_fecha_egreso DATE,
    prho_cantidad_habitaciones INT,
    prho_total_hospedaje DECIMAL(18,2),
    prho_subtotal_hospedaje DECIMAL(18,2),

    CONSTRAINT fk_propuesta_hospedaje_propuesta
        FOREIGN KEY (prho_prop_nro)
        REFERENCES propuesta(prop_nro),

    CONSTRAINT fk_propuesta_hospedaje_hospedaje
        FOREIGN KEY (prho_hosp_id)
        REFERENCES hospedaje(hosp_id),

    CONSTRAINT fk_propuesta_hospedaje_habitacion
        FOREIGN KEY (prho_habi_id)
        REFERENCES habitacion(habi_id)
);

CREATE TABLE vuelo (
    vuel_arol_codigo NVARCHAR(255),
    vuel_numero BIGINT,
    vuel_fecha DATE,
    vuel_aero_destino NVARCHAR(10),
    vuel_aero_origen NVARCHAR(10),
    vuel_duracion INT,
    PRIMARY KEY (vuel_arol_codigo, vuel_numero, vuel_fecha),

    CONSTRAINT fk_vuelo_aeropuerto_destino
        FOREIGN KEY (vuel_aero_destino)
        REFERENCES aeropuerto(aero_codigo),

    CONSTRAINT fk_vuelo_aeropuerto_origen
        FOREIGN KEY (vuel_aero_origen)
        REFERENCES aeropuerto(aero_codigo)
);

CREATE TABLE item_vuelo (
    itvu_codigo_reserva BIGINT IDENTITY(1,1) PRIMARY KEY,
    itvu_vuel_arol_codigo NVARCHAR(255),
    itvu_vuel_numero BIGINT,
    itvu_vuel_fecha DATE,
    itvu_cantidad_pasajes INT,
    itvu_precio_subtotal DECIMAL(18,2),


    CONSTRAINT fk_item_vuelo_vuelo
        FOREIGN KEY (itvu_vuel_arol_codigo, itvu_vuel_numero, itvu_vuel_fecha)
        REFERENCES vuelo(vuel_arol_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE pasaje (
    pasa_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    pasa_itvu_codigo_reserva BIGINT,
    pasa_vuel_arol_codigo NVARCHAR(255),
    pasa_vuel_numero BIGINT,
    pasa_vuel_fecha DATE,
    pasa_precio_unitario DECIMAL(18,2),
    pasa_inlcuye_carry BIT,
    pasa_incluye_valija BIT,

    CONSTRAINT fk_pasaje_item_vuelo
        FOREIGN KEY (pasa_itvu_codigo_reserva)
        REFERENCES item_vuelo(itvu_codigo_reserva),

    CONSTRAINT fk_pasaje_vuelo
        FOREIGN KEY (pasa_vuel_arol_codigo, pasa_vuel_numero, pasa_vuel_fecha)
        REFERENCES vuelo(vuel_arol_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE propuesta_vuelo (
    prvu_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    prvu_prop_nro BIGINT,
    prvu_vuel_arol_codigo NVARCHAR(255),
    prvu_vuel_numero BIGINT,
    prvu_vuel_fecha DATE,
    prvu_pasa_id BIGINT,
    prvu_cantidad_pasajes INT,
    prvu_precio_pasaje DECIMAL(18,2),
    prvu_subtotal_vuelo DECIMAL(18,2),

    CONSTRAINT fk_propuesta_propuesta_vuelo
        FOREIGN KEY (prvu_prop_nro)
        REFERENCES propuesta(prop_nro),

    CONSTRAINT fk_propuesta_pasaje_id
        FOREIGN KEY (prvu_pasa_id)
        REFERENCES pasaje(pasa_id),

    CONSTRAINT fk_propuesta_vuelo
        FOREIGN KEY (prvu_vuel_arol_codigo, prvu_vuel_numero, prvu_vuel_fecha)
        REFERENCES vuelo(vuel_arol_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE proveedor (
    prov_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    prov_nombre NVARCHAR(255),
    prov_mail NVARCHAR(255),
    prov_telefono NVARCHAR(255)
);

CREATE TABLE excursion (
    excu_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    excu_prov_id BIGINT,
    excu_descripcion NVARCHAR(255),
    excu_horario NVARCHAR(MAX),
    excu_duracion INT,
    excu_precio_unitario DECIMAL(18,2),

    CONSTRAINT fk_excursion_proveedor
        FOREIGN KEY (excu_prov_id)
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
    tram_aero_origen NVARCHAR(10),
    tram_aero_destino NVARCHAR(10),
    tram_fecha_salida DATE,
    tram_horario_salida NVARCHAR(50),
    tram_fecha_llegada DATE,
    tram_horario_llegada NVARCHAR(50),

    CONSTRAINT fk_tramo_aero_origen
        FOREIGN KEY (tram_aero_origen)
        REFERENCES aeropuerto(aero_codigo),

    CONSTRAINT fk_tramo_aero_destino
        FOREIGN KEY (tram_aero_destino)
        REFERENCES aeropuerto(aero_codigo)
);

-- ==========================================
-- TABLAS TRANSACCIONALES
-- ==========================================

CREATE TABLE item_excursion_excursion(
    itee_excu_id BIGINT,
    itee_item_codigo_reserva BIGINT,

    CONSTRAINT fk_item_excursion_excursion_item_excursion
        FOREIGN KEY (itee_item_codigo_reserva)
        REFERENCES item_excursion(itex_codigo_reserva),

    CONSTRAINT fk_item_excursion_excursion_excursion
        FOREIGN KEY (itee_excu_id)
        REFERENCES excursion(excu_id),

    PRIMARY KEY (itee_excu_id, itee_item_codigo_reserva)
);

CREATE TABLE pasaje_tramo (
    patr_pasa_id BIGINT,
    patr_tram_id BIGINT,

    CONSTRAINT fk_pasaje_tramo_pasaje
        FOREIGN KEY (patr_pasa_id)
        REFERENCES pasaje(pasa_id),

    CONSTRAINT fk_pasaje_tramo_tramo
        FOREIGN KEY (patr_tram_id)
        REFERENCES tramo(tram_id),

    PRIMARY KEY (patr_pasa_id, patr_tram_id)
);

CREATE TABLE vuelo_tramo (
    vutr_vuel_arol_codigo NVARCHAR(255),
    vutr_vuel_numero BIGINT,
    vutr_vuel_fecha DATE,
    vutr_tram_id BIGINT,

    CONSTRAINT fk_vuelo_tramo_vuelo
        FOREIGN KEY (vutr_vuel_arol_codigo, vutr_vuel_numero, vutr_vuel_fecha)
        REFERENCES vuelo(vuel_arol_codigo, vuel_numero, vuel_fecha),

    CONSTRAINT fk_vuelo_tramo_tramo
        FOREIGN KEY (vutr_tram_id)
        REFERENCES tramo(tram_id),

    PRIMARY KEY (vutr_vuel_arol_codigo, vutr_vuel_numero, vutr_vuel_fecha, vutr_tram_id)
);

CREATE TABLE propuesta_hospedaje_habitacion (
    habi_id BIGINT,
    prho_id BIGINT,

    CONSTRAINT fk_propuesta_hospedaje_habitacion_habitacion
        FOREIGN KEY (habi_id)
        REFERENCES habitacion(habi_id),
    CONSTRAINT fk_propuesta_hospedaje_habitacion_propuesta_hospedaje
        FOREIGN KEY (prho_id)
        REFERENCES propuesta_hospedaje(prho_id),

    PRIMARY KEY (habi_id, prho_id)
);

CREATE TABLE aspecto_puntaje (
    asde_deta_id BIGINT,
    asde_aspe_codigo BIGINT,

    CONSTRAINT fk_aspecto_puntaje_aspecto
        FOREIGN KEY (asde_deta_id)
        REFERENCES aspecto(aspe_codigo),

    CONSTRAINT fk_aspecto_puntaje_puntaje
        FOREIGN KEY (asde_aspe_codigo)
        REFERENCES puntaje(punt_id),

    PRIMARY KEY (asde_deta_id, asde_aspe_codigo)
);