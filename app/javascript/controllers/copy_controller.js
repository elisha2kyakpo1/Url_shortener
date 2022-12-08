import { Controller } from '@hotwired/stimulus';
export default class extends Controller {
  connect() {}

  copyText(event) {
    navigator.clipboard.writeText(event.params.shorturl);
  }
}