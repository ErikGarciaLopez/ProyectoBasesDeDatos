/*
 * Company :      FI-UNAM
 * Project :      Guarder�a de Mascotas
 * Author :       García López Erik, Morales Ortega Carlos, Ramárez Garcia Diego Andres
 *
 * Date Created : Saturday, May 27, 2023 16:42:37
 * Target DBMS : Microsoft SQL Server 2008
 */

/* 
 * TABLE: ADMINISTRATIVO 
 */

create database GUARDERIA
go
use GUARDERIA
go

CREATE TABLE ADMINISTRATIVO(
    id_personal    int    NOT NULL,
    id_centro      int    NULL,
    CONSTRAINT pk_ADMINISTRATIVO PRIMARY KEY CLUSTERED (id_personal)
)
go



IF OBJECT_ID('ADMINISTRATIVO') IS NOT NULL
    PRINT '<<< CREATED TABLE ADMINISTRATIVO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ADMINISTRATIVO >>>'
go

/* 
 * TABLE: ALMACEN 
 */

CREATE TABLE ALMACEN(
    id_centro         int         NOT NULL,
    id_medicamento    int         NOT NULL,
    cantidad          smallint    NOT NULL,
    CONSTRAINT pk_ALMACEN PRIMARY KEY CLUSTERED (id_centro, id_medicamento)
)
go



IF OBJECT_ID('ALMACEN') IS NOT NULL
    PRINT '<<< CREATED TABLE ALMACEN >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ALMACEN >>>'
go

/* 
 * TABLE: AÑADE 
 */

CREATE TABLE AÑADE(
    id_personal       int            NOT NULL,
    id_producto       int            NOT NULL,
    nombreProducto    varchar(50)    NOT NULL,
    cantidad          int            NOT NULL,
    CONSTRAINT pk_añade PRIMARY KEY CLUSTERED (id_personal, id_producto)
)
go



IF OBJECT_ID('AÑADE') IS NOT NULL
    PRINT '<<< CREATED TABLE AÑADE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE AÑADE >>>'
go

/* 
 * TABLE: BRAZALETE 
 */

CREATE TABLE BRAZALETE(
    id_brazalete       int             NOT NULL identity(1,1),
    comio              bit             NOT NULL,
    comida             varchar(100)    NOT NULL,
    cuantoComio        varchar(100)    NOT NULL,
    medicamento        bit             NULL,
    cuidadoEspecial    bit             NULL,
    CONSTRAINT pk_brazalete PRIMARY KEY CLUSTERED (id_brazalete),
	CONSTRAINT ck_comio check (comio in (0,1)),
	CONSTRAINT ck_medicamento check(medicamento in (0,1)),
	CONSTRAINT ck_cuidadoEspecial check(cuidadoEspecial in (0,1))
)
go



IF OBJECT_ID('BRAZALETE') IS NOT NULL
    PRINT '<<< CREATED TABLE BRAZALETE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE BRAZALETE >>>'
go

/* 
 * TABLE: BRAZALETE_MASCOTA 
 */

CREATE TABLE BRAZALETE_MASCOTA(
    id_brazaleteMascota    int         NOT NULL  IDENTITY(1,1),
    id_mascota             int         NULL,
    id_personal            int         NULL,
    id_brazalete           int         NULL,
    CONSTRAINT pk_BRAZALETE_MASCOTA PRIMARY KEY CLUSTERED (id_brazaleteMascota)
)
go
/* Modificación */
ALTER TABLE BRAZALETE_MASCOTA
    ADD estatus            CHAR(1)    NULL CONSTRAINT df_estatus DEFAULT 'A'
go
ALTER TABLE BRAZALETE_MASCOTA
    ADD CONSTRAINT ck_estatus CHECK (estatus IN ('A','I'))
go
-----------------

IF OBJECT_ID('BRAZALETE_MASCOTA') IS NOT NULL
    PRINT '<<< CREATED TABLE BRAZALETE_MASCOTA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE BRAZALETE_MASCOTA >>>'
go

/* 
 * TABLE: CANASTA 
 */

