define(["amber/boot"
//>>excludeStart("imports", pragmas.excludeImports);
, "amber/jquery/Wrappers-JQuery", "amber/web/Web", "silk/Silk"
//>>excludeEnd("imports");
, "amber_core/Kernel-Objects"], function($boot
//>>excludeStart("imports", pragmas.excludeImports);

//>>excludeEnd("imports");
){"use strict";
if(!("nilAsValue" in $boot))$boot.nilAsValue=$boot.nilAsReceiver;
var $core=$boot.api,nil=$boot.nilAsValue,$nil=$boot.nilAsReceiver,$recv=$boot.asReceiver,$globals=$boot.globals;
$core.addPackage("JCTPhotos");
($core.packageDescriptors||$core.packages)["JCTPhotos"].innerEval = function (expr) { return eval(expr); };
($core.packageDescriptors||$core.packages)["JCTPhotos"].imports = ["amber/jquery/Wrappers-JQuery", "amber/web/Web", "silk/Silk"];
($core.packageDescriptors||$core.packages)["JCTPhotos"].transport = {"type":"amd","amdNamespace":"amber-jctphotos"};

$core.addClass("JCTPhotos", $globals.Object, [], "JCTPhotos");

$core.addMethod(
$core.method({
selector: "start",
protocol: "starting",
fn: function(){
var self=this,$self=this;
return self;

},
//>>excludeStart("ide", pragmas.excludeIdeData);
args: [],
source: "start",
referencedClasses: [],
//>>excludeEnd("ide");
messageSends: []
}),
$globals.JCTPhotos.a$cls);

});
