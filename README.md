# NOC 
### • Specifications of design :-
- A Network-on-Chip interconnection module has been developed, with a 
2D mesh topology (3X3mesh).
- The routers allocate data at flit granularity, implementing a wormhole 
switching architecture further optimized by the presence of multiple 
virtual channels per input, avoiding the Head of Line blocking issue and 
thus allowing a higher average throughput to the network.
-  Packet routing is driven by [Node-based Routing algorithm with West-first Turn Model technique], independently computed by each router 
belonging to the mesh.
- Flow control is implemented in the switching activity management, which 
is controlled by a per-router switch allocation unit, and uses the On-Off 
algorithm, easy to implement but efficient enough for a medium level of 
traffic in the network.
## Design and implementation 
### • Router Block diagram
<img src="https://github.com/sarakady/NOC-Project/assets/113397553/bb159111-d2f6-433a-877a-93ad522a2c14" width="600" height="600">

##### The router contains 5 blocks:
- INPUT_PORTS module consists of five input ports: N,S,E,W,PE.
- Routing_unit module.
- VC_Allocator module.
- Switch_allocator module.
- Crossbar module. 
### Packet configurations: -
- Maximum number of packets is 8. [sequence number 3-bit]
- Each packet contains 8 flits.
  ##### the flit format
 <img src="https://github.com/sarakady/NOC-Project/assets/113397553/877d3a14-6bf2-4396-8564-098ed2c154ab">
 
 ## Input Port module
 is responsible for storing the flits that comes from its input interface matching the correspondent virtual channel id.
 - One router has exactly 5x input modules, each input module has 4 virtual channels.
- Each input port has Roun-Robin Arbiter to choose between VCs.
  
 <img src= "https://github.com/sarakady/NOC-Project/assets/113397553/c0577f5a-0713-455d-ac69-ec1a3af9db02" width="600" height="600">

 ### Input Port controller
 <img src= "https://github.com/sarakady/NOC-Project/assets/113397553/efaed6a3-f45a-4b1e-a4de-ff5823bdda08" width="600" height="600">
 
 ### Round-Robin Arbiter for input Port 
  <img src= "https://github.com/sarakady/NOC-Project/assets/113397553/9856bed9-d088-4b52-8f25-8c17e3fa33cc" width="600" height="600" >

 ## Route computation Unit 
 - the route computation unit computes the next hop for each packet as soon as the head flit arrives to the router and sends the result to the input port unit. 
 - the implemented routing algorithm [Node-based Routing with West-first Turn Model technique] requires only information about the position of the current router and of the destination router in the 2D mesh.
  <img src= "https://github.com/sarakady/NOC-Project/assets/113397553/fa39e8c7-69a9-4266-a34f-c06654128588" >

  
  <img src= "https://github.com/sarakady/NOC-Project/assets/113397553/09d47aa1-9591-487a-948e-b2056fa6c1db" >
  
  ## VC Allocator 
It responsible for checking the availability of VCs in the downstream router.
    - A separable input-first allocator is used inside the VC allocator unit. 
    - It is implementation by Applying a matrix contains all resources with respective to its availability.    
    - Round-Robin Arbiter to choose between requests. 
    
  <img src= "https://github.com/sarakady/NOC-Project/assets/113397553/91d114ae-86b5-4392-a7ff-3ffa99109aff">

  ## Switch Allocator 
The switch allocator module solves the contention between input buffers for the 
access to the crossbar switch.
    - By implementing a separable input-first allocator and thus sending control signals to the cross5 bar module and to the input buffers. 
    - And Round-Robin Arbiter to choose between the available output ports.
    
<img src= "https://github.com/sarakady/NOC-Project/assets/113397553/e343a848-4d37-4e3a-a0bc-f3a3566aa70">

## Round-Robin Arbiter for VC Allocator and switch Allocator

<img srs= "https://github.com/sarakady/NOC-Project/assets/113397553/2d79366d-ab69-439e-9020-bb1a4772265c" >

## Crossbar 
Cross bar module allows moving flits from input Block to output ports allowing only one input to propagate at a time. And input and output selection are done through switch allocator. 

<img srs= "https://github.com/sarakady/NOC-Project/assets/113397553/b6cf183f-dd59-4466-bfef-a55120df1589" >


  

  
   
 

