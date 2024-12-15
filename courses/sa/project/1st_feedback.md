# First Feedback Helpper <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Quality Attributes](#quality-attributes)
  - [Performance](#performance)
  - [Integrability](#integrability)
  - [Modifiability](#modifiability)
  - [Availability](#availability)
  - [Security](#security)

</details>

<br>

## Quality Attributes

- [x] Politeness
  - [x] O programa procura o ficheiro robots.txt de um site que não o definiu. Recebe um ficheiro HTML em vez de um txt e explora o site inteiro assumindo que todas as páginas encontradas são permitidas.
  - [x] O programa extrai diversas URLs com o mesmo domínio de um único URL. Ao tentar fazer estes pedidos a um mesmo domínio, deve esperar um pouco antes de fazer dois pedidos seguidos.
- [x] Scalability
- [x] Consistency
- [ ] Availability
  - [ ] Cenário de availability para URL Frontier
  - [ ] Cenário de availability para HTML Downloader
  - [ ] Cenário de availability para Content Parser
  - [ ] Cenário de availability para Comparador de Conteúdo
  - [ ] Cenário de availability para Link Extractor
  - [ ] Cenário de availability para URL Filter
  - [ ] Cenário de availability para URL Comparator
- [x] Security
  - [x] Cenário para uma spider trap
  - [x] Cenário para um link malicioso
- [ ] Extensibility
  - [x] Cenário para começar a recolher PDFs
  - [x] Cenário para começar a recolher Imagens
- [x] Reliability

### Performance

P1:
- Source: Page URL
- Stimulus: Process Page -> Periodic
- Artifact: Web Crawler
- Environment: Normal operation
- Response: Page is processed
- Response measure: 
  - Throughput: 1 billion pages per month = ~400 pages/s
  - Latency: 150ms on average

P2:
- Source: Page URL
- Stimulus: Process Page -> Stochastic
- Artifact: Web Crawler
- Environment: Peak load
- Response: Page is processed
- Response measure: 
  - Throughput: 500 millions pages per month = ~200 pages/s
  - Latency: 500ms on average

### Integrability

I1:
- Source: Website Vendor
- Stimulus: Add new website to web crawl
- Artifact: Web Crawler and Website Vendor
- Environment: Runtime
- Response: Web Crawler respects the new website's robots.txt
- Response measure: cost 0, some performance overhead

### Modifiability

M1: (Scalability)
- Source: Web Crawler Administrator
- Stimulus: Increase the number of URLs to process
- Artifact: Web Crawler Components
- Environment: Build time
- Response: Improve resource usage
- Response measure:
  - Elapsed time: at most 1 day
  - Money: new resources cost

M2: (Extensibility)
- Source: Web Crawler Administrator
- Stimulus: Save other types of content (e.g. images, PDFs)
- Artifact: Web Crawler Components
- Environment: Design Time
- Response: Start indexing other types of content
- Response Measure: 
  - Elapsed Time: 2 weeks
  - Money: developer salaries and new resources cost

M3: (Extensibility)
- Source: Web Crawler Administrator
- Stimulus: Add support for web archiving
- Artifact: Web Archiving Module
- Environment: Design time
- Response: Implement web archiving functionality
- Response measure:
  - Elapsed time: 3 months
  - Money: developer salaries and new resources cost

M4: (Extensibility)
- Source: Web Crawler Administrator
- Stimulus: Add support for web mining
- Artifact: Web Mining Module
- Environment: Design time
- Response: Implement web mining functionality
- Response measure:
  - Elapsed time: 5 months
  - Money: developer salaries and new resources cost

M5: (Extensibility)
- Source: Web Crawler Administrator
- Stimulus: Add support for web monitoring
- Artifact: Web Monitoring Module
- Environment: Design time
- Response: Implement web monitoring functionality
- Response measure:
  - Elapsed time: 1 months
  - Money: developer salaries and new resources cost

### Availability

A1:
- Source: Web Crawler System
- Stimulus: Crash
- Artifact: Web Crawler System
- Environment: Normal Operation
- Response: log the fault and keep providing service
- Response Measure: 99.99% availability

A2:
- Source: External Websites
- Stimulus: Omission
- Artifact: Web Crawler System
- Environment: Normal Operation
- Response: Retry once after a delay
- Response Measure: Minimal delay, 100% availability

A3:
- Source: External Websites
- Stimulus: Corrupted or invalid HTML
- Artifact: Web Crawler System
- Environment: Normal Operation
- Response: Ignore URL
- Response Measure: Minimal delay, 100% availability

A4:
- Source: External Websites
- Stimulus: Malformed Link
- Artifact: Web Crawler System
- Environment: Normal Operation
- Response: Ignore URL
- Response Measure: Minimal delay, 100% availability

### Security

S1:
- Source: External Websites
- Stimulus: Spider Trap
- Artifact: Web Crawler System
- Environment: Online and fully operational
- Response: Spider Trap is detected and avoided
- Response Measure: Detect with 100% accuracy after 50 URLs with similar pattern

S2:
- Source: External Websites
- Stimulus: Malicious URL
- Artifact: Web Crawler System
- Environment; Online and fully operational
- Response: Detect and avoid it
- Response Measure: Detect with 99.9% accuracy after consult blacklists