# Swadhin Sekhar Behera

<link rel="stylesheet" href="css/style.css">

:fontawesome-solid-location-dot: Bengaluru, India &nbsp;|&nbsp; :fontawesome-solid-mobile: +91-8908903171 &nbsp;|&nbsp; :material-email-fast: [swadhinsekhar05@gmail.com](mailto:swadhinsekhar05@gmail.com) &nbsp;|&nbsp; :fontawesome-brands-github: [swadhinsekhar](https://github.com/swadhinsekhar) &nbsp;|&nbsp; :fontawesome-brands-linkedin: [swadhinsekhar](https://www.linkedin.com/in/swadhinsekhar/)

<hr class="linebreakTop">

## Technical Skills
<hr class="linebreak">

<dl class="skills-list">
  <dt>Programming Languages</dt><dd>C & Golang</dd>
  <dt>Networking Protocols</dt><dd>DNS, DHCP, TCP/IP, SD-WAN/SDN, TLS (JA3/JA3S), mDNS/SSDP</dd>
  <dt>Security</dt><dd>PKI, Certificate Validation, eBPF, Device Fingerprinting</dd>
  <dt>Libraries/Frameworks</dt><dd>Gorilla-mux, websockets, REST API, gRPC, scikit-learn, pandas, redis-py-cluster</dd>
  <dt>Tools</dt><dd>Git, Jira, Confluence, Swagger, OpenSSL, Wireshark</dd>
  <dt>DevOps/Infra</dt><dd>Linux, Docker, Jenkins CI/CD, AWS (Lambda, ECR, S3, ElastiCache, API Gateway)</dd>
  <dt>Data Formats</dt><dd>JSON, YAML</dd>
</dl>


## Professional Experience

<hr class="linebreak">

<span class="job-title">
  <span class="company">Cambium Networks</span> :
  <span class="position">Staff Engineer </span>
  <span class="date">March 2024 - Continue.</span>
</span>

- Cloud Agent Security Enhancement
	- Fixed critical certificate validation issue in C-based cloud agent using OpenSSL 3.3.1
	- Enhanced ssl_cert_verify_callback to properly handle 3-tier AWS certificate chain (root/intermediate/leaf CA)
	- Implemented comprehensive certificate chain verification, strict hostname validation against CN, and graceful handling of not-yet-valid certificates
	- **Impact:** Resolved intermediate CA validation failures while strengthening security checks
	- **Skills:** C, OpenSSL, PKI, Certificate Validation, Security Hardening

- Endpoint Device Classification System
	- Developed a Golang-based solution to classify endpoint devices by analyzing network attributes including MAC addresses, DHCP fingerprints, TCP/IP stack, TLS (JA3/JA3S), HTTP headers, DNS OS Update lits, and mDNS/SSDP data.
	- Created structured JSON profiles for each device (keyed by MAC address) by aggregating multiple fingerprinting techniques. 
	- Integrated with cloud REST API to enrich device profiles with manufacturer/model information.
	- Implemented using eBPF for efficient and scalable network data collection and processing.
	- **Impact:** Enhanced network visibility and device identification accuracy for security monitoring.
	- **Skills:** Golang, eBPF, Network Fingerprinting, REST APIs, JSON Data Modeling.


<span class="job-title">
  <span class="company">Cambium Networks</span> :
  <span class="position">Sr. Engineer </span>
  <span class="date">Nov 2021 - March 2024</span>
</span>

- Developed microservice applications to manage REST API calls from the Subscriber Mobile App:
    - Designed REST API endpoints and JSON schemas for requests and responses.
    - Utilized AWS DynamoDB for storing user data, including notifications and speed test history.
    - Implemented user authentication from AAA Server using gRPC.
    - Implemented test cases for all REST API endpoints, adhering to Test Driven Development practices.

- Engaged in full product design and development lifecycle for network solutions:
    - Designed JSON schema between Network Cloud Server and Wi-Fi Router for all required product features.
    - Collaborated cross-functionally with multiple teams, contributing to end-to-end development and successful implementation of key features.
    - Guided the Quality Assurance team in prioritizing and resolving critical issues.
    - Implemented a speed test agent feature in Wi-Fi routers, enhancing network performance evaluation.
    - Integrated a robust Parental Control feature, enabling enhanced control and security for families.
    - **Technologies:** C, Golang, Shell, Python, Docker, Jira, Confluence, AWS EC2, S3 Bucket.

- Led the development of an Observability Engine with Elastic Stack and Grafana for stats & logs visualization of CPE, Wi-Fi APs, and Wi-Fi Router:
    - Integrated syslog-ng within Network Access Points (APs) for streamlined log export to the Observability Engine.
    - Developed a stats-collector agent in Golang for real-time monitoring and data-driven insights.
    - Containerized the ELK Stack, Grafana, and syslog-ng server, streamlining deployment and enhancing scalability.

<span class="job-title">
  <span class="company">Lavelle Networks</span> :
  <span class="position">Software Engineer - III </span>
  <span class="date">Sept 2020 - Nov 2021</span>
</span>

- Implemented Fault Visibility & Threshold Crossing Alerts (TCA) in the product:
    - Integrated fault event generation in various SD-WAN components (Dataplane, Control Plane, DPI Engine, Security Engine).
    - Integrated LMDB (memory-mapped database) for tracking event status such as RAISE or CLEAR.
    - Developed libraries in C, Golang, and Python for use in various user space services.

- Developed a System Resource Manager in Golang:
    - Built a watchdog application to monitor system resources such as CPU, memory, disk, open file descriptors, and system temperatures.
    - Monitored critical applications including Dataplane, DPI Engine, and Control Plane processes.

- Implemented inline DNS Proxy in Datapath:
    - Integrated DNS proxy into the product for improved DNS handling.
    - Utilized hashmap database for DNS answer headers.
    - Managed JSON configuration pull in Control Plane (Python) from Cloud and stored in the appropriate directory.

<span class="job-title">
  <span class="company">Etrance Networks (client Lavelle Networks)</span> :
  <span class="position">Software Engineer</span>
  <span class="date">Aug 2018 - Sept 2020</span>
</span>

- Led Active-Active High Availability (HA) feature:
    - Performed unit testing on the entire feature and resolved all bugs raised during the QA phase.

- Ported SD-WAN software to ARM platform:
    - Cross-compiled and ported all SD-WAN CPE components to ARM devices.
    - Developed a multi-pattern matching library for the DPI Engine on ARM architecture.
    - Integrated Switch Software (RTL8367) into the product.
    - Conducted onsite verification of the board for manufacturing.

- Integrated DHCP Server into the SD-WAN platform:
    - Integrated the DHCP Server in the control plane.
    - Implemented DHCP options such as 150, 66, and 67 in the DHCP server.

- Integrated modem support as WAN link into the SD-WAN platform:
    - Developed software to manage all types of USB-based 4G devices.
    - Developed modem driver for mini-PCI based devices.

<span class="job-title">
  <span class="company">Etrance Networks (client TATA Power SED)</span> :
  <span class="position">Software Engineer</span>
  <span class="date">Dec 2015 - Aug 2018</span>
</span>

- Developed Video Conference Bridge:
    - Built video conference software using GStreamer.
    - Ported the software to TI DM8168 & TI 6636K2H boards.
    - Integrated video codec plugins into the embedded board.

- Developed VoIP-based Call Server for Software Defined Radio (SDR):
    - Developed user authentication module using SIP REGISTER headers.
    - Implemented feature server for various IVR-related queries.
    - Integrated web calls into the VoIP server.

- Developed CREW Terminal SIP Client:
    - Built SIP client software for client-customized hardware.
    - Developed various drivers and firmware for embedded components used in the device.

<span class="job-title">
  <span class="company">Etrance Networks</span> :
  <span class="position">R & D Engineer</span>
  <span class="date">Sept 2015 - Dec 2015</span>
</span>

- Developed user authentication over WiFi router:
    - Integrated Splash software (nodogsplash from OpenWRT) in TP-Link router.
    - Developed cloud server to manage distributed routers.
    - Integrated Google Analytics into the platform.

<span class="job-title">
  <span class="company">Etrance Networks</span> :
  <span class="position">Internship </span>
  <span class="date">May 2015 - Sept 2015</span>
</span>

- Developed Smart Landline Calls over WiFi (IoT):
    - Built an embedded device to convert BSNL landline calls to home WiFi network, enabling reception on Android mobile phones.
    - Implemented firmware for various embedded chips used in the device (DAA CPC5622, ESP8266).
    - Developed I2S driver for audio codec chip WM8510.
    - Verified digital signals using an oscilloscope.

## Education
<hr class="linebreak">

<div class="education-list">
  <div class="education-item">
    <div>
      <div class="degree">Bachelor of Technology</div>
      <div class="school">Biju Pattnaik University Of Technology, Rourkela, Odisha</div>
    </div>
    <div class="edu-date">Aug 2010 – May 2014</div>
  </div>
  <div class="education-item">
    <div>
      <div class="degree">+2 Science</div>
      <div class="school">Sri Aurobindo I H S R, Matrubhaban, Cuttack, Odisha</div>
    </div>
    <div class="edu-date">June 2008 – May 2010</div>
  </div>
  <div class="education-item">
    <div>
      <div class="degree">Matriculation</div>
      <div class="school">Khannagar High School, Cuttack, Odisha</div>
    </div>
    <div class="edu-date">May 2008</div>
  </div>
</div>
