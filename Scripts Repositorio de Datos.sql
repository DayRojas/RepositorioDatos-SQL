CREATE TABLE adultomayor (
    id_adultomayor                       NUMBER NOT NULL,
    estado                               VARCHAR2(10), 

    grupo_id_grupopoblacional NUMBER NOT NULL
);

CREATE UNIQUE INDEX adultomayor__idx ON
    adultomayor (
        grupo_id_grupopoblacional
    ASC );

ALTER TABLE adultomayor ADD CONSTRAINT adultomayor_pk PRIMARY KEY ( id_adultomayor );

CREATE TABLE afrodescendiente (
    id_afrodescendiente        NUMBER NOT NULL,
    comunidad                  VARCHAR2(100),
    grupoetnico_id_grupoetnico NUMBER NOT NULL
);

CREATE UNIQUE INDEX afrodescendiente__idx ON
    afrodescendiente (
        grupoetnico_id_grupoetnico
    ASC );

ALTER TABLE afrodescendiente ADD CONSTRAINT afrodescendiente_pk PRIMARY KEY ( id_afrodescendiente );

CREATE TABLE alcalde (
    id_alcalde         NUMBER NOT NULL,
    id_datoscontacto   NUMBER,
    telefono           NUMBER,
    persona_id_persona NUMBER NOT NULL
);

CREATE UNIQUE INDEX alcalde__idx ON
    alcalde (
        persona_id_persona
    ASC );

ALTER TABLE alcalde ADD CONSTRAINT alcalde_pk PRIMARY KEY ( id_alcalde,
                                                            persona_id_persona );

CREATE TABLE asistencia (
    id_asistencia             NUMBER NOT NULL,
    id_participantesinscritos NUMBER NOT NULL
);

ALTER TABLE asistencia ADD CONSTRAINT asistencia_pk PRIMARY KEY ( id_asistencia );

CREATE TABLE componenteensalud (
    id_componentesalud NUMBER NOT NULL,
    tipo_afiliacion    VARCHAR2(50),
    persona_id_persona NUMBER NOT NULL
);

CREATE UNIQUE INDEX componenteensalud__idx ON
    componenteensalud (
        persona_id_persona
    ASC );

ALTER TABLE componenteensalud ADD CONSTRAINT componenteensalud_pk PRIMARY KEY ( id_componentesalud,
                                                                                persona_id_persona );

CREATE TABLE constancia (
    id_constancia                            NUMBER NOT NULL,
    id_documentoidentidad                    NUMBER NOT NULL,
    id_persona                               NUMBER NOT NULL,
    tipo_constancia                          VARCHAR2(50) NOT NULL,
    codigoqr                                 NUMBER, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    registro_id_registroaprobacion NUMBER NOT NULL
);

ALTER TABLE constancia ADD CONSTRAINT constancia_pk PRIMARY KEY ( id_constancia );

CREATE TABLE cursos (
    id_cursos                              NUMBER NOT NULL,
    nombre_curso                           VARCHAR2(100),
    profesores_id_profesores               NUMBER NOT NULL,
    asistencia_id_asistencia               NUMBER,
    intensidad_horaria                     VARCHAR2(20),
    id_modalidades                         NUMBER NOT NULL, 
    educacion_id_educacioncontinua NUMBER NOT NULL,
    profesores_id_persona                  NUMBER NOT NULL
);

ALTER TABLE cursos ADD CONSTRAINT cursos_pk PRIMARY KEY ( id_cursos );

CREATE TABLE datoscontacto (
    id_datoscontacto   NUMBER NOT NULL,
    correo_electronico VARCHAR2(50),
    celular            NUMBER,
    direccion          VARCHAR2(200),
    persona_id_persona NUMBER NOT NULL
);

CREATE UNIQUE INDEX datoscontacto__idx ON
    datoscontacto (
        persona_id_persona
    ASC );

ALTER TABLE datoscontacto ADD CONSTRAINT datoscontacto_pk PRIMARY KEY ( id_datoscontacto );

