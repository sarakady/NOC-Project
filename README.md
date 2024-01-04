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
<img src="https://github.com/sarakady/NOC-Project/assets/113397553/bb159111-d2f6-433a-877a-93ad522a2c14">
