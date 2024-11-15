import BaseController from "./BaseController";

/**
 * @namespace com.flexso.cap.dsp.hdi.controller
 */
export default class App extends BaseController {
	public onInit(): void {
		// apply content density mode to root view
		this.getView().addStyleClass(this.getOwnerComponent().getContentDensityClass());
	}
}