CREATE TABLE CANASTA(
    id_canasta                  int           NOT NULL identity(1,1),
    fecha                       time(7)       NOT NULL,
	tarifaEnvio					smallmoney    NOT NULL CONSTRAINT df_tarifaEnvio DEFAULT (100),
    total						smallmoney    NOT NULL ,
    tarifaCancelacion			smallmoney    NOT NULL,
    id_UsuarioComun             int           NOT NULL,
    CONSTRAINT pk_CANASTA PRIMARY KEY CLUSTERED (id_canasta),
	CONSTRAINT ck_tarifaCancelacion CHECK (tarifaCancelacion = total * 0.15),
)
go



IF OBJECT_ID('CANASTA') IS NOT NULL
    PRINT '<<< CREATED TABLE CANASTA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CANASTA >>>'
go

/* 
 * TABLE: CANASTA_PRODUCTO 
 */

CREATE TABLE CANASTA_PRODUCTO(
    id_canasta        int        NOT NULL,
    id_producto       int        NOT NULL,
    num_Uni_Compra    tinyint    NOT NULL,
    CONSTRAINT pk_CANASTA_PRODUCTO PRIMARY KEY CLUSTERED (id_canasta, id_producto)
)
go



IF OBJECT_ID('CANASTA_PRODUCTO') IS NOT NULL
    PRINT '<<< CREATED TABLE CANASTA_PRODUCTO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CANASTA_PRODUCTO >>>'
go

/* 
 * TABLE: CATEGORIA 
 */

CREATE TABLE CATEGORIA(
    id_categoria    int            NOT NULL identity(1,1),
    categoria       varchar(50)    NOT NULL,
    CONSTRAINT pk_CATEGORIA PRIMARY KEY CLUSTERED (id_categoria)
)
go



IF OBJECT_ID('CATEGORIA') IS NOT NULL
    PRINT '<<< CREATED TABLE CATEGORIA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CATEGORIA >>>'
go

/* 
 * TABLE: CENTRO_CUIDADO 
 */

CREATE TABLE CENTRO_CUIDADO(
    id_centro             int            NOT NULL identity(1,1),
    id_oficinaRegional    int            Null,
    colonia               varchar(50)    NOT NULL,
    alcaldia              varchar(50)    NOT NULL,
    CP                    int            NOT NULL,
    numero                varchar(10)    NOT NULL,
    nombre                varchar(30)    NOT NULL,
    calle                 varchar(50)    NOT NULL,
    id_personal           int            NULL,
    id_encargado          int            NOT NULL,
    CONSTRAINT pk_CENTRO_CUIDADO PRIMARY KEY CLUSTERED (id_centro)
)
go



IF OBJECT_ID('CENTRO_CUIDADO') IS NOT NULL
    PRINT '<<< CREATED TABLE CENTRO_CUIDADO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CENTRO_CUIDADO >>>'
go

/* 
 * TABLE: COMPRA_FISICA 
 */

CREATE TABLE COMPRA_FISICA(
    id_compraFisica     int			         NOT NULL identity(1,1),
    total               smallmoney           NOT NULL,
    id_personal         int                  NOT NULL,
    id_desgloseVenta    int                  NOT NULL,
    comision            AS (total * 0.15) PERSISTED,
    CONSTRAINT pk_COMPRA_FISICA PRIMARY KEY CLUSTERED (id_compraFisica),
)
go

IF OBJECT_ID('COMPRA_FISICA') IS NOT NULL
    PRINT '<<< CREATED TABLE COMPRA_FISICA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE COMPRA_FISICA >>>'
go

/* 
 * TABLE: CONTARA 
 */

CREATE TABLE CONTARA(
    id_producto    int    NOT NULL,
    id_oferta      int    NOT NULL,
    CONSTRAINT PK31 PRIMARY KEY CLUSTERED (id_producto, id_oferta)
)
go



IF OBJECT_ID('CONTARA') IS NOT NULL
    PRINT '<<< CREATED TABLE CONTARA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CONTARA >>>'
go

/* 
 * TABLE: CUENTA 
 */

CREATE TABLE CUENTA(
    id_centro      int    NOT NULL,
    id_producto    int    NOT NULL,
    CONSTRAINT PK38 PRIMARY KEY CLUSTERED (id_centro, id_producto)
)
go



IF OBJECT_ID('CUENTA') IS NOT NULL
    PRINT '<<< CREATED TABLE CUENTA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CUENTA >>>'
go

/* 
 * TABLE: DESGLOSE_VENTA 
 */

