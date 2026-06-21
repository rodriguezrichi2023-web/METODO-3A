# PRD — Plataforma de Auditoría & Captación de Leads
## Método 3A by Ricardo Rodríguez (@soy.ricardorodriguez)

**Versión:** 2.0
**Fecha:** Junio 2026
**Plataforma destino:** Claude Design (MVP) → migrable a Lovable/Vercel + Supabase
**Clasificación:** Documento estratégico — uso interno

> **Nota de versión:** Este documento reemplaza la v1.0. Sincronizado con la implementación real ya construida (11 preguntas, sistema de pilares Atracción/Autoridad/Audiencia, scoring invertido corregido). Ver Changelog al final.

---

## 1. VISIÓN DEL PRODUCTO

### 1.1 Propósito
Construir una herramienta web que funcione como embudo de captación de leads calificados para el **Método 3A (Atracción, Autoridad, Audiencia)** de Ricardo Rodríguez. La plataforma ofrece una auditoría **100% gratuita** de Instagram al usuario, y en el proceso recolecta sus datos, evalúa su disposición de compra, y los clasifica automáticamente según temperatura de lead (frío, tibio, caliente, urgente).

### 1.2 Problema que resuelve
Ricardo actualmente no tiene un sistema automatizado para:
- Filtrar prospectos calificados de los no calificados
- Capturar correos y datos antes de una llamada de ventas
- Conocer el nivel de conciencia y urgencia del prospecto antes del primer contacto
- Generar prueba de intención de compra antes de invertir tiempo en el cierre

### 1.3 Solución
Una plataforma de auditoría gratuita de Instagram que actúa como **embudo de diagnóstico persuasivo**. El usuario cree que está recibiendo un análisis de su perfil — en realidad está pasando por un proceso de pre-calificación diseñado para aumentar su percepción del problema y su deseo de resolverlo con el Método 3A. El diagnóstico final debe sentirse **coherente con sus propias respuestas**, no genérico — esto es un requisito de producto, no solo de copy.

### 1.4 Objetivo de negocio
- Captar mínimo 50 leads calificados por mes en fase inicial
- Lograr una tasa de conversión lead → llamada del 15–25%
- Reducir el tiempo de cierre al llegar con el prospecto pre-calificado y pre-calentado
- La gran mayoría de usuarios completará la auditoría; solo un porcentaje reducido hará clic en el CTA de agendar/WhatsApp. **Toda persona que complete el test debe quedar capturada en base de datos**, haga clic en el CTA o no — el valor del lead no depende de esa acción final.

---

## 2. USUARIOS OBJETIVO

### 2.1 Perfil primario
**Emprendedores y dueños de negocio** con presencia en Instagram que sienten que su perfil no les genera clientes. Tienen entre 500 y 20.000 seguidores. Invierten tiempo en contenido pero no ven resultados en ventas. Concentrados en Colombia, pero con alcance potencial a cualquier país hispanohablante de Latinoamérica.

### 2.2 Perfil secundario
**Freelancers y marcas personales** — coaches, consultores, profesionales de la salud, la belleza o la moda — que usan Instagram como canal principal de adquisición pero no tienen estrategia de contenido ni embudo de ventas.

### 2.3 Nivel de conciencia del usuario al entrar
La mayoría llega sin saber exactamente qué le falta. Sabe que algo no funciona. El trabajo de la plataforma es hacer que entienda **qué le falta y por qué Ricardo es quien puede dárselo**.

---

## 3. FLUJO COMPLETO DE LA PLATAFORMA

### PANTALLA 1 — Landing / Entrada
**Objetivo:** Captar atención, generar confianza inicial, motivar el inicio del test.

**Elementos:**
- Headline principal: pregunta directa que confronta al usuario con su resultado real (técnica PNL — el cerebro no puede no responder una pregunta)
- Subtítulo: promesa específica del diagnóstico + énfasis explícito en gratuidad
- Prueba social: 3 testimonios cortos con foto, nombre y resultado obtenido
- Indicadores de autoridad: número de auditorías realizadas, años de experiencia, resultados de clientes
- Botón CTA principal: "Audita tu Instagram gratis →"
- **Foto real de Ricardo en el Hero**, con texto superpuesto (ver sección 8.5 — Especificación de Hero)
- Indicador de tiempo: "Te toma menos de 3 minutos" *(ajustado de 4 a 3 — el test bajó a 11 preguntas cortas con opción múltiple, más rápido que el estimado original)*

