# The Connection Shape and Architecture used in **SUPRA REST INTERFACE**
Written by Amir Nourinia.

----------
The SUPRA Accepts two of the standard HTTP request Types namely: GET and POST.

The ip address that SUPRA is running at is referred as the SUPRA_URL below.

## GET REQUESTs

URL Shape:

**"SUPRA_URL/":** The root path for this url.

**"SUPRA_URL/nodes/var"** where var can be:
- input:    **"SUPRA_URL/nodes/input"**
This will return all the input nodes.
- output:   **"SUPRA_URL/nodes/output"** 
This will return all the output nodes.
- null or all:  **"SUPRA_URL/nodes/"** or **"SUPRA_URL/nodes/all"**
This will return all the nodes regardless of their types.

The shape of the object in response's body will be as:
`{"nodeIDs":[String]}`

**"SUPRA_URL/parameters":**
Sending a GET request with a node id in its body to this url will return all the parameters for that node.
shape of the object sent with the body should be similar to: `{"nodeID":"ID"}`

## POST REQUESTs

URL Shape:

**"SUPRA_URL/"** The root path for this url.

**"SUPRA_URL/parameters"**
A post request with an object in its body shaped as the example below would set a parameter in a specific node.

`{
    "nodeID":"id",
    "parameterID":"id",
    "value":"value"
}`

This is the classic `POST` request one would expect.


----------