CREATE TABLE DESGLOSE_VENTA(
    id_desgloseVenta    int        NOT NULL IDENTITY(1,1),
    num_Unidades        tinyint    NOT NULL,
    montoParcial        money      NOT NULL,
    id_centro           int        NOT NULL,
    id_producto         int        NOT NULL,
    CONSTRAINT pk_desgloseVenta PRIMARY KEY  (id_desgloseVenta)
)
go



IF OBJECT_ID('DESGLOSE_VENTA') IS NOT NULL
    PRINT '<<< CREATED TABLE DESGLOSE_VENTA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DESGLOSE_VENTA >>>'
go

/* 
 * TABLE: ENCARGADO 
 */

CREATE TABLE ENCARGADO(
    id_personal          int           NOT NULL,
    sueldoBase           smallmoney    NOT NULL,
    CONSTRAINT pk_encargado PRIMARY KEY  (id_personal)
)
go



IF OBJECT_ID('ENCARGADO') IS NOT NULL
    PRINT '<<< CREATED TABLE ENCARGADO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ENCARGADO >>>'
go

/* 
 * TABLE: ESPECIE 
 */

CREATE TABLE ESPECIE(
    id_especie    int        NOT NULL IDENTITY(1,1),
    tipo          char(1)    NOT NULL,
    id_raza       int        NOT NULL,
    CONSTRAINT pk_especie PRIMARY KEY  (id_especie),
    CONSTRAINT ck_tipoMacota check (tipo in ('P','G')),
)
go



IF OBJECT_ID('ESPECIE') IS NOT NULL
    PRINT '<<< CREATED TABLE ESPECIE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ESPECIE >>>'
go

/* 
 * TABLE: GERENTE 
 */

CREATE TABLE GERENTE(
    id_personal    int    NOT null,
    CONSTRAINT pk_gerente PRIMARY KEY  (id_personal)
)
go



IF OBJECT_ID('GERENTE') IS NOT NULL
    PRINT '<<< CREATED TABLE GERENTE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE GERENTE >>>'
go

/* 
 * TABLE: MASCOTA 
 */

CREATE TABLE MASCOTA(
    id_mascota               int             NOT NULL IDENTITY(1,1),
    nombre                   varchar(50)     NOT NULL,
    sexo                     char(1)         NOT NULL,
    edad                     int             NOT NULL,
    rasgosCaracteristicos    varchar(200)    NOT NULL,
    id_especie               int             NOT NULL,
    id_UsuarioComun          int             NOT NULL,
    CONSTRAINT pk_mascota PRIMARY KEY  (id_mascota),
    CONSTRAINT ck_sexo check (sexo in ('M','F'))
)
go



IF OBJECT_ID('MASCOTA') IS NOT NULL
    PRINT '<<< CREATED TABLE MASCOTA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE MASCOTA >>>'
go

/* 
 * TABLE: MEDICAMENTO 
 */

CREATE TABLE MEDICAMENTO(
    id_medicamento    int             NOT NULL IDENTITY(1,1),
    nombre            varchar(100)    NOT NULL,
    costo             smallmoney      NOT NULL,
    CONSTRAINT pk_medicamento PRIMARY KEY  (id_medicamento)
)
go



IF OBJECT_ID('MEDICAMENTO') IS NOT NULL
    PRINT '<<< CREATED TABLE MEDICAMENTO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE MEDICAMENTO >>>'
go

/* 
 * TABLE: OFERTA_PRODUCTOSFISICOS 
 */

CREATE TABLE OFERTA_PRODUCTOSFISICOS(
    id_producto    int    NOT NULL,
    id_oferta      int    NOT NULL,
    CONSTRAINT pk_of_producto PRIMARY KEY  (id_producto, id_oferta)
)
go



IF OBJECT_ID('OFERTA_PRODUCTOSFISICOS') IS NOT NULL
    PRINT '<<< CREATED TABLE OFERTA_PRODUCTOSFISICOS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE OFERTA_PRODUCTOSFISICOS >>>'
go

/* 
 * TABLE: OFERTAS_FISICOS 
 */

