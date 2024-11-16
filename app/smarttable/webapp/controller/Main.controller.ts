import MessageBox from "sap/m/MessageBox";
import BaseController from "./BaseController";
import Event from "sap/ui/base/Event";
import ODataModel from "sap/ui/model/odata/v2/ODataModel";
import Table from "sap/m/Table";
import SmartTable from "sap/ui/comp/smarttable/SmartTable";
import { Route$MatchedEvent } from "sap/ui/core/routing/Route";
import { urlParameters } from "../model/types";
import JSONModel from "sap/ui/model/json/JSONModel";
import Context from "sap/ui/model/odata/v2/Context";
import Dialog from "sap/m/Dialog";
import Fragment from "sap/ui/core/Fragment";
import UI5Element from "sap/ui/core/Element";
import SmartForm from "sap/ui/comp/smartform/SmartForm";
import Group from "sap/ui/comp/smartform/Group";
import GroupElement from "sap/ui/comp/smartform/GroupElement";
import SmartField from "sap/ui/comp/smartfield/SmartField";
import ResourceBundle from "sap/base/i18n/ResourceBundle";
import MessageToast from "sap/m/MessageToast";



/**
 * @namespace com.flexso.cap.dsp.hdi.controller
 */
export default class Main extends BaseController {
	private smartTable: SmartTable;
	private entitySet: string;
	private AddEntry: Dialog;

	public onInit(): void {
		this.smartTable = this.getView().byId("smartTableID") as SmartTable;

		// Navigation
		this.getRouter()
			?.getRoute('main')
			?.attachPatternMatched((event: Route$MatchedEvent) => this.onMainMatched(event), this);

		// const model: ODataModel = this.getOwnerComponent().getModel() as ODataModel;
		// let aInitiallyVisibleFields: string[] = model.getServiceMetadata().dataServices.schema[0].entityType.find(entityType => entityType.name === entitySet).property.map(property => property.name);
		// let sInitiallyVisibleFields: string = aInitiallyVisibleFields.join(",");

		// this.smartTable.setInitiallyVisibleFields(sInitiallyVisibleFields);
	}

	// *********************************************************************
	// Navigation
	// *********************************************************************
	private async onMainMatched(event: Route$MatchedEvent) {

		this.entitySet = (event.getParameter("arguments") as urlParameters).entitySet;

		this.setModel(new JSONModel({
			entitySet: this.entitySet
		}), "smartTableModel");

		if (this.smartTable.isInitialised()) {
			location.reload();
		}

		this.setModel(new JSONModel({
			entityType: this.entitySet
		}), "smartFormModel");
	}

	onEditToggled(oEvent: Event) {
		console.log(oEvent);

		const editableTurnedOff: boolean = !oEvent.getParameter("editable");
		let oModel: ODataModel = this.smartTable.getModel() as ODataModel;

		if (editableTurnedOff) {
			MessageBox.confirm((this.getResourceBundle() as ResourceBundle).getText("confirmSaveMessage"), {
				actions: [MessageBox.Action.YES, MessageBox.Action.NO],
				emphasizedAction: MessageBox.Action.YES,
				onClose: (sAction: string) => {
					if (sAction === MessageBox.Action.YES) {
						oModel.submitChanges();
					} else {
						oModel.resetChanges();
						oModel.refresh(true);
					}
				}
			})
		}


	}

	onDelete(oEvent: Event) {
		let items = (this.getView().byId("tableID") as Table).getSelectedItems();

		if (items.length === 0) {
			return;
		}

		MessageBox.warning((this.getResourceBundle() as ResourceBundle).getText("deleteWarning"), {
			actions: [MessageBox.Action.YES, MessageBox.Action.CANCEL],
			emphasizedAction: MessageBox.Action.YES,
			onClose: (sAction: string) => {
				if (sAction === MessageBox.Action.YES) {
					let oModel: ODataModel = this.smartTable.getModel() as ODataModel;
					oModel.setUseBatch(false);
					let items = (this.getView().byId("tableID") as Table).getSelectedItems();
					items.forEach(item => {
						let key: { name: string }[] = oModel.getServiceMetadata().dataServices.schema[0].entityType.find(entityType => entityType.name === this.entitySet).key.propertyRef;
						if (key?.length === 1) {
							let id = item.getBindingContext().getProperty(key[0].name);
							// only implemented if key is a number
							oModel.remove(`/${this.entitySet}(${id})`, { success: () => { oModel.refresh(true); } });
						}
					})
				}
			}
		})

	}

	async onAdd() {

		if (!this.AddEntry) {
			this.AddEntry = (await Fragment.load({
				name: "com.flexso.cap.dsp.hdi.view.fragment.AddEntry",
				controller: this,
			})) as Dialog;
		}
		(this.getView() as UI5Element).addDependent(this.AddEntry);

		/* Create a new entry */
		let oModel: ODataModel = this.smartTable.getModel() as ODataModel;
		const bindingContext = oModel?.createEntry(`/${this.entitySet}`, {}) as Context;

		this.AddEntry.setBindingContext(bindingContext);

		let aPropertiesOfEntitySet: [] = oModel.getServiceMetadata().dataServices.schema[0].entityType.find(entityType => entityType.name === this.entitySet).property;

		let smartform = this.createSmartform(aPropertiesOfEntitySet);
		this.AddEntry.destroyContent();
		this.AddEntry.addContent(smartform);
		this.AddEntry.open();
	}

	onCancel() {
		let oModel: ODataModel = this.smartTable.getModel() as ODataModel;
		oModel.resetChanges();
		this.AddEntry.close();
	}

	onSave(oEvent: Event) {
		console.log(oEvent);
		let oModel: ODataModel = this.smartTable.getModel() as ODataModel;
		oModel.submitChanges();
		this.AddEntry.close();
	}

	onRefresh() {
		let oModel: ODataModel = this.smartTable.getModel() as ODataModel;
		oModel.refresh(true);
	}

	createSmartform(fields: []) {
		let smartform: SmartForm = new SmartForm({ editTogglable: false, editable: true, validationMode: "Async" });

		let group: Group = new Group();

		fields.forEach(field => {
			let groupElement: GroupElement = new GroupElement();
			let smartField: SmartField = new SmartField({ value: `{${field.name}}` });
			groupElement.addElement(smartField);
			group.addGroupElement(groupElement);
		});
		smartform.addGroup(group);
		return smartform;
	}
}