**Copy del headline (ACTUALIZADO v2.0):**
> "¿Cuántos clientes te ha dado tu Instagram este mes? Si la respuesta te incomoda, esta auditoría es para ti."

**Subtítulo (con énfasis en gratuidad):**
> "Auditoría 100% gratuita. Sin tarjeta, sin letra pequeña. Descubre en 3 minutos exactamente qué le falta a tu perfil para convertir seguidores en clientes."

---

### PANTALLA 2 — Captura de datos (Gate)
**Objetivo:** Recolectar datos antes de dar el diagnóstico. El usuario debe dejar sus datos para acceder al resultado.

**Campos requeridos:**
- Nombre completo
- Correo electrónico (campo principal para base de datos)
- ~~Número de WhatsApp~~ **[ELIMINADO v2.0]** — se sentía invasivo y reducía la tasa de completación del formulario. El contacto posterior se resuelve igual vía el CTA de WhatsApp con mensaje prellenado al final del reporte (el usuario inicia el contacto, no al revés).
- Usuario de Instagram (@username)
- **País** **[NUEVO v2.0]** — select con países de Latinoamérica + España + "Otro". Necesario para: zona horaria de contacto, personalización de moneda/referencias en la llamada de ventas, y segmentación geográfica en el panel admin.
- Nicho o industria (select)

**Microcopy de confianza bajo el formulario:**
> "Tu información es privada. No hacemos spam. Solo te contactamos si tu perfil tiene potencial real."

**Lógica:** Sin correo no se accede al test. Este es el primer filtro.

---

### PANTALLA 3 — Test de Auditoría (11 preguntas estratégicas)
**Objetivo:** Diagnosticar el perfil Y pre-calificar al prospecto como lead. Cada pregunta tiene doble función: recolectar información real del perfil + medir nivel de consciencia, urgencia y capacidad de inversión. Las preguntas están redactadas con principios de PNL (preguntas que asumen el problema, reformulación que genera autoconciencia, lenguaje persuasivo y sugestivo) y organizadas en los 3 pilares del Método 3A + un bloque de calificación de cierre.

**Diseño UX:**
- Una pregunta por pantalla
- Badge visible del pilar al que pertenece cada pregunta (ej. "Atracción · Visibilidad") — refuerza que el diagnóstico tiene estructura metodológica, no es aleatorio
- Hint contextual debajo de cada pregunta, explicando por qué importa
- Barra de progreso visible
- Transiciones suaves entre preguntas
- Opción de retroceder
- Estimación de tiempo: ~3 minutos para 11 preguntas

---

#### PREGUNTAS DEL TEST (con lógica de scoring)

> **Nota de scoring:** en este sistema, **puntos altos = peor diagnóstico** (mayor vacío/problema detectado), no al revés. Esto es intencional: a mayor puntaje, mayor temperatura de lead (más consciente de su problema = más urgencia de compra). Para mostrar el "% de salud" de cada pilar en el reporte visual, el cálculo se invierte (`100 - % de puntos obtenidos`) — ver sección 4.3.

---

##### BLOQUE 1 — ATRACCIÓN

**Q1 — Visibilidad / Bio**
> "Llevas tiempo publicando. Pero si alguien llega hoy a tu perfil por primera vez, ¿qué tan claro queda en menos de 3 segundos a quién le hablas y qué problema le resuelves?"

*Hint: Tu bio es tu primer filtro. Si no convierte, el resto del contenido trabaja en vano.*

| Opción | Puntos |
|---|---|
| Muy claro — mi bio está optimizada para atraer a mi cliente ideal | 5 |
| Más o menos — tengo bio pero no estoy seguro de que convierta | 20 |
| No tan claro — describí lo que hago, pero no sé si atrae o espanta | 30 |
| No lo había pensado así — mi bio es solo una descripción genérica | 40 |

---

**Q2 — Destacados / Highlights [NUEVA v2.0]**
> "Cuando alguien entra a tu perfil, ¿tus historias destacadas (highlights) le muestran claramente quién eres, qué resultados generas y por qué confiar en ti — o son solo fotos sueltas sin estructura?"

*Hint: Los highlights son tu segunda vitrina. Las cuentas que convierten los usan para mostrar identidad, prueba social, resultados y estilo de vida — no solo momentos random.*

| Opción | Puntos |
|---|---|
| Sí — tengo highlights estructurados (quién soy, qué hago, testimonios, resultados) | 5 |
| Tengo algunos highlights pero no cubren todo eso | 20 |
| Tengo highlights pero son solo fotos sin ningún orden ni propósito | 35 |
| No tengo historias destacadas en mi perfil | 40 |

