﻿/*
 AngularJS v1.3.15
 (c) 2010-2014 Google, Inc. http://angularjs.org
 License: MIT
*/
(function (r, n, s) {
    'use strict'; n.module("ngAria", ["ng"]).provider("$aria", function () { function a(a, f, g) { return function (b, c, d) { var k = d.$normalize(f); e[k] && !d[k] && b.$watch(d[a], function (b) { g && (b = !b); c.attr(f, b) }) } } var e = { ariaHidden: !0, ariaChecked: !0, ariaDisabled: !0, ariaRequired: !0, ariaInvalid: !0, ariaMultiline: !0, ariaValue: !0, tabindex: !0, bindKeypress: !0 }; this.config = function (a) { e = n.extend(e, a) }; this.$get = function () { return { config: function (a) { return e[a] }, $$watchExpr: a } } }).directive("ngShow", ["$aria", function (a) {
        return a.$$watchExpr("ngShow",
        "aria-hidden", !0)
    }]).directive("ngHide", ["$aria", function (a) { return a.$$watchExpr("ngHide", "aria-hidden", !1) }]).directive("ngModel", ["$aria", function (a) {
        function e(e, b, c) { return a.config(b) && !c.attr(e) } function h(a, b) { return !b.attr("role") && b.attr("type") === a && "INPUT" !== b[0].nodeName } function f(a, b) {
            var c = a.type, d = a.role; return "checkbox" === (c || d) || "menuitemcheckbox" === d ? "checkbox" : "radio" === (c || d) || "menuitemradio" === d ? "radio" : "range" === c || "progressbar" === d || "slider" === d ? "range" : "textbox" === (c || d) ||
            "TEXTAREA" === b[0].nodeName ? "multiline" : ""
        } return {
            restrict: "A", require: "?ngModel", priority: 200, link: function (g, b, c, d) {
                function k() { return d.$modelValue } function p() { return m ? (m = !1, function (a) { a = c.value == d.$viewValue; b.attr("aria-checked", a); b.attr("tabindex", 0 - !a) }) : function (a) { b.attr("aria-checked", c.value == d.$viewValue) } } function q(a) { b.attr("aria-checked", !d.$isEmpty(d.$viewValue)) } var l = f(c, b), m = e("tabindex", "tabindex", b); switch (l) {
                    case "radio": case "checkbox": h(l, b) && b.attr("role", l); e("aria-checked",
                    "ariaChecked", b) && g.$watch(k, "radio" === l ? p() : q); break; case "range": h(l, b) && b.attr("role", "slider"); a.config("ariaValue") && (c.min && !b.attr("aria-valuemin") && b.attr("aria-valuemin", c.min), c.max && !b.attr("aria-valuemax") && b.attr("aria-valuemax", c.max), b.attr("aria-valuenow") || g.$watch(k, function (a) { b.attr("aria-valuenow", a) })); break; case "multiline": e("aria-multiline", "ariaMultiline", b) && b.attr("aria-multiline", !0)
                } m && b.attr("tabindex", 0); d.$validators.required && e("aria-required", "ariaRequired", b) &&
                g.$watch(function () { return d.$error.required }, function (a) { b.attr("aria-required", !!a) }); e("aria-invalid", "ariaInvalid", b) && g.$watch(function () { return d.$invalid }, function (a) { b.attr("aria-invalid", !!a) })
            }
        }
    }]).directive("ngDisabled", ["$aria", function (a) { return a.$$watchExpr("ngDisabled", "aria-disabled") }]).directive("ngMessages", function () { return { restrict: "A", require: "?ngMessages", link: function (a, e, h, f) { e.attr("aria-live") || e.attr("aria-live", "assertive") } } }).directive("ngClick", ["$aria", "$parse", function (a,
    e) { return { restrict: "A", compile: function (h, f) { var g = e(f.ngClick, null, !0); return function (b, c, d) { function e(b, a) { if (-1 !== a.indexOf(b[0].nodeName)) return !0 } var f = ["BUTTON", "A", "INPUT", "TEXTAREA"]; c.attr("role") || e(c, f) || c.attr("role", "button"); a.config("tabindex") && !c.attr("tabindex") && c.attr("tabindex", 0); if (a.config("bindKeypress") && !d.ngKeypress && !e(c, f)) c.on("keypress", function (a) { function c() { g(b, { $event: a }) } 32 !== a.keyCode && 13 !== a.keyCode || b.$apply(c) }) } } } }]).directive("ngDblclick", ["$aria", function (a) {
        return function (e,
        h, f) { a.config("tabindex") && !h.attr("tabindex") && h.attr("tabindex", 0) }
    }])
})(window, window.angular);
//# sourceMappingURL=angular-aria.min.js.map