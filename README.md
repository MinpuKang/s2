# s2
ssh to nodes based on special node name, no need to remember IP/User/Password anymore.

s2 is based on the module pexpect in python.

```
This is used for quickly login nodes based on special node name based on file:"nodes"

Usage: s2 node [-h] [-c "clis"]

Options:

  node    Node     Set node name to login
  
  -h      Help     Show the help
  
  -c      CLIs     Set the CLIs performed in remote server, more CLIs can added in double quotes and seperated with semicolon
  
                   For example: -c "ls -l;date;hostname"  


Example:
-----------------------------------


  Login the node abc:
  
  user@host> s2 abc


  Login the node abc and perform clis:
  
  user@host> s2 abc -c "ls -l;date;hostname"


-----------------------------------

Nodes info can be updated into file:nodes

Format in the file:node_name,ip,user,password,port

Options:

1.Node name must be unique in the file!

2.If no special port,set default 22!

3.Password can be empty!

An example without password:

abc,1.1.1.1,admin,,22

Currently node list: abc xyz hk hk1 
```
