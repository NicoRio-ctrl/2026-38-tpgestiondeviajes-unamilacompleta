-- ======================================== [Preparación] ======================================== --
USE GD1C2026;
GO

--Borrar FKs
GO
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

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_habitacion_hospedaje')
    ALTER TABLE LA_MILA_COMPLETA.habitacion DROP CONSTRAINT fk_habitacion_hospedaje;

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

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_tramo_aero_origen')
    ALTER TABLE LA_MILA_COMPLETA.tramo DROP CONSTRAINT fk_tramo_aero_origen;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_tramo_aero_destino')
    ALTER TABLE LA_MILA_COMPLETA.tramo DROP CONSTRAINT fk_tramo_aero_destino;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_item_excursion_excursion_item_excursion')
    ALTER TABLE LA_MILA_COMPLETA.item_excursion_excursion DROP CONSTRAINT fk_item_excursion_excursion_item_excursion;

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

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_hospedaje_habitacion_habitacion')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje_habitacion DROP CONSTRAINT fk_propuesta_hospedaje_habitacion_habitacion;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_propuesta_hospedaje_habitacion_propuesta_hospedaje')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje_habitacion DROP CONSTRAINT fk_propuesta_hospedaje_habitacion_propuesta_hospedaje;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_aspecto_puntaje_aspecto')
    ALTER TABLE LA_MILA_COMPLETA.aspecto_puntaje DROP CONSTRAINT fk_aspecto_puntaje_aspecto;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'fk_aspecto_puntaje_puntaje')
    ALTER TABLE LA_MILA_COMPLETA.aspecto_puntaje DROP CONSTRAINT fk_aspecto_puntaje_puntaje;

--Borrar PKs
GO
IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_pais')
    ALTER TABLE LA_MILA_COMPLETA.pais DROP CONSTRAINT PK_pais;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_ciud')
    ALTER TABLE LA_MILA_COMPLETA.ciudad DROP CONSTRAINT PK_ciud;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_pcia')
    ALTER TABLE LA_MILA_COMPLETA.provincia DROP CONSTRAINT PK_pcia;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_loca')
    ALTER TABLE LA_MILA_COMPLETA.localidad DROP CONSTRAINT PK_loca;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_clie')
    ALTER TABLE LA_MILA_COMPLETA.cliente DROP CONSTRAINT PK_clie;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_agcy')
    ALTER TABLE LA_MILA_COMPLETA.agencia DROP CONSTRAINT PK_agcy;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_agen')
    ALTER TABLE LA_MILA_COMPLETA.agente DROP CONSTRAINT PK_agen;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_soli')
    ALTER TABLE LA_MILA_COMPLETA.solicitud DROP CONSTRAINT PK_soli;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_deta')
    ALTER TABLE LA_MILA_COMPLETA.detalle_solicitud DROP CONSTRAINT PK_deta;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_arol')
    ALTER TABLE LA_MILA_COMPLETA.aerolinea DROP CONSTRAINT PK_arol;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_aero')
    ALTER TABLE LA_MILA_COMPLETA.aeropuerto DROP CONSTRAINT PK_aero;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_encu')
    ALTER TABLE LA_MILA_COMPLETA.encuesta DROP CONSTRAINT PK_encu;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_punt')
    ALTER TABLE LA_MILA_COMPLETA.puntaje DROP CONSTRAINT PK_punt;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_aspe')
    ALTER TABLE LA_MILA_COMPLETA.aspecto DROP CONSTRAINT PK_aspe;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_espr')
    ALTER TABLE LA_MILA_COMPLETA.estado_propuesta DROP CONSTRAINT PK_espr;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_prop')
    ALTER TABLE LA_MILA_COMPLETA.propuesta DROP CONSTRAINT PK_prop;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_vent')
    ALTER TABLE LA_MILA_COMPLETA.venta DROP CONSTRAINT PK_vent;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_hosp')
    ALTER TABLE LA_MILA_COMPLETA.hospedaje DROP CONSTRAINT PK_hosp;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_habi')
    ALTER TABLE LA_MILA_COMPLETA.habitacion DROP CONSTRAINT PK_habi;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_prho')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje DROP CONSTRAINT PK_prho;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_vuel')
    ALTER TABLE LA_MILA_COMPLETA.vuelo DROP CONSTRAINT PK_vuel;
    
IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_itvu')
    ALTER TABLE LA_MILA_COMPLETA.item_vuelo DROP CONSTRAINT PK_itvu;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_pasa')
    ALTER TABLE LA_MILA_COMPLETA.pasaje DROP CONSTRAINT PK_pasa;  

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_prvu')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_vuelo DROP CONSTRAINT PK_prvu;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_prov')
    ALTER TABLE LA_MILA_COMPLETA.proveedor DROP CONSTRAINT PK_prov;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_excu')
    ALTER TABLE LA_MILA_COMPLETA.excursion DROP CONSTRAINT PK_excu;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_itex')
    ALTER TABLE LA_MILA_COMPLETA.item_excursion DROP CONSTRAINT PK_itex;  

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_itho')
    ALTER TABLE LA_MILA_COMPLETA.item_hospedaje DROP CONSTRAINT PK_itho;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_tram')
    ALTER TABLE LA_MILA_COMPLETA.tramo DROP CONSTRAINT PK_tram;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_itee')
    ALTER TABLE LA_MILA_COMPLETA.item_excursion_excursion DROP CONSTRAINT PK_itee;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_patr')
    ALTER TABLE LA_MILA_COMPLETA.pasaje_tramo DROP CONSTRAINT PK_patr;
    
IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_vutr')
    ALTER TABLE LA_MILA_COMPLETA.vuelo_tramo DROP CONSTRAINT PK_vutr;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_prhh')
    ALTER TABLE LA_MILA_COMPLETA.propuesta_hospedaje_habitacion DROP CONSTRAINT PK_prhh;

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'PK_aspu')
    ALTER TABLE LA_MILA_COMPLETA.aspecto_puntaje DROP CONSTRAINT PK_aspu;

-- Borrar tablas
GO
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
GO
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_PAIS', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_PAIS;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_CIUDAD', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_CIUDAD;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_PROVINCIA', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROVINCIA;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_LOCALIDAD', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_LOCALIDAD;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_CLIENTE', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_CLIENTE;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_AGENCIA', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_AGENCIA;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_AGENTE', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_AGENTE;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_SOLICITUD', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_SOLICITUD;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_DETALLE_SOLICITUD', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_DETALLE_SOLICITUD;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_AEROLINEA', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_AEROLINEA;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_AEROPUERTO', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_AEROPUERTO;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_ENCUESTA', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_ENCUESTA;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_PUNTAJE', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_PUNTAJE;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_ASPECTO', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_ASPECTO;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_ESTADO_PROPUESTA', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_ESTADO_PROPUESTA;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_PROPUESTA', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROPUESTA;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_VENTA', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_VENTA;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_HOSPEDAJE', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_HOSPEDAJE;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_HABITACION', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_HABITACION;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_PROPUESTA_HOSPEDAJE', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROPUESTA_HOSPEDAJE;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_VUELO', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_VUELO;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_ITEM_VUELO', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_ITEM_VUELO;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_PASAJE', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_PASAJE;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_PROPUESTA_VUELO', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROPUESTA_VUELO;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_PROVEEDOR', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROVEEDOR;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_EXCURSION', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_EXCURSION;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_ITEM_EXCURSION', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_ITEM_EXCURSION;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_ITEM_HOSPEDAJE', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_ITEM_HOSPEDAJE;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_TRAMO', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_TRAMO;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_ITEM_EXCURSION_EXCURSION', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_ITEM_EXCURSION_EXCURSION;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_PASAJE_TRAMO', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_PASAJE_TRAMO;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_VUELO_TRAMO', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_VUELO_TRAMO;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_PROPUESTA_HOSPEDAJE_HABITACION', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROPUESTA_HOSPEDAJE_HABITACION;
IF OBJECT_ID('LA_MILA_COMPLETA.MIGRAR_ASPECTO_PUNTAJE', 'p') IS NOT NULL DROP PROCEDURE LA_MILA_COMPLETA.MIGRAR_ASPECTO_PUNTAJE;

