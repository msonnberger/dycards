import Rails from "@rails/ujs"

Rails.start()

import '../stylesheets/styles.scss';
import '../js/main.js';

require.context("../images", true);
