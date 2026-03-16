sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/Fragment",
    "sap/ui/core/Theming",
    "sap/m/MessageToast"
], function (Controller, Fragment, Theming, MessageToast) {
    "use strict";

    return Controller.extend("ui5.portfolio.controller.Main", {
        onInit: function () {
            // Check current theme, default to sap_horizon if not already set or if dark
            var sTheme = Theming.getTheme();
            if (sTheme !== "sap_horizon" && sTheme !== "sap_horizon_dark") {
                Theming.setTheme("sap_horizon");
            }
        },

        onThemeSwitch: function () {
            var sCurrentTheme = Theming.getTheme();
            var sNewTheme = (sCurrentTheme === "sap_horizon") ? "sap_horizon_dark" : "sap_horizon";
            
            Theming.setTheme(sNewTheme);
            MessageToast.show("Theme switched to: " + (sNewTheme === "sap_horizon_dark" ? "Dark" : "Light") + " Horizon");
        },

        onProjectPress: function (oEvent) {
            var oBindingContext = oEvent.getSource().getBindingContext();
            var oView = this.getView();

            if (!this.pDialog) {
                this.pDialog = Fragment.load({
                    id: oView.getId(),
                    name: "ui5.portfolio.view.fragment.ProjectDetails",
                    controller: this
                }).then(function (oDialog) {
                    oView.addDependent(oDialog);
                    return oDialog;
                });
            }

            this.pDialog.then(function(oDialog) {
                oDialog.setBindingContext(oBindingContext);
                oDialog.open();
            });
        },

        onCloseProjectDialog: function () {
            if (this.byId("projectDetailsDialog")) {
                this.byId("projectDetailsDialog").close();
            }
        }
    });
});
