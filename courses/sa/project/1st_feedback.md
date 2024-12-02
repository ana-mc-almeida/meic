# First Feedback Helpper <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Quality Attributes](#quality-attributes)
  - [Politeness](#politeness)
  - [Scalability](#scalability)
  - [Consistency](#consistency)
  - [Availability](#availability)
  - [Security](#security)
  - [Extensibility](#extensibility)
  - [Reliability](#reliability)
- [Architectural Concerns](#architectural-concerns)
  - [**Architectural Concerns**](#architectural-concerns-1)
    - [**1. Scalability**](#1-scalability)
    - [**2. Performance and Efficiency**](#2-performance-and-efficiency)
    - [**3. Fault Tolerance**](#3-fault-tolerance)
    - [**4. Extensibility**](#4-extensibility)
    - [**5. Data Management**](#5-data-management)
    - [**6. Security**](#6-security)
    - [**7. Politeness and Compliance**](#7-politeness-and-compliance)
    - [**8. Consistency and Deduplication**](#8-consistency-and-deduplication)
    - [**9. Monitoring and Logging**](#9-monitoring-and-logging)
    - [**10. Ethical and Legal Compliance**](#10-ethical-and-legal-compliance)

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


### Politeness

- General Idea: the crawler respects the robots.txt file

Parts | Politeness Scenario
----- | --------------------
**Source of Stimulus** | Website robot.txt file
**Stimulus**| The crawler encounters a valid robots.txt file with rules
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Assumes the rules in the robots.txt file
**Response Measure**| No unintended access to the website

- Scenario: The crawler visits a website and searches for its robots.txt file. When the file is found and properly formatted, the crawler parses the rules defined within and follows these rules, avoiding restricted areas and pacing requests according to the specified delay.

---

- General Idea: the crawler finds an invalid robots.txt file

Parts | Politeness Scenario
----- | --------------------
**Source of Stimulus** | Website with an invalid robots.txt file
**Stimulus**| Crawler encounters a malformed robots.txt file (e.g., HTML instead of plain text)
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Assumes that all paths are allowed
**Response Measure**| FIXME

- Scenario: The crawler searches for the robots.txt file on a target website. However, instead of a valid text file, it encounters a malformed or non-standard file, such as an HTML document or a file with unreadable syntax. When this happens, the crawler assumes that the file does not provide restrictions and proceeds as though all paths on the website are accessible and waits 1 second between requests to avoid overloading the website.

---

<!--
- General Idea: the crawler avoids overloading the website

Parts | Politeness Scenario
----- | --------------------
**Source of Stimulus** | Multiple URLs from the same domain
**Stimulus**| Requests queued for the same domain
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Enforce a minimum delay between consecutive requests
**Response Measure**| If crawl-delay is set, respect it; otherwise, wait 1 second between requests.

- Scenario: The crawler detects that it is making multiple requests to the same domain. To prevent overwhelming the website, it enforces a minimum delay between requests. If the website specifies a `Crawl-Delay` directive in its `robots.txt` file, the crawler uses that value; otherwise, it defaults to a 1-second delay.
-->

---
---

### Scalability

- General Idea: the crawler can handle a large number of URLs

Parts | Scalability Scenario
----- | --------------------
**Source of Stimulus** | Increasing number of URLs
**Stimulus**| Number of URLs increases from 100 to 1000
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Crawler can handle the increased load
**Response Measure**| No resource bottlenecks

- Scenario: The crawler begins processing a moderate workload of URLs, but this workload quickly scales to a much larger number of URLs, such as from 100 to 1000. The crawler dynamically adjusts its resource usage, distributing tasks efficiently to handle the increased volume without CPU, memory, or I/O bottlenecks.

--- 
---

### Consistency

- General Idea: The crawler can recover and resume from its last state after a crash.

Parts | Consistency Scenario
----- | -------------------- 
**Source of Stimulus** | System failure
**Stimulus**| Server crash
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Resume crawling from the last state
**Response Measure**| No data loss

- Scenario: The crawler experiences an unexpected failure, such as a system crash or power outage. Upon restarting, it loads the last saved state from a checkpoint and resumes crawling without repeating already-processed URLs or losing track of queued tasks.

---

- General Idea: The crawler detects and handles duplicate URLs

Parts | Consistency Scenario
----- | --------------------
**Source of Stimulus** | Same URL with different paths
**Stimulus**| Encounters the same URL with different paths (e.g., http://example.com and http://example.com/)
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Normalize URLs to avoid duplicates
**Response Measure**| No duplicate URLs in the database

- Scenario: While processing links, the crawler encounters multiple variations of the same URL, such as `http://example.com` and `http://example.com/`. The crawler normalizes these URLs to a consistent format, ensuring that only unique entries are stored in the database and processed.

---
---

### Availability

- General Idea: The crawler URL queue remains available despite a temporary storage failure

Parts | Availability Scenario
----- | ---------------------
**Source of Stimulus** | Storage failure
**Stimulus**| Temporary database connection loss
**Artifact**| Crawler (URL frontier)
**Environment**| Normal operation
**Response**| Use a fallback storage mechanism
**Response Measure**| No data loss

- Scenario: The primary storage for the URL queue becomes temporarily unavailable due to a database connection failure. The crawler switches to a fallback mechanism, such as in-memory storage, ensuring that queued URLs are not lost and crawling can continue without interruption.

---

- General Idea: The crawler's **URL Frontier** remains operational despite failures.

Parts | Availability Scenario
----- | --------------------
**Source of Stimulus** | Storage or system failure
**Stimulus**| Temporary unavailability of URL Frontier storage
**Artifact**| URL Frontier
**Environment**| Normal operation
**Response**| Switch to a backup queue or in-memory storage
**Response Measure**| Minimal impact on the crawling process (e.g., 99.9% uptime)

- **Scenario**: The URL Frontier experiences a temporary storage failure (e.g., database connection lost). The crawler seamlessly switches to an in-memory queue to temporarily hold URLs, ensuring no interruption in processing and minimal loss of progress.

---

- General Idea: The **HTML Downloader** remains operational despite external server delays or failures.

Parts | Availability Scenario
----- | --------------------
**Source of Stimulus** | External server
**Stimulus**| Target server is down or unreachable
**Artifact**| HTML Downloader
**Environment**| Normal operation
**Response**| Retry the download after a delay or skip the URL
**Response Measure**| Minimal delay in the overall crawling process

- **Scenario**: The HTML Downloader encounters an external server that is temporarily unavailable or responding with errors (e.g., `500 Internal Server Error`). The downloader retries the request after a delay, and if the server remains unresponsive, the URL is skipped and logged for future attempts.

---

> Igual para reliability

- General Idea: The **Content Parser** handles corrupted or invalid HTML files without crashing.

Parts | Availability Scenario
----- | --------------------
**Source of Stimulus** | Invalid HTML input
**Stimulus**| Encounters a corrupted or invalid HTML page
**Artifact**| Content Parser
**Environment**| Normal operation
**Response**| Skip the corrupted page and log the error
**Response Measure**| No interruptions or crashes in the parsing process

- **Scenario**: The Content Parser processes an invalid HTML file containing syntax errors or missing essential elements. The parser gracefully skips the file, logs the error, and continues parsing other pages without interrupting the crawling process.

---

> Achei uma merda e o chat devolveu outros merdas

- General Idea: The **Content Comparator** handles missing or unavailable content gracefully.

Parts | Availability Scenario
----- | --------------------
**Source of Stimulus** | Missing content
**Stimulus**| A document to be compared is unavailable
**Artifact**| Content Comparator
**Environment**| Normal operation
**Response**| Logs the unavailability and continues with the next comparison
**Response Measure**| Minimal delay and no interruption in the process

- **Scenario**: While comparing content from two pages, one of the pages is temporarily unavailable. The Content Comparator logs the issue, skips the comparison, and continues with other tasks.

---

- General Idea: The **Link Extractor** handles edge cases such as malformed links.

Parts | Availability Scenario
----- | --------------------
**Source of Stimulus** | Malformed or invalid URLs
**Stimulus**| Encounters a malformed link during extraction
**Artifact**| Link Extractor
**Environment**| Normal operation
**Response**| Skip the malformed link and log the issue
**Response Measure**| No crashes or interruptions in the link extraction process

- **Scenario**: The Link Extractor processes a webpage containing malformed links (e.g., missing protocols or invalid characters). The extractor skips these links, logs the anomalies, and continues extracting valid links from the page.

---

> Igual ao link extractor

- General Idea: The **URL Filter** remains operational despite unexpected input.

Parts | Availability Scenario
----- | --------------------
**Source of Stimulus** | Invalid or unexpected URL format
**Stimulus**| Encounters a URL with an unrecognized format
**Artifact**| URL Filter
**Environment**| Normal operation
**Response**| Skip the invalid URL and log the issue
**Response Measure**| No slowdown or interruption in the filtering process

- **Scenario**: The URL Filter receives a URL with an invalid or unexpected format (e.g., non-HTTP/HTTPS protocols). The filter logs the error, skips the invalid URL, and continues processing other URLs.

---

> Não sei se gosto deste

- General Idea: The **URL Comparator** handles database unavailability without interrupting operations.**

Parts | Availability Scenario
----- | --------------------
**Source of Stimulus** | Database unavailability
**Stimulus**| URL Comparator cannot access the database
**Artifact**| URL Comparator
**Environment**| Normal operation
**Response**| Use a temporary in-memory comparison mechanism
**Response Measure**| Minimal impact on the process, with retries logged

- **Scenario**: The URL Comparator relies on a database to check for duplicate or previously processed URLs. If the database becomes temporarily unavailable, the comparator uses an in-memory cache to continue operations until the database is restored, ensuring minimal disruption.

---
---

### Security

- General Idea: The crawler detects and avoids infinite link loops caused by spider traps

Parts | Security Scenario
----- | -----------------
**Source of Stimulus** | Malicious website
**Stimulus**| Encounters a spider trap
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Stop crawling links from the detected trap
**Response Measure**| Minimal impact on the crawling process

- Scenario: The crawler visits a malicious website designed to trap it in an infinite loop of dynamically generated links. The crawler identifies the repetitive pattern of links and halts further crawling of that domain, minimizing wasted resources and preventing system overload.

---

- General Idea: The crawler detects and avoids malicious URLs

Parts | Security Scenario
----- | -----------------
**Source of Stimulus** | Malicious URL
**Stimulus**| Encounters a flagged URL (e.g., phishing site, malware warning)
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Skip the flagged URL
**Response Measure**| No access to the malicious content

- Scenario: While crawling, the system identifies a URL flagged as malicious by an external security service or internal heuristics. The crawler skips the URL, logs the event, and continues processing safe links without exposing itself or its users to the harmful content.

---
---

### Extensibility

- General Idea: The crawler is updated to index PDF files

Parts | Extensibility Scenario
----- | ----------------------
**Source of Stimulus** | New requirement to index PDF files
**Stimulus**| Encounters a PDF file
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Parse and Index the PDF file
**Response Measure**| PDF files are searchable

- Scenario:If the crawler needs to be extended to index PDF files, it would only need to add a new module to parse and extract text from PDF files. When the crawler encounters a PDF file, it uses this new module to extract the text content and index it for searchability.

---

- General Idea: The crawler is updated to index images metadata

Parts | Extensibility Scenario
----- | ----------------------
**Source of Stimulus** | New requirement to index images metadata
**Stimulus**| Encounters an image URL
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Extract and Index the image metadata
**Response Measure**| Image metadata is searchable

- Scenario: If the crawler needs to be extended to index image metadata, it would only need to add a new module to extract metadata from images. When the crawler encounters an image URL, it uses this new module to extract the metadata and index it for searchability.

---
---

### Reliability

- General Idea: The crawler remains responsive despite delays from external servers

Parts | Reliability Scenario
----- | --------------------
**Source of Stimulus** | Slow external server
**Stimulus**| External server exceeds threshold response time
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Timeout and skip the request
**Response Measure**| Minimal impact on the crawling process (threshold defined)

- Scenario: The crawler sends a request to an external server that responds with high latency, exceeding a predefined threshold. To prevent delays in the overall crawling process, the crawler skips the request, logs the issue, and continues processing other URLs.

---

- General Idea: The crawler skips invalid HTML pages

Parts | Reliability Scenario
----- | --------------------
**Source of Stimulus** | Invalid HTML page
**Stimulus**| Encounters an HTML page with syntax errors
**Artifact**| Crawler
**Environment**| Normal operation
**Response**| Skip the invalid page
**Response Measure**| No crashes or data loss

- Scenario: TODO

---

## Architectural Concerns

### **Architectural Concerns**

#### **1. Scalability**  
- **Concern**: How will the system handle an increasing number of URLs to crawl?  
- **Implications**: The architecture needs to scale horizontally (e.g., distributed crawling across multiple machines) and vertically (e.g., increased storage or processing power).  
- **Questions to Address**:  
  - How is the workload distributed across nodes?  
  - What mechanisms are in place for dynamic scaling?

#### **2. Performance and Efficiency**  
- **Concern**: How can the crawler maximize throughput while minimizing delays?  
- **Implications**: Optimize network requests, reduce duplicate processing, and ensure efficient parsing of content.  
- **Questions to Address**:  
  - What is the maximum number of concurrent requests the system can handle?  
  - How are resources (CPU, memory) optimized for large-scale operations?

#### **3. Fault Tolerance**  
- **Concern**: How does the system recover from failures (e.g., storage errors, network issues)?  
- **Implications**: Ensure no loss of progress, implement retry mechanisms, and log failures for debugging.  
- **Questions to Address**:  
  - How is data integrity maintained during crashes?  
  - Are there fallback mechanisms for critical components (e.g., URL Frontier)?

#### **4. Extensibility**  
- **Concern**: How easily can new features or modules (e.g., support for PDFs or images) be integrated?  
- **Implications**: Modular architecture with clearly defined interfaces for plugging in new parsers or storage mechanisms.  
- **Questions to Address**:  
  - Can the crawler adapt to evolving web standards or content types?  
  - How are new modules tested and deployed without disrupting ongoing operations?

#### **5. Data Management**  
- **Concern**: How are crawled data and metadata stored, retrieved, and updated?  
- **Implications**: Choose efficient storage solutions (e.g., NoSQL for flexibility, relational databases for consistency).  
- **Questions to Address**:  
  - How is the metadata indexed for quick retrieval?  
  - How is data consistency maintained in distributed systems?

#### **6. Security**  
- **Concern**: How does the crawler protect itself and its users from malicious content (e.g., spider traps, phishing links)?  
- **Implications**: Validate inputs, sandbox content parsing, and implement security checks.  
- **Questions to Address**:  
  - How are malicious URLs detected and handled?  
  - Is the system resistant to denial-of-service attacks?

#### **7. Politeness and Compliance**  
- **Concern**: How does the crawler respect the robots.txt file and avoid overloading servers?  
- **Implications**: Implement mechanisms to parse robots.txt, enforce delays, and comply with crawl-delay rules.  
- **Questions to Address**:  
  - How is compliance with web standards ensured?  
  - How are ethical crawling practices enforced?

#### **8. Consistency and Deduplication**  
- **Concern**: How are duplicate URLs or content detected and handled?  
- **Implications**: Implement URL normalization and content comparison algorithms to avoid redundant work.  
- **Questions to Address**:  
  - What techniques are used to identify duplicate content?  
  - How is consistency maintained when data is updated or re-crawled?

#### **9. Monitoring and Logging**  
- **Concern**: How is the crawler’s activity monitored and logged for debugging or reporting purposes?  
- **Implications**: Provide detailed logs and dashboards to track performance, errors, and coverage.  
- **Questions to Address**:  
  - What metrics are captured to evaluate crawler efficiency?  
  - How is failure analysis performed?

#### **10. Ethical and Legal Compliance**  
- **Concern**: How does the crawler adhere to legal and ethical standards (e.g., GDPR, copyright laws)?  
- **Implications**: Avoid scraping personal data, respect copyrights, and anonymize requests when necessary.  
- **Questions to Address**:  
  - How is user privacy respected during crawling?  
  - Are there mechanisms to comply with region-specific legal requirements?