---

**Q3 — Contenido / Hook**
> "Cuando publicas un reel o carrusel, ¿qué pasa en los primeros 3 segundos? ¿Cuál describe mejor cómo arrancas tu contenido?"

*Hint: El 80% del resultado de un video depende de los primeros 3 segundos. El hook lo es todo.*

| Opción | Puntos |
|---|---|
| Empiezo con una frase de impacto o dato que detiene el scroll | 5 |
| A veces engancho, a veces no — no tengo una fórmula clara | 20 |
| Generalmente me presento o explico de qué va el video antes de entrar | 35 |
| No pienso en eso — subo el contenido y espero que funcione | 40 |

---

##### BLOQUE 2 — AUTORIDAD

**Q4 — Posicionamiento**
> "Si alguien de tu nicho ve tu perfil y el de tu competencia al mismo tiempo, ¿por qué elegiría seguirte a ti?"

*Hint: La autoridad no se construye con más contenido. Se construye con posicionamiento específico.*

| Opción | Puntos |
|---|---|
| Tengo un diferenciador claro y lo comunico en mi contenido | 5 |
| Soy diferente, pero no sé cómo comunicarlo bien | 25 |
| Publico contenido similar al de mi nicho — no tengo un ángulo propio | 35 |
| Nunca lo había pensado así — puede que no me diferencie de nadie | 40 |

---

**Q5 — Estrategia de contenido (TOFU-MOFU-BOFU)**
> "¿Conoces y aplicas la estructura TOFU–MOFU–BOFU? Es decir, ¿tienes contenido diferente para atraer desconocidos, nutrir interesados y convertir prospectos listos para comprar?"

*Hint: Sin esta estructura, tu contenido trabaja para todos y no convierte a nadie.*

| Opción | Puntos |
|---|---|
| Sí, la aplico — tengo contenido para cada etapa del embudo | 5 |
| La conozco pero no la aplico con consistencia | 20 |
| Escuché el término pero no sé cómo aplicarlo a Instagram | 35 |
| No la conozco — publico lo que se me ocurre o lo que veo en otros | 40 |

---

##### BLOQUE 3 — AUDIENCIA

**Q6 — Embudo de ventas**
> "Cuando alguien te escribe interesado en lo que haces, ¿tienes un proceso claro y repetible para llevarlo desde ese primer mensaje hasta la venta?"

*Hint: Sin proceso, dependes de la suerte del DM. El Método 3A reemplaza esa improvisación con un sistema.*

| Opción | Puntos |
|---|---|
| Sí, tengo un proceso definido con pasos claros | 0 |
| Más o menos — improviso según la persona pero generalmente cierro | 15 |
| Respondo el DM y a veces vendo, a veces no — no hay sistema | 30 |
| No tengo proceso — no sé cómo manejar esas conversaciones para cerrar | 40 |

---

**Q7 — Destino de conversión / Landing [NUEVA v2.0]**
> "¿Tu perfil tiene algún link que lleve a algo más — una página de aterrizaje, un agendamiento automático, un catálogo o un embudo de ventas? ¿O todo el tráfico que generas se queda atrapado dentro de Instagram sin ningún destino claro?"

*Hint: Sin un destino de conversión fuera del perfil, cada visita es una oportunidad que se diluye en el scroll. El link en bio es el puente entre "me sigue" y "me compra".*

| Opción | Puntos |
|---|---|
| Sí — tengo landing/agendamiento/embudo conectado y funcionando | 5 |
| Tengo un link pero no está optimizado o no convierte | 20 |
| Solo tengo mi WhatsApp o redes — no hay ningún embudo real | 35 |
| No tengo ningún link de conversión en mi perfil | 40 |

---

**Q8 — Tráfico pago (Meta Ads)**
> "¿Actualmente inviertes en Meta Ads para llevar personas a tu perfil o a una oferta específica?"

*Hint: El contenido orgánico construye. La pauta acelera. Las cuentas que escalan usan los dos.*

| Opción | Puntos |
|---|---|
| Sí, tengo campañas activas con estrategia definida | 5 |
| He intentado pautar pero no he visto resultados reales | 25 |
| No he pautado — solo confío en el contenido orgánico | 35 |
| No sé cómo funciona Meta Ads ni cómo empezar | 40 |

---

##### BLOQUE 4 — CIERRE / CALIFICACIÓN

**Q9 — Historial de inversión**
> "Siendo completamente honesto: ¿cuánto has invertido en los últimos 12 meses en formarte o mejorar tu estrategia digital?"