CREATE TABLE departamento (
    id_departamento     NUMBER NOT NULL,
    nombre_departamento VARCHAR2(50)
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE documentoidentidad (
    id_documentoidentidad NUMBER NOT NULL,
    tipo_documento        VARCHAR2(100),
    numero_documento      NUMBER,
    persona_id_persona    NUMBER NOT NULL,
    fechaemision          DATE,
    fechaexpedicion       DATE
);

CREATE UNIQUE INDEX documentoidentidad__idx ON
    documentoidentidad (
        persona_id_persona
    ASC );

ALTER TABLE documentoidentidad ADD CONSTRAINT documentoidentidad_pk PRIMARY KEY ( id_documentoidentidad );

CREATE TABLE edad (
    id_edad            NUMBER NOT NULL,
    edad_actual        NUMBER,
    persona_id_persona NUMBER NOT NULL
);

CREATE UNIQUE INDEX edad__idx ON
    edad (
        persona_id_persona
    ASC );

ALTER TABLE edad ADD CONSTRAINT edad_pk PRIMARY KEY ( id_edad,
                                                      persona_id_persona );

CREATE TABLE educacion (
    id_educacion       NUMBER NOT NULL,
    nombre_profesion   VARCHAR2(100),
    persona_id_persona NUMBER NOT NULL,
    nivel_educacion    VARCHAR2(50)
);

ALTER TABLE educacion ADD CONSTRAINT educacion_pk PRIMARY KEY ( id_educacion );

CREATE TABLE educacioncontinua (
    id_educacioncontinua NUMBER NOT NULL,
    categoria            VARCHAR2(50)
);

ALTER TABLE educacioncontinua ADD CONSTRAINT educacioncontinua_pk PRIMARY KEY ( id_educacioncontinua );

CREATE TABLE envioinformacion (
    id_envioinformacion NUMBER NOT NULL,
    autorizacion        VARCHAR2(10),
    persona_id_persona  NUMBER NOT NULL,
    medio_contacto      VARCHAR2(80)
);

CREATE UNIQUE INDEX envioinformacion__idx ON
    envioinformacion (
        persona_id_persona
    ASC );

ALTER TABLE envioinformacion ADD CONSTRAINT envioinformacion_pk PRIMARY KEY ( id_envioinformacion );

CREATE TABLE estadocivil (
    id_estadocivil     NUMBER NOT NULL,
    estado             VARCHAR2(20),
    persona_id_persona NUMBER NOT NULL
);

CREATE UNIQUE INDEX estadocivil__idx ON
    estadocivil (
        persona_id_persona
    ASC );

ALTER TABLE estadocivil ADD CONSTRAINT estadocivil_pk PRIMARY KEY ( id_estadocivil );

CREATE TABLE funcionariopublico (
    id_funcionariopublico NUMBER NOT NULL,
    persona_id_persona    NUMBER NOT NULL,
    nombre_cargo          VARCHAR2(80),
    id_documentoidentidad NUMBER NOT NULL,
    id_datoscontacto      NUMBER NOT NULL,
    id_sexo               NUMBER NOT NULL,
    id_educacion          NUMBER NOT NULL
);

CREATE UNIQUE INDEX funcionariopublico__idx ON
    funcionariopublico (
        persona_id_persona
    ASC );

ALTER TABLE funcionariopublico ADD CONSTRAINT funcionariopublico_pk PRIMARY KEY ( id_funcionariopublico );

CREATE TABLE grupoetnico (
    id_grupoetnico                       NUMBER NOT NULL,
    nombre_grupo                         VARCHAR2(50), 
    grupopo_id_grupopoblacional          NUMBER NOT NULL,
    indigena_id_indigena                 NUMBER NOT NULL
);

CREATE UNIQUE INDEX grupoetnico__idx ON
    grupoetnico (
        grupopo_id_grupopoblacional
    ASC );

CREATE UNIQUE INDEX grupoetnico__idxv1 ON
    grupoetnico (
        indigena_id_indigena
    ASC );

ALTER TABLE grupoetnico ADD CONSTRAINT grupoetnico_pk PRIMARY KEY ( id_grupoetnico );

CREATE TABLE grupopoblacional (
    id_grupopoblacional NUMBER NOT NULL,
    tipo_grupo          VARCHAR2(100)
);

ALTER TABLE grupopoblacional ADD CONSTRAINT grupopoblacional_pk PRIMARY KEY ( id_grupopoblacional );

CREATE TABLE huelladactilar (
    id_huella          NUMBER NOT NULL,
    persona_id_persona NUMBER NOT NULL,
    huella             RAW(1000),
    fecharegistro      TIMESTAMP
);

CREATE UNIQUE INDEX huelladactilar__idx ON
    huelladactilar (
        persona_id_persona
    ASC );

ALTER TABLE huelladactilar ADD CONSTRAINT huelladactilar_pk PRIMARY KEY ( id_huella );

CREATE TABLE indigena (
    id_indigena  NUMBER NOT NULL,
    nombre_tribu VARCHAR2(100)
);

ALTER TABLE indigena ADD CONSTRAINT indigena_pk PRIMARY KEY ( id_indigena );

CREATE TABLE informacion_municipios (
    id_informacion_municipios     NUMBER NOT NULL,
    id_datoscontacto              NUMBER NOT NULL,
    portalweb                     VARCHAR2(100),
    correo_contactenos            VARCHAR2(50),
    correo_adicional              VARCHAR2(50),
    telefono1                     NUMBER,
    telefono2                     NUMBER,
    celular2                      NUMBER,
    municipios_id_dane_municipios NUMBER NOT NULL
);

CREATE UNIQUE INDEX informacion_municipios__idx ON
    informacion_municipios (
        municipios_id_dane_municipios
    ASC );

ALTER TABLE informacion_municipios ADD CONSTRAINT id_informacion_municipios_pk PRIMARY KEY ( id_informacion_municipios );

CREATE TABLE ingresosmensuales (
    id_ingresosmensuales NUMBER NOT NULL,
    rango_ingresos       VARCHAR2(100),
    persona_id_persona   NUMBER
);

CREATE UNIQUE INDEX ingresosmensuales__idx ON
    ingresosmensuales (
        persona_id_persona
    ASC );

ALTER TABLE ingresosmensuales ADD CONSTRAINT ingresosmensuales_pk PRIMARY KEY ( id_ingresosmensuales );

CREATE TABLE junta_accion_comunal (
    id_junta_accion_comunal              NUMBER NOT NULL,
    cargo                                VARCHAR2(50),
    vereda                               VARCHAR2(100),
    fecha_inicio                         DATE,
    fecha_finalizacion                   DATE, 
    grupo_id_grupopoblacional NUMBER NOT NULL
);

CREATE UNIQUE INDEX junta_accion_comunal__idx ON
    junta_accion_comunal (
        grupo_id_grupopoblacional
    ASC );

ALTER TABLE junta_accion_comunal ADD CONSTRAINT junta_accion_comunal_pk PRIMARY KEY ( id_junta_accion_comunal );

CREATE TABLE "LGTBI+" (
    "id_LGTBI+"                          NUMBER NOT NULL, 
    grupopo_id_grupopoblacional NUMBER NOT NULL,
    identidadgenero                      VARCHAR2(50)
);

CREATE UNIQUE INDEX "LGTBI+__IDX" ON
    "LGTBI+" (
        grupopo_id_grupopoblacional
    ASC );

ALTER TABLE "LGTBI+" ADD CONSTRAINT "LGTBI+_PK" PRIMARY KEY ( "id_LGTBI+" );

CREATE TABLE lidertic (
    id_lidertic        NUMBER NOT NULL,
    id_datoscontacto   NUMBER NOT NULL,
    cargo              VARCHAR2(50),
    dependencia        VARCHAR2(50),
    correo_adicional   VARCHAR2(50),
    telefono1          NUMBER,
    telefono2          NUMBER,
    celular2           NUMBER,
    persona_id_persona NUMBER NOT NULL
);

CREATE UNIQUE INDEX lidertic__idx ON
    lidertic (
        persona_id_persona
    ASC );

ALTER TABLE lidertic ADD CONSTRAINT lidertic_pk PRIMARY KEY ( id_lidertic,
                                                              persona_id_persona );

CREATE TABLE modalidades (
    id_modalidades   NUMBER NOT NULL,
    nombremodalidad  VARCHAR2(50),
    cursos_id_cursos NUMBER NOT NULL
);

CREATE UNIQUE INDEX modalidades__idx ON
    modalidades (
        cursos_id_cursos
    ASC );

ALTER TABLE modalidades ADD CONSTRAINT modalidades_pk PRIMARY KEY ( id_modalidades );

CREATE TABLE municipios (
    id_dane                      NUMBER NOT NULL,
    nombre_municipio             VARCHAR2(120),
    categoria                    NUMBER,
    provincias_id_provincia      NUMBER NOT NULL,
    persona_id_persona           NUMBER NOT NULL,
    departamento_id_departamento NUMBER NOT NULL
);

CREATE UNIQUE INDEX municipios__idx ON
    municipios (
        persona_id_persona
    ASC );

ALTER TABLE municipios ADD CONSTRAINT municipios_pk PRIMARY KEY ( id_dane );

CREATE TABLE nucleofamiliar (
    id_nucleofamiliar  NUMBER NOT NULL,
    cantidad_personas  NUMBER,
    cantidad_hijos     NUMBER,
    persona_id_persona NUMBER
);

CREATE UNIQUE INDEX nucleofamiliar__idx ON
    nucleofamiliar (
        persona_id_persona
    ASC );

ALTER TABLE nucleofamiliar ADD CONSTRAINT nucleofamiliar_pk PRIMARY KEY ( id_nucleofamiliar );

CREATE TABLE ocupacion (
    id_ocupacion   NUMBER NOT NULL,
    tipo_ocupacion VARCHAR2(80)
);

ALTER TABLE ocupacion ADD CONSTRAINT ocupacion_pk PRIMARY KEY ( id_ocupacion );

CREATE TABLE participantesinscritos (
    id_participantesinscritos NUMBER NOT NULL,
    id_datoscontacto          NUMBER,
    persona_id_persona        NUMBER NOT NULL,
    id_documentoidentidad     NUMBER,
    id_dane                   NUMBER,
    cargo                     VARCHAR2(50),
    entidad                   VARCHAR2(50)
);

ALTER TABLE participantesinscritos ADD CONSTRAINT participantesinscritos_pk PRIMARY KEY ( id_participantesinscritos );

CREATE TABLE persona (
    id_persona       NUMBER NOT NULL,
    nombres          VARCHAR2(100),
    apellidos        VARCHAR2(100),
    fecha_nacimiento DATE
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( id_persona );

CREATE TABLE personascondiscapacidad (
    id_personascondiscapacidad           NUMBER NOT NULL,
    tipos_discapacidades                 VARCHAR2(100), 
    grupo_id_grupopoblacional NUMBER NOT NULL
);

CREATE UNIQUE INDEX personascondiscapacidad__idx ON
    personascondiscapacidad (
        grupo_id_grupopoblacional
    ASC );

ALTER TABLE personascondiscapacidad ADD CONSTRAINT personascondiscapacidad_pk PRIMARY KEY ( id_personascondiscapacidad );

CREATE TABLE profesores (
    id_profesores         NUMBER NOT NULL,
    id_persona            NUMBER NOT NULL,
    id_datoscontacto      NUMBER NOT NULL,
    id_educacion          NUMBER NOT NULL,
    id_documentoidentidad NUMBER NOT NULL
);

ALTER TABLE profesores ADD CONSTRAINT profesores_pk PRIMARY KEY ( id_profesores );

CREATE TABLE programassociales (
    id_programassociales NUMBER NOT NULL,
    nombre_programa      VARCHAR2(100)
);

ALTER TABLE programassociales ADD CONSTRAINT programassociales_pk PRIMARY KEY ( id_programassociales );

CREATE TABLE provincias (
    id_provincia                 NUMBER NOT NULL,
    provincia                    VARCHAR2(100),
    departamento_id_departamento NUMBER NOT NULL
);

ALTER TABLE provincias ADD CONSTRAINT provincias_pk PRIMARY KEY ( id_provincia );

CREATE TABLE registroaprobacion (
    id_registroaprobacion NUMBER NOT NULL,
    estado                VARCHAR2(20),
    cursos_id_cursos      NUMBER NOT NULL
);

ALTER TABLE registroaprobacion ADD CONSTRAINT registroaprobacion_pk PRIMARY KEY ( id_registroaprobacion );

CREATE TABLE relation_parti_cur ( 

    participantesinscritos_id_participantesinscritos NUMBER NOT NULL,
    cursos_id_cursos                                 NUMBER NOT NULL
);

ALTER TABLE relation_parti_cur ADD CONSTRAINT relation_parti_cur_pk PRIMARY KEY ( participantesinscritos_id_participantesinscritos,
                                                                                  cursos_id_cursos );

CREATE TABLE relation_per_ocupacion (
    persona_id_persona     NUMBER NOT NULL,
    ocupacion_id_ocupacion NUMBER NOT NULL
);

ALTER TABLE relation_per_ocupacion ADD CONSTRAINT relation_per_ocupacion_pk PRIMARY KEY ( persona_id_persona,
                                                                                          ocupacion_id_ocupacion );

CREATE TABLE relation_per_programa (
    persona_id_persona                     NUMBER NOT NULL, 
    programas_id_programassociales         NUMBER NOT NULL
);

ALTER TABLE relation_per_programa ADD CONSTRAINT relation_per_programa_pk PRIMARY KEY ( persona_id_persona,
                                                                                        programas_id_programassociales );

CREATE TABLE relation_pers_gp (
    persona_id_persona                   NUMBER NOT NULL, 
    grupo_id_grupopoblacional            NUMBER NOT NULL
);

ALTER TABLE relation_pers_gp ADD CONSTRAINT relation_pers_gp_pk PRIMARY KEY ( persona_id_persona,
                                                                              grupo_id_grupopoblacional );

CREATE TABLE sectoreconomico (
    id_sectoreconomico      NUMBER NOT NULL,
    nombre_sector_economico VARCHAR2(20),
    persona_id_persona      NUMBER NOT NULL
);

ALTER TABLE sectoreconomico ADD CONSTRAINT sectoreconomico_pk PRIMARY KEY ( id_sectoreconomico );

CREATE TABLE sexo (
    id_sexo            NUMBER NOT NULL,
    genero             VARCHAR2(20),
    persona_id_persona NUMBER NOT NULL
);
CREATE TABLE sechacienda (
    id_sechacienda        NUMBER NOT NULL,
    placa                 VARCHAR2(50),
    url                   VARCHAR2(100),
    id_datoscontacto      NUMBER NOT NULL,
    id_dane               NUMBER NOT NULL,
    id_documentoidentidad NUMBER NOT NULL,
    id_persona            NUMBER NOT NULL
);

ALTER TABLE sechacienda ADD CONSTRAINT sechacienda_pk PRIMARY KEY ( id_sechacienda );



CREATE TABLE persona_sechacienda (
    persona_id_persona         NUMBER NOT NULL,
    sechacienda_id_sechacienda NUMBER NOT NULL
);

ALTER TABLE persona_sechacienda ADD CONSTRAINT persona_sechacienda_pk PRIMARY KEY ( persona_id_persona,
                                                                                    sechacienda_id_sechacienda );
                                                                                    
                                                                                    ALTER TABLE persona_sechacienda
    ADD CONSTRAINT persona_sechacienda_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );


ALTER TABLE persona_sechacienda
    ADD CONSTRAINT fk_per_sechacienda
    FOREIGN KEY (sechacienda_id_sechacienda)
    REFERENCES sechacienda (id_sechacienda);
    
CREATE UNIQUE INDEX sexo__idx ON
    sexo (
        persona_id_persona
    ASC );

ALTER TABLE sexo ADD CONSTRAINT sexo_pk PRIMARY KEY ( id_sexo );

CREATE TABLE sisben (
    id_sisben          NUMBER NOT NULL,
    persona_id_persona NUMBER NOT NULL,
    grupo              CHAR(20),
    subgrupo           CHAR(20)
);

CREATE UNIQUE INDEX sisben__idx ON
    sisben (
        persona_id_persona
    ASC );

ALTER TABLE sisben ADD CONSTRAINT sisben_pk PRIMARY KEY ( id_sisben );

CREATE TABLE victimaconflictoarmado (
    id_victimaconflictoarmado            NUMBER NOT NULL,
    estado                               VARCHAR2(10), 
    grupo_id_grupopoblacional            NUMBER NOT NULL
);

CREATE UNIQUE INDEX victimaconflictoarmado__idx ON
    victimaconflictoarmado (
        grupo_id_grupopoblacional
    ASC );

ALTER TABLE victimaconflictoarmado ADD CONSTRAINT victimaconflictoarmado_pk PRIMARY KEY ( id_victimaconflictoarmado );

CREATE TABLE visitantes (
    id_visitantes             NUMBER NOT NULL,
    persona_id_persona        NUMBER NOT NULL,
    id_datoscontacto          NUMBER NOT NULL,
    id_documentoidentidad     NUMBER NOT NULL,
    huelladactillar_id_huella NUMBER NOT NULL
);

CREATE UNIQUE INDEX visitantes__idx ON
    visitantes (
        persona_id_persona
    ASC );

ALTER TABLE visitantes ADD CONSTRAINT visitantes_pk PRIMARY KEY ( id_visitantes );

CREATE TABLE vivienda (
    id_vivienda           NUMBER NOT NULL,
    persona_id_persona    NUMBER NOT NULL,
    tipo_vivienda         VARCHAR2(100),
    material_construccion VARCHAR2(50),
    nombre_tenencia       VARCHAR2(50),
    nombre_servicios      VARCHAR2(50)
);

CREATE UNIQUE INDEX vivienda__idx ON
    vivienda (
        persona_id_persona
    ASC );

ALTER TABLE vivienda ADD CONSTRAINT vivienda_pk PRIMARY KEY ( id_vivienda );


ALTER TABLE adultomayor
    ADD CONSTRAINT adultomayor_grupo_fk FOREIGN KEY ( grupo_id_grupopoblacional )
        REFERENCES grupopoblacional ( id_grupopoblacional );


ALTER TABLE afrodescendiente
    ADD CONSTRAINT afrodescendiente_grupoetnico_fk FOREIGN KEY ( grupoetnico_id_grupoetnico )
        REFERENCES grupoetnico ( id_grupoetnico );

ALTER TABLE alcalde
    ADD CONSTRAINT alcalde_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE componenteensalud
    ADD CONSTRAINT componenteensalud_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );


