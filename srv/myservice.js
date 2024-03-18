module.exports = (srv) => {


    srv.on('vendors', (req,res) => {


        var aVendors = [{
            "vendorId": 1,
            "name": "SAP"
        },{
            "vendorId": 2,
            "name": "IBM"
        },
        {
            "vendorId": 3,
            "name": "IBMClient"
        }];
        console.log("data aaya " + req.data.vendorId);


        for (let i = 0; i < aVendors.length; i++) {
            const element = aVendors[i];
            if(element.vendorId === req.data.vendorId){
                return element.name;
            }
        }       



    });


}