*Hint: Quien ya invirtió antes tiene menor fricción para volver a hacerlo.*

| Opción | Puntos |
|---|---|
| Más de $500 USD — invierto regularmente en mi crecimiento | 30 |
| Entre $100 y $500 USD — tomé algún curso o programa | 25 |
| Menos de $100 — recursos gratuitos y YouTube principalmente | 15 |
| Nada — no he invertido dinero real en esto | 10 |

---

**Q10 — Urgencia real**
> "Si en 90 días tu Instagram sigue exactamente igual — mismos seguidores, mismas ventas, mismo esfuerzo sin resultados — ¿qué impacto tendría eso en tu negocio?"

*Hint: Tu respuesta determina si estás listo para cambiar ahora o después.*

| Opción | Puntos |
|---|---|
| Sería crítico — necesito resultados antes de eso | 40 |
| Sería frustrante — ya llevo mucho tiempo así y necesito un cambio | 30 |
| Podría manejarlo — tengo otras fuentes de ingresos | 10 |
| No me afectaría — Instagram no es mi canal principal | 0 |

---

**Q11 — Disposición de inversión**
> "Si hoy existiera un sistema probado — paso a paso — para convertir tu Instagram en un canal predecible de clientes, ¿qué harías?"

*Hint: Esta respuesta define si tienes el perfil para implementar el Método 3A.*

| Opción | Puntos |
|---|---|
| Lo implementaría de inmediato — estoy listo para invertir en resultados | 40 |
| Lo evaluaría con seriedad si veo prueba de que funciona | 25 |
| Me interesa pero primero necesito tiempo para pensarlo | 15 |
| Prefiero seguir aprendiendo solo por ahora | 0 |

---

### PANTALLA 4 — Procesando resultado
**Objetivo:** Generar anticipación y percepción de valor del análisis.

**Elementos:**
- Animación de análisis (spinner + lista de pasos cargando secuencialmente)
- Mensajes dinámicos mientras "procesa":
  - "Analizando tu estrategia de contenido..."
  - "Comparando con cuentas exitosas de tu nicho..."
  - "Identificando tus mayores oportunidades..."
  - "Calculando tu potencial de crecimiento..."
- Duración: 3–4 segundos reales (no más)

---

### PANTALLA 5 — Reporte de Resultados
**Objetivo:** Entregar valor real, generar dolor específico, y llevar al usuario al CTA de conversión. **El diagnóstico debe construirse dinámicamente a partir de las respuestas reales del usuario — nunca debe sentirse genérico o desconectado de lo que respondió.**

**Estructura del reporte:**

**5.1 Score general**
- Número visual prominente en círculo de color (ej. "68%")
- Clasificación textual: Perfil Dormido / Perfil en Desarrollo / Perfil con Potencial / Perfil Optimizado
- Badge de temperatura del lead (Frío / Tibio / Caliente / Urgente) — visible al usuario solo como etiqueta de su "nivel de avance", nunca explicado como "qué tan buen lead eres para Ricardo" (ver 4.4 — separación de scoring interno vs. visible)

**5.2 Diagnóstico por los 3 pilares del Método 3A**
Reemplaza las "4 dimensiones genéricas" del PRD v1.0. Ahora son exactamente los 3 pilares de la metodología, con score calculado en tiempo real a partir de las respuestas:

- **Atracción** (basado en Q1, Q2, Q3 — bio, highlights, hook)
- **Autoridad** (basado en Q4, Q5 — posicionamiento, TOFU-MOFU-BOFU)
- **Audiencia** (basado en Q6, Q7, Q8 — embudo, landing, tráfico pago)

Cada barra muestra el % de salud del pilar + un insight de texto generado dinámicamente según la opción exacta que el usuario eligió en cada pregunta de ese pilar (no un texto fijo).

**5.3 Lo que están haciendo las cuentas top de tu nicho**
Tabla comparativa dinámica: "Tu perfil ahora" (columna que refleja literalmente la opción que el usuario eligió) vs. "Cuentas top" (el estándar del Método 3A). Esto es lo que hace que el reporte se sienta personalizado y no una plantilla genérica.

**5.4 Tus oportunidades principales**
Generadas dinámicamente: se identifica el pilar más débil del usuario (el de menor % de salud) y se redacta la oportunidad #1 específicamente sobre ese pilar, citando el insight de sus respuestas reales. Las oportunidades 2 y 3 cubren los huecos detectados en TOFU-MOFU-BOFU y en el proceso de cierre, también condicionadas a sus respuestas.

