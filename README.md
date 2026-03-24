# bc-courses-extension

Extensión AL para Microsoft Dynamics 365 Business Central que implementa un módulo completo de gestión de cursos de formación.

Desarrollada como proyecto de fin de ciclo DAM y portfolio para certificación MB-820.

---

## Arquitectura

### Tablas maestras
| Tabla | ID | Descripción |
|-------|----|-------------|
| `SANBA Course` | 50100 | Tabla maestra de cursos |
| `SANBA Courses Setup` | 50101 | Configuración del módulo (Singleton) |
| `SANBA Course Edition` | 50102 | Ediciones de cada curso (subsidiaria) |

### Tablas de posting
| Tabla | ID | Descripción |
|-------|----|-------------|
| `SANBA Course Journal Line` | 50104 | Líneas de diario (temporales) |
| `SANBA Course Ledger Entry` | 50103 | Movimientos contabilizados (permanentes) |

### Páginas
| Página | ID | Tipo | Descripción |
|--------|----|------|-------------|
| `SANBA Course List` | 50100 | List | Lista de cursos |
| `SANBA Course Card` | 50101 | Card | Ficha de curso |
| `SANBA Courses Setup` | 50102 | Card | Configuración del módulo |
| `SANBA Course Edition List` | 50103 | List | Lista de ediciones |
| `SANBA Course Edition Card` | 50104 | Card | Ficha de edición |
| `SANBA Course Edition Subpage` | 50105 | ListPart | Subpágina embebida en Course Card |
| `SANBA Course Journal Lines` | 50107 | Worksheet | Diario de cursos |
| `SANBA Course Ledger Entries` | 50106 | List | Movimientos contabilizados |

### Codeunits
| Codeunit | ID | Descripción |
|----------|----|-------------|
| `SANBA Courses Setup Mgt.` | 50100 | Gestión de configuración con patrón GetRecordOnce |
| `SANBA Course Journal Post Line` | 50101 | Posting — transforma líneas de diario en movimientos |

### Enums
| Enum | ID | Valores |
|------|----|---------|
| `SANBA Course Type` | 50100 | Classroom, Online, Hybrid |
| `SANBA Course Blocked` | 50101 | All |

---

## Patrones implementados

### Setup + No. Series + GetRecordOnce
La tabla `SANBA Courses Setup` sigue el patrón Singleton — una sola fila con PK vacía. La codeunit `SANBA Courses Setup Mgt.` centraliza el acceso con caché mediante `GetRecordOnce()` para evitar lecturas SQL repetidas.

La numeración automática de cursos usa la API moderna de No. Series (BC24+) con `AreRelated` y `GetNextNo`.

### Tabla maestra → Subsidiaria
`SANBA Course Edition` es subsidiaria de `SANBA Course`. Su PK compuesta `(Course No., No.)` garantiza unicidad relativa al curso padre. El campo `No.` se autoincrementa por curso mediante `OnInsert`.

### Posting flow
```
CourseJournalLine → PostAll() → Run() → CourseLedgerEntry
   (borrador)         (bucle)   (por línea)   (permanente)
```

1. El usuario introduce líneas en el diario (`Worksheet`)
2. Pulsa **Contabilizar**
3. `PostAll()` itera por todas las líneas del lote
4. `Run()` valida, crea el `LedgerEntry` y borra la línea
5. Los movimientos quedan permanentes e inmutables en `CourseLedgerEntry`

---

## Configuración inicial

1. Abre **SANBA Courses Setup** en BC
2. En **Course Nos.** selecciona o crea una No. Series (ej. `COURSE`)
3. Configura las líneas de la serie: Starting No. = `COURSE-0001`

---

## Entorno de desarrollo

- BC 27.5
- VS Code + AL Language Extension
- Publisher: `JCSB247`
- ID Range: `50100-50139`
- Prefijo: `SANBA`

---

## Roadmap

- [ ] Integración con módulo de ventas
- [ ] Install Codeunit + OnCompanyInitialize
- [ ] Testing automatizado
- [ ] API page para CourseLedgerEntry
- [ ] DevOps — CI/CD con Azure DevOps