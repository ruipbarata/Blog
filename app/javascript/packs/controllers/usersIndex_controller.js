import { Controller } from "stimulus";

export default class extends Controller {
  openHref(event) {
    window.open(event.currentTarget.dataset.href, "_self");
  }
}