**5.5 Bloque de prueba social contextual**
Testimonio de alguien con perfil similar al del usuario (mismo nicho o mismo problema declarado).

**5.6 CTA Principal**
Según la temperatura del lead:
- Urgente / Caliente: "Agenda tu sesión estratégica con Ricardo →" + botón de WhatsApp directo con mensaje prellenado (incluye @usuario y % del score)
- Tibio: "Habla con Ricardo por WhatsApp →"
- Frío: "Accede al recurso gratuito del Método 3A →" *(ver Sección 11 — Lead Magnet recomendado)*

---

## 4. SISTEMA DE CALIFICACIÓN DE LEADS

> **⚠️ USO EXCLUSIVAMENTE INTERNO.** Todo lo descrito en esta sección 4 — puntajes crudos, pesos, flags especiales, y la lógica exacta de clasificación — es para el panel de administración de Ricardo. **El usuario final nunca ve estos números ni esta terminología.** Lo único que el usuario ve en su reporte es: el % visual, la clasificación textual del perfil ("Perfil con Potencial", etc.), y las barras de los 3 pilares. Esto ya está resuelto correctamente en la implementación actual y debe mantenerse así en el rediseño con Claude Design.

### 4.1 Escala de puntuación
**Puntuación máxima posible:** 380 puntos *(ajustado de 300 a 380 por la incorporación de Q2 y Q7 — recalcular umbrales proporcionalmente, ver tabla)*

| Rango | Clasificación | Temperatura | Acción automática |
|-------|--------------|-------------|-------------------|
| 0 – 95 pts | No calificado | ❄️ Frío | Secuencia email nurturing + lead magnet |
| 96 – 190 pts | En exploración | 🌤 Tibio | Email + recurso gratuito |
| 191 – 285 pts | Interesado | 🔥 Caliente | WhatsApp directo |
| 286 – 380 pts | Listo para comprar | ⚡ Urgente | Agendar llamada inmediata |

### 4.2 Factores de peso adicional (flags internos)
Además del puntaje base, el sistema registra y pondera, **solo visible en el panel admin**:
- Respondió Q6 "No tengo proceso, no sé cómo cerrar" → flag: `alta_probabilidad_cierre`
- Respondió Q10 "Sería crítico" → flag: `contacto_prioritario`
- Respondió Q11 "Lo implementaría de inmediato" → flag: `calificado_financieramente`

*(Nota: con la eliminación del campo WhatsApp del formulario de captura, se elimina también el bonus de +15/+20 pts por dejar el número, ya que ese dato ya no se solicita por adelantado.)*

### 4.3 Cálculo del % de salud por pilar (visible al usuario)
Fórmula corregida (v2.0 — bug de v1.0 ya identificado y resuelto en código):

```
% problema del pilar = (puntos obtenidos / puntos máximos posibles del pilar) × 100
% salud del pilar (lo que se muestra) = 100 − % problema del pilar
```

Esto es necesario porque en el sistema de puntuación, puntos altos = peor diagnóstico. Sin esta inversión, el reporte muestra barras verdes con porcentajes altos para usuarios que respondieron mal — error que ya fue detectado y corregido en la versión actual del código y debe preservarse en la migración a Claude Design.

### 4.4 Separación scoring interno vs. reporte visible
| Dato | ¿Visible para el usuario? |
|---|---|
| Puntaje crudo (ej. 247/380) | No |
| Temperatura textual interna (Frío/Tibio/Caliente/Urgente) como tal | No — el usuario ve solo su % y clasificación de perfil |
| Flags especiales (`alta_probabilidad_cierre`, etc.) | No |
| % de salud por pilar (Atracción/Autoridad/Audiencia) | Sí |
| Clasificación textual del perfil ("Perfil Dormido", etc.) | Sí |

---

## 5. BASE DE DATOS Y PANEL DE ADMINISTRACIÓN

### 5.1 Datos almacenados por lead
- Nombre completo
- Correo electrónico
- **País** *(nuevo campo v2.0)*
- @Username de Instagram
- Nicho
- Fecha y hora del test
- Score total (crudo, interno)
- Clasificación de temperatura (interna)
- Respuestas individuales por pregunta — las 11 (para personalizar el contacto y revisar el diagnóstico exacto que vio el usuario)
- Flags especiales activados
- Estado del lead: Nuevo / Contactado / En proceso / Cerrado / Descartado
- Notas manuales de Ricardo