--Borrar Schema
GO
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

    CONSTRAINT PK_ciud PRIMARY KEY (ciud_id),

    CONSTRAINT fk_ciudad_pais
        FOREIGN KEY (ciud_pais_id)
        REFERENCES LA_MILA_COMPLETA.pais(pais_id)
);

CREATE TABLE LA_MILA_COMPLETA.provincia (
    pcia_id BIGINT IDENTITY(1,1),
    pcia_nombre NVARCHAR(255),

    CONSTRAINT PK_pcia PRIMARY KEY (pcia_id)
);

CREATE TABLE LA_MILA_COMPLETA.localidad (
    loca_id BIGINT IDENTITY(1,1),
    loca_provincia_id BIGINT,
    loca_nombre NVARCHAR(255),

    CONSTRAINT PK_loca PRIMARY KEY (loca_id),

    CONSTRAINT fk_localidad_provincia
        FOREIGN KEY (loca_provincia_id)
        REFERENCES LA_MILA_COMPLETA.provincia(pcia_id)
);

CREATE TABLE LA_MILA_COMPLETA.cliente (
    clie_id BIGINT IDENTITY(1,1),
    clie_localidad_id BIGINT,
    clie_dni INT NOT NULL,
    clie_nombre NVARCHAR(255) NOT NULL,
    clie_apellido NVARCHAR(255) NOT NULL,
    clie_telefono NVARCHAR(255),
    clie_mail NVARCHAR(255),
    clie_direccion NVARCHAR(255),
    clie_fecha_nacimiento DATE,

    CONSTRAINT PK_clie PRIMARY KEY (clie_id),

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

    CONSTRAINT PK_agcy PRIMARY KEY (agcy_nro),

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

    CONSTRAINT PK_agen PRIMARY KEY (agen_legajo),

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

    CONSTRAINT PK_soli PRIMARY KEY (soli_id),

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

    CONSTRAINT PK_deta PRIMARY KEY (deta_id),

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

    CONSTRAINT PK_arol PRIMARY KEY (arol_codigo),
    
    CONSTRAINT fk_aerolinea_pais
        FOREIGN KEY (arol_pais_id)
        REFERENCES LA_MILA_COMPLETA.pais(pais_id)
);

CREATE TABLE LA_MILA_COMPLETA.aeropuerto (
    aero_codigo NVARCHAR(10),
    aero_ciudad_id BIGINT,
    aero_descripcion NVARCHAR(200),

    CONSTRAINT PK_aero PRIMARY KEY (aero_codigo),

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

    CONSTRAINT PK_encu PRIMARY KEY (encu_codigo),

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
    
    CONSTRAINT PK_punt PRIMARY KEY (punt_id),

    CONSTRAINT fk_puntaje_encuesta
        FOREIGN KEY (punt_encuesta_codigo)
        REFERENCES LA_MILA_COMPLETA.encuesta(encu_codigo)
);

CREATE TABLE LA_MILA_COMPLETA.aspecto (
    aspe_codigo BIGINT IDENTITY(1,1),
    aspe_aspecto NVARCHAR(255),

    CONSTRAINT PK_aspe PRIMARY KEY (aspe_codigo),
);

CREATE TABLE LA_MILA_COMPLETA.estado_propuesta (
    espr_codigo BIGINT IDENTITY(1,1),
    espr_nombre NVARCHAR(255),

    CONSTRAINT PK_espr PRIMARY KEY (espr_codigo)
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
    
    CONSTRAINT PK_prop PRIMARY KEY (prop_id), 

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

    CONSTRAINT PK_vent PRIMARY KEY (vent_nro),

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
    hosp_incluye_desayuno BIT,

    CONSTRAINT PK_hosp PRIMARY KEY (hosp_id),

    CONSTRAINT fk_hospedaje_ciudad
        FOREIGN KEY (hosp_ciudad_id)
        REFERENCES LA_MILA_COMPLETA.ciudad(ciud_id)
);

CREATE TABLE LA_MILA_COMPLETA.habitacion (
    habi_id BIGINT IDENTITY(1,1),
    habi_hospedaje_id BIGINT,
    habi_nombre NVARCHAR(255),
    habi_descripcion NVARCHAR(MAX),
    habi_precio_noche DECIMAL(18,2),

    CONSTRAINT PK_habi PRIMARY KEY (habi_id),

    CONSTRAINT fk_habitacion_hospedaje
        FOREIGN KEY (habi_hospedaje_id)
        REFERENCES LA_MILA_COMPLETA.hospedaje(hosp_id)
);

CREATE TABLE LA_MILA_COMPLETA.propuesta_hospedaje (
    prho_id BIGINT IDENTITY(1,1),
    prho_propuesta_id BIGINT,
    prho_hospedaje_id BIGINT,
    prho_habitacion_id BIGINT,
    prho_fecha_ingreso DATE,
    prho_fecha_egreso DATE,
    prho_cantidad_habitaciones INT,
    prho_precio_hospedaje DECIMAL(18,2),
    prho_subtotal_hospedaje DECIMAL(18,2),

    CONSTRAINT PK_prho PRIMARY KEY (prho_id),

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
    vuel_numero BIGINT IDENTITY(1,1),
    vuel_fecha DATE,
    vuel_aeropuerto_destino NVARCHAR(10),
    vuel_aeropuerto_origen NVARCHAR(10),
    vuel_duracion INT,
    
    CONSTRAINT PK_vuel PRIMARY KEY (vuel_aerolinea_codigo, vuel_numero, vuel_fecha),

    CONSTRAINT fk_vuelo_aeropuerto_destino
        FOREIGN KEY (vuel_aeropuerto_destino)
        REFERENCES LA_MILA_COMPLETA.aeropuerto(aero_codigo),

    CONSTRAINT fk_vuelo_aeropuerto_origen
        FOREIGN KEY (vuel_aeropuerto_origen)
        REFERENCES LA_MILA_COMPLETA.aeropuerto(aero_codigo)
);

