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