ALTER TABLE constancia
    ADD CONSTRAINT constancia_registro_fk FOREIGN KEY ( registro_id_registroaprobacion )
        REFERENCES registroaprobacion ( id_registroaprobacion );

ALTER TABLE cursos
    ADD CONSTRAINT cursos_asistencia_fk FOREIGN KEY ( asistencia_id_asistencia )
        REFERENCES asistencia ( id_asistencia );

ALTER TABLE cursos
    ADD CONSTRAINT cursos_educacion_fk FOREIGN KEY ( educacion_id_educacioncontinua )
        REFERENCES educacioncontinua ( id_educacioncontinua );

ALTER TABLE cursos
    ADD CONSTRAINT cursos_profesores_fk FOREIGN KEY ( profesores_id_profesores )
        REFERENCES profesores ( id_profesores );

ALTER TABLE datoscontacto
    ADD CONSTRAINT datoscontacto_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE documentoidentidad
    ADD CONSTRAINT documentoidentidad_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE edad
    ADD CONSTRAINT edad_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE educacion
    ADD CONSTRAINT educacion_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE envioinformacion
    ADD CONSTRAINT envioinformacion_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE estadocivil
    ADD CONSTRAINT estadocivil_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE funcionariopublico
    ADD CONSTRAINT funcionariopublico_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

 
