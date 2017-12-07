define(["amber/boot", "amber_core/SUnit"], function($boot){"use strict";
if(!("nilAsValue" in $boot))$boot.nilAsValue=$boot.nilAsReceiver;
var $core=$boot.api,nil=$boot.nilAsValue,$nil=$boot.nilAsReceiver,$recv=$boot.asReceiver,$globals=$boot.globals;
$core.addPackage("JCTPhotos-Tests");
($core.packageDescriptors||$core.packages)["JCTPhotos-Tests"].innerEval = function (expr) { return eval(expr); };
($core.packageDescriptors||$core.packages)["JCTPhotos-Tests"].transport = {"type":"amd","amdNamespace":"amber-jctphotos"};

$core.addClass("JCTPhotosTest", $globals.TestCase, [], "JCTPhotos-Tests");

});