CREATE TABLE OFERTAS_FISICOS(
    id_oferta       int             NOT NULL IDENTITY(1,1),
    tipo            char(1)         NOT NULL,
    descripcion     varchar(100)    NOT NULL,
    Finicio         datetime        NOT NULL,
    Ffin            datetime        NOT NULL,
    CONSTRAINT pk_of_fisicas PRIMARY KEY (id_oferta),
    CONSTRAINT ck_tipoOF CHECK (tipo in ('N','L')),
    CONSTRAINT ck_MaxFfin CHECK (Ffin >= Finicio AND Ffin <= DATEADD(day, 40, Finicio))
)
go



IF OBJECT_ID('OFERTAS_FISICOS') IS NOT NULL
    PRINT '<<< CREATED TABLE OFERTAS_FISICOS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE OFERTAS_FISICOS >>>'
go

/* 
 * TABLE: OFERTAS_O 
 */

CREATE TABLE OFERTAS_O(
    id_oferta       int             NOT NULL IDENTITY(1,1),
    tipo            char(1)         NOT NULL,
    descripcion     varchar(100)    NOT NULL,
    Finicio         datetime        NOT NULL,
    Ffin            datetime        NOT NULL,
    CONSTRAINT pk_oferta PRIMARY KEY (id_oferta),
    CONSTRAINT ck_tipoO CHECK (tipo in ('N','L')),
    CONSTRAINT ck_MaxFfinO CHECK (Ffin >= Finicio AND Ffin <= DATEADD(day, 40, Finicio))
)
go



IF OBJECT_ID('OFERTAS_O') IS NOT NULL
    PRINT '<<< CREATED TABLE OFERTAS_O >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE OFERTAS_O >>>'
go

/* 
 * TABLE: PERSONAL 
 */

CREATE TABLE PERSONAL(
    id_personal       int            NOT NULL IDENTITY(1,1),
    tipo              char(1)        NOT NULL,
    nombre            varchar(50)    NOT NULL,
    usuario           varchar(20)    NOT NULL,
    contrasena        varchar(50)    NOT NULL,
    CURP              varchar(18)    NOT NULL,
    calle             varchar(50)    NOT NULL,
    numero            varchar(10)    NOT NULL,
    CP                int            NOT NULL,
    alcaldia          varchar(50)    NOT NULL,
    colonia           varchar(50)    NOT NULL,
    CONSTRAINT pk_personal PRIMARY KEY CLUSTERED (id_personal),
    CONSTRAINT ck_tipoPersonal CHECK (tipo in ('V','H','A','G','E'))
)
go



IF OBJECT_ID('PERSONAL') IS NOT NULL
    PRINT '<<< CREATED TABLE PERSONAL >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PERSONAL >>>'
go

/* 
 * TABLE: PERSONAL_AYUDA 
 */

CREATE TABLE PERSONAL_AYUDA(
    id_personal            int        NOT NULL,
    edad                   int        NOT NULL,
    tipoMascota            char(1)    NOT NULL,
    id_centro              int        NOT NULL,
    CONSTRAINT pk_personalAyuda PRIMARY KEY (id_personal)
)
go

IF OBJECT_ID('PERSONAL_AYUDA') IS NOT NULL
    PRINT '<<< CREATED TABLE PERSONAL_AYUDA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PERSONAL_AYUDA >>>'
go

/* 
 * TABLE: PRODUCTOS_FISICOS 
 */

CREATE TABLE PRODUCTOS_FISICOS(
    id_producto    int           NOT NULL IDENTITY(1,1),
    costo          smallmoney    NOT NULL,
    stock          int           NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY (id_producto),
)
go



IF OBJECT_ID('PRODUCTOS_FISICOS') IS NOT NULL
    PRINT '<<< CREATED TABLE PRODUCTOS_FISICOS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRODUCTOS_FISICOS >>>'
go

/* 
 * TABLE: PRODUCTOS_ONLINE 
 */

CREATE TABLE PRODUCTOS_ONLINE(
    id_producto     int            NOT NULL IDENTITY (1,1),
    stock           int            NOT NULL,
    precio          smallmoney     NOT NULL,
    descripcion     varchar(70)    NOT NULL,
    id_categoria    int            NOT NULL,
    CONSTRAINT pk_producto_online PRIMARY KEY CLUSTERED (id_producto)
)
go



IF OBJECT_ID('PRODUCTOS_ONLINE') IS NOT NULL
    PRINT '<<< CREATED TABLE PRODUCTOS_ONLINE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRODUCTOS_ONLINE >>>'