ALTER TABLE grupoetnico
    ADD CONSTRAINT grupoeo_grupo_fk FOREIGN KEY ( grupopo_id_grupopoblacional )
        REFERENCES grupopoblacional ( id_grupopoblacional );

ALTER TABLE grupoetnico
    ADD CONSTRAINT grupoetnico_indigena_fk FOREIGN KEY ( indigena_id_indigena )
        REFERENCES indigena ( id_indigena );

ALTER TABLE huelladactilar
    ADD CONSTRAINT huelladactilar_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );


ALTER TABLE informacion_municipios
    ADD CONSTRAINT informacion_municipios_municipios_fk FOREIGN KEY ( municipios_id_dane_municipios )
        REFERENCES municipios ( id_dane );

ALTER TABLE ingresosmensuales
    ADD CONSTRAINT ingresosmensuales_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );
 
ALTER TABLE junta_accion_comunal
    ADD CONSTRAINT junta_accion_comunal_grupo_fk FOREIGN KEY ( grupo_id_grupopoblacional )
        REFERENCES grupopoblacional ( id_grupopoblacional );

ALTER TABLE "LGTBI+"
    ADD CONSTRAINT "LGTBI+_Grupo_FK" FOREIGN KEY ( grupopo_id_grupopoblacional )
        REFERENCES grupopoblacional ( id_grupopoblacional );