> Nota: como ya no se captura WhatsApp en el formulario, el contacto se inicia siempre desde el lado del usuario (clic en el botón de WhatsApp del reporte) o desde el panel admin usando el @Instagram o el correo para buscarlo manualmente. Si en el futuro se requiere contacto proactivo masivo, evaluar agregar un campo opcional de WhatsApp en una fase posterior, pero no en este MVP.

### 5.2 Panel de administración (solo Ricardo)
Vista de tabla con todos los leads ordenados por:
- Temperatura (más calientes primero por defecto)
- Fecha
- País
- Nicho
- Score

Funciones del panel:
- Filtros por temperatura, nicho, país, fecha
- Vista de detalle por lead (ver todas sus 11 respuestas, su score por pilar, y sus flags)
- Cambiar estado del lead manualmente
- Exportar a CSV
- Contador de leads por período (hoy / semana / mes)
- Indicador de tasa de conversión (leads totales → CTA clicked)

### 5.3 Stack técnico (ACTUALIZADO v2.0)

> Ricardo cuenta con acceso a Vercel, Supabase, Firebase y GitHub. Recomendación de consultoría:

- **Hosting / Frontend:** Vercel — despliegue directo desde el repo de GitHub, soporta el output de Claude Design sin fricción.
- **Base de datos + Auth:** Supabase — PostgreSQL gestionado + autenticación nativa para el panel admin. **No se recomienda usar Firebase en paralelo** — Supabase ya cubre base de datos y autenticación, y duplicar con Firebase solo añade complejidad de sincronización sin beneficio real en este MVP. Firebase queda como opción futura solo si se necesita algo que Supabase no cubre (ej. push notifications nativas a una app móvil, que no aplica a este producto).
- **Versionamiento:** GitHub — repo conectado a Vercel para CI/CD automático en cada push.
- **Emails automáticos (fase 2):** Resend o Supabase Edge Functions.

### 5.4 Esquema de tabla Supabase (ACTUALIZADO v2.0)

**Tabla: `leads`**
```
id                  uuid (PK)
created_at          timestamp
nombre              text
email               text
pais                text                 -- NUEVO v2.0
instagram_username  text
nicho               text
score_total         integer              -- interno, no visible al usuario
temperatura         text                 -- frio/tibio/caliente/urgente, interno
pilar_atraccion_pct integer              -- visible al usuario en su reporte
pilar_autoridad_pct integer              -- visible al usuario en su reporte
pilar_audiencia_pct integer              -- visible al usuario en su reporte
respuestas          jsonb                -- objeto con las 11 respuestas
flags               jsonb                -- flags especiales, interno
estado              text                 -- nuevo/contactado/en_proceso/cerrado/descartado
notas               text, nullable       -- notas manuales de Ricardo
cta_clicked         boolean, default false  -- si hizo clic en WhatsApp/agendar
```

> Campo `whatsapp` **eliminado** del esquema respecto a v1.0.

### 5.5 Variables de entorno necesarias
```
SUPABASE_URL
SUPABASE_ANON_KEY
ADMIN_EMAIL (email de Ricardo para acceso al panel)
```

---

## 6. PRUEBA SOCIAL Y CREDIBILIDAD

### 6.1 Elementos de confianza en landing
- **Foto profesional real de Ricardo en el Hero** (ver sección 8.5)
- Contador dinámico: "X perfiles auditados" (inicia en número real)
- 3 testimonios con: foto, nombre completo, nicho, resultado específico
- Logos o menciones de medios si aplica

### 6.2 Testimonio contextual en reporte
Después del diagnóstico, mostrar un testimonio de alguien con perfil similar al del usuario:
> *"Yo también tenía X seguidores y no convertía. Después del Método 3A..."*

Mapear testimonios por nicho para que sean relevantes al usuario.

### 6.3 Elementos de autoridad
- Años de experiencia en marketing digital
- Número de clientes trabajados
- Resultados específicos (no genéricos): "Ayudé a [Nombre] a pasar de 0 a 3 clientes por semana en Instagram"

---

## 7. CTAs Y CANALES DE CONVERSIÓN

### 7.1 CTA principal — Agendar llamada
Botón que abre Calendly o sistema de agendamiento directamente.
Texto: "Agenda tu sesión estratégica gratuita de 30 min →"
Visible para leads calientes y urgentes.

### 7.2 CTA secundario — WhatsApp Business
Botón flotante presente en toda la plataforma.
Número: +57 312 692 6558
Mensaje prellenado, generado dinámicamente con @username y % de score real del usuario:
> "Hola Ricardo, acabo de auditar mi Instagram (@[username]) y quedé en [score]%. Quiero saber cómo implementar el Método 3A."

