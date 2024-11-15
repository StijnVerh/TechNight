import MessageBox from "sap/m/MessageBox";
import BaseController from "./BaseController";
import Event from "sap/ui/base/Event";
import ODataModel from "sap/ui/model/odata/v2/ODataModel";
import Table from "sap/m/Table";
import SmartTable from "sap/ui/comp/smarttable/SmartTable";
import { Route$MatchedEvent } from "sap/ui/core/routing/Route";
import JSONModel from "sap/ui/model/json/JSONModel";

/**
 * @namespace com.flexso.cap.dsp.hdi.controller
 */
export default class Initial extends BaseController {
    public onInit(): void {

        const model: ODataModel = this.getOwnerComponent().getModel() as ODataModel;
        let aEntitySets: [] = model.getServiceMetadata().dataServices.schema[0].entityContainer[0].entitySet.map(entitySet => {
            return {
                name: entitySet.name
            }
        });

        this.setModel(new JSONModel({
            entitySets: aEntitySets,
            selectedEntitySet: ""
        }), "entitySetModel");
    }

    public goToEntityTable(): void {
        const selectedEntitySet: string = this.getModel("entitySetModel").getProperty("/selectedEntitySet");
        this.navTo("main", { entitySet: selectedEntitySet });
    }
}