ALTER TABLE lidertic
    ADD CONSTRAINT lidertic_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE modalidades
    ADD CONSTRAINT modalidades_cursos_fk FOREIGN KEY ( cursos_id_cursos )
        REFERENCES cursos ( id_cursos );

ALTER TABLE municipios
    ADD CONSTRAINT municipios_departamento_fk FOREIGN KEY ( departamento_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE municipios
    ADD CONSTRAINT municipios_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE municipios
    ADD CONSTRAINT municipios_provincias_fk FOREIGN KEY ( provincias_id_provincia )
        REFERENCES provincias ( id_provincia );

ALTER TABLE nucleofamiliar
    ADD CONSTRAINT nucleofamiliar_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );


ALTER TABLE participantesinscritos
    ADD CONSTRAINT participantesinscritos_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );


ALTER TABLE personascondiscapacidad
    ADD CONSTRAINT personascondiscapacidad_grupopoblacional_fk FOREIGN KEY ( grupopoblacional_id_grupopoblacional )
        REFERENCES grupopoblacional ( id_grupopoblacional );

ALTER TABLE provincias
    ADD CONSTRAINT provincias_departamento_fk FOREIGN KEY ( departamento_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE registroaprobacion
    ADD CONSTRAINT registroaprobacion_cursos_fk FOREIGN KEY ( cursos_id_cursos )
        REFERENCES cursos ( id_cursos );

ALTER TABLE relation_parti_cur
    ADD CONSTRAINT relation_parti_cur_cursos_fk FOREIGN KEY ( cursos_id_cursos )
        REFERENCES cursos ( id_cursos );


ALTER TABLE relation_parti_cur
    ADD CONSTRAINT relation_parti_cur_participantesinscritos_fk FOREIGN KEY ( participantesinscritos_id_participantesinscritos )
        REFERENCES participantesinscritos ( id_participantesinscritos );


ALTER TABLE relation_per_ocupacion
    ADD CONSTRAINT relation_per_ocupacion_ocupacion_fk FOREIGN KEY ( ocupacion_id_ocupacion )
        REFERENCES ocupacion ( id_ocupacion );


ALTER TABLE relation_per_ocupacion
    ADD CONSTRAINT relation_per_ocupacion_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );


ALTER TABLE relation_per_programa
    ADD CONSTRAINT rela_per_programa_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );


ALTER TABLE relation_per_programa
    ADD CONSTRAINT relation_per_programa_programassociales_fk FOREIGN KEY ( programassociales_id_programassociales )
        REFERENCES programassociales ( id_programassociales );

ALTER TABLE relation_pers_gp
    ADD CONSTRAINT re_pers_gp_grupo_fk FOREIGN KEY ( grupopo_id_grupopoblacional )
        REFERENCES grupopoblacional ( id_grupopoblacional );

ALTER TABLE relation_pers_gp
    ADD CONSTRAINT relation_pers_gp_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE sectoreconomico
    ADD CONSTRAINT sectoreconomico_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE sexo
    ADD CONSTRAINT sexo_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE sisben
    ADD CONSTRAINT sisben_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

 
ALTER TABLE victimaconflictoarmado
    ADD CONSTRAINT victima_grupopoblacional_fk FOREIGN KEY ( grupo_id_grupopoblacional )
        REFERENCES grupopoblacional ( id_grupopoblacional );

ALTER TABLE visitantes
    ADD CONSTRAINT visitantes_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE vivienda
    ADD CONSTRAINT vivienda_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

