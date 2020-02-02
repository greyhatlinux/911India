# 911 India

## The Problem Statement :
Interactive & user friendly map application
for the public to inform police about the
crimes and emergencies in real time.

### Digging the Problem Statement
* Interactive and user-friendly UI
* Map enabled solution
* Real-time crime reporting
* Emergency Reporting

### Our system architecture has 4 endpoints:
1. Reporter
2. Other people
3. PCR
4. Headquarters


#### Roadmap :
![endpoints](/images/1.png)

#### Step 1 :
The user downloads the App into his
smartphone.
It requires no initial set-up or any sort of
user registration. The app provides
hassle-free UX.
Upon launching the app and clicking
the help me button, an immediate
response will be sent to the nearest
Police Station and then to all nearby
PCRs.

![endpoints](/images/2.png)

#### Step 2 :
The request document which arrives to
the Police HQ will contain the
requester’s IP address, high precision
Lat-Long coordinates and other vital
information for proper identification.
In areas of low network connectivity,
and unavailability of internet, the
Lat-Long will be sent via text-based
messages.

![endpoints](/images/3.png)

#### Step 3 :
Upon receiving help request, all the
PCRs in the range of 5km radius will
get notified.
The app with the PCR will clearly show
the location of incoming help request,
along with the nearest route to him.

![endpoints](/images/4.png)


#### Step 4 :
By the appropriate and timely
execution of the above mentioned
steps, the requestor would be
rescued and and/or potential crime
is expected to be prevented.

![endpoints](/images/5.png)


### Advantages
* Convenience 
* Feasible and Quick Deployable
* Real-time information Huge Scale of Impact
* Automatic PCR dispatch 
* Hassle-Free user experience
* Encrypted Data 
* Well handled exceptions

### Future Prospects

* A new feature will be added in which people close to the user can help in
case of an emergency.
* Feature to allow the user to share a picture of the crime scene if possible.
* In future, the app can address emergencies during natural calamities like
floods, earthquakes etc.
* Machine Learning will be employed for better PCR dispatch and quick help.
* Instead of monolithic infrastructure, the system will be based on
micro-services.
* Implementation of ELK stack.
* The incorporation of ansible will make the entire architecture fault-tolerant.