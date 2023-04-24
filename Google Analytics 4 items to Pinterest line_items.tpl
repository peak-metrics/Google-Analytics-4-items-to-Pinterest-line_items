___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Google Analytics 4 items to Pinterest line_items",
  "description": "Convert Google Analytics 4 items object to Pinterest line_items object.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "ecommerceDataLayer",
    "displayName": "Google Analytics 4 Ecommerce Data Layer object",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "alwaysInSummary": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Inserisci il codice del modello qui.
const log = require('logToConsole');
log('data =', data.ecommerceDataLayer);

 if (!data.ecommerceDataLayer || !data.ecommerceDataLayer.items) {
    return [];
  }

  var newData = data.ecommerceDataLayer.items.map(function(item) {
    return {
      product_name: item.item_name,
      product_id: item.item_id,
      product_price: item.price,
      product_quantity: item.quantity
    };
  });


return newData;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Ecommerce items
  code: |-
    const mockData = {
      ecommerceDataLayer: {
      currency: "EUR",
      value: "1190.00",
      items: [
        {
          item_id: 102244,
          item_name: "CRISTALLO Professional Diver | Black",
          item_brand: "",
          price: 1190,
          item_category: "Cristallo",
          quantity: 1,
          google_business_vertical: "retail",
          id: "102244"
        }
      ]
      }
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo(undefined);
- name: Empty Ecommerce Object
  code: |-
    const mockData = {
      // Mocked field values
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo(undefined);
setup: ''


___NOTES___

Created on 24/4/2023, 15:33:19


