# The Connection Shape and Architercture used in **SUPRA REST INTERFACE**
Written by Amir Nourinia.

----------
The SUPRA Accepts the standard HTTP request Types namely: GET, POST, PUT, PATCH, Delete, OPTIONS and some other types.


The most important ones that are functional and used in this project are the GET and the POST request types.

The ip address that SUPRA is running at is referred as the SUPRA_URL below.
## GET REQUESTs

URL Shape:

**"SUPRA_URL/":** The root path for this url i.e. **"/"** has not been implemented yet, however this can be used to return the manual to use the SUPRA REST INTERFACE.

**"SUPRA_URL/nodes/var"** where var can be:
- input:    **"SUPRA_URL/nodes/input"**
This will return all the input nodes.
- output:   **"SUPRA_URL/nodes/output"** 
This will return all the output nodes.
- all:      **"SUPRA_URL/nodes/all"**
This will return all the nodes regardless of their types.

The shape of the object in response's body will be as:
`{"nodeIDs":[String]}`

**"SUPRA_URL/parameters":** This only prints the body of the request of the client back. It can be used for debugging purposes.

## POST REQUESTs

URL Shape:

**"SUPRA_URL/"** The root path for this url i.e. **"/"** has not been implemented yet, however this can be used to return the manual to use the SUPRA REST INTERFACE.

**"SUPRA_URL/nodes/\*"** This URL behaves exactly like the POST counterpart of it.

**"SUPRA_URL/get_parameters"**
Sending a post request with a node id init's body to this url will return all the parameters for that node.
shape of the object sent with the body should be similar to: `{"nodeID":"ID"}`

**"SUPRA_URL/set_parameters"**
A post request with an object in its body shaped as the example below would set a parameter in a specific node.

`{
    "nodeID":"id",
    "parameterID":"id",
    "value":"value"
}`
