sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"claimsproject/claimsproject/test/integration/pages/ProductsList",
	"claimsproject/claimsproject/test/integration/pages/ProductsObjectPage"
], function (JourneyRunner, ProductsList, ProductsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('claimsproject/claimsproject') + '/test/flp.html#app-preview',
        pages: {
			onTheProductsList: ProductsList,
			onTheProductsObjectPage: ProductsObjectPage
        },
        async: true
    });

    return runner;
});

