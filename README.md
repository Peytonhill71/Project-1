## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Diagrams/Virtual_Machine_Network_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the .yml file may be used to install only certain pieces of it, such as Filebeat.

  - filebeat-playbook.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly efficient, in addition to restricting unwanted traffic to the network.
Load balancer are really effective when it comes to preventing certain attacks such as distributed denial-of-service attacks. Jump Boxes are extremely beneficial when
it comes to working on the cloud, since the jump server acts as an audit for traffic and a single point where we can manage user accounts.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.

Filebeat is a lightweight shipper for forwarding and centralizing log data.

Metricbeat is a lightweight shipper that records system and service statistics.
The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.1   | Linux            |
| Web1     | Server   | 10.0.0.4   | Linux            |
| Web2     | Server   | 10.0.0.8   | Linux            |
| ELK      | Server   | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 96.33.7.236

Machines within the network can only be accessed by JumpBox.
Jumpbox - 

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No                  | 10.0.0.7 10.0.0.8    |
| web1&web2| Yes                 | 10.0.0.4             |
| Elk      | No                  | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

The advantage of automating configuration with Ansible is that you can run the playbook and have it configure on multiple systems at once instead manually configuring each machine one-by-one. 

The playbook implements the following tasks:
- Install docker.io
- Install python3-pip
- Install Docker Module
- Increase and use more virtual memory
- Download and launch a docker elk container
- Enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

10.0.0.7
10.0.0.8

We have installed the following Beats on these machines:
Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
Filebeat monitors log files and collects log events. An example of this could be a specific log of a file that was downloaded from a certain link on the internet. 
Metricbeat periodically collects metrics from the OS and and from services running on the server.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the config file to etc/ansible/.
- Update the hosts file to add the ip of the webservers, then add the ELK group with the IPs as well
- Run the playbook, and navigate to kibana to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_ elkplaybook.yml copy it to etc/ansible/ 
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_ The hosts file. You insert the IP/port of each specific one on the hosts file.
- _Which URL do you navigate to in order to check that the ELK server is running?http://40.76.226.151:5601/setup.php