CREATE OR REPLACE VIEW Vista_AdultoMayor ( nombres, apellidos, estado ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    adultomayor.estado
FROM
    adultomayor,
    persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    adultomayor.estado 
;

CREATE OR REPLACE VIEW Vista_Afrodescendiente ( nombres, apellidos, comunidad ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    afrodescendiente.comunidad
FROM
    persona,
    afrodescendiente
ORDER BY
    persona.nombres,
    persona.apellidos,
    afrodescendiente.comunidad 
;

CREATE OR REPLACE VIEW Vista_Alcalde ( nombres, apellidos, correo_electronico, celular, direccion, telefono ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    alcalde.telefono
FROM
         alcalde
    INNER JOIN persona ON persona.id_persona = alcalde.persona_id_persona
    INNER JOIN datoscontacto ON persona.id_persona = datoscontacto.persona_id_persona 
;

CREATE OR REPLACE VIEW Vista_Asistencia ( nombres, apellidos, correo_electronico, celular, direccion, tipo_documento, numero_documento, nombre_municipio, cargo, entidad ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    municipios.nombre_municipio,
    participantesinscritos.cargo,
    participantesinscritos.entidad
FROM
         persona
    INNER JOIN datoscontacto ON persona.id_persona = datoscontacto.persona_id_persona
    INNER JOIN documentoidentidad ON persona.id_persona = documentoidentidad.persona_id_persona
    INNER JOIN participantesinscritos ON persona.id_persona = participantesinscritos.persona_id_persona,
    municipios
ORDER BY
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    municipios.nombre_municipio,
    participantesinscritos.cargo,
    participantesinscritos.entidad 
;

CREATE OR REPLACE VIEW Vista_ComponenteSalud ( nombres, apellidos, tipo_afiliacion ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    componenteensalud.tipo_afiliacion
FROM
         persona
    INNER JOIN componenteensalud ON persona.id_persona = componenteensalud.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    componenteensalud.tipo_afiliacion 
;

CREATE OR REPLACE VIEW Vista_Constancia ( nombres, apellidos, tipo_documento, numero_documento, tipo_constancia, codigoqr ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    constancia.tipo_constancia,
    constancia.codigoqr
FROM
         persona
    INNER JOIN documentoidentidad ON persona.id_persona = documentoidentidad.persona_id_persona,
    constancia
ORDER BY
    persona.nombres,
    persona.apellidos,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    constancia.tipo_constancia 
;

CREATE OR REPLACE VIEW VistaControlRegistroCursos ( nombres, apellidos, estado, nombre_curso, intensidad_horaria, tipo_constancia, codigoqr, categoria, nombremodalidad ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    registroaprobacion.estado,
    cursos.nombre_curso,
    cursos.intensidad_horaria,
    constancia.tipo_constancia,
    constancia.codigoqr,
    educacioncontinua.categoria,
    modalidades.nombremodalidad
FROM
    persona, registroaprobacion
    INNER JOIN cursos ON cursos.id_cursos = registro.cursos_id_cursos
    INNER JOIN educacioncontinua ON edu.id_educacioncontinua = cur.educacion_id_educacioncontinua
    INNER JOIN modalidades ON cur.id_cursos = modali.id_modalidades,
    constancia
ORDER BY
    persona.nombres,
    persona.apellidos,
    registroaprobacion.estado,
    cursos.nombre_curso,
    cursos.intensidad_horaria,
    constancia.tipo_constancia,
    constancia.codigoqr,
    educacioncontinua.categoria,
    modalidades.nombremodalidad 
;

CREATE OR REPLACE VIEW Vista_DatosContacto ( nombres, apellidos, correo_electronico, celular, direccion ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion
FROM
         persona
    INNER JOIN datoscontacto ON persona.id_persona = datoscontacto.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion 
;

CREATE OR REPLACE VIEW Vista_DatosPersonalesCompletos ( id_persona, nombres, apellidos, fecha_nacimiento, tipo_documento, numero_documento, fechaemision, fechaexpedicion, huella, fecharegistro, correo_electronico, celular, direccion ) AS
SELECT
    persona.id_persona,
    persona.nombres,
    persona.apellidos,
    persona.fecha_nacimiento,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    documentoidentidad.fechaemision,
    documentoidentidad.fechaexpedicion,
    huelladactilar.huella,
    huelladactilar.fecharegistro,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion
FROM
         persona
    INNER JOIN documentoidentidad ON persona.id_persona = documentoidentidad.persona_id_persona
    INNER JOIN datoscontacto ON persona.id_persona = datoscontacto.persona_id_persona
    INNER JOIN huelladactilar ON persona.id_persona = huelladactilar.persona_id_persona
ORDER BY
    persona.id_persona,
    persona.nombres,
    persona.apellidos,
    persona.fecha_nacimiento,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    documentoidentidad.fechaemision,
    documentoidentidad.fechaexpedicion,
    huelladactilar.huella,
    huelladactilar.fecharegistro,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion 
;

CREATE OR REPLACE VIEW Vista_Educacion ( nombres, apellidos, nombre_profesion, nivel_educacion ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    educacion.nombre_profesion,
    educacion.nivel_educacion
FROM
         persona
    INNER JOIN educacion ON persona.id_persona = educacion.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    educacion.nombre_profesion,
    educacion.nivel_educacion 
;

CREATE OR REPLACE VIEW Vista_EnvioInformacion ( nombres, apellidos, autorizacion, medio_contacto ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    envioinformacion.autorizacion,
    envioinformacion.medio_contacto
FROM
    persona,
    envioinformacion
ORDER BY
    persona.nombres,
    persona.apellidos,
    envioinformacion.autorizacion,
    envioinformacion.medio_contacto 
;

CREATE OR REPLACE VIEW Vista_EstadoCivil ( nombres, apellidos, estado ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    estadocivil.estado
FROM
         persona
    INNER JOIN estadocivil ON persona.id_persona = estadocivil.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    estadocivil.estado 
;

CREATE OR REPLACE VIEW Vista_FuncionarioPublico ( nombres, apellidos, correo_electronico, celular, direccion, tipo_documento, numero_documento, fechaemision, fechaexpedicion, nombre_profesion, genero, nombre_cargo, nivel_educacion ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    documentoidentidad.fechaemision,
    documentoidentidad.fechaexpedicion,
    educacion.nombre_profesion,
    sexo.genero,
    funcionariopublico.nombre_cargo,
    educacion.nivel_educacion
FROM
         persona
    INNER JOIN datoscontacto ON persona.id_persona = datoscontacto.persona_id_persona
    INNER JOIN documentoidentidad ON persona.id_persona = documentoidentidad.persona_id_persona
    INNER JOIN educacion ON persona.id_persona = educacion.persona_id_persona
    INNER JOIN sexo ON persona.id_persona = sexo.persona_id_persona,
    funcionariopublico
ORDER BY
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    documentoidentidad.fechaemision,
    documentoidentidad.fechaexpedicion,
    educacion.nombre_profesion,
    sexo.genero,
    funcionariopublico.nombre_cargo,
    educacion.nivel_educacion 
;

CREATE OR REPLACE VIEW Vista_GrupoEtnico ( nombres, apellidos, nombre_grupo ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    grupoetnico.nombre_grupo
FROM
    grupoetnico,
    persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    grupoetnico.nombre_grupo 
;

CREATE OR REPLACE VIEW Vista_GrupoPoblacional ( nombres, apellidos, tipo_grupo ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    grupopoblacional.tipo_grupo
FROM
    persona,
    grupopoblacional
ORDER BY
    persona.nombres,
    persona.apellidos,
    grupopoblacional.tipo_grupo 
;

CREATE OR REPLACE VIEW Vista_HuellasDactilares ( nombres, apellidos, fecha_nacimiento, huella, fecharegistro ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    persona.fecha_nacimiento,
    huelladactilar.huella,
    huelladactilar.fecharegistro
FROM
         persona
    INNER JOIN huelladactilar ON persona.id_persona = huelladactilar.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    persona.fecha_nacimiento,
    huelladactilar.huella,
    huelladactilar.fecharegistro 
;

CREATE OR REPLACE VIEW Vista_Indigena ( nombres, apellidos, nombre_tribu ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    indigena.nombre_tribu
FROM
    persona,
    indigena
ORDER BY
    persona.nombres,
    persona.apellidos,
    indigena.nombre_tribu 
;

CREATE OR REPLACE VIEW Vista_InformacionMunicipios ( correo_electronico, celular, direccion, portalweb, correo_contactenos, correo_adicional, telefono1, telefono2, celular2 ) AS
SELECT
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    informacion_municipios.portalweb,
    informacion_municipios.correo_contactenos,
    informacion_municipios.correo_adicional,
    informacion_municipios.telefono1,
    informacion_municipios.telefono2,
    informacion_municipios.celular2
FROM
    informacion_municipios,
    datoscontacto
ORDER BY
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    informacion_municipios.portalweb,
    informacion_municipios.correo_contactenos,
    informacion_municipios.correo_adicional,
    informacion_municipios.telefono1,
    informacion_municipios.telefono2,
    informacion_municipios.celular2 
;

CREATE OR REPLACE VIEW Vista_IngresosMensuales ( nombres, apellidos, rango_ingresos ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    ingresosmensuales.rango_ingresos
FROM
         persona
    INNER JOIN ingresosmensuales ON persona.id_persona = ingresosmensuales.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    ingresosmensuales.rango_ingresos 
;

CREATE OR REPLACE VIEW Vista_Junta_Accion_Comunal ( nombres, apellidos, cargo, vereda, fecha_inicio, fecha_finalizacion ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    junta_accion_comunal.cargo,
    junta_accion_comunal.vereda,
    junta_accion_comunal.fecha_inicio,
    junta_accion_comunal.fecha_finalizacion
FROM
    persona,
    junta_accion_comunal
ORDER BY
    persona.nombres,
    persona.apellidos,
    junta_accion_comunal.cargo,
    junta_accion_comunal.vereda,
    junta_accion_comunal.fecha_inicio,
    junta_accion_comunal.fecha_finalizacion 
;

CREATE OR REPLACE VIEW "Vista_LGTBI+" ( nombres, apellidos, grupopo_id_grupopoblacional, identidadgenero ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    "LGTBI+".grupopo_id_grupopoblacional,
    "LGTBI+".identidadgenero
FROM
    "LGTBI+",
    persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    "LGTBI+".grupopo_id_grupopoblacional,
    "LGTBI+".identidadgenero 
;

CREATE OR REPLACE VIEW Vista_LiderTIC ( nombres, apellidos, correo_electronico, celular, direccion, cargo, dependencia, correo_adicional, telefono1, telefono2, celular2 ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    lidertic.cargo,
    lidertic.dependencia,
    lidertic.correo_adicional,
    lidertic.telefono1,
    lidertic.telefono2,
    lidertic.celular2
FROM
         lidertic
    INNER JOIN persona ON persona.id_persona = lidertic.persona_id_persona
    INNER JOIN datoscontacto ON persona.id_persona = datoscontacto.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    lidertic.cargo,
    lidertic.dependencia,
    lidertic.correo_adicional,
    lidertic.telefono1,
    lidertic.telefono2,
    lidertic.celular2 
;

CREATE OR REPLACE VIEW Vista_Municipios ( nombres, apellidos, nombre_municipio, nombre_departamento, provincia ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    municipios.nombre_municipio,
    departamento.nombre_departamento,
    provincias.provincia
FROM
    persona, municipios
    INNER JOIN provincias ON provincias.id_provincia = municipios.provincias_id_provincia
    INNER JOIN departamento ON departamento.id_departamento = provincias.departamento_id_departamento
ORDER BY
    persona.nombres,
    persona.apellidos 
;

CREATE OR REPLACE VIEW Vista_NucleoFamiliar ( nombres, apellidos, cantidad_personas, cantidad_hijos ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    nucleofamiliar.cantidad_personas,
    nucleofamiliar.cantidad_hijos
FROM
         persona
    INNER JOIN nucleofamiliar ON persona.id_persona = nucleofamiliar.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    nucleofamiliar.cantidad_personas,
    nucleofamiliar.cantidad_hijos 
;

CREATE OR REPLACE VIEW Vista_Ocupacion ( nombres, apellidos, tipo_ocupacion ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    ocupacion.tipo_ocupacion
FROM
    persona,
    ocupacion
ORDER BY
    persona.nombres,
    persona.apellidos,
    ocupacion.tipo_ocupacion 
;

CREATE OR REPLACE VIEW Vista_ParticipantesInscritos ( nombres, apellidos, tipo_documento, numero_documento, correo_electronico, celular, direccion, cargo, entidad, nombre_municipio ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    participantesinscritos.cargo,
    participantesinscritos.entidad,
    municipios.nombre_municipio
FROM
         persona
    INNER JOIN datoscontacto ON persona.id_persona = datoscontacto.persona_id_persona
    INNER JOIN documentoidentidad ON persona.id_persona = documentoidentidad.persona_id_persona
    INNER JOIN participantesinscritos ON persona.id_persona = participantesinscritos.persona_id_persona,
    municipios
ORDER BY
    persona.nombres,
    persona.apellidos,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    participantesinscritos.cargo,
    participantesinscritos.entidad,
    municipios.nombre_municipio 
;

CREATE OR REPLACE VIEW Vista_Persona ( nombres, apellidos, fecha_nacimiento ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    persona.fecha_nacimiento
FROM
    persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    persona.fecha_nacimiento 
;

CREATE OR REPLACE VIEW Vista_PersonaConDiscapacidad ( nombres, apellidos, tipos_discapacidades ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    personascondiscapacidad.tipos_discapacidades
FROM
    persona,
    personascondiscapacidad
ORDER BY
    persona.nombres,
    persona.apellidos,
    personascondiscapacidad.tipos_discapacidades 
;

CREATE OR REPLACE VIEW Vista_Profesores ( nombres, apellidos, correo_electronico, celular, direccion, tipo_documento, numero_documento, nombre_profesion ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    educacion.nombre_profesion
FROM
         persona
    INNER JOIN datoscontacto ON persona.id_persona = datoscontacto.persona_id_persona
    INNER JOIN documentoidentidad ON persona.id_persona = documentoidentidad.persona_id_persona
    INNER JOIN educacion ON persona.id_persona = educacion.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    datoscontacto.celular,
    datoscontacto.direccion,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    educacion.nombre_profesion 
;

CREATE OR REPLACE VIEW Vista_ProgramasSociales ( nombres, apellidos, nombre_programa ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    programassociales.nombre_programa
FROM
    persona,
    programassociales
ORDER BY
    persona.nombres,
    persona.apellidos,
    programassociales.nombre_programa 
;

CREATE OR REPLACE VIEW Vista_SecHacienda ( numero_documento, nombres, apellidos, correo_electronico, nombre_departamento, nombre_municipio, direccion, placa, url ) AS
SELECT
    documentoidentidad.numero_documento,
    persona.nombres,
    persona.apellidos,
    datoscontacto.correo_electronico,
    departamento.nombre_departamento,
    municipios.nombre_municipio,
    datoscontacto.direccion,
    sechacienda.placa,
    sechacienda.url
FROM
         sechacienda
    INNER JOIN documentoidentidad ON sechacienda.id_documentoidentidad = documentoidentidad.id_documentoidentidad
    INNER JOIN datoscontacto ON sechacienda.id_datoscontacto = datoscontacto.id_datoscontacto
    INNER JOIN municipios ON sechacienda.id_dane = municipios.id_dane
    INNER JOIN departamento ON departamento.id_departamento = municipios.departamento_id_departamento
    INNER JOIN persona ON sechacienda.id_persona = persona.id_persona;

CREATE OR REPLACE VIEW Vista_Sexo ( nombres, apellidos, genero ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    sexo.genero
FROM
         persona
    INNER JOIN sexo ON persona.id_persona = sexo.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    sexo.genero 
;

CREATE OR REPLACE VIEW Vista_SISBEN ( nombres, apellidos, grupo, subgrupo ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    sisben.grupo,
    sisben.subgrupo
FROM
         persona
    INNER JOIN sisben ON persona.id_persona = sisben.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    sisben.grupo,
    sisben.subgrupo 
;

CREATE OR REPLACE VIEW Vista_VictimaConflictoArmado ( nombres, apellidos, estado ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    victimaconflictoarmado.estado
FROM
    persona,
    victimaconflictoarmado
ORDER BY
    persona.nombres,
    persona.apellidos,
    victimaconflictoarmado.estado 
;

CREATE OR REPLACE VIEW Vista_Visitantes ( nombres, apellidos, tipo_documento, numero_documento, celular, huella, fecharegistro ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    datoscontacto.celular,
    huelladactilar.huella,
    huelladactilar.fecharegistro
FROM
         persona
    INNER JOIN documentoidentidad ON persona.id_persona = documentoidentidad.persona_id_persona
    INNER JOIN datoscontacto ON persona.id_persona = datoscontacto.persona_id_persona
    INNER JOIN huelladactilar ON persona.id_persona = huelladactilar.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    datoscontacto.celular 
;

CREATE OR REPLACE VIEW Vista_Vivienda ( nombres, apellidos, tipo_vivienda, material_construccion, nombre_tenencia, nombre_servicios ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    vivienda.tipo_vivienda,
    vivienda.material_construccion,
    vivienda.nombre_tenencia,
    vivienda.nombre_servicios
FROM
         persona
    INNER JOIN vivienda ON persona.id_persona = vivienda.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    vivienda.tipo_vivienda,
    vivienda.material_construccion,
    vivienda.nombre_tenencia,
z;

CREATE OR REPLACE VIEW VistaDocumentoIdentidad ( nombres, apellidos, tipo_documento, numero_documento, fechaemision, fechaexpedicion ) AS
SELECT
    persona.nombres,
    persona.apellidos,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    documentoidentidad.fechaemision,
    documentoidentidad.fechaexpedicion
FROM
         persona
    INNER JOIN documentoidentidad ON persona.id_persona = documentoidentidad.persona_id_persona
ORDER BY
    persona.nombres,
    persona.apellidos,
    documentoidentidad.tipo_documento,
    documentoidentidad.numero_documento,
    documentoidentidad.fechaemision,
    documentoidentidad.fechaexpedicion 
;