go

/* 
 * TABLE: RAZA 
 */

CREATE TABLE RAZA(
    id_raza       int            NOT NULL IDENTITY(1,1),
    nombreRaza    varchar(30)    NOT NULL,
    CONSTRAINT pk_raza PRIMARY KEY (id_raza)
)
go



IF OBJECT_ID('RAZA') IS NOT NULL
    PRINT '<<< CREATED TABLE RAZA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RAZA >>>'
go

/* 
 * TABLE: RECIBO 
 */

CREATE TABLE RECIBO(
    id_recibo          int            NOT NULL IDENTITY(1,1),
    costoTotal         smallmoney     NOT NULL,
    tratamiento        smallmoney     NOT NULL,
    examinacion        varchar(50)    NOT NULL,
    id_reporte         int            NOT NULL,
    id_UsuarioComun    int            NOT NULL,
    CONSTRAINT pk_recibo PRIMARY KEY (id_recibo)
)
go



IF OBJECT_ID('RECIBO') IS NOT NULL
    PRINT '<<< CREATED TABLE RECIBO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RECIBO >>>'
go

/* 
 * TABLE: REPORTE 
 */

CREATE TABLE REPORTE(
    id_reporte             int              NOT NULL IDENTITY(1,1),
    diagnostico            varchar(255)     NOT NULL,
    detallesExaminacion    varchar(1000)    NOT NULL,
    fechaHora              datetime         NOT NULL,
    id_personal            int              NOT NULL,
    CONSTRAINT pk_reporte PRIMARY KEY CLUSTERED (id_reporte)
)
go



IF OBJECT_ID('REPORTE') IS NOT NULL
    PRINT '<<< CREATED TABLE REPORTE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE REPORTE >>>'
go

/* 
 * TABLE: REPORTE_MEDICAMENTO 
 */

CREATE TABLE REPORTE_MEDICAMENTO(
    id_reporte        int             NOT NULL, -- no IDENTITY
    id_medicamento    int             NOT NULL,
    dosis             varchar(100)    NOT NULL,
    CONSTRAINT pk_rep_medicamento PRIMARY KEY (id_reporte, id_medicamento)
    
)
go



IF OBJECT_ID('REPORTE_MEDICAMENTO') IS NOT NULL
    PRINT '<<< CREATED TABLE REPORTE_MEDICAMENTO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE REPORTE_MEDICAMENTO >>>'
go

/* 
 * TABLE: RESERVACION_GUARDERIA 
 */

CREATE TABLE RESERVACION_GUARDERIA(
    id_guarderia       int           NOT NULL IDENTITY(1,1),
    finicio            datetime      NOT NULL,
    ffin               datetime      NOT NULL,
    costoXDia          smallmoney    NOT NULL,
    numDias            AS DATEDIFF(day, finicio, ffin) PERSISTED,
    total              AS (300 * costoXDia) PERSISTED,
    id_centro          int           NOT NULL,
    id_UsuarioComun    int           NOT NULL,
    CONSTRAINT pk_guarderia PRIMARY KEY CLUSTERED (id_guarderia)
)
go



IF OBJECT_ID('RESERVACION_GUARDERIA') IS NOT NULL
    PRINT '<<< CREATED TABLE RESERVACION_GUARDERIA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RESERVACION_GUARDERIA >>>'
go

/* 
 * TABLE: TELEFONOS_PERSONAL_AYUDA 
 */

CREATE TABLE TELEFONOS_PERSONAL_AYUDA(
    id_telefono_personalAyuda    int            NOT NULL IDENTITY(1,1),
    id_personal                  int            NOT NULL,
    numTelefono                  varchar(20)    NOT NULL CONSTRAINT uk_telefono UNIQUE,
    CONSTRAINT pf_telefono_personalAyuda PRIMARY KEY (id_telefono_personalAyuda)
)
go



IF OBJECT_ID('TELEFONOS_PERSONAL_AYUDA') IS NOT NULL
    PRINT '<<< CREATED TABLE TELEFONOS_PERSONAL_AYUDA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TELEFONOS_PERSONAL_AYUDA >>>'
go

/* 
 * TABLE: USUARIO_COMUN 
 */

