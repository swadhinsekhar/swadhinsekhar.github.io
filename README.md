# **Swadhin Sekhar Behera**
A Senior Software Engineer building networking products at Cambium Networks

## Work Experience

### Cambium Networks
->_Bengaluru_

**Sr. Engineer**
->_Nov 2021 to Present_

- Currently developing an analytics engine using InfluxDB and visualizing using Grafana. 
    - Written wrapper application in golang which will receive json format data from devices and push into the influxDB.
    - Written client application in golang which will run inside the devices and send the data to the analytics engine. 
    - Ported InfluxDB and Grafana into the docker and plan is to scale the Analytics Engine using Kubernetes. 
    - Achieve:
        - Goal is to provide customers an overview of the entire network. 
        - Support team can easily figure out what's wrong in the network.
        - Alarm and event notification system which will prevent attacks such as DDOS etc.
- Currently developing a testbed application for NMS cloud. 
    - Where the testbed contains 4 major components like device-agent (runs inside device), router, activator and server .
    - Ported entire components into docker. 
    - Achieve:
        - Cloud Agent runs in various different embedded devices. so any enhancement of this application can be tested in this testbed.  
        - Using test cases developers can drive the application into corner cases.
        - It will save a lot of time in bug fix and testing.

### Lavelle Networks
->_Bengaluru_

**Senior Software Engineer - III**
->_Sept 2020 to Nov 2021_

- Fault Visibility & TCA(Threshold Crossing Alerts) implemented in the Product. 
    - Integrated the fault events generation in various SD-WAN components such as (Dataplane, Control Plane, DPI Engine, Security Engine). 
    - Integrated LMDB(mmaped) for tracking events status such as RAISE or CLEAR. 
    - Written libraries in C, Golang & Python which are used in various user space services.
- Developed System Resource Manager in Golang 
    - Watchdog application which monitors system resources such as CPU, Memory, Disk, Open FD and temperatures of the system. 
    - Certain critical applications such as Dataplane process, DPI Engine process and Control Plane process are monitored by this service.
- Implemented inline DNS Proxy in Datapath 
    - Implemented the DNS proxy into the product. 
    - Used hashmap db for DNS Answer headers. 
    - Handle the json configuration pull in Control Plane (python) from Cloud and store in the appropriate directory.

## Skills
- **Programming Language** : `C` `Golang`  `Python` 
- **Libraries/Framework** : Gorilla-mux, websockets, RestAPI
- **Tools**: `Git` `Jira` `Confluence`  `AWS` `Swagger`
- **Technical**: `Elasticsearch` `Grafana` `Clickhouse` `Kubernetes` `Docker` `Linux`

## Education
* Bachelor in Technology From Biju Pattnaik University of Technology, Odisha
* +2 Science from Sri Aurobindo I H S R, Matrubhaban, Cuttack, Odisha .
* Matriculation from Khannagar High School, Cuttack, Odisha.


---

||: Email: **<swadhinsekhar05@gmail.com>** || Phone: **+91 8908903171** || Website: **[swadhinsekhar.github.io](swadhinsekhar.github.io)** :||
