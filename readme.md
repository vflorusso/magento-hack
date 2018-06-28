# Deployment information

This repository holds Azure Resource Manager templates to serve as a structure to host a highly available Magento Commerce on Azure using SoftNAS as NFS storage

The AKS cluster will hold:

- the varnish docker pods

- the magento docker pods

- the redis docker pods

Networking is created in its own resource group to allow better RBAC control
A KeyVault is created to allow secrets storage for template deployment
VMs have all the Linux script extensions to provide script execution at launch and the Log Analytics extension to log infrastructural telemetry to the OMS workspace