CREATE TABLE USUARIO_COMUN(
    id_UsuarioComun    int             NOT NULL identity(1,1),
    nombre             varchar(50)     NOT NULL,
    apellidoPaterno    varchar(50)     NOT NULL,
    apellidoMaterno    varchar(50)     NOT NULL,
    CURP               varchar(18)     NOT NULL,
    nombreUsuario      varchar(20)     NOT NULL,
    contrasena         varchar(50)     NOT NULL,
    genero             varchar(10)     NOT NULL,
    telefono           varchar(20)     NOT NULL,
    correo             varchar(100)    NOT NULL,
    calle              varchar(50)     NOT NULL,
    numero             varchar(10)     NOT NULL,
    CP                 int             NOT NULL,
    alcaldia           varchar(50)     NOT NULL,
    colonia            varchar(50)     NOT NULL,
    numeroTarjeta      varchar(16)     NOT NULL,
    vigenciaTarjeta    date            NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY CLUSTERED (id_UsuarioComun)
)
go



IF OBJECT_ID('USUARIO_COMUN') IS NOT NULL
    PRINT '<<< CREATED TABLE USUARIO_COMUN >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE USUARIO_COMUN >>>'
go

/* 
 * TABLE: VETERINARIO 
 */

CREATE TABLE VETERINARIO(
    id_personal     int            NOT NULL,
    cedula          varchar(10)    NOT NULL,
    especialidad    varchar(50)    NOT NULL,
    id_centro       int            NOT NULL,
    CONSTRAINT pk_veterinario PRIMARY KEY CLUSTERED (id_personal)
)
go



IF OBJECT_ID('VETERINARIO') IS NOT NULL
    PRINT '<<< CREATED TABLE VETERINARIO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE VETERINARIO >>>'
go

/* 
 * TABLE: VITALES 
 */

CREATE TABLE VITALES(
    id_vitales       int         NOT NULL IDENTITY(1,1),
    ritmoCardiaco    smallint    NOT NULL,
    temperatura      float       NOT NULL,
    nivelOxigeno     float       NOT NULL,
    fechaHora        datetime    NOT NULL,
    id_brazalete     int         NOT NULL,
    CONSTRAINT pk_vitales PRIMARY KEY CLUSTERED (id_vitales)
)
go



IF OBJECT_ID('VITALES') IS NOT NULL
    PRINT '<<< CREATED TABLE VITALES >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE VITALES >>>'
go


/* 
 * TABLE: ADMINISTRATIVO 
 */

ALTER TABLE ADMINISTRATIVO ADD CONSTRAINT fk_PERSONAL50  
    FOREIGN KEY (id_personal)
    REFERENCES PERSONAL(id_personal)
go

ALTER TABLE ADMINISTRATIVO ADD CONSTRAINT fk_CENTRO_CUIDADO105 
    FOREIGN KEY (id_centro)
    REFERENCES CENTRO_CUIDADO(id_centro)
go


/* 
 * TABLE: ALMACEN 
 */

ALTER TABLE ALMACEN ADD CONSTRAINT fk_CENTRO_CUIDADO87 
    FOREIGN KEY (id_centro)
    REFERENCES CENTRO_CUIDADO(id_centro)
go

ALTER TABLE ALMACEN ADD CONSTRAINT fk_MEDICAMENTO88 
    FOREIGN KEY (id_medicamento)
    REFERENCES MEDICAMENTO(id_medicamento)
go


/* 
 * TABLE: AÑADE 
 */

ALTER TABLE AÑADE ADD CONSTRAINT fk_ADMINISTRATIVO109 
    FOREIGN KEY (id_personal)
    REFERENCES ADMINISTRATIVO(id_personal)
go

ALTER TABLE AÑADE ADD CONSTRAINT fk_PRODUCTOS_ONLINE110 
    FOREIGN KEY (id_producto)
    REFERENCES PRODUCTOS_ONLINE(id_producto)
go


/* 
 * TABLE: BRAZALETE_MASCOTA 
 */

ALTER TABLE BRAZALETE_MASCOTA ADD CONSTRAINT fk_MASCOTA9 
    FOREIGN KEY (id_mascota)
    REFERENCES MASCOTA(id_mascota)
go

ALTER TABLE BRAZALETE_MASCOTA ADD CONSTRAINT fk_PERSONAL_AYUDA101 
    FOREIGN KEY (id_personal)
    REFERENCES PERSONAL_AYUDA(id_personal)
