var express = require('express');
var app = express();
var http = require('http').createServer(app);
var io = require('socket.io')(http);



var bodyparser = require('body-parser');
app.use(bodyparser.urlencoded({ extended: true }));

app.use(express.static("public"));
app.set("view engine", "ejs");

var mongoose = require('mongoose');
mongoose.connect("mongodb://localhost:27017/demo", { useNewUrlParser: true , useUnifiedTopology: true } );





var locationSchema = new mongoose.Schema({
	
	lat:String,
	lon:String,
	msg:String,
	});


var victimlocation = mongoose.model("victimlocation",locationSchema);



var v_loc;




async function send_to_clients()
{
	var promise_2;
	
	promise_2  = new Promise(update_vloc);
	
	let result = await promise_2;
	// console.log(socket_var);
	socket_var.emit('msgfromserver',v_loc);
}




















app.get("/getvictimlocation", function(req, res) {
	victimlocation.find({},function(err,alllocations){
	if(err){
		console.log("\n\n there is a error in finding victimloaction")
		;}
	else{
		console.log("\n\n success in finding victimlocation");
		v_loc = alllocations;
		v_loc = {"lat":alllocations[alllocations.length-1]["lat"] , "lon" : alllocations[alllocations.length-1]["lon"]};
		console.log(v_loc);
		res.send(v_loc);
	}
	;})
    
})












var promise;
function update_vloc(resolve,reject)
{

	
	console.log('running update function');
	
	
	
	
	
	victimlocation.find({},function(err,alllocations){
	if(err){
		console.log("\n\n there is a error in finding victimloaction")
		;}
	else{
		//console.log("\n\n success in finding victimlocation");
		//console.log(interests);
		v_loc = alllocations;
		v_loc = {"lat":alllocations[alllocations.length-1]["lat"] , "lon" : alllocations[alllocations.length-1]["lon"]};
	
		//console.log(alllocations);
		//console.log('allocation '+v_loc);
		//re
		resolve(v_loc);
		// module.exports = { loc:v_loc, try:'123'}
		
		
	}
	;})

    
}






async function update_and_print()
{
	
	promise  = new Promise(update_vloc);
	
	let result = await promise;
	console.log(result);
	//return result;
	
}

update_and_print()




















app.post("/addvictimlocation", function(req, res) {

    victimlocation.create({lat:req.body.newvictimlat,lon:req.body.newvictimlon},
				function(err,interest){
	if (err)
	{console.log("\n\nerror in creating victim location");}
	else{
		console.log("\n\nsuccessfully created victim loaction");
		console.log(req.body);
		 lon = (req.body.newvictimlat);
		lat =(req.body.newvictimlon);
		//console.log(victimlocation);
		// console.log(victimlocation);}})
		//console.log('running update function inside addvictimloc');
		update_and_print();
		//console.log('running function to broadcast');
		send_to_clients();
		//socket_var.emit('msgfromserver',v_loc);
		
    res.send("ok");
		
}})})







var socket_var;
function send_vloc_socket()
{
	
io.on('connection', (socket)=>{
	socket_var = socket;
    // ws.send because socket.emit
    socket.emit('msgfromserver',v_loc);

})
	
}



send_vloc_socket()












app.get('/cases', function(req, res){
  res.render('receive_for_socket');
});




app.get('/map', function(req, res){
	
  res.render('map');
});


http.listen(3000, function(){
  console.log('listening on *:3000');
});






