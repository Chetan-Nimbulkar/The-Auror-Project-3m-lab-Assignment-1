Welcome to the auror project challange 1

you can simply clone this repository to your local machine and try out

simply
step 1

clone via
``` 
git clone https://github.com/Chetan-Nimbulkar/The-Auror-Project-3m-lab-Assignment-1.git
```
step 2 

```
cd Server
vagrant up
```
step 3 

After server provisioning is completed 

```
cd ..
cd Client
vagrant up
```

update : sometimes vagrant does not set correct hostname even when defined in vagrantfile, simply open powershell in client machine and use this command
```
set Hostname MachineB
```
and restart to take effect