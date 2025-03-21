﻿/*
 AngularJS v1.3.15
 (c) 2010-2014 Google, Inc. http://angularjs.org
 License: MIT
*/
(function (N, f, W) {
    'use strict'; f.module("ngAnimate", ["ng"]).directive("ngAnimateChildren", function () { return function (X, C, g) { g = g.ngAnimateChildren; f.isString(g) && 0 === g.length ? C.data("$$ngAnimateChildren", !0) : X.$watch(g, function (f) { C.data("$$ngAnimateChildren", !!f) }) } }).factory("$$animateReflow", ["$$rAF", "$document", function (f, C) { return function (g) { return f(function () { g() }) } }]).config(["$provide", "$animateProvider", function (X, C) {
        function g(f) { for (var n = 0; n < f.length; n++) { var g = f[n]; if (1 == g.nodeType) return g } }
        function ba(f, n) { return g(f) == g(n) } var t = f.noop, n = f.forEach, da = C.$$selectors, aa = f.isArray, ea = f.isString, ga = f.isObject, r = { running: !0 }, u; X.decorator("$animate", ["$delegate", "$$q", "$injector", "$sniffer", "$rootElement", "$$asyncCallback", "$rootScope", "$document", "$templateRequest", "$$jqLite", function (O, N, M, Y, y, H, P, W, Z, Q) {
            function R(a, c) { var b = a.data("$$ngAnimateState") || {}; c && (b.running = !0, b.structural = !0, a.data("$$ngAnimateState", b)); return b.disabled || b.running && b.structural } function D(a) {
                var c, b = N.defer();
                b.promise.$$cancelFn = function () { c && c() }; P.$$postDigest(function () { c = a(function () { b.resolve() }) }); return b.promise
            } function I(a) { if (ga(a)) return a.tempClasses && ea(a.tempClasses) && (a.tempClasses = a.tempClasses.split(/\s+/)), a } function S(a, c, b) {
                b = b || {}; var d = {}; n(b, function (e, a) { n(a.split(" "), function (a) { d[a] = e }) }); var h = Object.create(null); n((a.attr("class") || "").split(/\s+/), function (e) { h[e] = !0 }); var f = [], l = []; n(c && c.classes || [], function (e, a) {
                    var b = h[a], c = d[a] || {}; !1 === e ? (b || "addClass" == c.event) &&
                    l.push(a) : !0 === e && (b && "removeClass" != c.event || f.push(a))
                }); return 0 < f.length + l.length && [f.join(" "), l.join(" ")]
            } function T(a) { if (a) { var c = [], b = {}; a = a.substr(1).split("."); (Y.transitions || Y.animations) && c.push(M.get(da[""])); for (var d = 0; d < a.length; d++) { var f = a[d], k = da[f]; k && !b[f] && (c.push(M.get(k)), b[f] = !0) } return c } } function U(a, c, b, d) {
                function h(e, a) {
                    var b = e[a], c = e["before" + a.charAt(0).toUpperCase() + a.substr(1)]; if (b || c) return "leave" == a && (c = b, b = null), u.push({ event: a, fn: b }), J.push({ event: a, fn: c }),
                    !0
                } function k(c, l, w) { var E = []; n(c, function (a) { a.fn && E.push(a) }); var m = 0; n(E, function (c, f) { var p = function () { a: { if (l) { (l[f] || t)(); if (++m < E.length) break a; l = null } w() } }; switch (c.event) { case "setClass": l.push(c.fn(a, e, A, p, d)); break; case "animate": l.push(c.fn(a, b, d.from, d.to, p)); break; case "addClass": l.push(c.fn(a, e || b, p, d)); break; case "removeClass": l.push(c.fn(a, A || b, p, d)); break; default: l.push(c.fn(a, p, d)) } }); l && 0 === l.length && w() } var l = a[0]; if (l) {
                    d && (d.to = d.to || {}, d.from = d.from || {}); var e, A; aa(b) && (e =
                    b[0], A = b[1], e ? A ? b = e + " " + A : (b = e, c = "addClass") : (b = A, c = "removeClass")); var w = "setClass" == c, E = w || "addClass" == c || "removeClass" == c || "animate" == c, p = a.attr("class") + " " + b; if (x(p)) {
                        var ca = t, m = [], J = [], g = t, s = [], u = [], p = (" " + p).replace(/\s+/g, "."); n(T(p), function (a) { !h(a, c) && w && (h(a, "addClass"), h(a, "removeClass")) }); return {
                            node: l, event: c, className: b, isClassBased: E, isSetClassOperation: w, applyStyles: function () { d && a.css(f.extend(d.from || {}, d.to || {})) }, before: function (a) { ca = a; k(J, m, function () { ca = t; a() }) }, after: function (a) {
                                g =
                                a; k(u, s, function () { g = t; a() })
                            }, cancel: function () { m && (n(m, function (a) { (a || t)(!0) }), ca(!0)); s && (n(s, function (a) { (a || t)(!0) }), g(!0)) }
                        }
                    }
                }
            } function G(a, c, b, d, h, k, l, e) {
                function A(e) { var l = "$animate:" + e; J && J[l] && 0 < J[l].length && H(function () { b.triggerHandler(l, { event: a, className: c }) }) } function w() { A("before") } function E() { A("after") } function p() { p.hasBeenRun || (p.hasBeenRun = !0, k()) } function g() {
                    if (!g.hasBeenRun) {
                        m && m.applyStyles(); g.hasBeenRun = !0; l && l.tempClasses && n(l.tempClasses, function (a) {
                            u.removeClass(b,
                            a)
                        }); var w = b.data("$$ngAnimateState"); w && (m && m.isClassBased ? B(b, c) : (H(function () { var e = b.data("$$ngAnimateState") || {}; fa == e.index && B(b, c, a) }), b.data("$$ngAnimateState", w))); A("close"); e()
                    }
                } var m = U(b, a, c, l); if (!m) return p(), w(), E(), g(), t; a = m.event; c = m.className; var J = f.element._data(m.node), J = J && J.events; d || (d = h ? h.parent() : b.parent()); if (z(b, d)) return p(), w(), E(), g(), t; d = b.data("$$ngAnimateState") || {}; var L = d.active || {}, s = d.totalActive || 0, q = d.last; h = !1; if (0 < s) {
                    s = []; if (m.isClassBased) "setClass" == q.event ?
                    (s.push(q), B(b, c)) : L[c] && (v = L[c], v.event == a ? h = !0 : (s.push(v), B(b, c))); else if ("leave" == a && L["ng-leave"]) h = !0; else { for (var v in L) s.push(L[v]); d = {}; B(b, !0) } 0 < s.length && n(s, function (a) { a.cancel() })
                } !m.isClassBased || m.isSetClassOperation || "animate" == a || h || (h = "addClass" == a == b.hasClass(c)); if (h) return p(), w(), E(), A("close"), e(), t; L = d.active || {}; s = d.totalActive || 0; if ("leave" == a) b.one("$destroy", function (a) { a = f.element(this); var e = a.data("$$ngAnimateState"); e && (e = e.active["ng-leave"]) && (e.cancel(), B(a, "ng-leave")) });
                u.addClass(b, "ng-animate"); l && l.tempClasses && n(l.tempClasses, function (a) { u.addClass(b, a) }); var fa = K++; s++; L[c] = m; b.data("$$ngAnimateState", { last: m, active: L, index: fa, totalActive: s }); w(); m.before(function (e) { var l = b.data("$$ngAnimateState"); e = e || !l || !l.active[c] || m.isClassBased && l.active[c].event != a; p(); !0 === e ? g() : (E(), m.after(g)) }); return m.cancel
            } function q(a) {
                if (a = g(a)) a = f.isFunction(a.getElementsByClassName) ? a.getElementsByClassName("ng-animate") : a.querySelectorAll(".ng-animate"), n(a, function (a) {
                    a =
                    f.element(a); (a = a.data("$$ngAnimateState")) && a.active && n(a.active, function (a) { a.cancel() })
                })
            } function B(a, c) { if (ba(a, y)) r.disabled || (r.running = !1, r.structural = !1); else if (c) { var b = a.data("$$ngAnimateState") || {}, d = !0 === c; !d && b.active && b.active[c] && (b.totalActive--, delete b.active[c]); if (d || !b.totalActive) u.removeClass(a, "ng-animate"), a.removeData("$$ngAnimateState") } } function z(a, c) {
                if (r.disabled) return !0; if (ba(a, y)) return r.running; var b, d, g; do {
                    if (0 === c.length) break; var k = ba(c, y), l = k ? r : c.data("$$ngAnimateState") ||
                    {}; if (l.disabled) return !0; k && (g = !0); !1 !== b && (k = c.data("$$ngAnimateChildren"), f.isDefined(k) && (b = k)); d = d || l.running || l.last && !l.last.isClassBased
                } while (c = c.parent()); return !g || !b && d
            } u = Q; y.data("$$ngAnimateState", r); var $ = P.$watch(function () { return Z.totalPendingRequests }, function (a, c) { 0 === a && ($(), P.$$postDigest(function () { P.$$postDigest(function () { r.running = !1 }) })) }), K = 0, V = C.classNameFilter(), x = V ? function (a) { return V.test(a) } : function () { return !0 }; return {
                animate: function (a, c, b, d, h) {
                    d = d || "ng-inline-animate";
                    h = I(h) || {}; h.from = b ? c : null; h.to = b ? b : c; return D(function (b) { return G("animate", d, f.element(g(a)), null, null, t, h, b) })
                }, enter: function (a, c, b, d) { d = I(d); a = f.element(a); c = c && f.element(c); b = b && f.element(b); R(a, !0); O.enter(a, c, b); return D(function (h) { return G("enter", "ng-enter", f.element(g(a)), c, b, t, d, h) }) }, leave: function (a, c) { c = I(c); a = f.element(a); q(a); R(a, !0); return D(function (b) { return G("leave", "ng-leave", f.element(g(a)), null, null, function () { O.leave(a) }, c, b) }) }, move: function (a, c, b, d) {
                    d = I(d); a = f.element(a);
                    c = c && f.element(c); b = b && f.element(b); q(a); R(a, !0); O.move(a, c, b); return D(function (h) { return G("move", "ng-move", f.element(g(a)), c, b, t, d, h) })
                }, addClass: function (a, c, b) { return this.setClass(a, c, [], b) }, removeClass: function (a, c, b) { return this.setClass(a, [], c, b) }, setClass: function (a, c, b, d) {
                    d = I(d); a = f.element(a); a = f.element(g(a)); if (R(a)) return O.$$setClassImmediately(a, c, b, d); var h, k = a.data("$$animateClasses"), l = !!k; k || (k = { classes: {} }); h = k.classes; c = aa(c) ? c : c.split(" "); n(c, function (a) {
                        a && a.length && (h[a] =
                        !0)
                    }); b = aa(b) ? b : b.split(" "); n(b, function (a) { a && a.length && (h[a] = !1) }); if (l) return d && k.options && (k.options = f.extend(k.options || {}, d)), k.promise; a.data("$$animateClasses", k = { classes: h, options: d }); return k.promise = D(function (e) {
                        var l = a.parent(), b = g(a), c = b.parentNode; if (!c || c.$$NG_REMOVED || b.$$NG_REMOVED) e(); else {
                            b = a.data("$$animateClasses"); a.removeData("$$animateClasses"); var c = a.data("$$ngAnimateState") || {}, d = S(a, b, c.active); return d ? G("setClass", d, a, l, null, function () {
                                d[0] && O.$$addClassImmediately(a,
                                d[0]); d[1] && O.$$removeClassImmediately(a, d[1])
                            }, b.options, e) : e()
                        }
                    })
                }, cancel: function (a) { a.$$cancelFn() }, enabled: function (a, c) { switch (arguments.length) { case 2: if (a) B(c); else { var b = c.data("$$ngAnimateState") || {}; b.disabled = !0; c.data("$$ngAnimateState", b) } break; case 1: r.disabled = !a; break; default: a = !r.disabled } return !!a }
            }
        }]); C.register("", ["$window", "$sniffer", "$timeout", "$$animateReflow", function (r, C, M, Y) {
            function y() { b || (b = Y(function () { c = []; b = null; x = {} })) } function H(a, e) {
                b && b(); c.push(e); b = Y(function () {
                    n(c,
                    function (a) { a() }); c = []; b = null; x = {}
                })
            } function P(a, e) { var b = g(a); a = f.element(b); k.push(a); b = Date.now() + e; b <= h || (M.cancel(d), h = b, d = M(function () { X(k); k = [] }, e, !1)) } function X(a) { n(a, function (a) { (a = a.data("$$ngAnimateCSS3Data")) && n(a.closeAnimationFns, function (a) { a() }) }) } function Z(a, e) {
                var b = e ? x[e] : null; if (!b) {
                    var c = 0, d = 0, f = 0, g = 0; n(a, function (a) {
                        if (1 == a.nodeType) {
                            a = r.getComputedStyle(a) || {}; c = Math.max(Q(a[z + "Duration"]), c); d = Math.max(Q(a[z + "Delay"]), d); g = Math.max(Q(a[K + "Delay"]), g); var e = Q(a[K + "Duration"]);
                            0 < e && (e *= parseInt(a[K + "IterationCount"], 10) || 1); f = Math.max(e, f)
                        }
                    }); b = { total: 0, transitionDelay: d, transitionDuration: c, animationDelay: g, animationDuration: f }; e && (x[e] = b)
                } return b
            } function Q(a) { var e = 0; a = ea(a) ? a.split(/\s*,\s*/) : []; n(a, function (a) { e = Math.max(parseFloat(a) || 0, e) }); return e } function R(b, e, c, d) {
                b = 0 <= ["ng-enter", "ng-leave", "ng-move"].indexOf(c); var f, p = e.parent(), h = p.data("$$ngAnimateKey"); h || (p.data("$$ngAnimateKey", ++a), h = a); f = h + "-" + g(e).getAttribute("class"); var p = f + " " + c, h = x[p] ? ++x[p].total :
                0, m = {}; if (0 < h) { var n = c + "-stagger", m = f + " " + n; (f = !x[m]) && u.addClass(e, n); m = Z(e, m); f && u.removeClass(e, n) } u.addClass(e, c); var n = e.data("$$ngAnimateCSS3Data") || {}, k = Z(e, p); f = k.transitionDuration; k = k.animationDuration; if (b && 0 === f && 0 === k) return u.removeClass(e, c), !1; c = d || b && 0 < f; b = 0 < k && 0 < m.animationDelay && 0 === m.animationDuration; e.data("$$ngAnimateCSS3Data", { stagger: m, cacheKey: p, running: n.running || 0, itemIndex: h, blockTransition: c, closeAnimationFns: n.closeAnimationFns || [] }); p = g(e); c && (I(p, !0), d && e.css(d));
                b && (p.style[K + "PlayState"] = "paused"); return !0
            } function D(a, e, b, c, d) {
                function f() { e.off(D, h); u.removeClass(e, k); u.removeClass(e, t); z && M.cancel(z); G(e, b); var a = g(e), c; for (c in s) a.style.removeProperty(s[c]) } function h(a) { a.stopPropagation(); var b = a.originalEvent || a; a = b.$manualTimeStamp || b.timeStamp || Date.now(); b = parseFloat(b.elapsedTime.toFixed(3)); Math.max(a - H, 0) >= C && b >= x && c() } var m = g(e); a = e.data("$$ngAnimateCSS3Data"); if (-1 != m.getAttribute("class").indexOf(b) && a) {
                    var k = "", t = ""; n(b.split(" "), function (a,
                    b) { var e = (0 < b ? " " : "") + a; k += e + "-active"; t += e + "-pending" }); var s = [], q = a.itemIndex, v = a.stagger, r = 0; if (0 < q) { r = 0; 0 < v.transitionDelay && 0 === v.transitionDuration && (r = v.transitionDelay * q); var y = 0; 0 < v.animationDelay && 0 === v.animationDuration && (y = v.animationDelay * q, s.push(B + "animation-play-state")); r = Math.round(100 * Math.max(r, y)) / 100 } r || (u.addClass(e, k), a.blockTransition && I(m, !1)); var F = Z(e, a.cacheKey + " " + k), x = Math.max(F.transitionDuration, F.animationDuration); if (0 === x) u.removeClass(e, k), G(e, b), c(); else {
                        !r &&
                        d && 0 < Object.keys(d).length && (F.transitionDuration || (e.css("transition", F.animationDuration + "s linear all"), s.push("transition")), e.css(d)); var q = Math.max(F.transitionDelay, F.animationDelay), C = 1E3 * q; 0 < s.length && (v = m.getAttribute("style") || "", ";" !== v.charAt(v.length - 1) && (v += ";"), m.setAttribute("style", v + " ")); var H = Date.now(), D = V + " " + $, q = 1E3 * (r + 1.5 * (q + x)), z; 0 < r && (u.addClass(e, t), z = M(function () {
                            z = null; 0 < F.transitionDuration && I(m, !1); 0 < F.animationDuration && (m.style[K + "PlayState"] = ""); u.addClass(e, k);
                            u.removeClass(e, t); d && (0 === F.transitionDuration && e.css("transition", F.animationDuration + "s linear all"), e.css(d), s.push("transition"))
                        }, 1E3 * r, !1)); e.on(D, h); a.closeAnimationFns.push(function () { f(); c() }); a.running++; P(e, q); return f
                    }
                } else c()
            } function I(a, b) { a.style[z + "Property"] = b ? "none" : "" } function S(a, b, c, d) { if (R(a, b, c, d)) return function (a) { a && G(b, c) } } function T(a, b, c, d, f) { if (b.data("$$ngAnimateCSS3Data")) return D(a, b, c, d, f); G(b, c); d() } function U(a, b, c, d, f) {
                var g = S(a, b, c, f.from); if (g) {
                    var h = g; H(b,
                    function () { h = T(a, b, c, d, f.to) }); return function (a) { (h || t)(a) }
                } y(); d()
            } function G(a, b) { u.removeClass(a, b); var c = a.data("$$ngAnimateCSS3Data"); c && (c.running && c.running--, c.running && 0 !== c.running || a.removeData("$$ngAnimateCSS3Data")) } function q(a, b) { var c = ""; a = aa(a) ? a : a.split(/\s+/); n(a, function (a, d) { a && 0 < a.length && (c += (0 < d ? " " : "") + a + b) }); return c } var B = "", z, $, K, V; N.ontransitionend === W && N.onwebkittransitionend !== W ? (B = "-webkit-", z = "WebkitTransition", $ = "webkitTransitionEnd transitionend") : (z = "transition",
            $ = "transitionend"); N.onanimationend === W && N.onwebkitanimationend !== W ? (B = "-webkit-", K = "WebkitAnimation", V = "webkitAnimationEnd animationend") : (K = "animation", V = "animationend"); var x = {}, a = 0, c = [], b, d = null, h = 0, k = []; return {
                animate: function (a, b, c, d, f, g) { g = g || {}; g.from = c; g.to = d; return U("animate", a, b, f, g) }, enter: function (a, b, c) { c = c || {}; return U("enter", a, "ng-enter", b, c) }, leave: function (a, b, c) { c = c || {}; return U("leave", a, "ng-leave", b, c) }, move: function (a, b, c) { c = c || {}; return U("move", a, "ng-move", b, c) }, beforeSetClass: function (a,
                b, c, d, f) { f = f || {}; b = q(c, "-remove") + " " + q(b, "-add"); if (f = S("setClass", a, b, f.from)) return H(a, d), f; y(); d() }, beforeAddClass: function (a, b, c, d) { d = d || {}; if (b = S("addClass", a, q(b, "-add"), d.from)) return H(a, c), b; y(); c() }, beforeRemoveClass: function (a, b, c, d) { d = d || {}; if (b = S("removeClass", a, q(b, "-remove"), d.from)) return H(a, c), b; y(); c() }, setClass: function (a, b, c, d, f) { f = f || {}; c = q(c, "-remove"); b = q(b, "-add"); return T("setClass", a, c + " " + b, d, f.to) }, addClass: function (a, b, c, d) {
                    d = d || {}; return T("addClass", a, q(b, "-add"),
                    c, d.to)
                }, removeClass: function (a, b, c, d) { d = d || {}; return T("removeClass", a, q(b, "-remove"), c, d.to) }
            }
        }])
    }])
})(window, window.angular);
//# sourceMappingURL=angular-animate.min.js.map