go

ALTER TABLE BRAZALETE_MASCOTA ADD CONSTRAINT fk_BRAZALETE117 
    FOREIGN KEY (id_brazalete)
    REFERENCES BRAZALETE(id_brazalete)
go


/* 
 * TABLE: CANASTA 
 */

ALTER TABLE CANASTA ADD CONSTRAINT fk_USUARIO_COMUN63 
    FOREIGN KEY (id_UsuarioComun)
    REFERENCES USUARIO_COMUN(id_UsuarioComun)
go


/* 
 * TABLE: CANASTA_PRODUCTO 
 */

ALTER TABLE CANASTA_PRODUCTO ADD CONSTRAINT fk_CANASTA97 
    FOREIGN KEY (id_canasta)
    REFERENCES CANASTA(id_canasta)
go

ALTER TABLE CANASTA_PRODUCTO ADD CONSTRAINT fk_PRODUCTOS_ONLINE108 
    FOREIGN KEY (id_producto)
    REFERENCES PRODUCTOS_ONLINE(id_producto)
go


/* 
 * TABLE: CENTRO_CUIDADO 
 */
ALTER TABLE CENTRO_CUIDADO ADD CONSTRAINT fk_encargadoC
    FOREIGN KEY (id_encargado)
    REFERENCES ENCARGADO(id_personal)
go

ALTER TABLE CENTRO_CUIDADO ADD CONSTRAINT fk_CENTRO_CUIDADO103 
    FOREIGN KEY (id_oficinaRegional)
    REFERENCES CENTRO_CUIDADO(id_centro)
go

ALTER TABLE CENTRO_CUIDADO ADD CONSTRAINT fk_GERENTE104 
    FOREIGN KEY (id_personal)
    REFERENCES GERENTE(id_personal)
go


/* 
 * TABLE: COMPRA_FISICA 
 */

ALTER TABLE COMPRA_FISICA ADD CONSTRAINT fk_ENCARGADO93 
    FOREIGN KEY (id_personal)
    REFERENCES ENCARGADO(id_personal)
go

ALTER TABLE COMPRA_FISICA ADD CONSTRAINT fk_DESGLOSE_VENTA114 
    FOREIGN KEY (id_desgloseVenta)
    REFERENCES DESGLOSE_VENTA(id_desgloseVenta)
go


/* 
 * TABLE: CONTARA 
 */

ALTER TABLE CONTARA ADD CONSTRAINT RefPRODUCTOS_ONLINE55 
    FOREIGN KEY (id_producto)
    REFERENCES PRODUCTOS_ONLINE(id_producto)
go

ALTER TABLE CONTARA ADD CONSTRAINT RefOFERTAS_O56 
    FOREIGN KEY (id_oferta)
    REFERENCES OFERTAS_O(id_oferta)
go


/* 
 * TABLE: CUENTA 
 */

ALTER TABLE CUENTA ADD CONSTRAINT RefCENTRO_CUIDADO73 
    FOREIGN KEY (id_centro)
    REFERENCES CENTRO_CUIDADO(id_centro)
go

ALTER TABLE CUENTA ADD CONSTRAINT RefPRODUCTOS_FISICOS74 
    FOREIGN KEY (id_producto)
    REFERENCES PRODUCTOS_FISICOS(id_producto)
go

/* 
 * TABLE: DESGLOSE_VENTA 
 */

ALTER TABLE DESGLOSE_VENTA ADD 
    CONSTRAINT fk_codigo_producto FOREIGN KEY (id_centro, id_producto) REFERENCES CUENTA(id_centro, id_producto)
go


/* 
 * TABLE: ENCARGADO 
 */

ALTER TABLE ENCARGADO ADD 
    CONSTRAINT fk_personalE FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal)
go


/* 
 * TABLE: ESPECIE 
 */

ALTER TABLE ESPECIE ADD 
    CONSTRAINT fk_raza FOREIGN KEY (id_raza) REFERENCES RAZA(id_raza)
go


/* 
 * TABLE: GERENTE 
 */

ALTER TABLE GERENTE ADD 
    CONSTRAINT fk_personalG FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal)
go


/* 
 * TABLE: MASCOTA 
 */

