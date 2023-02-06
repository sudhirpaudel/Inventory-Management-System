import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/config/colors.dart';
import 'package:inventorymanagementsystem/models/client_model.dart';

customerInfo(BuildContext context, width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 50,
        width: width / 24,
        child: Center(
            child: Text(
          'SN',
          style: Theme.of(context).textTheme.bodySmall,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Customer Name',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'PAN No.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Manager Name',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'PhoneNo.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Company Type',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        width: width / 24,
      )
    ],
  );
}

customerData(BuildContext context, width,ClientModel client,int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 50,
        width: width / 24,
        child:  Center(
            child: Text(
          "$index",
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
          client.clientName,
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
          client.panNumber ?? '',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
           client.managerName ?? '',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
          client.clientPhone ?? '',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
     
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
           client.clientType,
         style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 24,
        child: const Center(
            child: Icon(
          Icons.arrow_drop_down,
          color: primaryColor,
        )),
      )
    ],
  );
}
