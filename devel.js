define([
    './testing',
    'amber/devel',
    'bootstrap/js/bootstrap',
    'css!bower_components/font-awesome/css/font-awesome',
    // --- packages used only during development begin here ---
    'amber/legacy/Benchfib',
    'amber/legacy/Examples',
    'amber/legacy/IDE'
    // --- packages used only during development end here ---
], function (amber) {
    return amber;
});