ALTER TABLE MASCOTA ADD 
    CONSTRAINT fk_UsuarioComunM  FOREIGN KEY (id_UsuarioComun) REFERENCES USUARIO_COMUN(id_UsuarioComun)
go

ALTER TABLE MASCOTA ADD 
    CONSTRAINT fk_especieM FOREIGN KEY (id_especie) REFERENCES ESPECIE(id_especie)
go


/* 
 * TABLE: OFERTA_PRODUCTOSFISICOS 
 */

ALTER TABLE OFERTA_PRODUCTOSFISICOS ADD 
    CONSTRAINT fk_productoOF FOREIGN KEY (id_producto) REFERENCES PRODUCTOS_FISICOS(id_producto)
go

ALTER TABLE OFERTA_PRODUCTOSFISICOS ADD 
    CONSTRAINT fk_ofertaOF FOREIGN KEY (id_oferta) REFERENCES OFERTAS_FISICOS(id_oferta)
go


/* 
 * TABLE: PERSONAL_AYUDA 
 */

ALTER TABLE PERSONAL_AYUDA ADD
    CONSTRAINT ck_tipoMacotaPA check (tipoMascota in ('P','G')),
    CONSTRAINT fk_personalAyuda FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal)
go

ALTER TABLE PERSONAL_AYUDA ADD 
    CONSTRAINT fk_centroPA FOREIGN KEY (id_centro) REFERENCES CENTRO_CUIDADO(id_centro)
go

/* 
 * TABLE: PRODUCTOS_ONLINE 
 */

ALTER TABLE PRODUCTOS_ONLINE ADD
    CONSTRAINT fk_categoria_online FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
go


/* 
 * TABLE: RECIBO 
 */

ALTER TABLE RECIBO ADD 
    CONSTRAINT fk_reporte_rec FOREIGN KEY (id_reporte) REFERENCES REPORTE(id_reporte)
go

ALTER TABLE RECIBO ADD 
    CONSTRAINT fk_usu_comun FOREIGN KEY (id_UsuarioComun) REFERENCES USUARIO_COMUN(id_UsuarioComun)
go

 
/* 
 * TABLE: REPORTE 
 */

ALTER TABLE REPORTE ADD 
    CONSTRAINT fk_personal_repo FOREIGN KEY (id_personal) REFERENCES VETERINARIO(id_personal)
go


/* 
 * TABLE: REPORTE_MEDICAMENTO 
 */

ALTER TABLE REPORTE_MEDICAMENTO ADD 
    CONSTRAINT fk_reporteR FOREIGN KEY (id_reporte) REFERENCES REPORTE(id_reporte)
go

ALTER TABLE REPORTE_MEDICAMENTO ADD 
    CONSTRAINT fk_medicamentoR FOREIGN KEY (id_medicamento) REFERENCES MEDICAMENTO(id_medicamento)
go


/* 
 * TABLE: RESERVACION_GUARDERIA 
 */

ALTER TABLE RESERVACION_GUARDERIA ADD   
    CONSTRAINT  fk_centroR FOREIGN KEY (id_centro) REFERENCES CENTRO_CUIDADO(id_centro)
go

ALTER TABLE RESERVACION_GUARDERIA ADD
    CONSTRAINT fk_UsuarioComunR FOREIGN KEY (id_UsuarioComun) REFERENCES USUARIO_COMUN(id_UsuarioComun)
go


/* 
 * TABLE: TELEFONOS_PERSONAL_AYUDA 
 */

ALTER TABLE TELEFONOS_PERSONAL_AYUDA ADD 
    CONSTRAINT fk_personalT FOREIGN KEY (id_personal)REFERENCES PERSONAL_AYUDA(id_personal)
go


/* 
 * TABLE: VETERINARIO 
 */

ALTER TABLE VETERINARIO ADD
    CONSTRAINT fk_centroV FOREIGN KEY (id_centro) REFERENCES CENTRO_CUIDADO(id_centro)
go

ALTER TABLE VETERINARIO ADD
    CONSTRAINT fk_personalV FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal)
go


/* 
 * TABLE: VITALES 
 */

ALTER TABLE VITALES ADD 
    CONSTRAINT fk_brazalete FOREIGN KEY (id_brazalete) REFERENCES BRAZALETE(id_brazalete)
go