> Como ya no se captura el WhatsApp del usuario por adelantado, **este es ahora el único canal de contacto directo** — y depende de que el usuario dé el primer paso. Esto refuerza la importancia de que el reporte (Pantalla 5) sea lo suficientemente persuasivo como para motivar ese clic.

### 7.3 CTA terciario — Recurso gratuito (Lead Magnet)
Para leads fríos: ofrecer la **plantilla de Bio + Calendario de contenido TOFU-MOFU-BOFU de 7 días** (ver Sección 11) a cambio de confirmar el correo. Mantiene el lead en el ecosistema y es la continuación lógica del diagnóstico que ya recibió, en vez de un recurso genérico desconectado.

---

## 8. DISEÑO Y EXPERIENCIA DE USUARIO

### 8.1 Principios de diseño
- Mobile-first (la mayoría de usuarios llegan desde Instagram móvil)
- Una sola acción por pantalla — nunca abrumar
- Progreso siempre visible — el usuario sabe exactamente dónde está
- Velocidad — carga en menos de 2 segundos
- Sin fricciones — máximo 2 campos de texto libre (el resto son selects)

### 8.2 Paleta y estética
- Estética editorial oscura — diferente al SaaS genérico
- Color primario: Ámbar quemado (#C8811A)
- Color de acento: Coral (#B84A2E)
- Fondo: Negro tinta (#0E0D0B)
- Tipografía display: Playfair Display (autoridad, confianza)
- Tipografía cuerpo: DM Sans (legibilidad, modernidad)

### 8.3 Micro-interacciones clave
- Selección de opción: feedback visual inmediato (borde ámbar + fondo sutil)
- Avance entre preguntas: transición slide suave
- Pantalla de procesamiento: animación que comunica análisis real
- Reporte: barras de progreso animadas al cargar, coherentes con las respuestas reales
- Botón WhatsApp: flotante, siempre visible, pulso suave de atención

### 8.4 Estados de error
- Campo vacío: mensaje claro y no agresivo
- Sin correo válido: validación en tiempo real
- Error de conexión: mensaje con opción de reintentar

### 8.5 Especificación de Hero con foto real [NUEVO v2.0]
- Imagen de Ricardo (foto real, no placeholder/avatar) como fondo o elemento principal del Hero de la Landing.
- Texto del headline y subtítulo **superpuesto sobre la foto**, no al lado — usar overlay oscuro semitransparente (gradiente negro de abajo hacia arriba, o scrim completo al 40-50% de opacidad) para garantizar legibilidad del texto sobre cualquier fondo de la foto.
- Tipografía del headline en Playfair Display, color claro (#F2EFE8) o ámbar (#C8811A) para el énfasis, con suficiente contraste sobre el overlay.
- La foto debe sentirse "dinámica" — evitar pose corporativa estática; preferir foto con energía, mirada directa a cámara, gesto natural que refuerce el tono confrontacional/directo de la marca personal de Ricardo.
- Responsive: en mobile, la foto puede recortarse a un encuadre más vertical/centrado en el rostro sin perder el overlay de texto.

---

## 9. FLUJO TÉCNICO PARA CLAUDE DESIGN

### 9.1 Prompt base para Claude Design
El PRD completo sirve como contexto. El prompt de construcción debe especificar:

```
Stack: React + Tailwind + Supabase
Páginas: Landing → Captura de datos → Test (11 steps) → Loading → Reporte → Admin panel
Auth: Solo para panel admin (Ricardo), vía Supabase Auth
DB: Tabla leads con todos los campos especificados en sección 5.4 (sin campo whatsapp)
Scoring: Lógica JS en el frontend según fórmula de sección 4.3 (con inversión de %),
         resultado guardado en Supabase
CTA WhatsApp: +573126926558 con mensaje dinámico por @username y score
Diseño: Dark editorial, fuente Playfair Display + DM Sans, color ámbar #C8811A,
        Hero con foto real de Ricardo + overlay de texto (ver sección 8.5)
Captura: Sin campo de WhatsApp. Incluye campo de País (select).
```

### 9.2 Variables de entorno necesarias
```
SUPABASE_URL
SUPABASE_ANON_KEY
ADMIN_EMAIL
```

---

## 10. MÉTRICAS DE ÉXITO

| Métrica | Objetivo mes 1 | Objetivo mes 3 |
|---------|---------------|----------------|
| Leads totales capturados | 50 | 200 |
| Tasa de completación del test | >70% | >75% |
| Leads calientes (191+ pts) | 30% del total | 40% del total |
| Tasa lead → clic en CTA (WhatsApp/agendar) | 15% | 25% |
| Tasa CTA → venta | 30% | 40% |
| Costo por lead calificado | <$5 USD | <$3 USD |

---

## 11. LEAD MAGNET RECOMENDADO (CTA terciario)

### "Plantilla de Bio + Calendario TOFU-MOFU-BOFU — Método 3A"

Recomendación estratégica para el recurso gratuito ofrecido a leads fríos — debe ser la continuación lógica del diagnóstico, no un regalo genérico desconectado.

**Parte 1 — Constructor de Bio que Convierte**
Fórmula rellenable: [A quién ayudo] + [Qué resultado específico logro] + [Cómo lo hago diferente] + [CTA]. Con 3 ejemplos reales por nicho (belleza, coaching, consultoría).

**Parte 2 — Calendario de contenido de 7 días con estructura TOFU-MOFU-BOFU**
Tabla de 7 días donde cada día especifica qué tipo de contenido publicar (atracción, autoridad o conversión) y por qué, con 1 ejemplo de hook ya escrito por día.

**Por qué funciona como lead magnet:**
1. Es la continuación directa de la auditoría — ataca exactamente el pilar que salió más débil en el diagnóstico del usuario.
2. Genera una victoria rápida (pueden aplicar la bio hoy mismo).
3. Es prueba de la metodología de Ricardo, no solo generosidad.
4. Deja deliberadamente sin resolver el "cómo convertir" y "cómo escalar con pauta" — esas brechas siguen abiertas para la llamada de ventas.

---

## 12. FASES DE LANZAMIENTO

### Fase 1 — MVP (Claude Design)
- Landing con Hero de foto real + captura de datos (sin WhatsApp, con País)
- Test de 11 preguntas funcional, con badges de pilar y hints
- Reporte con diagnóstico por pilar coherente con respuestas reales
- Base de datos operativa en Supabase
- Panel de admin básico (tabla de leads, filtros, exportar CSV)
- Botón WhatsApp activo con mensaje dinámico

### Fase 2 — Optimización
- Lead magnet (Plantilla Bio + Calendario TOFU-MOFU-BOFU) conectado al CTA de leads fríos
- Benchmark por nicho dinámico más granular
- Testimonios con foto real
- Sistema de agendamiento (Calendly embed)
- Emails automáticos por temperatura de lead

### Fase 3 — Escala
- A/B testing de preguntas y CTAs
- Segmentación automática por nicho y país
- Dashboard de métricas para Ricardo
- Integración con herramienta de email marketing
- Versión en inglés para expansión de mercado

---

## CHANGELOG v1.0 → v2.0

| Cambio | Detalle |
|---|---|
| ❌ Campo WhatsApp eliminado del formulario de captura | Se sentía invasivo, reducía tasa de completación. Contacto ahora se inicia desde el botón de WhatsApp del reporte. |
| ✅ Campo País agregado | Nuevo campo en captura de datos y en esquema de Supabase. |
| ✏️ Headline del Hero actualizado | De genérico a pregunta confrontacional con énfasis en gratuidad. |
| ✅ 2 preguntas nuevas en el test | Q2 (Highlights/Destacados) y Q7 (Destino de conversión/Landing). Test pasa de 9 a 11 preguntas. |
| 🔢 Escala de puntuación recalculada | De máx. 300 a máx. 380 pts por las 2 preguntas nuevas. Umbrales de temperatura ajustados proporcionalmente. |
| 🔧 Bug de inversión de % corregido y documentado | Sección 4.3 deja explícita la fórmula correcta (100 − % problema) para que no se repita en la migración. |
| 📋 Separación scoring interno vs. visible documentada explícitamente | Sección 4.4 — para evitar ambigüedad de cara a Claude Design. |
| 🖼️ Especificación de Hero con foto real | Sección 8.5 — overlay de texto sobre foto de Ricardo, dinámico y responsive. |
| 🛠️ Stack técnico actualizado | Vercel + Supabase + GitHub confirmados; Firebase descartado para este MVP por redundancia con Supabase. |
| 🎁 Lead magnet especificado | Sección 11 — Plantilla Bio + Calendario TOFU-MOFU-BOFU como CTA terciario para leads fríos. |
| 🗑️ Bonus de puntos por WhatsApp eliminado | Ya no aplica al no capturarse el dato por adelantado. |

---

*Documento preparado por Claude para Ricardo Rodríguez — Método 3A*
*Versión 2.0 · Junio 2026*
