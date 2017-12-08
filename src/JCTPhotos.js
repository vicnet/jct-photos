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
protocol: "as yet unclassified",
fn: function(){
var self=this,$self=this;
//>>excludeStart("ctx", pragmas.excludeDebugContexts);
return $core.withContext(function($ctx1) {
//>>excludeEnd("ctx");
$recv("#app"._asSilk()).__lt_lt("test");
return self;
//>>excludeStart("ctx", pragmas.excludeDebugContexts);
}, function($ctx1) {$ctx1.fill(self,"start",{},$globals.JCTPhotos)});
//>>excludeEnd("ctx");
},
//>>excludeStart("ide", pragmas.excludeIdeData);
args: [],
source: "start\x0a\x09'#app' asSilk << 'test'",
referencedClasses: [],
//>>excludeEnd("ide");
messageSends: ["<<", "asSilk"]
}),
$globals.JCTPhotos);


$core.addMethod(
$core.method({
selector: "start",
protocol: "starting",
fn: function(){
var self=this,$self=this;
//>>excludeStart("ctx", pragmas.excludeDebugContexts);
return $core.withContext(function($ctx1) {
//>>excludeEnd("ctx");
$recv($self._new())._start();
return self;
//>>excludeStart("ctx", pragmas.excludeDebugContexts);
}, function($ctx1) {$ctx1.fill(self,"start",{},$globals.JCTPhotos.a$cls)});
//>>excludeEnd("ctx");
},
//>>excludeStart("ide", pragmas.excludeIdeData);
args: [],
source: "start\x0a\x09self new start",
referencedClasses: [],
//>>excludeEnd("ide");
messageSends: ["start", "new"]
}),
$globals.JCTPhotos.a$cls);

});