CREATE TABLE LA_MILA_COMPLETA.item_vuelo (
    itvu_codigo_reserva NVARCHAR(255),
    itvu_vuelo_aerolinea_codigo NVARCHAR(255),
    itvu_vuelo_numero BIGINT,
    itvu_vuelo_fecha DATE,
    itvu_cantidad_pasajes INT,
    itvu_precio_subtotal DECIMAL(18,2),

    CONSTRAINT PK_itvu PRIMARY KEY (itvu_codigo_reserva),

    CONSTRAINT fk_item_vuelo_vuelo
        FOREIGN KEY (itvu_vuelo_aerolinea_codigo, itvu_vuelo_numero, itvu_vuelo_fecha)
        REFERENCES LA_MILA_COMPLETA.vuelo(vuel_aerolinea_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE LA_MILA_COMPLETA.pasaje (
    pasa_id BIGINT IDENTITY(1,1),
    pasa_item_vuelo_codigo_reserva NVARCHAR(255),
    pasa_vuelo_aerolinea_codigo NVARCHAR(255),
    pasa_vuelo_numero BIGINT,
    pasa_vuelo_fecha DATE,
    pasa_precio_unitario DECIMAL(18,2),
    pasa_inlcuye_carry BIT,
    pasa_incluye_valija BIT,

    CONSTRAINT PK_pasa PRIMARY KEY (pasa_id),

    CONSTRAINT fk_pasaje_item_vuelo
        FOREIGN KEY (pasa_item_vuelo_codigo_reserva)
        REFERENCES LA_MILA_COMPLETA.item_vuelo(itvu_codigo_reserva),

    CONSTRAINT fk_pasaje_vuelo
        FOREIGN KEY (pasa_vuelo_aerolinea_codigo, pasa_vuelo_numero, pasa_vuelo_fecha)
        REFERENCES LA_MILA_COMPLETA.vuelo(vuel_aerolinea_codigo, vuel_numero, vuel_fecha)
);

CREATE TABLE LA_MILA_COMPLETA.propuesta_vuelo (
    prvu_id BIGINT IDENTITY(1,1),
    prvu_propuesta_nro BIGINT,
    prvu_vuelo_aerolinea_codigo NVARCHAR(255),
    prvu_vuelo_numero BIGINT,
    prvu_vuelo_fecha DATE,
    prvu_pasaje_id BIGINT,
    prvu_cantidad_pasajes INT,
    prvu_precio_vuelo DECIMAL(18,2),
    prvu_subtotal_vuelo DECIMAL(18,2),
    
    CONSTRAINT PK_prvu PRIMARY KEY (prvu_id),

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
    prov_id BIGINT IDENTITY(1,1),
    prov_nombre NVARCHAR(255),
    prov_mail NVARCHAR(255),
    prov_telefono NVARCHAR(255),

    CONSTRAINT PK_prov PRIMARY KEY (prov_id)
);

CREATE TABLE LA_MILA_COMPLETA.excursion (
    excu_id BIGINT IDENTITY(1,1),
    excu_proveedor_id BIGINT,
    excu_nombre NVARCHAR(255),
    excu_descripcion NVARCHAR(255),
    excu_horario NVARCHAR(MAX),
    excu_duracion INT,
    excu_precio_unitario DECIMAL(18,2),

    CONSTRAINT PK_excu PRIMARY KEY (excu_id),

    CONSTRAINT fk_excursion_proveedor
        FOREIGN KEY (excu_proveedor_id)
        REFERENCES LA_MILA_COMPLETA.proveedor(prov_id)
);

CREATE TABLE LA_MILA_COMPLETA.item_excursion (
    itex_codigo_reserva NVARCHAR(255),
    itex_fecha_venta DATE,
    itex_cantidad INT,
    itex_precio_subtotal DECIMAL(18,2),
    
    CONSTRAINT PK_itex PRIMARY KEY (itex_codigo_reserva)
);

CREATE TABLE LA_MILA_COMPLETA.item_hospedaje (
    itho_codigo_reserva NVARCHAR(255),
    itho_fecha_ingreso DATE,
    itho_fecha_egreso DATE,
    itho_cantidad_habitaciones INT,
    itho_precio_subtotal DECIMAL(18,2),

    CONSTRAINT PK_itho PRIMARY KEY (itho_codigo_reserva)
);

CREATE TABLE LA_MILA_COMPLETA.tramo(
    tram_id BIGINT IDENTITY(1,1),
    tram_aeropuerto_origen NVARCHAR(10),
    tram_aeropuerto_destino NVARCHAR(10),
    tram_fecha_salida DATE,
    tram_horario_salida NVARCHAR(50),
    tram_fecha_llegada DATE,
    tram_horario_llegada NVARCHAR(50),

    CONSTRAINT PK_tram PRIMARY KEY (tram_id),

    CONSTRAINT fk_tramo_aero_origen
        FOREIGN KEY (tram_aeropuerto_origen)
        REFERENCES LA_MILA_COMPLETA.aeropuerto(aero_codigo),

    CONSTRAINT fk_tramo_aero_destino
        FOREIGN KEY (tram_aeropuerto_destino)
        REFERENCES LA_MILA_COMPLETA.aeropuerto(aero_codigo)
);

-- Tablas transaccionales

CREATE TABLE LA_MILA_COMPLETA.item_excursion_excursion(
    itee_excursion_id BIGINT,
    itee_item_codigo_reserva NVARCHAR(255),

    CONSTRAINT fk_item_excursion_excursion_item_excursion
        FOREIGN KEY (itee_item_codigo_reserva)
        REFERENCES LA_MILA_COMPLETA.item_excursion(itex_codigo_reserva),

    CONSTRAINT fk_item_excursion_excursion_excursion
        FOREIGN KEY (itee_excursion_id)
        REFERENCES LA_MILA_COMPLETA.excursion(excu_id),

    CONSTRAINT PK_itee PRIMARY KEY (itee_excursion_id, itee_item_codigo_reserva)
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

    CONSTRAINT PK_patr PRIMARY KEY (patr_pasaje_id, patr_tramo_id)
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

    CONSTRAINT PK_vutr PRIMARY KEY (vutr_vuelo_aerolinea_codigo, vutr_vuelo_numero, vutr_vuelo_fecha, vutr_tramo_id)
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

    CONSTRAINT PK_prhh PRIMARY KEY (prhh_habitacion_id, prhh_propuesta_hospedaje_id)
);

CREATE TABLE LA_MILA_COMPLETA.aspecto_puntaje (
    aspu_puntaje_id BIGINT,
    aspu_aspecto_codigo BIGINT,

    CONSTRAINT fk_aspecto_puntaje_aspecto
        FOREIGN KEY (aspu_aspecto_codigo)
        REFERENCES LA_MILA_COMPLETA.aspecto(aspe_codigo),

    CONSTRAINT fk_aspecto_puntaje_puntaje
        FOREIGN KEY (aspu_puntaje_id)
        REFERENCES LA_MILA_COMPLETA.puntaje(punt_id),

    CONSTRAINT PK_aspu PRIMARY KEY (aspu_puntaje_id, aspu_aspecto_codigo)
);

-- ======================================== [Migración] ======================================== --
--Stored Procedures de las tablas maestras.
GO
CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_PAIS
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.pais (pais_nombre)
        SELECT Aeropuerto_Salida_Pais FROM GD1C2026.gd_esquema.Maestra WHERE Aeropuerto_Salida_Pais IS NOT NULL
        UNION
        SELECT Aeropuerto_Llegada_Pais FROM GD1C2026.gd_esquema.Maestra WHERE Aeropuerto_Llegada_Pais IS NOT NULL
        UNION
        SELECT Aerolinea_Pais FROM GD1C2026.gd_esquema.Maestra WHERE Aerolinea_Pais IS NOT NULL
        UNION
        SELECT Hospedaje_Pais FROM GD1C2026.gd_esquema.Maestra WHERE Hospedaje_Pais IS NOT NULL;
END

GO
CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_CIUDAD
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.ciudad (ciud_nombre, ciud_pais_id)
        SELECT m.Aeropuerto_Salida_Ciudad, p.pais_id
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.pais p ON m.Aeropuerto_Salida_Pais = p.pais_nombre
        WHERE m.Aeropuerto_Salida_Ciudad IS NOT NULL

        UNION

        SELECT m.Aeropuerto_Llegada_Ciudad, p.pais_id
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.pais p ON m.Aeropuerto_Llegada_Pais = p.pais_nombre
        WHERE m.Aeropuerto_Llegada_Ciudad IS NOT NULL

        UNION

        SELECT m.Hospedaje_Ciudad, p.pais_id
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.pais p ON m.Hospedaje_Pais = p.pais_nombre
        WHERE m.Hospedaje_Ciudad IS NOT NULL;
END;

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
CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_LOCALIDAD
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.localidad (loca_nombre, loca_provincia_id)

    SELECT m.Agencia_Localidad, p.pcia_id
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.provincia p ON m.Agencia_Provincia = p.pcia_nombre
    WHERE m.Agencia_Localidad IS NOT NULL

    UNION

    SELECT m.Agente_Localidad, p.pcia_id
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.provincia p ON m.Agente_Provincia = p.pcia_nombre
    WHERE m.Agente_Localidad IS NOT NULL

    UNION

    SELECT m.Cliente_Localidad, p.pcia_id
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.provincia p ON m.Cliente_Provincia = p.pcia_nombre
    WHERE m.Cliente_Localidad IS NOT NULL;
END

GO
CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_CLIENTE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.cliente (
        clie_localidad_id,
        clie_dni,
        clie_nombre,
        clie_apellido,
        clie_telefono,
        clie_mail,
        clie_direccion,
        clie_fecha_nacimiento
    )
    SELECT
        MAX(l.loca_id),
        m.Cliente_Dni,
        MAX(m.Cliente_Nombre),
        MAX(m.Cliente_Apellido),
        MAX(m.Cliente_Tel),
        MAX(m.Cliente_Mail),
        MAX(m.Cliente_Direccion),
        MAX(m.Cliente_Fecha_Nac)
    FROM GD1C2026.gd_esquema.Maestra m

    JOIN LA_MILA_COMPLETA.provincia p ON m.Cliente_Provincia = p.pcia_nombre
    JOIN LA_MILA_COMPLETA.localidad l ON m.Cliente_Localidad = l.loca_nombre AND l.loca_provincia_id = p.pcia_id

    WHERE m.Cliente_DNI IS NOT NULL

    GROUP BY m.Cliente_Dni;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_AGENCIA
AS
BEGIN
    SET NOCOUNT ON;

    SET IDENTITY_INSERT LA_MILA_COMPLETA.agencia ON;

    INSERT INTO LA_MILA_COMPLETA.agencia (agcy_nro, agcy_localidad_id, agcy_direccion, agcy_telefono, agcy_mail)
    SELECT DISTINCT
        m.Agencia_Nro_Agencia,
        l.loca_id,
        m.Agencia_Direccion,
        m.Agencia_Telefono,
        m.Agencia_Mail
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.provincia p ON m.Agencia_Provincia = p.pcia_nombre
    JOIN LA_MILA_COMPLETA.localidad l ON m.Agencia_Localidad = l.loca_nombre AND l.loca_provincia_id = p.pcia_id
    WHERE m.Agencia_Nro_Agencia IS NOT NULL

    SET IDENTITY_INSERT LA_MILA_COMPLETA.agencia OFF;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_AGENTE
AS
BEGIN
    SET NOCOUNT ON;

    SET IDENTITY_INSERT LA_MILA_COMPLETA.agente ON;

    INSERT INTO LA_MILA_COMPLETA.agente (agen_legajo, agen_agencia_numero, agen_localidad_id, agen_dni, agen_nombre, agen_apellido, agen_telefono, agen_mail, agen_direccion, agen_fecha_nacimiento)
    SELECT DISTINCT m.Agente_Legajo, a.agcy_nro, l.loca_id, m.Agente_Dni, m.Agente_Nombre, m.Agente_Apellido, m.Agente_Telefono, m.Agente_Mail, m.Agente_Direccion, m.Agente_Fecha_Nac
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.agencia a ON m.Agencia_Nro_Agencia = a.agcy_nro
    JOIN LA_MILA_COMPLETA.provincia p ON m.Agente_Provincia = p.pcia_nombre
    JOIN LA_MILA_COMPLETA.localidad l ON m.Agente_Localidad = l.loca_nombre AND l.loca_provincia_id = p.pcia_id
    WHERE m.Agente_DNI IS NOT NULL;

    SET IDENTITY_INSERT LA_MILA_COMPLETA.agente OFF;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_SOLICITUD
AS
BEGIN
    SET NOCOUNT ON;

    SET IDENTITY_INSERT LA_MILA_COMPLETA.solicitud ON;

    WITH SolicitudesUnicas AS (
        SELECT 
            m.Solicitud_Nro_Solicitud as soli_id, 
            c.clie_id as soli_cliente_id, 
            a.agen_legajo as soli_agente_legajo, 
            m.Solicitud_Fecha_Solicitud as soli_fecha_realizacion, 
            m.Solicitud_Fecha_Inicio_Tentativa as soli_fecha_inicio_tentativa, 
            m.Solicitud_Fecha_Fin_Tentativa as soli_fecha_fin_tentativa, 
            m.Solicitud_Cant_Pax as soli_cantidad_pasajeros, 
            m.Solicitud_Observaciones as soli_observaciones, 
            m.Solicitud_Presupuesto_Estimado as soli_presupuesto_estimado,
            ROW_NUMBER() OVER(PARTITION BY m.Solicitud_Nro_Solicitud ORDER BY m.Solicitud_Nro_Solicitud) as fila
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.cliente c ON m.Cliente_Dni = c.clie_dni
        JOIN LA_MILA_COMPLETA.agente a ON m.Agente_Dni = a.agen_dni
        WHERE m.Solicitud_Nro_Solicitud IS NOT NULL
    )

    INSERT INTO LA_MILA_COMPLETA.solicitud (
        soli_id, soli_cliente_id, soli_agente_legajo, soli_fecha_realizacion, 
        soli_fecha_inicio_tentativa, soli_fecha_fin_tentativa, 
        soli_cantidad_pasajeros, soli_observaciones, soli_presupuesto_estimado
    )
    SELECT 
        soli_id, 
        soli_cliente_id, 
        soli_agente_legajo, 
        soli_fecha_realizacion, 
        soli_fecha_inicio_tentativa, 
        soli_fecha_fin_tentativa, 
        soli_cantidad_pasajeros, 
        soli_observaciones, 
        soli_presupuesto_estimado
    FROM SolicitudesUnicas
    WHERE fila = 1;

    SET IDENTITY_INSERT LA_MILA_COMPLETA.solicitud OFF;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_DETALLE_SOLICITUD
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.detalle_solicitud(deta_solicitud_id, deta_ciudad_id, deta_cantidad_dias, deta_observaciones)
    SELECT DISTINCT s.soli_id, c.ciud_id, m.Detalle_Solicitud_Cant_Dias_Aprox, m.Detalle_Solicitud_Observaciones

    FROM GD1C2026.gd_esquema.Maestra m

    JOIN LA_MILA_COMPLETA.solicitud s 
        ON s.soli_id = m.Solicitud_Nro_Solicitud
    JOIN LA_MILA_COMPLETA.ciudad c 
        ON c.ciud_nombre = m.Detalle_Solicitud_Ciudad 
    WHERE m.Solicitud_Nro_Solicitud IS NOT NULL AND m.Detalle_Solicitud_Ciudad IS NOT NULL;
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

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_AEROPUERTO
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.aeropuerto (aero_codigo, aero_ciudad_id, aero_descripcion)
        SELECT DISTINCT m.Aeropuerto_Salida_Codigo, c.ciud_id, m.Aeropuerto_Salida_Descripcion
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.ciudad c ON m.Aeropuerto_Salida_Ciudad = c.ciud_nombre
        WHERE m.Aeropuerto_Salida_Codigo IS NOT NULL

        UNION

        SELECT DISTINCT m.Aeropuerto_Llegada_Codigo, c.ciud_id, m.Aeropuerto_Llegada_Descripcion
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.ciudad c ON m.Aeropuerto_Llegada_Ciudad = c.ciud_nombre
        WHERE m.Aeropuerto_Llegada_Codigo IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ENCUESTA
AS
BEGIN

    SET NOCOUNT ON;
    SET IDENTITY_INSERT LA_MILA_COMPLETA.encuesta ON;

    INSERT INTO LA_MILA_COMPLETA.encuesta (encu_codigo, encu_cliente_id, encu_agente_legajo, encu_agencia_nro, encu_fecha, encu_comentario)
        SELECT DISTINCT  m.Encuesta_Codigo_Encuesta, c.clie_id, a.agen_legajo, ag.agcy_nro, m.Encuesta_Fecha_Encuesta, m.Encuesta_Comentarios
        FROM GD1C2026.gd_esquema.Maestra m

        JOIN LA_MILA_COMPLETA.cliente c ON m.Cliente_Dni = c.clie_dni AND m.Cliente_Nombre = c.clie_nombre AND m.Cliente_Apellido = c.clie_apellido

        JOIN LA_MILA_COMPLETA.agente a ON m.Agente_Legajo = a.agen_legajo

        JOIN LA_MILA_COMPLETA.agencia ag ON m.Agencia_Nro_Agencia = ag.agcy_nro

        WHERE m.Encuesta_Codigo_Encuesta IS NOT NULL;

    SET IDENTITY_INSERT LA_MILA_COMPLETA.encuesta OFF;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_PUNTAJE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.puntaje (punt_encuesta_codigo, punt_puntaje)
        SELECT DISTINCT e.encu_codigo, m.Detalle_Encuesta_Puntaje
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.encuesta e ON m.Encuesta_Codigo_Encuesta = e.encu_codigo
        WHERE m.Detalle_Encuesta_Puntaje IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ASPECTO
AS
BEGIN
    INSERT INTO LA_MILA_COMPLETA.aspecto (aspe_aspecto)
    SELECT DISTINCT
        Aspecto_Aspecto
    FROM GD1C2026.gd_esquema.Maestra
    WHERE Aspecto_Aspecto IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ESTADO_PROPUESTA
AS
BEGIN

    SET NOCOUNT ON;
    INSERT INTO LA_MILA_COMPLETA.estado_propuesta (espr_nombre)
        SELECT DISTINCT Propuesta_Estado
        FROM GD1C2026.gd_esquema.Maestra
        WHERE Propuesta_Estado IS NOT NULL;
END;
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROPUESTA
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.propuesta (
        prop_id,
        prop_estado,
        prop_agente_legajo,
        prop_solicitud_id,
        prop_fecha_emision,
        prop_fecha_vigencia,
        prop_fecha_inicio_viaje,
        prop_fecha_fin_viaje,
        prop_subtotal,
        prop_descuento,
        prop_importe_total)
    SELECT DISTINCT
        m.Propuesta_Nro_Propuesta,
        ep.espr_codigo,
        a.agen_legajo,
        s.soli_id,
        m.Propuesta_Fecha_Emision,
        m.Propuesta_Vigencia_Hasta,
        m.Propuesta_Fecha_Desde,
        m.Propuesta_Fecha_Hasta,
        m.Propuesta_Subtotal,
        m.Propuesta_Descuento,
        m.Propuesta_Importe_Total
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.solicitud s ON m.Solicitud_Nro_Solicitud = s.soli_id
    JOIN LA_MILA_COMPLETA.estado_propuesta ep ON m.Propuesta_Estado = ep.espr_nombre
    JOIN LA_MILA_COMPLETA.agente a ON m.Agente_Legajo = a.agen_legajo
    WHERE m.Propuesta_Nro_Propuesta IS NOT NULL;
END;
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_VENTA
AS
BEGIN
    SET NOCOUNT ON;
    
    WITH VentasUnicas AS (
        SELECT 
            m.Venta_Nro_Venta as vent_nro,
            a.agcy_nro as vent_agencia_nro,
            g.agen_legajo as vent_agente_legajo,
            c.clie_id as vent_cliente_id,
            p.prop_id as vent_propuesta_id,
            m.Venta_Fecha_Venta as vent_fecha,
            m.Venta_Canal_Venta as vent_canal_venta,
            m.Venta_Subtotal as vent_subtotal,
            m.Venta_Descuento as vent_descuento,
            m.Venta_Importe_Total as vent_importe_total,
            m.Venta_Medio_Pago as vent_medio_pago,
            ROW_NUMBER() OVER(PARTITION BY m.Venta_Nro_Venta ORDER BY m.Venta_Nro_Venta) as fila
        FROM GD1C2026.gd_esquema.Maestra m

        JOIN LA_MILA_COMPLETA.cliente c ON m.Cliente_Dni = c.clie_dni
        LEFT JOIN LA_MILA_COMPLETA.agencia a ON m.Agencia_Nro_Agencia = a.agcy_nro
        LEFT JOIN LA_MILA_COMPLETA.agente g ON m.Agente_Legajo = g.agen_legajo
        LEFT JOIN LA_MILA_COMPLETA.propuesta p ON m.Propuesta_Nro_Propuesta = p.prop_id
        WHERE m.Venta_Nro_Venta IS NOT NULL
    )

    INSERT INTO LA_MILA_COMPLETA.venta (
        vent_nro, vent_agencia_nro, vent_agente_legajo, vent_cliente_id,
        vent_propuesta_id, vent_fecha, vent_canal_venta, vent_subtotal,
        vent_descuento, vent_importe_total, vent_medio_pago
    )
    SELECT
        vent_nro, vent_agencia_nro, vent_agente_legajo, vent_cliente_id,
        vent_propuesta_id, vent_fecha, vent_canal_venta, vent_subtotal,
        vent_descuento, vent_importe_total, vent_medio_pago
    FROM VentasUnicas
    WHERE fila = 1;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_HOSPEDAJE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.hospedaje (hosp_check_in, hosp_check_out, hosp_ciudad_id, hosp_nombre, hosp_direccion, hosp_incluye_desayuno)
    SELECT DISTINCT m.Hospedaje_Check_In, m.Hospedaje_Check_Out, c.ciud_id, m.Hospedaje_Nombre, m.Hospedaje_Direccion, m.Hospedaje_Incluye_Desayuno
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.ciudad c ON m.Hospedaje_Ciudad = c.ciud_nombre
    WHERE m.Hospedaje_Nombre IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_HABITACION
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.habitacion (habi_hospedaje_id, habi_nombre, habi_descripcion, habi_precio_noche)
    SELECT DISTINCT h.hosp_id, m.Habitacion_Nombre, m.Habitacion_Descripcion, m.Habitacion_Precio_Noche
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.hospedaje h ON m.Hospedaje_Nombre = h.hosp_nombre
    WHERE m.Habitacion_Nombre IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROPUESTA_HOSPEDAJE
AS
BEGIN
    SET NOCOUNT ON;

    WITH PropuestasHospedajeUnicas AS (
        SELECT
            m.Propuesta_Nro_Propuesta as prho_propuesta_id,
            h.hosp_id as prho_hospedaje_id,
            ha.habi_id as prho_habitacion_id,
            m.Detalle_Propuesta_Hospedaje_Fecha_Desde as prho_fecha_ingreso,
            m.Detalle_Propuesta_Hospedaje_Fecha_Hasta as prho_fecha_egreso,
            m.Detalle_Propuesta_Hospedaje_Cant as prho_cantidad_habitaciones,
            m.Detalle_Propuesta_Hospedaje_Precio as prho_precio_hospedaje,
            m.Detalle_Propuesta_Hospedaje_Subtotal as prho_subtotal_hospedaje,
            ROW_NUMBER() OVER(
                PARTITION BY m.Propuesta_Nro_Propuesta, h.hosp_id, ha.habi_id
                ORDER BY m.Detalle_Propuesta_Hospedaje_Fecha_Desde
            ) as fila
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.propuesta p
            ON m.Propuesta_Nro_Propuesta = p.prop_id

        JOIN LA_MILA_COMPLETA.ciudad c
            ON m.Hospedaje_Ciudad = c.ciud_nombre

        JOIN LA_MILA_COMPLETA.hospedaje h
            ON m.Hospedaje_Nombre = h.hosp_nombre
            AND h.hosp_ciudad_id = c.ciud_id

        JOIN LA_MILA_COMPLETA.habitacion ha
            ON m.Habitacion_Nombre = ha.habi_nombre
            AND ha.habi_hospedaje_id = h.hosp_id

        WHERE m.Propuesta_Nro_Propuesta IS NOT NULL
          AND m.Hospedaje_Nombre IS NOT NULL
          AND m.Detalle_Propuesta_Hospedaje_Precio IS NOT NULL
    )

    INSERT INTO LA_MILA_COMPLETA.propuesta_hospedaje (
        prho_propuesta_id,
        prho_hospedaje_id,
        prho_habitacion_id,
        prho_fecha_ingreso,
        prho_fecha_egreso,
        prho_cantidad_habitaciones,
        prho_precio_hospedaje,
        prho_subtotal_hospedaje
    )
    SELECT
        prho_propuesta_id,
        prho_hospedaje_id,
        prho_habitacion_id,
        prho_fecha_ingreso,
        prho_fecha_egreso,
        prho_cantidad_habitaciones,
        prho_precio_hospedaje,
        prho_subtotal_hospedaje
    FROM PropuestasHospedajeUnicas
    WHERE fila = 1;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_VUELO
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.vuelo(
        vuel_aerolinea_codigo,
        vuel_fecha,
        vuel_aeropuerto_destino,
        vuel_aeropuerto_origen,
        vuel_duracion
    )
    SELECT
        m.Aerolinea_Codigo,
        m.Vuelo_Fecha_Salida,
        a1.aero_codigo,
        a2.aero_codigo,
        MAX(m.Vuelo_Duracion)
    FROM GD1C2026.gd_esquema.Maestra m

    JOIN LA_MILA_COMPLETA.aeropuerto a1 ON m.Aeropuerto_Llegada_Codigo = a1.aero_codigo
    JOIN LA_MILA_COMPLETA.aeropuerto a2 ON m.Aeropuerto_Salida_Codigo = a2.aero_codigo

    WHERE m.Aerolinea_Codigo IS NOT NULL
      AND m.Vuelo_Fecha_Salida IS NOT NULL

    GROUP BY
        m.Aerolinea_Codigo,
        m.Vuelo_Fecha_Salida,
        a1.aero_codigo,
        a2.aero_codigo;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ITEM_VUELO
AS
BEGIN
    SET NOCOUNT ON;

    WITH ItemsVueloUnicos AS (
        SELECT
            m.Detalle_Venta_Vuelo_Cod_Reserva as itvu_codigo_reserva,
            m.Aerolinea_Codigo as itvu_vuelo_aerolinea_codigo,
            v.vuel_numero as itvu_vuelo_numero,
            m.Vuelo_Fecha_Salida as itvu_vuelo_fecha,
            m.Detalle_Venta_Vuelo_Cantidad_Pasajes as itvu_cantidad_pasajes,
            m.Detalle_Venta_Vuelo_Subtotal as itvu_precio_subtotal,

            ROW_NUMBER() OVER(PARTITION BY m.Detalle_Venta_Vuelo_Cod_Reserva ORDER BY m.Detalle_Venta_Vuelo_Cod_Reserva) as fila
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.vuelo v ON
            m.Aerolinea_Codigo = v.vuel_aerolinea_codigo AND
            m.Vuelo_Fecha_Salida = v.vuel_fecha AND
            m.Aeropuerto_Salida_Codigo = v.vuel_aeropuerto_origen AND
            m.Aeropuerto_Llegada_Codigo = v.vuel_aeropuerto_destino
        WHERE m.Detalle_Venta_Vuelo_Cod_Reserva IS NOT NULL
    )

    INSERT INTO LA_MILA_COMPLETA.item_vuelo (
        itvu_codigo_reserva, itvu_vuelo_aerolinea_codigo, itvu_vuelo_numero,
        itvu_vuelo_fecha, itvu_cantidad_pasajes, itvu_precio_subtotal
    )
    SELECT
        itvu_codigo_reserva,
        itvu_vuelo_aerolinea_codigo,
        itvu_vuelo_numero,
        itvu_vuelo_fecha,
        itvu_cantidad_pasajes,
        itvu_precio_subtotal
    FROM ItemsVueloUnicos
    WHERE fila = 1;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_PASAJE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.pasaje (
        pasa_item_vuelo_codigo_reserva,
        pasa_vuelo_aerolinea_codigo,
        pasa_vuelo_numero,
        pasa_vuelo_fecha,
        pasa_precio_unitario,
        pasa_inlcuye_carry,
        pasa_incluye_valija
        )
    SELECT DISTINCT
        iv.itvu_codigo_reserva,
        iv.itvu_vuelo_aerolinea_codigo,
        iv.itvu_vuelo_numero,
        iv.itvu_vuelo_fecha,
        m.Vuelo_Precio,
        m.Vuelo_Incluye_Carry,
        m.Vuelo_Incluye_Valija
    FROM GD1C2026.gd_esquema.Maestra m

    JOIN LA_MILA_COMPLETA.item_vuelo iv ON m.Detalle_Venta_Vuelo_Cod_Reserva = iv.itvu_codigo_reserva

    WHERE m.Detalle_Venta_Vuelo_Cod_Reserva IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROPUESTA_VUELO
AS
BEGIN
    SET NOCOUNT ON;

    WITH PropuestasVueloUnicas AS (
        SELECT
            pr.prop_id as prvu_propuesta_nro,
            v.vuel_aerolinea_codigo as prvu_vuelo_aerolinea_codigo,
            v.vuel_numero as prvu_vuelo_numero,
            v.vuel_fecha as prvu_vuelo_fecha,
            pa.pasa_id as prvu_pasaje_id,
            m.Detalle_Propuesta_Vuelo_Cant_Pasajes as prvu_cantidad_pasajes,
            m.Detalle_Propuesta_Vuelo_Precio as prvu_precio_vuelo,
            m.Detalle_Propuesta_Vuelo_Subtotal as prvu_subtotal_vuelo,
            ROW_NUMBER() OVER(
                PARTITION BY pr.prop_id, v.vuel_aerolinea_codigo, v.vuel_fecha, m.Aeropuerto_Salida_Codigo, m.Aeropuerto_Llegada_Codigo
                ORDER BY pa.pasa_id
            ) as fila
        FROM GD1C2026.gd_esquema.Maestra m
        JOIN LA_MILA_COMPLETA.propuesta pr ON m.Propuesta_Nro_Propuesta = pr.prop_id
        JOIN LA_MILA_COMPLETA.vuelo v ON
            m.Aerolinea_Codigo = v.vuel_aerolinea_codigo AND
            m.Vuelo_Fecha_Salida = v.vuel_fecha AND
            m.Aeropuerto_Salida_Codigo = v.vuel_aeropuerto_origen AND
            m.Aeropuerto_Llegada_Codigo = v.vuel_aeropuerto_destino AND
            m.Vuelo_Duracion = v.vuel_duracion

        LEFT JOIN LA_MILA_COMPLETA.pasaje pa ON
            v.vuel_aerolinea_codigo = pa.pasa_vuelo_aerolinea_codigo AND
            v.vuel_numero = pa.pasa_vuelo_numero AND
            v.vuel_fecha = pa.pasa_vuelo_fecha

        WHERE m.Propuesta_Nro_Propuesta IS NOT NULL
          AND m.Detalle_Propuesta_Vuelo_Precio IS NOT NULL
    )

    INSERT INTO LA_MILA_COMPLETA.propuesta_vuelo(
        prvu_propuesta_nro,
        prvu_vuelo_aerolinea_codigo,
        prvu_vuelo_numero,
        prvu_vuelo_fecha,
        prvu_pasaje_id,
        prvu_cantidad_pasajes,
        prvu_precio_vuelo,
        prvu_subtotal_vuelo
    )
    SELECT
        prvu_propuesta_nro,
        prvu_vuelo_aerolinea_codigo,
        prvu_vuelo_numero,
        prvu_vuelo_fecha,
        prvu_pasaje_id,
        prvu_cantidad_pasajes,
        prvu_precio_vuelo,
        prvu_subtotal_vuelo
    FROM PropuestasVueloUnicas
    WHERE fila = 1;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROVEEDOR
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.proveedor (prov_nombre)
        SELECT DISTINCT Proveedor_Nombre FROM GD1C2026.gd_esquema.Maestra WHERE Proveedor_Nombre IS NOT NULL;

END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_EXCURSION
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.excursion (excu_proveedor_id, excu_nombre, excu_descripcion, excu_horario, excu_duracion, excu_precio_unitario)
    SELECT DISTINCT
        pr.prov_id, m.Excursion_Nombre, m.Excursion_Descripcion, m.Excursion_Horario, m.Excursion_Duracion, m.Excursion_Precio
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.proveedor pr ON m.Proveedor_Nombre = pr.prov_nombre
    WHERE m.Excursion_Nombre IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ITEM_EXCURSION
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.item_excursion (itex_codigo_reserva,itex_fecha_venta, itex_cantidad, itex_precio_subtotal)
    SELECT DISTINCT Detalle_Venta_Excursion_Cod_Reserva,
                    Detalle_Venta_Excursion_Fecha_Reserva,
                    Detalle_Venta_Excursion_Cant,
                    Detalle_Venta_Excursion_Subtotal
    FROM GD1C2026.gd_esquema.Maestra
    WHERE Detalle_Venta_Excursion_Cod_Reserva IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ITEM_HOSPEDAJE
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.item_hospedaje (itho_codigo_reserva, itho_fecha_ingreso, itho_fecha_egreso, itho_cantidad_habitaciones, itho_precio_subtotal)
    SELECT DISTINCT Detalle_Venta_Hospedaje_Cod_Reserva,
                    Detalle_Venta_Hospedaje_Fecha_Desde,
                    Detalle_Venta_Hospedaje_Fecha_Hasta,
                    Detalle_Venta_Hospedaje_Cantidad,
                    Detalle_Venta_Hospedaje_Subtotal
    FROM GD1C2026.gd_esquema.Maestra
    WHERE Detalle_Venta_Hospedaje_Cod_Reserva IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_TRAMO
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.tramo (tram_aeropuerto_origen,
                                        tram_aeropuerto_destino,
                                        tram_fecha_salida,
                                        tram_horario_salida,
                                        tram_fecha_llegada,
                                        tram_horario_llegada)
    SELECT DISTINCT a1.aero_codigo,
                    a2.aero_Codigo,
                    m.Vuelo_Fecha_Salida,
                    m.Vuelo_Horario_Salida,
                    m.Vuelo_Fecha_Llegada,
                    m.Vuelo_Horario_Llegada
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.aeropuerto a1 ON m.Aeropuerto_Salida_Codigo = a1.aero_codigo
    JOIN LA_MILA_COMPLETA.aeropuerto a2 ON m.Aeropuerto_Llegada_Codigo = a2.aero_codigo
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ITEM_EXCURSION_EXCURSION
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.item_excursion_excursion (itee_excursion_id, itee_item_codigo_reserva)
    SELECT DISTINCT
        e.excu_id,
        m.Detalle_Venta_Excursion_Cod_Reserva
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.excursion e ON m.Excursion_Nombre = e.excu_nombre
    WHERE m.Detalle_Venta_Excursion_Cod_Reserva IS NOT NULL AND m.Excursion_Nombre IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_PASAJE_TRAMO
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.pasaje_tramo (patr_pasaje_id, patr_tramo_id)
    SELECT DISTINCT
        p.pasa_id,
        t.tram_id
    FROM GD1C2026.gd_esquema.Maestra m
    JOIN LA_MILA_COMPLETA.pasaje p ON m.Detalle_Venta_Vuelo_Cod_Reserva = p.pasa_item_vuelo_codigo_reserva
    JOIN LA_MILA_COMPLETA.tramo t ON
        m.Aeropuerto_Salida_Codigo = t.tram_aeropuerto_origen AND
        m.Aeropuerto_Llegada_Codigo = t.tram_aeropuerto_destino AND
        m.Vuelo_Fecha_Salida = t.tram_fecha_salida AND
        m.Vuelo_Horario_Salida = t.tram_horario_salida AND
        m.Vuelo_Fecha_Llegada = t.tram_fecha_llegada AND
        m.Vuelo_Horario_Llegada = t.tram_horario_llegada
    WHERE m.Detalle_Venta_Vuelo_Cod_Reserva IS NOT NULL AND m.Aeropuerto_Salida_Codigo IS NOT NULL AND m.Aeropuerto_Llegada_Codigo IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_VUELO_TRAMO
AS
BEGIN
    SET NOCOUNT ON;
    INSERT  INTO LA_MILA_COMPLETA.vuelo_tramo( vutr_vuelo_aerolinea_codigo,vutr_vuelo_numero,vutr_vuelo_fecha,vutr_tramo_id)
    SELECT DISTINCT
        m.Aerolinea_Codigo,
        v.vuel_numero,
        m.Vuelo_Fecha_Salida,
        t.tram_id
    FROM GD1C2026.gd_esquema.Maestra m

    JOIN LA_MILA_COMPLETA.vuelo v ON m.Aeropuerto_Salida_Codigo = v.vuel_aeropuerto_origen AND
    m.Aeropuerto_Llegada_Codigo = v.vuel_aeropuerto_destino AND
    m.Vuelo_Fecha_Salida = v.vuel_fecha AND
    m.Aerolinea_Codigo = v.vuel_aerolinea_codigo

    JOIN LA_MILA_COMPLETA.tramo t ON
    m.Aeropuerto_Salida_Codigo = t.tram_aeropuerto_origen AND
    m.Aeropuerto_Llegada_Codigo = t.tram_aeropuerto_destino AND
    m.Vuelo_Fecha_Salida = t.tram_fecha_salida AND
    m.Vuelo_Horario_Salida = t.tram_horario_salida AND
    m.Vuelo_Fecha_Llegada = t.tram_fecha_llegada AND
    m.Vuelo_Horario_Llegada = t.tram_horario_llegada

    WHERE m.Aerolinea_Codigo IS NOT NULL AND m.Vuelo_Fecha_Salida IS NOT NULL AND m.Aeropuerto_Salida_Codigo IS NOT NULL AND m.Aeropuerto_Llegada_Codigo IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_PROPUESTA_HOSPEDAJE_HABITACION
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LA_MILA_COMPLETA.propuesta_hospedaje_habitacion (prhh_habitacion_id, prhh_propuesta_hospedaje_id)
    SELECT DISTINCT prho_habitacion_id, prho_id
    FROM LA_MILA_COMPLETA.propuesta_hospedaje
    WHERE prho_habitacion_id IS NOT NULL;
END
GO

CREATE PROCEDURE LA_MILA_COMPLETA.MIGRAR_ASPECTO_PUNTAJE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO LA_MILA_COMPLETA.aspecto_puntaje (aspu_puntaje_id, aspu_aspecto_codigo)

    SELECT DISTINCT p.punt_id, a.aspe_codigo
    FROM GD1C2026.gd_esquema.Maestra m

    JOIN LA_MILA_COMPLETA.aspecto a
        ON m.Aspecto_Aspecto = a.aspe_aspecto

    JOIN LA_MILA_COMPLETA.puntaje p
        ON m.Detalle_Encuesta_Puntaje = p.punt_puntaje
        AND m.Encuesta_Codigo_Encuesta = p.punt_encuesta_codigo

    WHERE m.Aspecto_Aspecto IS NOT NULL AND m.Detalle_Encuesta_Puntaje IS NOT NULL;
END
GO

--Ejecución Stored Procedures
EXEC LA_MILA_COMPLETA.MIGRAR_PAIS;
EXEC LA_MILA_COMPLETA.MIGRAR_CIUDAD;
EXEC LA_MILA_COMPLETA.MIGRAR_PROVINCIA;
EXEC LA_MILA_COMPLETA.MIGRAR_LOCALIDAD;
EXEC LA_MILA_COMPLETA.MIGRAR_CLIENTE;
EXEC LA_MILA_COMPLETA.MIGRAR_AGENCIA;
EXEC LA_MILA_COMPLETA.MIGRAR_AGENTE;
EXEC LA_MILA_COMPLETA.MIGRAR_SOLICITUD;
EXEC LA_MILA_COMPLETA.MIGRAR_DETALLE_SOLICITUD;
EXEC LA_MILA_COMPLETA.MIGRAR_AEROLINEA;
EXEC LA_MILA_COMPLETA.MIGRAR_AEROPUERTO;
EXEC LA_MILA_COMPLETA.MIGRAR_ENCUESTA;
EXEC LA_MILA_COMPLETA.MIGRAR_PUNTAJE;
EXEC LA_MILA_COMPLETA.MIGRAR_ASPECTO;
EXEC LA_MILA_COMPLETA.MIGRAR_ESTADO_PROPUESTA;
EXEC LA_MILA_COMPLETA.MIGRAR_PROPUESTA;
EXEC LA_MILA_COMPLETA.MIGRAR_VENTA;
EXEC LA_MILA_COMPLETA.MIGRAR_HOSPEDAJE;
EXEC LA_MILA_COMPLETA.MIGRAR_HABITACION;
EXEC LA_MILA_COMPLETA.MIGRAR_PROPUESTA_HOSPEDAJE;
EXEC LA_MILA_COMPLETA.MIGRAR_VUELO;
EXEC LA_MILA_COMPLETA.MIGRAR_ITEM_VUELO;
EXEC LA_MILA_COMPLETA.MIGRAR_PASAJE;
EXEC LA_MILA_COMPLETA.MIGRAR_PROPUESTA_VUELO;
EXEC LA_MILA_COMPLETA.MIGRAR_PROVEEDOR;
EXEC LA_MILA_COMPLETA.MIGRAR_EXCURSION;
EXEC LA_MILA_COMPLETA.MIGRAR_ITEM_EXCURSION;
EXEC LA_MILA_COMPLETA.MIGRAR_ITEM_HOSPEDAJE;
EXEC LA_MILA_COMPLETA.MIGRAR_TRAMO;
EXEC LA_MILA_COMPLETA.MIGRAR_ITEM_EXCURSION_EXCURSION;
EXEC LA_MILA_COMPLETA.MIGRAR_PASAJE_TRAMO;
EXEC LA_MILA_COMPLETA.MIGRAR_VUELO_TRAMO;
EXEC LA_MILA_COMPLETA.MIGRAR_PROPUESTA_HOSPEDAJE_HABITACION;
EXEC LA_MILA_COMPLETA.MIGRAR_ASPECTO_PUNTAJE;