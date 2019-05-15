# UDPExamples

## Introduction 

This are two example application to demonstrate udp communication from different clients to 
a single receiver using multiple ports. 

## Project Description

First we implement a simple receiver application which run two udp instances on different ports. 
It is poosible to to talk to each instance from different senders. In our demonstration, all on a 
singel client, aka localhost, we implement a sender application which communicate to the different ports
configured in the receiver application. 

- **Receiver**
Just run MultipleUPDHandler (the receiver). 

- **Receiver**
Lanch MultipleUPDHandlerTest and send some commands from the keyboard to the receicer on 
port 8889. Te application will send i++ continously to port 8890. 

Commands will be resend to the sender applikation only.  

Inspired by https://discourse.processing.org/t/udp-recreiving-multiple-ports/7516/6

- **Info** 

A new branch development is available now and will be used as longterm branch for future development. 

Hotfix will be used for patches 
Feature for further feature devlopment

