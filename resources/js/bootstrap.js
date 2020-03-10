window._ = require('lodash');
// Axios
window.axios = require('axios');
// Jquery
window.$ = window.jQuery = require('jquery');
// Toastr
window.Toastr = require('toastr/toastr');
// Ladda 
window.Ladda = require('ladda/js/ladda');
// Axios defults
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
