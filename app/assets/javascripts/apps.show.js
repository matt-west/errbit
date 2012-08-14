$(function() {

  $('.toggle.watchers').toggle({
    onClick: function (event, status) {
      $("#watchers_div").slideToggle("slow");
    },
    text: {
      enabled: false, // Change the enabled disabled text on the fly ie: 'ENABLED'
      disabled: false // and for 'DISABLED'
    },
    style: {
      enabled: 'primary', // default button styles like btn-primary, btn-info, btn-warning just remove the btn- part.
      disabled: false // same goes for this, primary, info, warning, danger, success.
    }
  });

  $('.toggle.repository').toggle({
    onClick: function (event, status) {
      $("#repository_div").slideToggle("slow");
    },
    text: {
      enabled: false, // Change the enabled disabled text on the fly ie: 'ENABLED'
      disabled: false // and for 'DISABLED'
    },
    style: {
      enabled: 'primary', // default button styles like btn-primary, btn-info, btn-warning just remove the btn- part.
      disabled: false // same goes for this, primary, info, warning, danger, success.
    }
  });


  $('.toggle.deploys').toggle({
    onClick: function (event, status) {
      $("#deploys_div").slideToggle("slow");
    },
    text: {
      enabled: false, // Change the enabled disabled text on the fly ie: 'ENABLED'
      disabled: false // and for 'DISABLED'
    },
    style: {
      enabled: 'primary', // default button styles like btn-primary, btn-info, btn-warning just remove the btn- part.
      disabled: false // same goes for this, primary, info, warning, danger, success.
    }
  });
});
