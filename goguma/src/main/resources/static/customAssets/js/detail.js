/*! jQuery v1.12.4 | (c) jQuery Foundation | jquery.org/license */
function SetCaretAtEnd(e) {
    var t = e.value.length;
    if (document.selection) {
        e.focus();
        var n = document.selection.createRange();
        n.moveStart("character", -t),
        n.moveStart("character", t),
        n.moveEnd("character", 0),
        n.select()
    } else
        (e.selectionStart || "0" == e.selectionStart) && (e.selectionStart = t,
        e.selectionEnd = t,
        e.focus())
}
function changeRegion(e) {
    var t = window.location.toString();
    t.indexOf("?") > 0 && (t = t.substring(0, t.indexOf("?"))),
    window.location.href = t + "?region_id=" + e
}
function redirectAppLink(e) {
    "mobile" === util.userAgent().platform && daumtools.web2app({
        urlScheme: e,
        intentURI: e,
        storeURL: "#",
        appName: "\ub2f9\uadfc",
        onAppMissing: function() {
            console.log("do nothing")
        },
        onUnsupportedEnvironment: function() {
            console.log("unsupported environment")
        },
        willInvokeApp: function() {
            console.log("will invoke app")
        }
    })
}
!function(e, t) {
    "object" == typeof module && "object" == typeof module.exports ? module.exports = e.document ? t(e, !0) : function(e) {
        if (!e.document)
            throw new Error("jQuery requires a window with a document");
        return t(e)
    }
    : t(e)
}("undefined" != typeof window ? window : this, function(e, t) {
    function n(e) {
        var t = !!e && "length"in e && e.length
          , n = fe.type(e);
        return "function" !== n && !fe.isWindow(e) && ("array" === n || 0 === t || "number" == typeof t && t > 0 && t - 1 in e)
    }
    function i(e, t, n) {
        if (fe.isFunction(t))
            return fe.grep(e, function(e, i) {
                return !!t.call(e, i, e) !== n
            });
        if (t.nodeType)
            return fe.grep(e, function(e) {
                return e === t !== n
            });
        if ("string" == typeof t) {
            if (Te.test(t))
                return fe.filter(t, e, n);
            t = fe.filter(t, e)
        }
        return fe.grep(e, function(e) {
            return fe.inArray(e, t) > -1 !== n
        })
    }
    function o(e, t) {
        do {
            e = e[t]
        } while (e && 1 !== e.nodeType);
        return e
    }
    function r(e) {
        var t = {};
        return fe.each(e.match(Le) || [], function(e, n) {
            t[n] = !0
        }),
        t
    }
    function s() {
        ie.addEventListener ? (ie.removeEventListener("DOMContentLoaded", a),
        e.removeEventListener("load", a)) : (ie.detachEvent("onreadystatechange", a),
        e.detachEvent("onload", a))
    }
    function a() {
        (ie.addEventListener || "load" === e.event.type || "complete" === ie.readyState) && (s(),
        fe.ready())
    }
    function l(e, t, n) {
        if (void 0 === n && 1 === e.nodeType) {
            var i = "data-" + t.replace(De, "-$1").toLowerCase();
            if ("string" == typeof (n = e.getAttribute(i))) {
                try {
                    n = "true" === n || "false" !== n && ("null" === n ? null : +n + "" === n ? +n : He.test(n) ? fe.parseJSON(n) : n)
                } catch (oe) {}
                fe.data(e, t, n)
            } else
                n = void 0
        }
        return n
    }
    function d(e) {
        var t;
        for (t in e)
            if (("data" !== t || !fe.isEmptyObject(e[t])) && "toJSON" !== t)
                return !1;
        return !0
    }
    function c(e, t, n, i) {
        if (je(e)) {
            var o, r, s = fe.expando, a = e.nodeType, l = a ? fe.cache : e, d = a ? e[s] : e[s] && s;
            if (d && l[d] && (i || l[d].data) || void 0 !== n || "string" != typeof t)
                return d || (d = a ? e[s] = ne.pop() || fe.guid++ : s),
                l[d] || (l[d] = a ? {} : {
                    toJSON: fe.noop
                }),
                "object" != typeof t && "function" != typeof t || (i ? l[d] = fe.extend(l[d], t) : l[d].data = fe.extend(l[d].data, t)),
                r = l[d],
                i || (r.data || (r.data = {}),
                r = r.data),
                void 0 !== n && (r[fe.camelCase(t)] = n),
                "string" == typeof t ? null == (o = r[t]) && (o = r[fe.camelCase(t)]) : o = r,
                o
        }
    }
    function u(e, t, n) {
        if (je(e)) {
            var i, o, r = e.nodeType, s = r ? fe.cache : e, a = r ? e[fe.expando] : fe.expando;
            if (s[a]) {
                if (t && (i = n ? s[a] : s[a].data)) {
                    fe.isArray(t) ? t = t.concat(fe.map(t, fe.camelCase)) : t in i ? t = [t] : t = (t = fe.camelCase(t))in i ? [t] : t.split(" "),
                    o = t.length;
                    for (; o--; )
                        delete i[t[o]];
                    if (n ? !d(i) : !fe.isEmptyObject(i))
                        return
                }
                (n || (delete s[a].data,
                d(s[a]))) && (r ? fe.cleanData([e], !0) : ue.deleteExpando || s != s.window ? delete s[a] : s[a] = void 0)
            }
        }
    }
    function p(e, t, n, i) {
        var o, r = 1, s = 20, a = i ? function() {
            return i.cur()
        }
        : function() {
            return fe.css(e, t, "")
        }
        , l = a(), d = n && n[3] || (fe.cssNumber[t] ? "" : "px"), c = (fe.cssNumber[t] || "px" !== d && +l) && Me.exec(fe.css(e, t));
        if (c && c[3] !== d) {
            d = d || c[3],
            n = n || [],
            c = +l || 1;
            do {
                c /= r = r || ".5",
                fe.style(e, t, c + d)
            } while (r !== (r = a() / l) && 1 !== r && --s)
        }
        return n && (c = +c || +l || 0,
        o = n[1] ? c + (n[1] + 1) * n[2] : +n[2],
        i && (i.unit = d,
        i.start = c,
        i.end = o)),
        o
    }
    function f(e) {
        var t = _e.split("|")
          , n = e.createDocumentFragment();
        if (n.createElement)
            for (; t.length; )
                n.createElement(t.pop());
        return n
    }
    function h(e, t) {
        var n, i, o = 0, r = "undefined" != typeof e.getElementsByTagName ? e.getElementsByTagName(t || "*") : "undefined" != typeof e.querySelectorAll ? e.querySelectorAll(t || "*") : void 0;
        if (!r)
            for (r = [],
            n = e.childNodes || e; null != (i = n[o]); o++)
                !t || fe.nodeName(i, t) ? r.push(i) : fe.merge(r, h(i, t));
        return void 0 === t || t && fe.nodeName(e, t) ? fe.merge([e], r) : r
    }
    function v(e, t) {
        for (var n, i = 0; null != (n = e[i]); i++)
            fe._data(n, "globalEval", !t || fe._data(t[i], "globalEval"))
    }
    function g(e) {
        Ie.test(e.type) && (e.defaultChecked = e.checked)
    }
    function m(e, t, n, i, o) {
        for (var r, s, a, l, d, c, u, p = e.length, m = f(t), y = [], w = 0; p > w; w++)
            if ((s = e[w]) || 0 === s)
                if ("object" === fe.type(s))
                    fe.merge(y, s.nodeType ? [s] : s);
                else if (Ue.test(s)) {
                    for (l = l || m.appendChild(t.createElement("div")),
                    d = (Fe.exec(s) || ["", ""])[1].toLowerCase(),
                    u = Be[d] || Be._default,
                    l.innerHTML = u[1] + fe.htmlPrefilter(s) + u[2],
                    r = u[0]; r--; )
                        l = l.lastChild;
                    if (!ue.leadingWhitespace && We.test(s) && y.push(t.createTextNode(We.exec(s)[0])),
                    !ue.tbody)
                        for (r = (s = "table" !== d || Xe.test(s) ? "<table>" !== u[1] || Xe.test(s) ? 0 : l : l.firstChild) && s.childNodes.length; r--; )
                            fe.nodeName(c = s.childNodes[r], "tbody") && !c.childNodes.length && s.removeChild(c);
                    for (fe.merge(y, l.childNodes),
                    l.textContent = ""; l.firstChild; )
                        l.removeChild(l.firstChild);
                    l = m.lastChild
                } else
                    y.push(t.createTextNode(s));
        for (l && m.removeChild(l),
        ue.appendChecked || fe.grep(h(y, "input"), g),
        w = 0; s = y[w++]; )
            if (i && fe.inArray(s, i) > -1)
                o && o.push(s);
            else if (a = fe.contains(s.ownerDocument, s),
            l = h(m.appendChild(s), "script"),
            a && v(l),
            n)
                for (r = 0; s = l[r++]; )
                    Re.test(s.type || "") && n.push(s);
        return l = null,
        m
    }
    function y() {
        return !0
    }
    function w() {
        return !1
    }
    function b() {
        try {
            return ie.activeElement
        } catch (e) {}
    }
    function x(e, t, n, i, o, r) {
        var s, a;
        if ("object" == typeof t) {
            for (a in "string" != typeof n && (i = i || n,
            n = void 0),
            t)
                x(e, a, n, i, t[a], r);
            return e
        }
        if (null == i && null == o ? (o = n,
        i = n = void 0) : null == o && ("string" == typeof n ? (o = i,
        i = void 0) : (o = i,
        i = n,
        n = void 0)),
        !1 === o)
            o = w;
        else if (!o)
            return e;
        return 1 === r && (s = o,
        (o = function(e) {
            return fe().off(e),
            s.apply(this, arguments)
        }
        ).guid = s.guid || (s.guid = fe.guid++)),
        e.each(function() {
            fe.event.add(this, t, o, i, n)
        })
    }
    function k(e, t) {
        return fe.nodeName(e, "table") && fe.nodeName(11 !== t.nodeType ? t : t.firstChild, "tr") ? e.getElementsByTagName("tbody")[0] || e.appendChild(e.ownerDocument.createElement("tbody")) : e
    }
    function T(e) {
        return e.type = (null !== fe.find.attr(e, "type")) + "/" + e.type,
        e
    }
    function S(e) {
        var t = it.exec(e.type);
        return t ? e.type = t[1] : e.removeAttribute("type"),
        e
    }
    function C(e, t) {
        if (1 === t.nodeType && fe.hasData(e)) {
            var n, i, o, r = fe._data(e), s = fe._data(t, r), a = r.events;
            if (a)
                for (n in delete s.handle,
                s.events = {},
                a)
                    for (i = 0,
                    o = a[n].length; o > i; i++)
                        fe.event.add(t, n, a[n][i]);
            s.data && (s.data = fe.extend({}, s.data))
        }
    }
    function $(e, t) {
        var n, i, o;
        if (1 === t.nodeType) {
            if (n = t.nodeName.toLowerCase(),
            !ue.noCloneEvent && t[fe.expando]) {
                for (i in (o = fe._data(t)).events)
                    fe.removeEvent(t, i, o.handle);
                t.removeAttribute(fe.expando)
            }
            "script" === n && t.text !== e.text ? (T(t).text = e.text,
            S(t)) : "object" === n ? (t.parentNode && (t.outerHTML = e.outerHTML),
            ue.html5Clone && e.innerHTML && !fe.trim(t.innerHTML) && (t.innerHTML = e.innerHTML)) : "input" === n && Ie.test(e.type) ? (t.defaultChecked = t.checked = e.checked,
            t.value !== e.value && (t.value = e.value)) : "option" === n ? t.defaultSelected = t.selected = e.defaultSelected : "input" !== n && "textarea" !== n || (t.defaultValue = e.defaultValue)
        }
    }
    function A(e, t, n, i) {
        t = re.apply([], t);
        var o, r, s, a, l, d, c = 0, u = e.length, p = u - 1, f = t[0], v = fe.isFunction(f);
        if (v || u > 1 && "string" == typeof f && !ue.checkClone && nt.test(f))
            return e.each(function(o) {
                var r = e.eq(o);
                v && (t[0] = f.call(this, o, r.html())),
                A(r, t, n, i)
            });
        if (u && (o = (d = m(t, e[0].ownerDocument, !1, e, i)).firstChild,
        1 === d.childNodes.length && (d = o),
        o || i)) {
            for (s = (a = fe.map(h(d, "script"), T)).length; u > c; c++)
                r = d,
                c !== p && (r = fe.clone(r, !0, !0),
                s && fe.merge(a, h(r, "script"))),
                n.call(e[c], r, c);
            if (s)
                for (l = a[a.length - 1].ownerDocument,
                fe.map(a, S),
                c = 0; s > c; c++)
                    r = a[c],
                    Re.test(r.type || "") && !fe._data(r, "globalEval") && fe.contains(l, r) && (r.src ? fe._evalUrl && fe._evalUrl(r.src) : fe.globalEval((r.text || r.textContent || r.innerHTML || "").replace(ot, "")));
            d = o = null
        }
        return e
    }
    function E(e, t, n) {
        for (var i, o = t ? fe.filter(t, e) : e, r = 0; null != (i = o[r]); r++)
            n || 1 !== i.nodeType || fe.cleanData(h(i)),
            i.parentNode && (n && fe.contains(i.ownerDocument, i) && v(h(i, "script")),
            i.parentNode.removeChild(i));
        return e
    }
    function N(e, t) {
        var n = fe(t.createElement(e)).appendTo(t.body)
          , i = fe.css(n[0], "display");
        return n.detach(),
        i
    }
    function L(e) {
        var t = ie
          , n = at[e];
        return n || ("none" !== (n = N(e, t)) && n || ((t = ((st = (st || fe("<iframe frameborder='0' width='0' height='0'/>")).appendTo(t.documentElement))[0].contentWindow || st[0].contentDocument).document).write(),
        t.close(),
        n = N(e, t),
        st.detach()),
        at[e] = n),
        n
    }
    function j(e, t) {
        return {
            get: function() {
                return e() ? void delete this.get : (this.get = t).apply(this, arguments)
            }
        }
    }
    function H(e) {
        if (e in kt)
            return e;
        for (var t = e.charAt(0).toUpperCase() + e.slice(1), n = xt.length; n--; )
            if ((e = xt[n] + t)in kt)
                return e
    }
    function D(e, t) {
        for (var n, i, o, r = [], s = 0, a = e.length; a > s; s++)
            (i = e[s]).style && (r[s] = fe._data(i, "olddisplay"),
            n = i.style.display,
            t ? (r[s] || "none" !== n || (i.style.display = ""),
            "" === i.style.display && qe(i) && (r[s] = fe._data(i, "olddisplay", L(i.nodeName)))) : (o = qe(i),
            (n && "none" !== n || !o) && fe._data(i, "olddisplay", o ? n : fe.css(i, "display"))));
        for (s = 0; a > s; s++)
            (i = e[s]).style && (t && "none" !== i.style.display && "" !== i.style.display || (i.style.display = t ? r[s] || "" : "none"));
        return e
    }
    function O(e, t, n) {
        var i = yt.exec(t);
        return i ? Math.max(0, i[1] - (n || 0)) + (i[2] || "px") : t
    }
    function M(e, t, n, i, o) {
        for (var r = n === (i ? "border" : "content") ? 4 : "width" === t ? 1 : 0, s = 0; 4 > r; r += 2)
            "margin" === n && (s += fe.css(e, n + Pe[r], !0, o)),
            i ? ("content" === n && (s -= fe.css(e, "padding" + Pe[r], !0, o)),
            "margin" !== n && (s -= fe.css(e, "border" + Pe[r] + "Width", !0, o))) : (s += fe.css(e, "padding" + Pe[r], !0, o),
            "padding" !== n && (s += fe.css(e, "border" + Pe[r] + "Width", !0, o)));
        return s
    }
    function P(e, t, n) {
        var i = !0
          , o = "width" === t ? e.offsetWidth : e.offsetHeight
          , r = pt(e)
          , s = ue.boxSizing && "border-box" === fe.css(e, "boxSizing", !1, r);
        if (0 >= o || null == o) {
            if ((0 > (o = ft(e, t, r)) || null == o) && (o = e.style[t]),
            dt.test(o))
                return o;
            i = s && (ue.boxSizingReliable() || o === e.style[t]),
            o = parseFloat(o) || 0
        }
        return o + M(e, t, n || (s ? "border" : "content"), i, r) + "px"
    }
    function q(e, t, n, i, o) {
        return new q.prototype.init(e,t,n,i,o)
    }
    function z() {
        return e.setTimeout(function() {
            Tt = void 0
        }),
        Tt = fe.now()
    }
    function I(e, t) {
        var n, i = {
            height: e
        }, o = 0;
        for (t = t ? 1 : 0; 4 > o; o += 2 - t)
            i["margin" + (n = Pe[o])] = i["padding" + n] = e;
        return t && (i.opacity = i.width = e),
        i
    }
    function F(e, t, n) {
        for (var i, o = (_.tweeners[t] || []).concat(_.tweeners["*"]), r = 0, s = o.length; s > r; r++)
            if (i = o[r].call(n, t, e))
                return i
    }
    function R(e, t, n) {
        var i, o, r, s, a, l, d, c = this, u = {}, p = e.style, f = e.nodeType && qe(e), h = fe._data(e, "fxshow");
        for (i in n.queue || (null == (a = fe._queueHooks(e, "fx")).unqueued && (a.unqueued = 0,
        l = a.empty.fire,
        a.empty.fire = function() {
            a.unqueued || l()
        }
        ),
        a.unqueued++,
        c.always(function() {
            c.always(function() {
                a.unqueued--,
                fe.queue(e, "fx").length || a.empty.fire()
            })
        })),
        1 === e.nodeType && ("height"in t || "width"in t) && (n.overflow = [p.overflow, p.overflowX, p.overflowY],
        "inline" === ("none" === (d = fe.css(e, "display")) ? fe._data(e, "olddisplay") || L(e.nodeName) : d) && "none" === fe.css(e, "float") && (ue.inlineBlockNeedsLayout && "inline" !== L(e.nodeName) ? p.zoom = 1 : p.display = "inline-block")),
        n.overflow && (p.overflow = "hidden",
        ue.shrinkWrapBlocks() || c.always(function() {
            p.overflow = n.overflow[0],
            p.overflowX = n.overflow[1],
            p.overflowY = n.overflow[2]
        })),
        t)
            if (o = t[i],
            Ct.exec(o)) {
                if (delete t[i],
                r = r || "toggle" === o,
                o === (f ? "hide" : "show")) {
                    if ("show" !== o || !h || void 0 === h[i])
                        continue;
                    f = !0
                }
                u[i] = h && h[i] || fe.style(e, i)
            } else
                d = void 0;
        if (fe.isEmptyObject(u))
            "inline" === ("none" === d ? L(e.nodeName) : d) && (p.display = d);
        else
            for (i in h ? "hidden"in h && (f = h.hidden) : h = fe._data(e, "fxshow", {}),
            r && (h.hidden = !f),
            f ? fe(e).show() : c.done(function() {
                fe(e).hide()
            }),
            c.done(function() {
                var t;
                for (t in fe._removeData(e, "fxshow"),
                u)
                    fe.style(e, t, u[t])
            }),
            u)
                s = F(f ? h[i] : 0, i, c),
                i in h || (h[i] = s.start,
                f && (s.end = s.start,
                s.start = "width" === i || "height" === i ? 1 : 0))
    }
    function W(e, t) {
        var n, i, o, r, s;
        for (n in e)
            if (o = t[i = fe.camelCase(n)],
            r = e[n],
            fe.isArray(r) && (o = r[1],
            r = e[n] = r[0]),
            n !== i && (e[i] = r,
            delete e[n]),
            (s = fe.cssHooks[i]) && "expand"in s)
                for (n in r = s.expand(r),
                delete e[i],
                r)
                    n in e || (e[n] = r[n],
                    t[n] = o);
            else
                t[i] = o
    }
    function _(e, t, n) {
        var i, o, r = 0, s = _.prefilters.length, a = fe.Deferred().always(function() {
            delete l.elem
        }), l = function() {
            if (o)
                return !1;
            for (var t = Tt || z(), n = Math.max(0, d.startTime + d.duration - t), i = 1 - (n / d.duration || 0), r = 0, s = d.tweens.length; s > r; r++)
                d.tweens[r].run(i);
            return a.notifyWith(e, [d, i, n]),
            1 > i && s ? n : (a.resolveWith(e, [d]),
            !1)
        }, d = a.promise({
            elem: e,
            props: fe.extend({}, t),
            opts: fe.extend(!0, {
                specialEasing: {},
                easing: fe.easing._default
            }, n),
            originalProperties: t,
            originalOptions: n,
            startTime: Tt || z(),
            duration: n.duration,
            tweens: [],
            createTween: function(t, n) {
                var i = fe.Tween(e, d.opts, t, n, d.opts.specialEasing[t] || d.opts.easing);
                return d.tweens.push(i),
                i
            },
            stop: function(t) {
                var n = 0
                  , i = t ? d.tweens.length : 0;
                if (o)
                    return this;
                for (o = !0; i > n; n++)
                    d.tweens[n].run(1);
                return t ? (a.notifyWith(e, [d, 1, 0]),
                a.resolveWith(e, [d, t])) : a.rejectWith(e, [d, t]),
                this
            }
        }), c = d.props;
        for (W(c, d.opts.specialEasing); s > r; r++)
            if (i = _.prefilters[r].call(d, e, c, d.opts))
                return fe.isFunction(i.stop) && (fe._queueHooks(d.elem, d.opts.queue).stop = fe.proxy(i.stop, i)),
                i;
        return fe.map(c, F, d),
        fe.isFunction(d.opts.start) && d.opts.start.call(e, d),
        fe.fx.timer(fe.extend(l, {
            elem: e,
            anim: d,
            queue: d.opts.queue
        })),
        d.progress(d.opts.progress).done(d.opts.done, d.opts.complete).fail(d.opts.fail).always(d.opts.always)
    }
    function B(e) {
        return fe.attr(e, "class") || ""
    }
    function U(e) {
        return function(t, n) {
            "string" != typeof t && (n = t,
            t = "*");
            var i, o = 0, r = t.toLowerCase().match(Le) || [];
            if (fe.isFunction(n))
                for (; i = r[o++]; )
                    "+" === i.charAt(0) ? (i = i.slice(1) || "*",
                    (e[i] = e[i] || []).unshift(n)) : (e[i] = e[i] || []).push(n)
        }
    }
    function X(e, t, n, i) {
        function o(a) {
            var l;
            return r[a] = !0,
            fe.each(e[a] || [], function(e, a) {
                var d = a(t, n, i);
                return "string" != typeof d || s || r[d] ? s ? !(l = d) : void 0 : (t.dataTypes.unshift(d),
                o(d),
                !1)
            }),
            l
        }
        var r = {}
          , s = e === Jt;
        return o(t.dataTypes[0]) || !r["*"] && o("*")
    }
    function Y(e, t) {
        var n, i, o = fe.ajaxSettings.flatOptions || {};
        for (i in t)
            void 0 !== t[i] && ((o[i] ? e : n || (n = {}))[i] = t[i]);
        return n && fe.extend(!0, e, n),
        e
    }
    function V(e, t, n) {
        for (var i, o, r, s, a = e.contents, l = e.dataTypes; "*" === l[0]; )
            l.shift(),
            void 0 === o && (o = e.mimeType || t.getResponseHeader("Content-Type"));
        if (o)
            for (s in a)
                if (a[s] && a[s].test(o)) {
                    l.unshift(s);
                    break
                }
        if (l[0]in n)
            r = l[0];
        else {
            for (s in n) {
                if (!l[0] || e.converters[s + " " + l[0]]) {
                    r = s;
                    break
                }
                i || (i = s)
            }
            r = r || i
        }
        return r ? (r !== l[0] && l.unshift(r),
        n[r]) : void 0
    }
    function G(e, t, n, i) {
        var o, r, s, a, l, d = {}, c = e.dataTypes.slice();
        if (c[1])
            for (s in e.converters)
                d[s.toLowerCase()] = e.converters[s];
        for (r = c.shift(); r; )
            if (e.responseFields[r] && (n[e.responseFields[r]] = t),
            !l && i && e.dataFilter && (t = e.dataFilter(t, e.dataType)),
            l = r,
            r = c.shift())
                if ("*" === r)
                    r = l;
                else if ("*" !== l && l !== r) {
                    if (!(s = d[l + " " + r] || d["* " + r]))
                        for (o in d)
                            if ((a = o.split(" "))[1] === r && (s = d[l + " " + a[0]] || d["* " + a[0]])) {
                                !0 === s ? s = d[o] : !0 !== d[o] && (r = a[0],
                                c.unshift(a[1]));
                                break
                            }
                    if (!0 !== s)
                        if (s && e.throws)
                            t = s(t);
                        else
                            try {
                                t = s(t)
                            } catch (ue) {
                                return {
                                    state: "parsererror",
                                    error: s ? ue : "No conversion from " + l + " to " + r
                                }
                            }
                }
        return {
            state: "success",
            data: t
        }
    }
    function J(e) {
        return e.style && e.style.display || fe.css(e, "display")
    }
    function Q(e) {
        if (!fe.contains(e.ownerDocument || ie, e))
            return !0;
        for (; e && 1 === e.nodeType; ) {
            if ("none" === J(e) || "hidden" === e.type)
                return !0;
            e = e.parentNode
        }
        return !1
    }
    function K(e, t, n, i) {
        var o;
        if (fe.isArray(t))
            fe.each(t, function(t, o) {
                n || tn.test(e) ? i(e, o) : K(e + "[" + ("object" == typeof o && null != o ? t : "") + "]", o, n, i)
            });
        else if (n || "object" !== fe.type(t))
            i(e, t);
        else
            for (o in t)
                K(e + "[" + o + "]", t[o], n, i)
    }
    function Z() {
        try {
            return new e.XMLHttpRequest
        } catch (t) {}
    }
    function ee() {
        try {
            return new e.ActiveXObject("Microsoft.XMLHTTP")
        } catch (t) {}
    }
    function te(e) {
        return fe.isWindow(e) ? e : 9 === e.nodeType && (e.defaultView || e.parentWindow)
    }
    var ne = []
      , ie = e.document
      , oe = ne.slice
      , re = ne.concat
      , se = ne.push
      , ae = ne.indexOf
      , le = {}
      , de = le.toString
      , ce = le.hasOwnProperty
      , ue = {}
      , pe = "1.12.4"
      , fe = function(e, t) {
        return new fe.fn.init(e,t)
    }
      , he = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g
      , ve = /^-ms-/
      , ge = /-([\da-z])/gi
      , me = function(e, t) {
        return t.toUpperCase()
    };
    fe.fn = fe.prototype = {
        jquery: pe,
        constructor: fe,
        selector: "",
        length: 0,
        toArray: function() {
            return oe.call(this)
        },
        get: function(e) {
            return null != e ? 0 > e ? this[e + this.length] : this[e] : oe.call(this)
        },
        pushStack: function(e) {
            var t = fe.merge(this.constructor(), e);
            return t.prevObject = this,
            t.context = this.context,
            t
        },
        each: function(e) {
            return fe.each(this, e)
        },
        map: function(e) {
            return this.pushStack(fe.map(this, function(t, n) {
                return e.call(t, n, t)
            }))
        },
        slice: function() {
            return this.pushStack(oe.apply(this, arguments))
        },
        first: function() {
            return this.eq(0)
        },
        last: function() {
            return this.eq(-1)
        },
        eq: function(e) {
            var t = this.length
              , n = +e + (0 > e ? t : 0);
            return this.pushStack(n >= 0 && t > n ? [this[n]] : [])
        },
        end: function() {
            return this.prevObject || this.constructor()
        },
        push: se,
        sort: ne.sort,
        splice: ne.splice
    },
    fe.extend = fe.fn.extend = function() {
        var e, t, n, i, o, r, s = arguments[0] || {}, a = 1, l = arguments.length, d = !1;
        for ("boolean" == typeof s && (d = s,
        s = arguments[a] || {},
        a++),
        "object" == typeof s || fe.isFunction(s) || (s = {}),
        a === l && (s = this,
        a--); l > a; a++)
            if (null != (o = arguments[a]))
                for (i in o)
                    e = s[i],
                    s !== (n = o[i]) && (d && n && (fe.isPlainObject(n) || (t = fe.isArray(n))) ? (t ? (t = !1,
                    r = e && fe.isArray(e) ? e : []) : r = e && fe.isPlainObject(e) ? e : {},
                    s[i] = fe.extend(d, r, n)) : void 0 !== n && (s[i] = n));
        return s
    }
    ,
    fe.extend({
        expando: "jQuery" + (pe + Math.random()).replace(/\D/g, ""),
        isReady: !0,
        error: function(e) {
            throw new Error(e)
        },
        noop: function() {},
        isFunction: function(e) {
            return "function" === fe.type(e)
        },
        isArray: Array.isArray || function(e) {
            return "array" === fe.type(e)
        }
        ,
        isWindow: function(e) {
            return null != e && e == e.window
        },
        isNumeric: function(e) {
            var t = e && e.toString();
            return !fe.isArray(e) && t - parseFloat(t) + 1 >= 0
        },
        isEmptyObject: function(e) {
            var t;
            for (t in e)
                return !1;
            return !0
        },
        isPlainObject: function(e) {
            var t;
            if (!e || "object" !== fe.type(e) || e.nodeType || fe.isWindow(e))
                return !1;
            try {
                if (e.constructor && !ce.call(e, "constructor") && !ce.call(e.constructor.prototype, "isPrototypeOf"))
                    return !1
            } catch (ne) {
                return !1
            }
            if (!ue.ownFirst)
                for (t in e)
                    return ce.call(e, t);
            for (t in e)
                ;
            return void 0 === t || ce.call(e, t)
        },
        type: function(e) {
            return null == e ? e + "" : "object" == typeof e || "function" == typeof e ? le[de.call(e)] || "object" : typeof e
        },
        globalEval: function(t) {
            t && fe.trim(t) && (e.execScript || function(t) {
                e.eval.call(e, t)
            }
            )(t)
        },
        camelCase: function(e) {
            return e.replace(ve, "ms-").replace(ge, me)
        },
        nodeName: function(e, t) {
            return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase()
        },
        each: function(e, t) {
            var i, o = 0;
            if (n(e))
                for (i = e.length; i > o && !1 !== t.call(e[o], o, e[o]); o++)
                    ;
            else
                for (o in e)
                    if (!1 === t.call(e[o], o, e[o]))
                        break;
            return e
        },
        trim: function(e) {
            return null == e ? "" : (e + "").replace(he, "")
        },
        makeArray: function(e, t) {
            var i = t || [];
            return null != e && (n(Object(e)) ? fe.merge(i, "string" == typeof e ? [e] : e) : se.call(i, e)),
            i
        },
        inArray: function(e, t, n) {
            var i;
            if (t) {
                if (ae)
                    return ae.call(t, e, n);
                for (i = t.length,
                n = n ? 0 > n ? Math.max(0, i + n) : n : 0; i > n; n++)
                    if (n in t && t[n] === e)
                        return n
            }
            return -1
        },
        merge: function(e, t) {
            for (var n = +t.length, i = 0, o = e.length; n > i; )
                e[o++] = t[i++];
            if (n != n)
                for (; void 0 !== t[i]; )
                    e[o++] = t[i++];
            return e.length = o,
            e
        },
        grep: function(e, t, n) {
            for (var i = [], o = 0, r = e.length, s = !n; r > o; o++)
                !t(e[o], o) !== s && i.push(e[o]);
            return i
        },
        map: function(e, t, i) {
            var o, r, s = 0, a = [];
            if (n(e))
                for (o = e.length; o > s; s++)
                    null != (r = t(e[s], s, i)) && a.push(r);
            else
                for (s in e)
                    null != (r = t(e[s], s, i)) && a.push(r);
            return re.apply([], a)
        },
        guid: 1,
        proxy: function(e, t) {
            var n, i, o;
            return "string" == typeof t && (o = e[t],
            t = e,
            e = o),
            fe.isFunction(e) ? (n = oe.call(arguments, 2),
            (i = function() {
                return e.apply(t || this, n.concat(oe.call(arguments)))
            }
            ).guid = e.guid = e.guid || fe.guid++,
            i) : void 0
        },
        now: function() {
            return +new Date
        },
        support: ue
    }),
    "function" == typeof Symbol && (fe.fn[Symbol.iterator] = ne[Symbol.iterator]),
    fe.each("Boolean Number String Function Array Date RegExp Object Error Symbol".split(" "), function(e, t) {
        le["[object " + t + "]"] = t.toLowerCase()
    });
    var ye = function(e) {
        function t(e, t, n, i) {
            var o, r, s, a, l, d, u, f, h = t && t.ownerDocument, v = t ? t.nodeType : 9;
            if (n = n || [],
            "string" != typeof e || !e || 1 !== v && 9 !== v && 11 !== v)
                return n;
            if (!i && ((t ? t.ownerDocument || t : R) !== D && H(t),
            t = t || D,
            M)) {
                if (11 !== v && (d = ye.exec(e)))
                    if (o = d[1]) {
                        if (9 === v) {
                            if (!(s = t.getElementById(o)))
                                return n;
                            if (s.id === o)
                                return n.push(s),
                                n
                        } else if (h && (s = h.getElementById(o)) && I(t, s) && s.id === o)
                            return n.push(s),
                            n
                    } else {
                        if (d[2])
                            return Z.apply(n, t.getElementsByTagName(e)),
                            n;
                        if ((o = d[3]) && k.getElementsByClassName && t.getElementsByClassName)
                            return Z.apply(n, t.getElementsByClassName(o)),
                            n
                    }
                if (k.qsa && !X[e + " "] && (!P || !P.test(e))) {
                    if (1 !== v)
                        h = t,
                        f = e;
                    else if ("object" !== t.nodeName.toLowerCase()) {
                        for ((a = t.getAttribute("id")) ? a = a.replace(be, "\\$&") : t.setAttribute("id", a = F),
                        r = (u = $(e)).length,
                        l = fe.test(a) ? "#" + a : "[id='" + a + "']"; r--; )
                            u[r] = l + " " + p(u[r]);
                        f = u.join(","),
                        h = we.test(e) && c(t.parentNode) || t
                    }
                    if (f)
                        try {
                            return Z.apply(n, h.querySelectorAll(f)),
                            n
                        } catch (B) {} finally {
                            a === F && t.removeAttribute("id")
                        }
                }
            }
            return E(e.replace(le, "$1"), t, n, i)
        }
        function n() {
            function e(n, i) {
                return t.push(n + " ") > T.cacheLength && delete e[t.shift()],
                e[n + " "] = i
            }
            var t = [];
            return e
        }
        function i(e) {
            return e[F] = !0,
            e
        }
        function o(e) {
            var t = D.createElement("div");
            try {
                return !!e(t)
            } catch (k) {
                return !1
            } finally {
                t.parentNode && t.parentNode.removeChild(t),
                t = null
            }
        }
        function r(e, t) {
            for (var n = e.split("|"), i = n.length; i--; )
                T.attrHandle[n[i]] = t
        }
        function s(e, t) {
            var n = t && e
              , i = n && 1 === e.nodeType && 1 === t.nodeType && (~t.sourceIndex || V) - (~e.sourceIndex || V);
            if (i)
                return i;
            if (n)
                for (; n = n.nextSibling; )
                    if (n === t)
                        return -1;
            return e ? 1 : -1
        }
        function a(e) {
            return function(t) {
                return "input" === t.nodeName.toLowerCase() && t.type === e
            }
        }
        function l(e) {
            return function(t) {
                var n = t.nodeName.toLowerCase();
                return ("input" === n || "button" === n) && t.type === e
            }
        }
        function d(e) {
            return i(function(t) {
                return t = +t,
                i(function(n, i) {
                    for (var o, r = e([], n.length, t), s = r.length; s--; )
                        n[o = r[s]] && (n[o] = !(i[o] = n[o]))
                })
            })
        }
        function c(e) {
            return e && "undefined" != typeof e.getElementsByTagName && e
        }
        function u() {}
        function p(e) {
            for (var t = 0, n = e.length, i = ""; n > t; t++)
                i += e[t].value;
            return i
        }
        function f(e, t, n) {
            var i = t.dir
              , o = n && "parentNode" === i
              , r = _++;
            return t.first ? function(t, n, r) {
                for (; t = t[i]; )
                    if (1 === t.nodeType || o)
                        return e(t, n, r)
            }
            : function(t, n, s) {
                var a, l, d, c = [W, r];
                if (s) {
                    for (; t = t[i]; )
                        if ((1 === t.nodeType || o) && e(t, n, s))
                            return !0
                } else
                    for (; t = t[i]; )
                        if (1 === t.nodeType || o) {
                            if ((a = (l = (d = t[F] || (t[F] = {}))[t.uniqueID] || (d[t.uniqueID] = {}))[i]) && a[0] === W && a[1] === r)
                                return c[2] = a[2];
                            if (l[i] = c,
                            c[2] = e(t, n, s))
                                return !0
                        }
            }
        }
        function v(e) {
            return e.length > 1 ? function(t, n, i) {
                for (var o = e.length; o--; )
                    if (!e[o](t, n, i))
                        return !1;
                return !0
            }
            : e[0]
        }
        function g(e, n, i) {
            for (var o = 0, r = n.length; r > o; o++)
                t(e, n[o], i);
            return i
        }
        function m(e, t, n, i, o) {
            for (var r, s = [], a = 0, l = e.length, d = null != t; l > a; a++)
                (r = e[a]) && (n && !n(r, i, o) || (s.push(r),
                d && t.push(a)));
            return s
        }
        function y(e, t, n, o, r, s) {
            return o && !o[F] && (o = y(o)),
            r && !r[F] && (r = y(r, s)),
            i(function(i, s, a, l) {
                var d, c, u, p = [], f = [], h = s.length, v = i || g(t || "*", a.nodeType ? [a] : a, []), y = !e || !i && t ? v : m(v, p, e, a, l), w = n ? r || (i ? e : h || o) ? [] : s : y;
                if (n && n(y, w, a, l),
                o)
                    for (d = m(w, f),
                    o(d, [], a, l),
                    c = d.length; c--; )
                        (u = d[c]) && (w[f[c]] = !(y[f[c]] = u));
                if (i) {
                    if (r || e) {
                        if (r) {
                            for (d = [],
                            c = w.length; c--; )
                                (u = w[c]) && d.push(y[c] = u);
                            r(null, w = [], d, l)
                        }
                        for (c = w.length; c--; )
                            (u = w[c]) && (d = r ? te(i, u) : p[c]) > -1 && (i[d] = !(s[d] = u))
                    }
                } else
                    w = m(w === s ? w.splice(h, w.length) : w),
                    r ? r(null, s, w, l) : Z.apply(s, w)
            })
        }
        function w(e) {
            for (var t, n, i, o = e.length, r = T.relative[e[0].type], s = r || T.relative[" "], a = r ? 1 : 0, l = f(function(e) {
                return e === t
            }, s, !0), d = f(function(e) {
                return te(t, e) > -1
            }, s, !0), c = [function(e, n, i) {
                var o = !r && (i || n !== N) || ((t = n).nodeType ? l(e, n, i) : d(e, n, i));
                return t = null,
                o
            }
            ]; o > a; a++)
                if (n = T.relative[e[a].type])
                    c = [f(v(c), n)];
                else {
                    if ((n = T.filter[e[a].type].apply(null, e[a].matches))[F]) {
                        for (i = ++a; o > i && !T.relative[e[i].type]; i++)
                            ;
                        return y(a > 1 && v(c), a > 1 && p(e.slice(0, a - 1).concat({
                            value: " " === e[a - 2].type ? "*" : ""
                        })).replace(le, "$1"), n, i > a && w(e.slice(a, i)), o > i && w(e = e.slice(i)), o > i && p(e))
                    }
                    c.push(n)
                }
            return v(c)
        }
        function b(e, n) {
            var o = n.length > 0
              , r = e.length > 0
              , s = function(i, s, a, l, d) {
                var c, u, p, f = 0, h = "0", v = i && [], g = [], y = N, w = i || r && T.find.TAG("*", d), b = W += null == y ? 1 : Math.random() || .1, x = w.length;
                for (d && (N = s === D || s || d); h !== x && null != (c = w[h]); h++) {
                    if (r && c) {
                        for (u = 0,
                        s || c.ownerDocument === D || (H(c),
                        a = !M); p = e[u++]; )
                            if (p(c, s || D, a)) {
                                l.push(c);
                                break
                            }
                        d && (W = b)
                    }
                    o && ((c = !p && c) && f--,
                    i && v.push(c))
                }
                if (f += h,
                o && h !== f) {
                    for (u = 0; p = n[u++]; )
                        p(v, g, s, a);
                    if (i) {
                        if (f > 0)
                            for (; h--; )
                                v[h] || g[h] || (g[h] = Q.call(l));
                        g = m(g)
                    }
                    Z.apply(l, g),
                    d && !i && g.length > 0 && f + n.length > 1 && t.uniqueSort(l)
                }
                return d && (W = b,
                N = y),
                v
            };
            return o ? i(s) : s
        }
        var x, k, T, S, C, $, A, E, N, L, j, H, D, O, M, P, q, z, I, F = "sizzle" + 1 * new Date, R = e.document, W = 0, _ = 0, B = n(), U = n(), X = n(), Y = function(e, t) {
            return e === t && (j = !0),
            0
        }, V = 1 << 31, G = {}.hasOwnProperty, J = [], Q = J.pop, K = J.push, Z = J.push, ee = J.slice, te = function(e, t) {
            for (var n = 0, i = e.length; i > n; n++)
                if (e[n] === t)
                    return n;
            return -1
        }, ne = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped", ie = "[\\x20\\t\\r\\n\\f]", oe = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+", re = "\\[" + ie + "*(" + oe + ")(?:" + ie + "*([*^$|!~]?=)" + ie + "*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|(" + oe + "))|)" + ie + "*\\]", se = ":(" + oe + ")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|" + re + ")*)|.*)\\)|)", ae = new RegExp(ie + "+","g"), le = new RegExp("^" + ie + "+|((?:^|[^\\\\])(?:\\\\.)*)" + ie + "+$","g"), de = new RegExp("^" + ie + "*," + ie + "*"), ce = new RegExp("^" + ie + "*([>+~]|" + ie + ")" + ie + "*"), ue = new RegExp("=" + ie + "*([^\\]'\"]*?)" + ie + "*\\]","g"), pe = new RegExp(se), fe = new RegExp("^" + oe + "$"), he = {
            ID: new RegExp("^#(" + oe + ")"),
            CLASS: new RegExp("^\\.(" + oe + ")"),
            TAG: new RegExp("^(" + oe + "|[*])"),
            ATTR: new RegExp("^" + re),
            PSEUDO: new RegExp("^" + se),
            CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + ie + "*(even|odd|(([+-]|)(\\d*)n|)" + ie + "*(?:([+-]|)" + ie + "*(\\d+)|))" + ie + "*\\)|)","i"),
            bool: new RegExp("^(?:" + ne + ")$","i"),
            needsContext: new RegExp("^" + ie + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + ie + "*((?:-\\d)?\\d*)" + ie + "*\\)|)(?=[^-]|$)","i")
        }, ve = /^(?:input|select|textarea|button)$/i, ge = /^h\d$/i, me = /^[^{]+\{\s*\[native \w/, ye = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/, we = /[+~]/, be = /'|\\/g, xe = new RegExp("\\\\([\\da-f]{1,6}" + ie + "?|(" + ie + ")|.)","ig"), ke = function(e, t, n) {
            var i = "0x" + t - 65536;
            return i != i || n ? t : 0 > i ? String.fromCharCode(i + 65536) : String.fromCharCode(i >> 10 | 55296, 1023 & i | 56320)
        }, Te = function() {
            H()
        };
        try {
            Z.apply(J = ee.call(R.childNodes), R.childNodes),
            J[R.childNodes.length].nodeType
        } catch (h) {
            Z = {
                apply: J.length ? function(e, t) {
                    K.apply(e, ee.call(t))
                }
                : function(e, t) {
                    for (var n = e.length, i = 0; e[n++] = t[i++]; )
                        ;
                    e.length = n - 1
                }
            }
        }
        for (x in k = t.support = {},
        C = t.isXML = function(e) {
            var t = e && (e.ownerDocument || e).documentElement;
            return !!t && "HTML" !== t.nodeName
        }
        ,
        H = t.setDocument = function(e) {
            var t, n, i = e ? e.ownerDocument || e : R;
            return i !== D && 9 === i.nodeType && i.documentElement ? (O = (D = i).documentElement,
            M = !C(D),
            (n = D.defaultView) && n.top !== n && (n.addEventListener ? n.addEventListener("unload", Te, !1) : n.attachEvent && n.attachEvent("onunload", Te)),
            k.attributes = o(function(e) {
                return e.className = "i",
                !e.getAttribute("className")
            }),
            k.getElementsByTagName = o(function(e) {
                return e.appendChild(D.createComment("")),
                !e.getElementsByTagName("*").length
            }),
            k.getElementsByClassName = me.test(D.getElementsByClassName),
            k.getById = o(function(e) {
                return O.appendChild(e).id = F,
                !D.getElementsByName || !D.getElementsByName(F).length
            }),
            k.getById ? (T.find.ID = function(e, t) {
                if ("undefined" != typeof t.getElementById && M) {
                    var n = t.getElementById(e);
                    return n ? [n] : []
                }
            }
            ,
            T.filter.ID = function(e) {
                var t = e.replace(xe, ke);
                return function(e) {
                    return e.getAttribute("id") === t
                }
            }
            ) : (delete T.find.ID,
            T.filter.ID = function(e) {
                var t = e.replace(xe, ke);
                return function(e) {
                    var n = "undefined" != typeof e.getAttributeNode && e.getAttributeNode("id");
                    return n && n.value === t
                }
            }
            ),
            T.find.TAG = k.getElementsByTagName ? function(e, t) {
                return "undefined" != typeof t.getElementsByTagName ? t.getElementsByTagName(e) : k.qsa ? t.querySelectorAll(e) : void 0
            }
            : function(e, t) {
                var n, i = [], o = 0, r = t.getElementsByTagName(e);
                if ("*" === e) {
                    for (; n = r[o++]; )
                        1 === n.nodeType && i.push(n);
                    return i
                }
                return r
            }
            ,
            T.find.CLASS = k.getElementsByClassName && function(e, t) {
                return "undefined" != typeof t.getElementsByClassName && M ? t.getElementsByClassName(e) : void 0
            }
            ,
            q = [],
            P = [],
            (k.qsa = me.test(D.querySelectorAll)) && (o(function(e) {
                O.appendChild(e).innerHTML = "<a id='" + F + "'></a><select id='" + F + "-\r\\' msallowcapture=''><option selected=''></option></select>",
                e.querySelectorAll("[msallowcapture^='']").length && P.push("[*^$]=" + ie + "*(?:''|\"\")"),
                e.querySelectorAll("[selected]").length || P.push("\\[" + ie + "*(?:value|" + ne + ")"),
                e.querySelectorAll("[id~=" + F + "-]").length || P.push("~="),
                e.querySelectorAll(":checked").length || P.push(":checked"),
                e.querySelectorAll("a#" + F + "+*").length || P.push(".#.+[+~]")
            }),
            o(function(e) {
                var t = D.createElement("input");
                t.setAttribute("type", "hidden"),
                e.appendChild(t).setAttribute("name", "D"),
                e.querySelectorAll("[name=d]").length && P.push("name" + ie + "*[*^$|!~]?="),
                e.querySelectorAll(":enabled").length || P.push(":enabled", ":disabled"),
                e.querySelectorAll("*,:x"),
                P.push(",.*:")
            })),
            (k.matchesSelector = me.test(z = O.matches || O.webkitMatchesSelector || O.mozMatchesSelector || O.oMatchesSelector || O.msMatchesSelector)) && o(function(e) {
                k.disconnectedMatch = z.call(e, "div"),
                z.call(e, "[s!='']:x"),
                q.push("!=", se)
            }),
            P = P.length && new RegExp(P.join("|")),
            q = q.length && new RegExp(q.join("|")),
            t = me.test(O.compareDocumentPosition),
            I = t || me.test(O.contains) ? function(e, t) {
                var n = 9 === e.nodeType ? e.documentElement : e
                  , i = t && t.parentNode;
                return e === i || !(!i || 1 !== i.nodeType || !(n.contains ? n.contains(i) : e.compareDocumentPosition && 16 & e.compareDocumentPosition(i)))
            }
            : function(e, t) {
                if (t)
                    for (; t = t.parentNode; )
                        if (t === e)
                            return !0;
                return !1
            }
            ,
            Y = t ? function(e, t) {
                if (e === t)
                    return j = !0,
                    0;
                var n = !e.compareDocumentPosition - !t.compareDocumentPosition;
                return n || (1 & (n = (e.ownerDocument || e) === (t.ownerDocument || t) ? e.compareDocumentPosition(t) : 1) || !k.sortDetached && t.compareDocumentPosition(e) === n ? e === D || e.ownerDocument === R && I(R, e) ? -1 : t === D || t.ownerDocument === R && I(R, t) ? 1 : L ? te(L, e) - te(L, t) : 0 : 4 & n ? -1 : 1)
            }
            : function(e, t) {
                if (e === t)
                    return j = !0,
                    0;
                var n, i = 0, o = e.parentNode, r = t.parentNode, a = [e], l = [t];
                if (!o || !r)
                    return e === D ? -1 : t === D ? 1 : o ? -1 : r ? 1 : L ? te(L, e) - te(L, t) : 0;
                if (o === r)
                    return s(e, t);
                for (n = e; n = n.parentNode; )
                    a.unshift(n);
                for (n = t; n = n.parentNode; )
                    l.unshift(n);
                for (; a[i] === l[i]; )
                    i++;
                return i ? s(a[i], l[i]) : a[i] === R ? -1 : l[i] === R ? 1 : 0
            }
            ,
            D) : D
        }
        ,
        t.matches = function(e, n) {
            return t(e, null, null, n)
        }
        ,
        t.matchesSelector = function(e, n) {
            if ((e.ownerDocument || e) !== D && H(e),
            n = n.replace(ue, "='$1']"),
            k.matchesSelector && M && !X[n + " "] && (!q || !q.test(n)) && (!P || !P.test(n)))
                try {
                    var i = z.call(e, n);
                    if (i || k.disconnectedMatch || e.document && 11 !== e.document.nodeType)
                        return i
                } catch (S) {}
            return t(n, D, null, [e]).length > 0
        }
        ,
        t.contains = function(e, t) {
            return (e.ownerDocument || e) !== D && H(e),
            I(e, t)
        }
        ,
        t.attr = function(e, t) {
            (e.ownerDocument || e) !== D && H(e);
            var n = T.attrHandle[t.toLowerCase()]
              , i = n && G.call(T.attrHandle, t.toLowerCase()) ? n(e, t, !M) : void 0;
            return void 0 !== i ? i : k.attributes || !M ? e.getAttribute(t) : (i = e.getAttributeNode(t)) && i.specified ? i.value : null
        }
        ,
        t.error = function(e) {
            throw new Error("Syntax error, unrecognized expression: " + e)
        }
        ,
        t.uniqueSort = function(e) {
            var t, n = [], i = 0, o = 0;
            if (j = !k.detectDuplicates,
            L = !k.sortStable && e.slice(0),
            e.sort(Y),
            j) {
                for (; t = e[o++]; )
                    t === e[o] && (i = n.push(o));
                for (; i--; )
                    e.splice(n[i], 1)
            }
            return L = null,
            e
        }
        ,
        S = t.getText = function(e) {
            var t, n = "", i = 0, o = e.nodeType;
            if (o) {
                if (1 === o || 9 === o || 11 === o) {
                    if ("string" == typeof e.textContent)
                        return e.textContent;
                    for (e = e.firstChild; e; e = e.nextSibling)
                        n += S(e)
                } else if (3 === o || 4 === o)
                    return e.nodeValue
            } else
                for (; t = e[i++]; )
                    n += S(t);
            return n
        }
        ,
        (T = t.selectors = {
            cacheLength: 50,
            createPseudo: i,
            match: he,
            attrHandle: {},
            find: {},
            relative: {
                ">": {
                    dir: "parentNode",
                    first: !0
                },
                " ": {
                    dir: "parentNode"
                },
                "+": {
                    dir: "previousSibling",
                    first: !0
                },
                "~": {
                    dir: "previousSibling"
                }
            },
            preFilter: {
                ATTR: function(e) {
                    return e[1] = e[1].replace(xe, ke),
                    e[3] = (e[3] || e[4] || e[5] || "").replace(xe, ke),
                    "~=" === e[2] && (e[3] = " " + e[3] + " "),
                    e.slice(0, 4)
                },
                CHILD: function(e) {
                    return e[1] = e[1].toLowerCase(),
                    "nth" === e[1].slice(0, 3) ? (e[3] || t.error(e[0]),
                    e[4] = +(e[4] ? e[5] + (e[6] || 1) : 2 * ("even" === e[3] || "odd" === e[3])),
                    e[5] = +(e[7] + e[8] || "odd" === e[3])) : e[3] && t.error(e[0]),
                    e
                },
                PSEUDO: function(e) {
                    var t, n = !e[6] && e[2];
                    return he.CHILD.test(e[0]) ? null : (e[3] ? e[2] = e[4] || e[5] || "" : n && pe.test(n) && (t = $(n, !0)) && (t = n.indexOf(")", n.length - t) - n.length) && (e[0] = e[0].slice(0, t),
                    e[2] = n.slice(0, t)),
                    e.slice(0, 3))
                }
            },
            filter: {
                TAG: function(e) {
                    var t = e.replace(xe, ke).toLowerCase();
                    return "*" === e ? function() {
                        return !0
                    }
                    : function(e) {
                        return e.nodeName && e.nodeName.toLowerCase() === t
                    }
                },
                CLASS: function(e) {
                    var t = B[e + " "];
                    return t || (t = new RegExp("(^|" + ie + ")" + e + "(" + ie + "|$)")) && B(e, function(e) {
                        return t.test("string" == typeof e.className && e.className || "undefined" != typeof e.getAttribute && e.getAttribute("class") || "")
                    })
                },
                ATTR: function(e, n, i) {
                    return function(o) {
                        var r = t.attr(o, e);
                        return null == r ? "!=" === n : !n || (r += "",
                        "=" === n ? r === i : "!=" === n ? r !== i : "^=" === n ? i && 0 === r.indexOf(i) : "*=" === n ? i && r.indexOf(i) > -1 : "$=" === n ? i && r.slice(-i.length) === i : "~=" === n ? (" " + r.replace(ae, " ") + " ").indexOf(i) > -1 : "|=" === n && (r === i || r.slice(0, i.length + 1) === i + "-"))
                    }
                },
                CHILD: function(e, t, n, i, o) {
                    var r = "nth" !== e.slice(0, 3)
                      , s = "last" !== e.slice(-4)
                      , a = "of-type" === t;
                    return 1 === i && 0 === o ? function(e) {
                        return !!e.parentNode
                    }
                    : function(t, n, l) {
                        var d, c, u, p, f, h, v = r !== s ? "nextSibling" : "previousSibling", g = t.parentNode, m = a && t.nodeName.toLowerCase(), y = !l && !a, w = !1;
                        if (g) {
                            if (r) {
                                for (; v; ) {
                                    for (p = t; p = p[v]; )
                                        if (a ? p.nodeName.toLowerCase() === m : 1 === p.nodeType)
                                            return !1;
                                    h = v = "only" === e && !h && "nextSibling"
                                }
                                return !0
                            }
                            if (h = [s ? g.firstChild : g.lastChild],
                            s && y) {
                                for (w = (f = (d = (c = (u = (p = g)[F] || (p[F] = {}))[p.uniqueID] || (u[p.uniqueID] = {}))[e] || [])[0] === W && d[1]) && d[2],
                                p = f && g.childNodes[f]; p = ++f && p && p[v] || (w = f = 0) || h.pop(); )
                                    if (1 === p.nodeType && ++w && p === t) {
                                        c[e] = [W, f, w];
                                        break
                                    }
                            } else if (y && (w = f = (d = (c = (u = (p = t)[F] || (p[F] = {}))[p.uniqueID] || (u[p.uniqueID] = {}))[e] || [])[0] === W && d[1]),
                            !1 === w)
                                for (; (p = ++f && p && p[v] || (w = f = 0) || h.pop()) && ((a ? p.nodeName.toLowerCase() !== m : 1 !== p.nodeType) || !++w || (y && ((c = (u = p[F] || (p[F] = {}))[p.uniqueID] || (u[p.uniqueID] = {}))[e] = [W, w]),
                                p !== t)); )
                                    ;
                            return (w -= o) === i || w % i == 0 && w / i >= 0
                        }
                    }
                },
                PSEUDO: function(e, n) {
                    var o, r = T.pseudos[e] || T.setFilters[e.toLowerCase()] || t.error("unsupported pseudo: " + e);
                    return r[F] ? r(n) : r.length > 1 ? (o = [e, e, "", n],
                    T.setFilters.hasOwnProperty(e.toLowerCase()) ? i(function(e, t) {
                        for (var i, o = r(e, n), s = o.length; s--; )
                            e[i = te(e, o[s])] = !(t[i] = o[s])
                    }) : function(e) {
                        return r(e, 0, o)
                    }
                    ) : r
                }
            },
            pseudos: {
                not: i(function(e) {
                    var t = []
                      , n = []
                      , o = A(e.replace(le, "$1"));
                    return o[F] ? i(function(e, t, n, i) {
                        for (var r, s = o(e, null, i, []), a = e.length; a--; )
                            (r = s[a]) && (e[a] = !(t[a] = r))
                    }) : function(e, i, r) {
                        return t[0] = e,
                        o(t, null, r, n),
                        t[0] = null,
                        !n.pop()
                    }
                }),
                has: i(function(e) {
                    return function(n) {
                        return t(e, n).length > 0
                    }
                }),
                contains: i(function(e) {
                    return e = e.replace(xe, ke),
                    function(t) {
                        return (t.textContent || t.innerText || S(t)).indexOf(e) > -1
                    }
                }),
                lang: i(function(e) {
                    return fe.test(e || "") || t.error("unsupported lang: " + e),
                    e = e.replace(xe, ke).toLowerCase(),
                    function(t) {
                        var n;
                        do {
                            if (n = M ? t.lang : t.getAttribute("xml:lang") || t.getAttribute("lang"))
                                return (n = n.toLowerCase()) === e || 0 === n.indexOf(e + "-")
                        } while ((t = t.parentNode) && 1 === t.nodeType);
                        return !1
                    }
                }),
                target: function(t) {
                    var n = e.location && e.location.hash;
                    return n && n.slice(1) === t.id
                },
                root: function(e) {
                    return e === O
                },
                focus: function(e) {
                    return e === D.activeElement && (!D.hasFocus || D.hasFocus()) && !!(e.type || e.href || ~e.tabIndex)
                },
                enabled: function(e) {
                    return !1 === e.disabled
                },
                disabled: function(e) {
                    return !0 === e.disabled
                },
                checked: function(e) {
                    var t = e.nodeName.toLowerCase();
                    return "input" === t && !!e.checked || "option" === t && !!e.selected
                },
                selected: function(e) {
                    return e.parentNode && e.parentNode.selectedIndex,
                    !0 === e.selected
                },
                empty: function(e) {
                    for (e = e.firstChild; e; e = e.nextSibling)
                        if (e.nodeType < 6)
                            return !1;
                    return !0
                },
                parent: function(e) {
                    return !T.pseudos.empty(e)
                },
                header: function(e) {
                    return ge.test(e.nodeName)
                },
                input: function(e) {
                    return ve.test(e.nodeName)
                },
                button: function(e) {
                    var t = e.nodeName.toLowerCase();
                    return "input" === t && "button" === e.type || "button" === t
                },
                text: function(e) {
                    var t;
                    return "input" === e.nodeName.toLowerCase() && "text" === e.type && (null == (t = e.getAttribute("type")) || "text" === t.toLowerCase())
                },
                first: d(function() {
                    return [0]
                }),
                last: d(function(e, t) {
                    return [t - 1]
                }),
                eq: d(function(e, t, n) {
                    return [0 > n ? n + t : n]
                }),
                even: d(function(e, t) {
                    for (var n = 0; t > n; n += 2)
                        e.push(n);
                    return e
                }),
                odd: d(function(e, t) {
                    for (var n = 1; t > n; n += 2)
                        e.push(n);
                    return e
                }),
                lt: d(function(e, t, n) {
                    for (var i = 0 > n ? n + t : n; --i >= 0; )
                        e.push(i);
                    return e
                }),
                gt: d(function(e, t, n) {
                    for (var i = 0 > n ? n + t : n; ++i < t; )
                        e.push(i);
                    return e
                })
            }
        }).pseudos.nth = T.pseudos.eq,
        {
            radio: !0,
            checkbox: !0,
            file: !0,
            password: !0,
            image: !0
        })
            T.pseudos[x] = a(x);
        for (x in {
            submit: !0,
            reset: !0
        })
            T.pseudos[x] = l(x);
        return u.prototype = T.filters = T.pseudos,
        T.setFilters = new u,
        $ = t.tokenize = function(e, n) {
            var i, o, r, s, a, l, d, c = U[e + " "];
            if (c)
                return n ? 0 : c.slice(0);
            for (a = e,
            l = [],
            d = T.preFilter; a; ) {
                for (s in i && !(o = de.exec(a)) || (o && (a = a.slice(o[0].length) || a),
                l.push(r = [])),
                i = !1,
                (o = ce.exec(a)) && (i = o.shift(),
                r.push({
                    value: i,
                    type: o[0].replace(le, " ")
                }),
                a = a.slice(i.length)),
                T.filter)
                    !(o = he[s].exec(a)) || d[s] && !(o = d[s](o)) || (i = o.shift(),
                    r.push({
                        value: i,
                        type: s,
                        matches: o
                    }),
                    a = a.slice(i.length));
                if (!i)
                    break
            }
            return n ? a.length : a ? t.error(e) : U(e, l).slice(0)
        }
        ,
        A = t.compile = function(e, t) {
            var n, i = [], o = [], r = X[e + " "];
            if (!r) {
                for (t || (t = $(e)),
                n = t.length; n--; )
                    (r = w(t[n]))[F] ? i.push(r) : o.push(r);
                (r = X(e, b(o, i))).selector = e
            }
            return r
        }
        ,
        E = t.select = function(e, t, n, i) {
            var o, r, s, a, l, d = "function" == typeof e && e, u = !i && $(e = d.selector || e);
            if (n = n || [],
            1 === u.length) {
                if ((r = u[0] = u[0].slice(0)).length > 2 && "ID" === (s = r[0]).type && k.getById && 9 === t.nodeType && M && T.relative[r[1].type]) {
                    if (!(t = (T.find.ID(s.matches[0].replace(xe, ke), t) || [])[0]))
                        return n;
                    d && (t = t.parentNode),
                    e = e.slice(r.shift().value.length)
                }
                for (o = he.needsContext.test(e) ? 0 : r.length; o-- && (s = r[o],
                !T.relative[a = s.type]); )
                    if ((l = T.find[a]) && (i = l(s.matches[0].replace(xe, ke), we.test(r[0].type) && c(t.parentNode) || t))) {
                        if (r.splice(o, 1),
                        !(e = i.length && p(r)))
                            return Z.apply(n, i),
                            n;
                        break
                    }
            }
            return (d || A(e, u))(i, t, !M, n, !t || we.test(e) && c(t.parentNode) || t),
            n
        }
        ,
        k.sortStable = F.split("").sort(Y).join("") === F,
        k.detectDuplicates = !!j,
        H(),
        k.sortDetached = o(function(e) {
            return 1 & e.compareDocumentPosition(D.createElement("div"))
        }),
        o(function(e) {
            return e.innerHTML = "<a href='#'></a>",
            "#" === e.firstChild.getAttribute("href")
        }) || r("type|href|height|width", function(e, t, n) {
            return n ? void 0 : e.getAttribute(t, "type" === t.toLowerCase() ? 1 : 2)
        }),
        k.attributes && o(function(e) {
            return e.innerHTML = "<input/>",
            e.firstChild.setAttribute("value", ""),
            "" === e.firstChild.getAttribute("value")
        }) || r("value", function(e, t, n) {
            return n || "input" !== e.nodeName.toLowerCase() ? void 0 : e.defaultValue
        }),
        o(function(e) {
            return null == e.getAttribute("disabled")
        }) || r(ne, function(e, t, n) {
            var i;
            return n ? void 0 : !0 === e[t] ? t.toLowerCase() : (i = e.getAttributeNode(t)) && i.specified ? i.value : null
        }),
        t
    }(e);
    fe.find = ye,
    fe.expr = ye.selectors,
    fe.expr[":"] = fe.expr.pseudos,
    fe.uniqueSort = fe.unique = ye.uniqueSort,
    fe.text = ye.getText,
    fe.isXMLDoc = ye.isXML,
    fe.contains = ye.contains;
    var we = function(e, t, n) {
        for (var i = [], o = void 0 !== n; (e = e[t]) && 9 !== e.nodeType; )
            if (1 === e.nodeType) {
                if (o && fe(e).is(n))
                    break;
                i.push(e)
            }
        return i
    }
      , be = function(e, t) {
        for (var n = []; e; e = e.nextSibling)
            1 === e.nodeType && e !== t && n.push(e);
        return n
    }
      , xe = fe.expr.match.needsContext
      , ke = /^<([\w-]+)\s*\/?>(?:<\/\1>|)$/
      , Te = /^.[^:#\[\.,]*$/;
    fe.filter = function(e, t, n) {
        var i = t[0];
        return n && (e = ":not(" + e + ")"),
        1 === t.length && 1 === i.nodeType ? fe.find.matchesSelector(i, e) ? [i] : [] : fe.find.matches(e, fe.grep(t, function(e) {
            return 1 === e.nodeType
        }))
    }
    ,
    fe.fn.extend({
        find: function(e) {
            var t, n = [], i = this, o = i.length;
            if ("string" != typeof e)
                return this.pushStack(fe(e).filter(function() {
                    for (t = 0; o > t; t++)
                        if (fe.contains(i[t], this))
                            return !0
                }));
            for (t = 0; o > t; t++)
                fe.find(e, i[t], n);
            return (n = this.pushStack(o > 1 ? fe.unique(n) : n)).selector = this.selector ? this.selector + " " + e : e,
            n
        },
        filter: function(e) {
            return this.pushStack(i(this, e || [], !1))
        },
        not: function(e) {
            return this.pushStack(i(this, e || [], !0))
        },
        is: function(e) {
            return !!i(this, "string" == typeof e && xe.test(e) ? fe(e) : e || [], !1).length
        }
    });
    var Se, Ce = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/;
    (fe.fn.init = function(e, t, n) {
        var i, o;
        if (!e)
            return this;
        if (n = n || Se,
        "string" == typeof e) {
            if (!(i = "<" === e.charAt(0) && ">" === e.charAt(e.length - 1) && e.length >= 3 ? [null, e, null] : Ce.exec(e)) || !i[1] && t)
                return !t || t.jquery ? (t || n).find(e) : this.constructor(t).find(e);
            if (i[1]) {
                if (t = t instanceof fe ? t[0] : t,
                fe.merge(this, fe.parseHTML(i[1], t && t.nodeType ? t.ownerDocument || t : ie, !0)),
                ke.test(i[1]) && fe.isPlainObject(t))
                    for (i in t)
                        fe.isFunction(this[i]) ? this[i](t[i]) : this.attr(i, t[i]);
                return this
            }
            if ((o = ie.getElementById(i[2])) && o.parentNode) {
                if (o.id !== i[2])
                    return Se.find(e);
                this.length = 1,
                this[0] = o
            }
            return this.context = ie,
            this.selector = e,
            this
        }
        return e.nodeType ? (this.context = this[0] = e,
        this.length = 1,
        this) : fe.isFunction(e) ? "undefined" != typeof n.ready ? n.ready(e) : e(fe) : (void 0 !== e.selector && (this.selector = e.selector,
        this.context = e.context),
        fe.makeArray(e, this))
    }
    ).prototype = fe.fn,
    Se = fe(ie);
    var $e = /^(?:parents|prev(?:Until|All))/
      , Ae = {
        children: !0,
        contents: !0,
        next: !0,
        prev: !0
    };
    fe.fn.extend({
        has: function(e) {
            var t, n = fe(e, this), i = n.length;
            return this.filter(function() {
                for (t = 0; i > t; t++)
                    if (fe.contains(this, n[t]))
                        return !0
            })
        },
        closest: function(e, t) {
            for (var n, i = 0, o = this.length, r = [], s = xe.test(e) || "string" != typeof e ? fe(e, t || this.context) : 0; o > i; i++)
                for (n = this[i]; n && n !== t; n = n.parentNode)
                    if (n.nodeType < 11 && (s ? s.index(n) > -1 : 1 === n.nodeType && fe.find.matchesSelector(n, e))) {
                        r.push(n);
                        break
                    }
            return this.pushStack(r.length > 1 ? fe.uniqueSort(r) : r)
        },
        index: function(e) {
            return e ? "string" == typeof e ? fe.inArray(this[0], fe(e)) : fe.inArray(e.jquery ? e[0] : e, this) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1
        },
        add: function(e, t) {
            return this.pushStack(fe.uniqueSort(fe.merge(this.get(), fe(e, t))))
        },
        addBack: function(e) {
            return this.add(null == e ? this.prevObject : this.prevObject.filter(e))
        }
    }),
    fe.each({
        parent: function(e) {
            var t = e.parentNode;
            return t && 11 !== t.nodeType ? t : null
        },
        parents: function(e) {
            return we(e, "parentNode")
        },
        parentsUntil: function(e, t, n) {
            return we(e, "parentNode", n)
        },
        next: function(e) {
            return o(e, "nextSibling")
        },
        prev: function(e) {
            return o(e, "previousSibling")
        },
        nextAll: function(e) {
            return we(e, "nextSibling")
        },
        prevAll: function(e) {
            return we(e, "previousSibling")
        },
        nextUntil: function(e, t, n) {
            return we(e, "nextSibling", n)
        },
        prevUntil: function(e, t, n) {
            return we(e, "previousSibling", n)
        },
        siblings: function(e) {
            return be((e.parentNode || {}).firstChild, e)
        },
        children: function(e) {
            return be(e.firstChild)
        },
        contents: function(e) {
            return fe.nodeName(e, "iframe") ? e.contentDocument || e.contentWindow.document : fe.merge([], e.childNodes)
        }
    }, function(e, t) {
        fe.fn[e] = function(n, i) {
            var o = fe.map(this, t, n);
            return "Until" !== e.slice(-5) && (i = n),
            i && "string" == typeof i && (o = fe.filter(i, o)),
            this.length > 1 && (Ae[e] || (o = fe.uniqueSort(o)),
            $e.test(e) && (o = o.reverse())),
            this.pushStack(o)
        }
    });
    var Ee, Ne, Le = /\S+/g;
    for (Ne in fe.Callbacks = function(e) {
        e = "string" == typeof e ? r(e) : fe.extend({}, e);
        var t, n, i, o, s = [], a = [], l = -1, d = function() {
            for (o = e.once,
            i = t = !0; a.length; l = -1)
                for (n = a.shift(); ++l < s.length; )
                    !1 === s[l].apply(n[0], n[1]) && e.stopOnFalse && (l = s.length,
                    n = !1);
            e.memory || (n = !1),
            t = !1,
            o && (s = n ? [] : "")
        }, c = {
            add: function() {
                return s && (n && !t && (l = s.length - 1,
                a.push(n)),
                function i(t) {
                    fe.each(t, function(t, n) {
                        fe.isFunction(n) ? e.unique && c.has(n) || s.push(n) : n && n.length && "string" !== fe.type(n) && i(n)
                    })
                }(arguments),
                n && !t && d()),
                this
            },
            remove: function() {
                return fe.each(arguments, function(e, t) {
                    for (var n; (n = fe.inArray(t, s, n)) > -1; )
                        s.splice(n, 1),
                        l >= n && l--
                }),
                this
            },
            has: function(e) {
                return e ? fe.inArray(e, s) > -1 : s.length > 0
            },
            empty: function() {
                return s && (s = []),
                this
            },
            disable: function() {
                return o = a = [],
                s = n = "",
                this
            },
            disabled: function() {
                return !s
            },
            lock: function() {
                return o = !0,
                n || c.disable(),
                this
            },
            locked: function() {
                return !!o
            },
            fireWith: function(e, n) {
                return o || (n = [e, (n = n || []).slice ? n.slice() : n],
                a.push(n),
                t || d()),
                this
            },
            fire: function() {
                return c.fireWith(this, arguments),
                this
            },
            fired: function() {
                return !!i
            }
        };
        return c
    }
    ,
    fe.extend({
        Deferred: function(e) {
            var t = [["resolve", "done", fe.Callbacks("once memory"), "resolved"], ["reject", "fail", fe.Callbacks("once memory"), "rejected"], ["notify", "progress", fe.Callbacks("memory")]]
              , n = "pending"
              , i = {
                state: function() {
                    return n
                },
                always: function() {
                    return o.done(arguments).fail(arguments),
                    this
                },
                then: function() {
                    var e = arguments;
                    return fe.Deferred(function(n) {
                        fe.each(t, function(t, r) {
                            var s = fe.isFunction(e[t]) && e[t];
                            o[r[1]](function() {
                                var e = s && s.apply(this, arguments);
                                e && fe.isFunction(e.promise) ? e.promise().progress(n.notify).done(n.resolve).fail(n.reject) : n[r[0] + "With"](this === i ? n.promise() : this, s ? [e] : arguments)
                            })
                        }),
                        e = null
                    }).promise()
                },
                promise: function(e) {
                    return null != e ? fe.extend(e, i) : i
                }
            }
              , o = {};
            return i.pipe = i.then,
            fe.each(t, function(e, r) {
                var s = r[2]
                  , a = r[3];
                i[r[1]] = s.add,
                a && s.add(function() {
                    n = a
                }, t[1 ^ e][2].disable, t[2][2].lock),
                o[r[0]] = function() {
                    return o[r[0] + "With"](this === o ? i : this, arguments),
                    this
                }
                ,
                o[r[0] + "With"] = s.fireWith
            }),
            i.promise(o),
            e && e.call(o, o),
            o
        },
        when: function(e) {
            var t, n, i, o = 0, r = oe.call(arguments), s = r.length, a = 1 !== s || e && fe.isFunction(e.promise) ? s : 0, l = 1 === a ? e : fe.Deferred(), d = function(e, n, i) {
                return function(o) {
                    n[e] = this,
                    i[e] = arguments.length > 1 ? oe.call(arguments) : o,
                    i === t ? l.notifyWith(n, i) : --a || l.resolveWith(n, i)
                }
            };
            if (s > 1)
                for (t = new Array(s),
                n = new Array(s),
                i = new Array(s); s > o; o++)
                    r[o] && fe.isFunction(r[o].promise) ? r[o].promise().progress(d(o, n, t)).done(d(o, i, r)).fail(l.reject) : --a;
            return a || l.resolveWith(i, r),
            l.promise()
        }
    }),
    fe.fn.ready = function(e) {
        return fe.ready.promise().done(e),
        this
    }
    ,
    fe.extend({
        isReady: !1,
        readyWait: 1,
        holdReady: function(e) {
            e ? fe.readyWait++ : fe.ready(!0)
        },
        ready: function(e) {
            (!0 === e ? --fe.readyWait : fe.isReady) || (fe.isReady = !0,
            !0 !== e && --fe.readyWait > 0 || (Ee.resolveWith(ie, [fe]),
            fe.fn.triggerHandler && (fe(ie).triggerHandler("ready"),
            fe(ie).off("ready"))))
        }
    }),
    fe.ready.promise = function(t) {
        if (!Ee)
            if (Ee = fe.Deferred(),
            "complete" === ie.readyState || "loading" !== ie.readyState && !ie.documentElement.doScroll)
                e.setTimeout(fe.ready);
            else if (ie.addEventListener)
                ie.addEventListener("DOMContentLoaded", a),
                e.addEventListener("load", a);
            else {
                ie.attachEvent("onreadystatechange", a),
                e.attachEvent("onload", a);
                var n = !1;
                try {
                    n = null == e.frameElement && ie.documentElement
                } catch (oe) {}
                n && n.doScroll && function i() {
                    if (!fe.isReady) {
                        try {
                            n.doScroll("left")
                        } catch (t) {
                            return e.setTimeout(i, 50)
                        }
                        s(),
                        fe.ready()
                    }
                }()
            }
        return Ee.promise(t)
    }
    ,
    fe.ready.promise(),
    fe(ue))
        break;
    ue.ownFirst = "0" === Ne,
    ue.inlineBlockNeedsLayout = !1,
    fe(function() {
        var e, t, n, i;
        (n = ie.getElementsByTagName("body")[0]) && n.style && (t = ie.createElement("div"),
        (i = ie.createElement("div")).style.cssText = "position:absolute;border:0;width:0;height:0;top:0;left:-9999px",
        n.appendChild(i).appendChild(t),
        "undefined" != typeof t.style.zoom && (t.style.cssText = "display:inline;margin:0;border:0;padding:1px;width:1px;zoom:1",
        ue.inlineBlockNeedsLayout = e = 3 === t.offsetWidth,
        e && (n.style.zoom = 1)),
        n.removeChild(i))
    }),
    function() {
        var e = ie.createElement("div");
        ue.deleteExpando = !0;
        try {
            delete e.test
        } catch (t) {
            ue.deleteExpando = !1
        }
        e = null
    }();
    var je = function(e) {
        var t = fe.noData[(e.nodeName + " ").toLowerCase()]
          , n = +e.nodeType || 1;
        return (1 === n || 9 === n) && (!t || !0 !== t && e.getAttribute("classid") === t)
    }
      , He = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/
      , De = /([A-Z])/g;
    fe.extend({
        cache: {},
        noData: {
            "applet ": !0,
            "embed ": !0,
            "object ": "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
        },
        hasData: function(e) {
            return !!(e = e.nodeType ? fe.cache[e[fe.expando]] : e[fe.expando]) && !d(e)
        },
        data: function(e, t, n) {
            return c(e, t, n)
        },
        removeData: function(e, t) {
            return u(e, t)
        },
        _data: function(e, t, n) {
            return c(e, t, n, !0)
        },
        _removeData: function(e, t) {
            return u(e, t, !0)
        }
    }),
    fe.fn.extend({
        data: function(e, t) {
            var n, i, o, r = this[0], s = r && r.attributes;
            if (void 0 === e) {
                if (this.length && (o = fe.data(r),
                1 === r.nodeType && !fe._data(r, "parsedAttrs"))) {
                    for (n = s.length; n--; )
                        s[n] && (0 === (i = s[n].name).indexOf("data-") && l(r, i = fe.camelCase(i.slice(5)), o[i]));
                    fe._data(r, "parsedAttrs", !0)
                }
                return o
            }
            return "object" == typeof e ? this.each(function() {
                fe.data(this, e)
            }) : arguments.length > 1 ? this.each(function() {
                fe.data(this, e, t)
            }) : r ? l(r, e, fe.data(r, e)) : void 0
        },
        removeData: function(e) {
            return this.each(function() {
                fe.removeData(this, e)
            })
        }
    }),
    fe.extend({
        queue: function(e, t, n) {
            var i;
            return e ? (t = (t || "fx") + "queue",
            i = fe._data(e, t),
            n && (!i || fe.isArray(n) ? i = fe._data(e, t, fe.makeArray(n)) : i.push(n)),
            i || []) : void 0
        },
        dequeue: function(e, t) {
            t = t || "fx";
            var n = fe.queue(e, t)
              , i = n.length
              , o = n.shift()
              , r = fe._queueHooks(e, t)
              , s = function() {
                fe.dequeue(e, t)
            };
            "inprogress" === o && (o = n.shift(),
            i--),
            o && ("fx" === t && n.unshift("inprogress"),
            delete r.stop,
            o.call(e, s, r)),
            !i && r && r.empty.fire()
        },
        _queueHooks: function(e, t) {
            var n = t + "queueHooks";
            return fe._data(e, n) || fe._data(e, n, {
                empty: fe.Callbacks("once memory").add(function() {
                    fe._removeData(e, t + "queue"),
                    fe._removeData(e, n)
                })
            })
        }
    }),
    fe.fn.extend({
        queue: function(e, t) {
            var n = 2;
            return "string" != typeof e && (t = e,
            e = "fx",
            n--),
            arguments.length < n ? fe.queue(this[0], e) : void 0 === t ? this : this.each(function() {
                var n = fe.queue(this, e, t);
                fe._queueHooks(this, e),
                "fx" === e && "inprogress" !== n[0] && fe.dequeue(this, e)
            })
        },
        dequeue: function(e) {
            return this.each(function() {
                fe.dequeue(this, e)
            })
        },
        clearQueue: function(e) {
            return this.queue(e || "fx", [])
        },
        promise: function(e, t) {
            var n, i = 1, o = fe.Deferred(), r = this, s = this.length, a = function() {
                --i || o.resolveWith(r, [r])
            };
            for ("string" != typeof e && (t = e,
            e = void 0),
            e = e || "fx"; s--; )
                (n = fe._data(r[s], e + "queueHooks")) && n.empty && (i++,
                n.empty.add(a));
            return a(),
            o.promise(t)
        }
    }),
    function() {
        var e;
        ue.shrinkWrapBlocks = function() {
            return null != e ? e : (e = !1,
            (n = ie.getElementsByTagName("body")[0]) && n.style ? (t = ie.createElement("div"),
            (i = ie.createElement("div")).style.cssText = "position:absolute;border:0;width:0;height:0;top:0;left:-9999px",
            n.appendChild(i).appendChild(t),
            "undefined" != typeof t.style.zoom && (t.style.cssText = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:1px;width:1px;zoom:1",
            t.appendChild(ie.createElement("div")).style.width = "5px",
            e = 3 !== t.offsetWidth),
            n.removeChild(i),
            e) : void 0);
            var t, n, i
        }
    }();
    var Oe = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source
      , Me = new RegExp("^(?:([+-])=|)(" + Oe + ")([a-z%]*)$","i")
      , Pe = ["Top", "Right", "Bottom", "Left"]
      , qe = function(e, t) {
        return e = t || e,
        "none" === fe.css(e, "display") || !fe.contains(e.ownerDocument, e)
    }
      , ze = function(e, t, n, i, o, r, s) {
        var a = 0
          , l = e.length
          , d = null == n;
        if ("object" === fe.type(n))
            for (a in o = !0,
            n)
                ze(e, t, a, n[a], !0, r, s);
        else if (void 0 !== i && (o = !0,
        fe.isFunction(i) || (s = !0),
        d && (s ? (t.call(e, i),
        t = null) : (d = t,
        t = function(e, t, n) {
            return d.call(fe(e), n)
        }
        )),
        t))
            for (; l > a; a++)
                t(e[a], n, s ? i : i.call(e[a], a, t(e[a], n)));
        return o ? e : d ? t.call(e) : l ? t(e[0], n) : r
    }
      , Ie = /^(?:checkbox|radio)$/i
      , Fe = /<([\w:-]+)/
      , Re = /^$|\/(?:java|ecma)script/i
      , We = /^\s+/
      , _e = "abbr|article|aside|audio|bdi|canvas|data|datalist|details|dialog|figcaption|figure|footer|header|hgroup|main|mark|meter|nav|output|picture|progress|section|summary|template|time|video";
    !function() {
        var e = ie.createElement("div")
          , t = ie.createDocumentFragment()
          , n = ie.createElement("input");
        e.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",
        ue.leadingWhitespace = 3 === e.firstChild.nodeType,
        ue.tbody = !e.getElementsByTagName("tbody").length,
        ue.htmlSerialize = !!e.getElementsByTagName("link").length,
        ue.html5Clone = "<:nav></:nav>" !== ie.createElement("nav").cloneNode(!0).outerHTML,
        n.type = "checkbox",
        n.checked = !0,
        t.appendChild(n),
        ue.appendChecked = n.checked,
        e.innerHTML = "<textarea>x</textarea>",
        ue.noCloneChecked = !!e.cloneNode(!0).lastChild.defaultValue,
        t.appendChild(e),
        (n = ie.createElement("input")).setAttribute("type", "radio"),
        n.setAttribute("checked", "checked"),
        n.setAttribute("name", "t"),
        e.appendChild(n),
        ue.checkClone = e.cloneNode(!0).cloneNode(!0).lastChild.checked,
        ue.noCloneEvent = !!e.addEventListener,
        e[fe.expando] = 1,
        ue.attributes = !e.getAttribute(fe.expando)
    }();
    var Be = {
        option: [1, "<select multiple='multiple'>", "</select>"],
        legend: [1, "<fieldset>", "</fieldset>"],
        area: [1, "<map>", "</map>"],
        param: [1, "<object>", "</object>"],
        thead: [1, "<table>", "</table>"],
        tr: [2, "<table><tbody>", "</tbody></table>"],
        col: [2, "<table><tbody></tbody><colgroup>", "</colgroup></table>"],
        td: [3, "<table><tbody><tr>", "</tr></tbody></table>"],
        _default: ue.htmlSerialize ? [0, "", ""] : [1, "X<div>", "</div>"]
    };
    Be.optgroup = Be.option,
    Be.tbody = Be.tfoot = Be.colgroup = Be.caption = Be.thead,
    Be.th = Be.td;
    var Ue = /<|&#?\w+;/
      , Xe = /<tbody/i;
    !function() {
        var t, n, i = ie.createElement("div");
        for (t in {
            submit: !0,
            change: !0,
            focusin: !0
        })
            n = "on" + t,
            (ue[t] = n in e) || (i.setAttribute(n, "t"),
            ue[t] = !1 === i.attributes[n].expando);
        i = null
    }();
    var Ye = /^(?:input|select|textarea)$/i
      , Ve = /^key/
      , Ge = /^(?:mouse|pointer|contextmenu|drag|drop)|click/
      , Je = /^(?:focusinfocus|focusoutblur)$/
      , Qe = /^([^.]*)(?:\.(.+)|)/;
    fe.event = {
        global: {},
        add: function(e, t, n, i, o) {
            var r, s, a, l, d, c, u, p, f, h, v, g = fe._data(e);
            if (g) {
                for (n.handler && (n = (l = n).handler,
                o = l.selector),
                n.guid || (n.guid = fe.guid++),
                (s = g.events) || (s = g.events = {}),
                (c = g.handle) || ((c = g.handle = function(e) {
                    return void 0 === fe || e && fe.event.triggered === e.type ? void 0 : fe.event.dispatch.apply(c.elem, arguments)
                }
                ).elem = e),
                a = (t = (t || "").match(Le) || [""]).length; a--; )
                    f = v = (r = Qe.exec(t[a]) || [])[1],
                    h = (r[2] || "").split(".").sort(),
                    f && (d = fe.event.special[f] || {},
                    f = (o ? d.delegateType : d.bindType) || f,
                    d = fe.event.special[f] || {},
                    u = fe.extend({
                        type: f,
                        origType: v,
                        data: i,
                        handler: n,
                        guid: n.guid,
                        selector: o,
                        needsContext: o && fe.expr.match.needsContext.test(o),
                        namespace: h.join(".")
                    }, l),
                    (p = s[f]) || ((p = s[f] = []).delegateCount = 0,
                    d.setup && !1 !== d.setup.call(e, i, h, c) || (e.addEventListener ? e.addEventListener(f, c, !1) : e.attachEvent && e.attachEvent("on" + f, c))),
                    d.add && (d.add.call(e, u),
                    u.handler.guid || (u.handler.guid = n.guid)),
                    o ? p.splice(p.delegateCount++, 0, u) : p.push(u),
                    fe.event.global[f] = !0);
                e = null
            }
        },
        remove: function(e, t, n, i, o) {
            var r, s, a, l, d, c, u, p, f, h, v, g = fe.hasData(e) && fe._data(e);
            if (g && (c = g.events)) {
                for (d = (t = (t || "").match(Le) || [""]).length; d--; )
                    if (f = v = (a = Qe.exec(t[d]) || [])[1],
                    h = (a[2] || "").split(".").sort(),
                    f) {
                        for (u = fe.event.special[f] || {},
                        p = c[f = (i ? u.delegateType : u.bindType) || f] || [],
                        a = a[2] && new RegExp("(^|\\.)" + h.join("\\.(?:.*\\.|)") + "(\\.|$)"),
                        l = r = p.length; r--; )
                            s = p[r],
                            !o && v !== s.origType || n && n.guid !== s.guid || a && !a.test(s.namespace) || i && i !== s.selector && ("**" !== i || !s.selector) || (p.splice(r, 1),
                            s.selector && p.delegateCount--,
                            u.remove && u.remove.call(e, s));
                        l && !p.length && (u.teardown && !1 !== u.teardown.call(e, h, g.handle) || fe.removeEvent(e, f, g.handle),
                        delete c[f])
                    } else
                        for (f in c)
                            fe.event.remove(e, f + t[d], n, i, !0);
                fe.isEmptyObject(c) && (delete g.handle,
                fe._removeData(e, "events"))
            }
        },
        trigger: function(t, i, o, r) {
            var s, a, l, d, c, u, p, f = [o || ie], h = ce.call(t, "type") ? t.type : t, v = ce.call(t, "namespace") ? t.namespace.split(".") : [];
            if (l = u = o = o || ie,
            3 !== o.nodeType && 8 !== o.nodeType && !Je.test(h + fe.event.triggered) && (h.indexOf(".") > -1 && (h = (v = h.split(".")).shift(),
            v.sort()),
            a = h.indexOf(":") < 0 && "on" + h,
            (t = t[fe.expando] ? t : new fe.Event(h,"object" == typeof t && t)).isTrigger = r ? 2 : 3,
            t.namespace = v.join("."),
            t.rnamespace = t.namespace ? new RegExp("(^|\\.)" + v.join("\\.(?:.*\\.|)") + "(\\.|$)") : null,
            t.result = void 0,
            t.target || (t.target = o),
            i = null == i ? [t] : fe.makeArray(i, [t]),
            c = fe.event.special[h] || {},
            r || !c.trigger || !1 !== c.trigger.apply(o, i))) {
                if (!r && !c.noBubble && !fe.isWindow(o)) {
                    for (d = c.delegateType || h,
                    Je.test(d + h) || (l = l.parentNode); l; l = l.parentNode)
                        f.push(l),
                        u = l;
                    u === (o.ownerDocument || ie) && f.push(u.defaultView || u.parentWindow || e)
                }
                for (p = 0; (l = f[p++]) && !t.isPropagationStopped(); )
                    t.type = p > 1 ? d : c.bindType || h,
                    (s = (fe._data(l, "events") || {})[t.type] && fe._data(l, "handle")) && s.apply(l, i),
                    (s = a && l[a]) && s.apply && je(l) && (t.result = s.apply(l, i),
                    !1 === t.result && t.preventDefault());
                if (t.type = h,
                !r && !t.isDefaultPrevented() && (!c._default || !1 === c._default.apply(f.pop(), i)) && je(o) && a && o[h] && !fe.isWindow(o)) {
                    (u = o[a]) && (o[a] = null),
                    fe.event.triggered = h;
                    try {
                        o[h]()
                    } catch (n) {}
                    fe.event.triggered = void 0,
                    u && (o[a] = u)
                }
                return t.result
            }
        },
        dispatch: function(e) {
            e = fe.event.fix(e);
            var t, n, i, o, r, s = [], a = oe.call(arguments), l = (fe._data(this, "events") || {})[e.type] || [], d = fe.event.special[e.type] || {};
            if (a[0] = e,
            e.delegateTarget = this,
            !d.preDispatch || !1 !== d.preDispatch.call(this, e)) {
                for (s = fe.event.handlers.call(this, e, l),
                t = 0; (o = s[t++]) && !e.isPropagationStopped(); )
                    for (e.currentTarget = o.elem,
                    n = 0; (r = o.handlers[n++]) && !e.isImmediatePropagationStopped(); )
                        e.rnamespace && !e.rnamespace.test(r.namespace) || (e.handleObj = r,
                        e.data = r.data,
                        void 0 !== (i = ((fe.event.special[r.origType] || {}).handle || r.handler).apply(o.elem, a)) && !1 === (e.result = i) && (e.preventDefault(),
                        e.stopPropagation()));
                return d.postDispatch && d.postDispatch.call(this, e),
                e.result
            }
        },
        handlers: function(e, t) {
            var n, i, o, r, s = [], a = t.delegateCount, l = e.target;
            if (a && l.nodeType && ("click" !== e.type || isNaN(e.button) || e.button < 1))
                for (; l != this; l = l.parentNode || this)
                    if (1 === l.nodeType && (!0 !== l.disabled || "click" !== e.type)) {
                        for (i = [],
                        n = 0; a > n; n++)
                            void 0 === i[o = (r = t[n]).selector + " "] && (i[o] = r.needsContext ? fe(o, this).index(l) > -1 : fe.find(o, this, null, [l]).length),
                            i[o] && i.push(r);
                        i.length && s.push({
                            elem: l,
                            handlers: i
                        })
                    }
            return a < t.length && s.push({
                elem: this,
                handlers: t.slice(a)
            }),
            s
        },
        fix: function(e) {
            if (e[fe.expando])
                return e;
            var t, n, i, o = e.type, r = e, s = this.fixHooks[o];
            for (s || (this.fixHooks[o] = s = Ge.test(o) ? this.mouseHooks : Ve.test(o) ? this.keyHooks : {}),
            i = s.props ? this.props.concat(s.props) : this.props,
            e = new fe.Event(r),
            t = i.length; t--; )
                e[n = i[t]] = r[n];
            return e.target || (e.target = r.srcElement || ie),
            3 === e.target.nodeType && (e.target = e.target.parentNode),
            e.metaKey = !!e.metaKey,
            s.filter ? s.filter(e, r) : e
        },
        props: "altKey bubbles cancelable ctrlKey currentTarget detail eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),
        fixHooks: {},
        keyHooks: {
            props: "char charCode key keyCode".split(" "),
            filter: function(e, t) {
                return null == e.which && (e.which = null != t.charCode ? t.charCode : t.keyCode),
                e
            }
        },
        mouseHooks: {
            props: "button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),
            filter: function(e, t) {
                var n, i, o, r = t.button, s = t.fromElement;
                return null == e.pageX && null != t.clientX && (o = (i = e.target.ownerDocument || ie).documentElement,
                n = i.body,
                e.pageX = t.clientX + (o && o.scrollLeft || n && n.scrollLeft || 0) - (o && o.clientLeft || n && n.clientLeft || 0),
                e.pageY = t.clientY + (o && o.scrollTop || n && n.scrollTop || 0) - (o && o.clientTop || n && n.clientTop || 0)),
                !e.relatedTarget && s && (e.relatedTarget = s === e.target ? t.toElement : s),
                e.which || void 0 === r || (e.which = 1 & r ? 1 : 2 & r ? 3 : 4 & r ? 2 : 0),
                e
            }
        },
        special: {
            load: {
                noBubble: !0
            },
            focus: {
                trigger: function() {
                    if (this !== b() && this.focus)
                        try {
                            return this.focus(),
                            !1
                        } catch (e) {}
                },
                delegateType: "focusin"
            },
            blur: {
                trigger: function() {
                    return this === b() && this.blur ? (this.blur(),
                    !1) : void 0
                },
                delegateType: "focusout"
            },
            click: {
                trigger: function() {
                    return fe.nodeName(this, "input") && "checkbox" === this.type && this.click ? (this.click(),
                    !1) : void 0
                },
                _default: function(e) {
                    return fe.nodeName(e.target, "a")
                }
            },
            beforeunload: {
                postDispatch: function(e) {
                    void 0 !== e.result && e.originalEvent && (e.originalEvent.returnValue = e.result)
                }
            }
        },
        simulate: function(e, t, n) {
            var i = fe.extend(new fe.Event, n, {
                type: e,
                isSimulated: !0
            });
            fe.event.trigger(i, null, t),
            i.isDefaultPrevented() && n.preventDefault()
        }
    },
    fe.removeEvent = ie.removeEventListener ? function(e, t, n) {
        e.removeEventListener && e.removeEventListener(t, n)
    }
    : function(e, t, n) {
        var i = "on" + t;
        e.detachEvent && ("undefined" == typeof e[i] && (e[i] = null),
        e.detachEvent(i, n))
    }
    ,
    fe.Event = function(e, t) {
        return this instanceof fe.Event ? (e && e.type ? (this.originalEvent = e,
        this.type = e.type,
        this.isDefaultPrevented = e.defaultPrevented || void 0 === e.defaultPrevented && !1 === e.returnValue ? y : w) : this.type = e,
        t && fe.extend(this, t),
        this.timeStamp = e && e.timeStamp || fe.now(),
        void (this[fe.expando] = !0)) : new fe.Event(e,t)
    }
    ,
    fe.Event.prototype = {
        constructor: fe.Event,
        isDefaultPrevented: w,
        isPropagationStopped: w,
        isImmediatePropagationStopped: w,
        preventDefault: function() {
            var e = this.originalEvent;
            this.isDefaultPrevented = y,
            e && (e.preventDefault ? e.preventDefault() : e.returnValue = !1)
        },
        stopPropagation: function() {
            var e = this.originalEvent;
            this.isPropagationStopped = y,
            e && !this.isSimulated && (e.stopPropagation && e.stopPropagation(),
            e.cancelBubble = !0)
        },
        stopImmediatePropagation: function() {
            var e = this.originalEvent;
            this.isImmediatePropagationStopped = y,
            e && e.stopImmediatePropagation && e.stopImmediatePropagation(),
            this.stopPropagation()
        }
    },
    fe.each({
        mouseenter: "mouseover",
        mouseleave: "mouseout",
        pointerenter: "pointerover",
        pointerleave: "pointerout"
    }, function(e, t) {
        fe.event.special[e] = {
            delegateType: t,
            bindType: t,
            handle: function(e) {
                var n, i = this, o = e.relatedTarget, r = e.handleObj;
                return o && (o === i || fe.contains(i, o)) || (e.type = r.origType,
                n = r.handler.apply(this, arguments),
                e.type = t),
                n
            }
        }
    }),
    ue.submit || (fe.event.special.submit = {
        setup: function() {
            return !fe.nodeName(this, "form") && void fe.event.add(this, "click._submit keypress._submit", function(e) {
                var t = e.target
                  , n = fe.nodeName(t, "input") || fe.nodeName(t, "button") ? fe.prop(t, "form") : void 0;
                n && !fe._data(n, "submit") && (fe.event.add(n, "submit._submit", function(e) {
                    e._submitBubble = !0
                }),
                fe._data(n, "submit", !0))
            })
        },
        postDispatch: function(e) {
            e._submitBubble && (delete e._submitBubble,
            this.parentNode && !e.isTrigger && fe.event.simulate("submit", this.parentNode, e))
        },
        teardown: function() {
            return !fe.nodeName(this, "form") && void fe.event.remove(this, "._submit")
        }
    }),
    ue.change || (fe.event.special.change = {
        setup: function() {
            return Ye.test(this.nodeName) ? ("checkbox" !== this.type && "radio" !== this.type || (fe.event.add(this, "propertychange._change", function(e) {
                "checked" === e.originalEvent.propertyName && (this._justChanged = !0)
            }),
            fe.event.add(this, "click._change", function(e) {
                this._justChanged && !e.isTrigger && (this._justChanged = !1),
                fe.event.simulate("change", this, e)
            })),
            !1) : void fe.event.add(this, "beforeactivate._change", function(e) {
                var t = e.target;
                Ye.test(t.nodeName) && !fe._data(t, "change") && (fe.event.add(t, "change._change", function(e) {
                    !this.parentNode || e.isSimulated || e.isTrigger || fe.event.simulate("change", this.parentNode, e)
                }),
                fe._data(t, "change", !0))
            })
        },
        handle: function(e) {
            var t = e.target;
            return this !== t || e.isSimulated || e.isTrigger || "radio" !== t.type && "checkbox" !== t.type ? e.handleObj.handler.apply(this, arguments) : void 0
        },
        teardown: function() {
            return fe.event.remove(this, "._change"),
            !Ye.test(this.nodeName)
        }
    }),
    ue.focusin || fe.each({
        focus: "focusin",
        blur: "focusout"
    }, function(e, t) {
        var n = function(e) {
            fe.event.simulate(t, e.target, fe.event.fix(e))
        };
        fe.event.special[t] = {
            setup: function() {
                var i = this.ownerDocument || this
                  , o = fe._data(i, t);
                o || i.addEventListener(e, n, !0),
                fe._data(i, t, (o || 0) + 1)
            },
            teardown: function() {
                var i = this.ownerDocument || this
                  , o = fe._data(i, t) - 1;
                o ? fe._data(i, t, o) : (i.removeEventListener(e, n, !0),
                fe._removeData(i, t))
            }
        }
    }),
    fe.fn.extend({
        on: function(e, t, n, i) {
            return x(this, e, t, n, i)
        },
        one: function(e, t, n, i) {
            return x(this, e, t, n, i, 1)
        },
        off: function(e, t, n) {
            var i, o;
            if (e && e.preventDefault && e.handleObj)
                return i = e.handleObj,
                fe(e.delegateTarget).off(i.namespace ? i.origType + "." + i.namespace : i.origType, i.selector, i.handler),
                this;
            if ("object" == typeof e) {
                for (o in e)
                    this.off(o, t, e[o]);
                return this
            }
            return !1 !== t && "function" != typeof t || (n = t,
            t = void 0),
            !1 === n && (n = w),
            this.each(function() {
                fe.event.remove(this, e, n, t)
            })
        },
        trigger: function(e, t) {
            return this.each(function() {
                fe.event.trigger(e, t, this)
            })
        },
        triggerHandler: function(e, t) {
            var n = this[0];
            return n ? fe.event.trigger(e, t, n, !0) : void 0
        }
    });
    var Ke = / jQuery\d+="(?:null|\d+)"/g
      , Ze = new RegExp("<(?:" + _e + ")[\\s/>]","i")
      , et = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:-]+)[^>]*)\/>/gi
      , tt = /<script|<style|<link/i
      , nt = /checked\s*(?:[^=]|=\s*.checked.)/i
      , it = /^true\/(.*)/
      , ot = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g
      , rt = f(ie).appendChild(ie.createElement("div"));
    fe.extend({
        htmlPrefilter: function(e) {
            return e.replace(et, "<$1></$2>")
        },
        clone: function(e, t, n) {
            var i, o, r, s, a, l = fe.contains(e.ownerDocument, e);
            if (ue.html5Clone || fe.isXMLDoc(e) || !Ze.test("<" + e.nodeName + ">") ? r = e.cloneNode(!0) : (rt.innerHTML = e.outerHTML,
            rt.removeChild(r = rt.firstChild)),
            !(ue.noCloneEvent && ue.noCloneChecked || 1 !== e.nodeType && 11 !== e.nodeType || fe.isXMLDoc(e)))
                for (i = h(r),
                a = h(e),
                s = 0; null != (o = a[s]); ++s)
                    i[s] && $(o, i[s]);
            if (t)
                if (n)
                    for (a = a || h(e),
                    i = i || h(r),
                    s = 0; null != (o = a[s]); s++)
                        C(o, i[s]);
                else
                    C(e, r);
            return (i = h(r, "script")).length > 0 && v(i, !l && h(e, "script")),
            i = a = o = null,
            r
        },
        cleanData: function(e, t) {
            for (var n, i, o, r, s = 0, a = fe.expando, l = fe.cache, d = ue.attributes, c = fe.event.special; null != (n = e[s]); s++)
                if ((t || je(n)) && (r = (o = n[a]) && l[o])) {
                    if (r.events)
                        for (i in r.events)
                            c[i] ? fe.event.remove(n, i) : fe.removeEvent(n, i, r.handle);
                    l[o] && (delete l[o],
                    d || "undefined" == typeof n.removeAttribute ? n[a] = void 0 : n.removeAttribute(a),
                    ne.push(o))
                }
        }
    }),
    fe.fn.extend({
        domManip: A,
        detach: function(e) {
            return E(this, e, !0)
        },
        remove: function(e) {
            return E(this, e)
        },
        text: function(e) {
            return ze(this, function(e) {
                return void 0 === e ? fe.text(this) : this.empty().append((this[0] && this[0].ownerDocument || ie).createTextNode(e))
            }, null, e, arguments.length)
        },
        append: function() {
            return A(this, arguments, function(e) {
                1 !== this.nodeType && 11 !== this.nodeType && 9 !== this.nodeType || k(this, e).appendChild(e)
            })
        },
        prepend: function() {
            return A(this, arguments, function(e) {
                if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                    var t = k(this, e);
                    t.insertBefore(e, t.firstChild)
                }
            })
        },
        before: function() {
            return A(this, arguments, function(e) {
                this.parentNode && this.parentNode.insertBefore(e, this)
            })
        },
        after: function() {
            return A(this, arguments, function(e) {
                this.parentNode && this.parentNode.insertBefore(e, this.nextSibling)
            })
        },
        empty: function() {
            for (var e, t = 0; null != (e = this[t]); t++) {
                for (1 === e.nodeType && fe.cleanData(h(e, !1)); e.firstChild; )
                    e.removeChild(e.firstChild);
                e.options && fe.nodeName(e, "select") && (e.options.length = 0)
            }
            return this
        },
        clone: function(e, t) {
            return e = null != e && e,
            t = null == t ? e : t,
            this.map(function() {
                return fe.clone(this, e, t)
            })
        },
        html: function(e) {
            return ze(this, function(e) {
                var t = this[0] || {}
                  , n = 0
                  , i = this.length;
                if (void 0 === e)
                    return 1 === t.nodeType ? t.innerHTML.replace(Ke, "") : void 0;
                if ("string" == typeof e && !tt.test(e) && (ue.htmlSerialize || !Ze.test(e)) && (ue.leadingWhitespace || !We.test(e)) && !Be[(Fe.exec(e) || ["", ""])[1].toLowerCase()]) {
                    e = fe.htmlPrefilter(e);
                    try {
                        for (; i > n; n++)
                            1 === (t = this[n] || {}).nodeType && (fe.cleanData(h(t, !1)),
                            t.innerHTML = e);
                        t = 0
                    } catch (oe) {}
                }
                t && this.empty().append(e)
            }, null, e, arguments.length)
        },
        replaceWith: function() {
            var e = [];
            return A(this, arguments, function(t) {
                var n = this.parentNode;
                fe.inArray(this, e) < 0 && (fe.cleanData(h(this)),
                n && n.replaceChild(t, this))
            }, e)
        }
    }),
    fe.each({
        appendTo: "append",
        prependTo: "prepend",
        insertBefore: "before",
        insertAfter: "after",
        replaceAll: "replaceWith"
    }, function(e, t) {
        fe.fn[e] = function(e) {
            for (var n, i = 0, o = [], r = fe(e), s = r.length - 1; s >= i; i++)
                n = i === s ? this : this.clone(!0),
                fe(r[i])[t](n),
                se.apply(o, n.get());
            return this.pushStack(o)
        }
    });
    var st, at = {
        HTML: "block",
        BODY: "block"
    }, lt = /^margin/, dt = new RegExp("^(" + Oe + ")(?!px)[a-z%]+$","i"), ct = function(e, t, n, i) {
        var o, r, s = {};
        for (r in t)
            s[r] = e.style[r],
            e.style[r] = t[r];
        for (r in o = n.apply(e, i || []),
        t)
            e.style[r] = s[r];
        return o
    }, ut = ie.documentElement;
    !function() {
        var t, n, i, o, r, s, a = ie.createElement("div"), l = ie.createElement("div");
        if (l.style) {
            function d() {
                var d, c, u = ie.documentElement;
                u.appendChild(a),
                l.style.cssText = "-webkit-box-sizing:border-box;box-sizing:border-box;position:relative;display:block;margin:auto;border:1px;padding:1px;top:1%;width:50%",
                t = i = s = !1,
                n = r = !0,
                e.getComputedStyle && (c = e.getComputedStyle(l),
                t = "1%" !== (c || {}).top,
                s = "2px" === (c || {}).marginLeft,
                i = "4px" === (c || {
                    width: "4px"
                }).width,
                l.style.marginRight = "50%",
                n = "4px" === (c || {
                    marginRight: "4px"
                }).marginRight,
                (d = l.appendChild(ie.createElement("div"))).style.cssText = l.style.cssText = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:0",
                d.style.marginRight = d.style.width = "0",
                l.style.width = "1px",
                r = !parseFloat((e.getComputedStyle(d) || {}).marginRight),
                l.removeChild(d)),
                l.style.display = "none",
                (o = 0 === l.getClientRects().length) && (l.style.display = "",
                l.innerHTML = "<table><tr><td></td><td>t</td></tr></table>",
                l.childNodes[0].style.borderCollapse = "separate",
                (d = l.getElementsByTagName("td"))[0].style.cssText = "margin:0;border:0;padding:0;display:none",
                (o = 0 === d[0].offsetHeight) && (d[0].style.display = "",
                d[1].style.display = "none",
                o = 0 === d[0].offsetHeight)),
                u.removeChild(a)
            }
            l.style.cssText = "float:left;opacity:.5",
            ue.opacity = "0.5" === l.style.opacity,
            ue.cssFloat = !!l.style.cssFloat,
            l.style.backgroundClip = "content-box",
            l.cloneNode(!0).style.backgroundClip = "",
            ue.clearCloneStyle = "content-box" === l.style.backgroundClip,
            (a = ie.createElement("div")).style.cssText = "border:0;width:8px;height:0;top:0;left:-9999px;padding:0;margin-top:1px;position:absolute",
            l.innerHTML = "",
            a.appendChild(l),
            ue.boxSizing = "" === l.style.boxSizing || "" === l.style.MozBoxSizing || "" === l.style.WebkitBoxSizing,
            fe.extend(ue, {
                reliableHiddenOffsets: function() {
                    return null == t && d(),
                    o
                },
                boxSizingReliable: function() {
                    return null == t && d(),
                    i
                },
                pixelMarginRight: function() {
                    return null == t && d(),
                    n
                },
                pixelPosition: function() {
                    return null == t && d(),
                    t
                },
                reliableMarginRight: function() {
                    return null == t && d(),
                    r
                },
                reliableMarginLeft: function() {
                    return null == t && d(),
                    s
                }
            })
        }
    }();
    var pt, ft, ht = /^(top|right|bottom|left)$/;
    e.getComputedStyle ? (pt = function(t) {
        var n = t.ownerDocument.defaultView;
        return n && n.opener || (n = e),
        n.getComputedStyle(t)
    }
    ,
    ft = function(e, t, n) {
        var i, o, r, s, a = e.style;
        return "" !== (s = (n = n || pt(e)) ? n.getPropertyValue(t) || n[t] : void 0) && void 0 !== s || fe.contains(e.ownerDocument, e) || (s = fe.style(e, t)),
        n && !ue.pixelMarginRight() && dt.test(s) && lt.test(t) && (i = a.width,
        o = a.minWidth,
        r = a.maxWidth,
        a.minWidth = a.maxWidth = a.width = s,
        s = n.width,
        a.width = i,
        a.minWidth = o,
        a.maxWidth = r),
        void 0 === s ? s : s + ""
    }
    ) : ut.currentStyle && (pt = function(e) {
        return e.currentStyle
    }
    ,
    ft = function(e, t, n) {
        var i, o, r, s, a = e.style;
        return null == (s = (n = n || pt(e)) ? n[t] : void 0) && a && a[t] && (s = a[t]),
        dt.test(s) && !ht.test(t) && (i = a.left,
        (r = (o = e.runtimeStyle) && o.left) && (o.left = e.currentStyle.left),
        a.left = "fontSize" === t ? "1em" : s,
        s = a.pixelLeft + "px",
        a.left = i,
        r && (o.left = r)),
        void 0 === s ? s : s + "" || "auto"
    }
    );
    var vt = /alpha\([^)]*\)/i
      , gt = /opacity\s*=\s*([^)]*)/i
      , mt = /^(none|table(?!-c[ea]).+)/
      , yt = new RegExp("^(" + Oe + ")(.*)$","i")
      , wt = {
        position: "absolute",
        visibility: "hidden",
        display: "block"
    }
      , bt = {
        letterSpacing: "0",
        fontWeight: "400"
    }
      , xt = ["Webkit", "O", "Moz", "ms"]
      , kt = ie.createElement("div").style;
    fe.extend({
        cssHooks: {
            opacity: {
                get: function(e, t) {
                    if (t) {
                        var n = ft(e, "opacity");
                        return "" === n ? "1" : n
                    }
                }
            }
        },
        cssNumber: {
            animationIterationCount: !0,
            columnCount: !0,
            fillOpacity: !0,
            flexGrow: !0,
            flexShrink: !0,
            fontWeight: !0,
            lineHeight: !0,
            opacity: !0,
            order: !0,
            orphans: !0,
            widows: !0,
            zIndex: !0,
            zoom: !0
        },
        cssProps: {
            float: ue.cssFloat ? "cssFloat" : "styleFloat"
        },
        style: function(e, t, n, i) {
            if (e && 3 !== e.nodeType && 8 !== e.nodeType && e.style) {
                var o, r, s, a = fe.camelCase(t), l = e.style;
                if (t = fe.cssProps[a] || (fe.cssProps[a] = H(a) || a),
                s = fe.cssHooks[t] || fe.cssHooks[a],
                void 0 === n)
                    return s && "get"in s && void 0 !== (o = s.get(e, !1, i)) ? o : l[t];
                if ("string" === (r = typeof n) && (o = Me.exec(n)) && o[1] && (n = p(e, t, o),
                r = "number"),
                null != n && n == n && ("number" === r && (n += o && o[3] || (fe.cssNumber[a] ? "" : "px")),
                ue.clearCloneStyle || "" !== n || 0 !== t.indexOf("background") || (l[t] = "inherit"),
                !(s && "set"in s && void 0 === (n = s.set(e, n, i)))))
                    try {
                        l[t] = n
                    } catch (de) {}
            }
        },
        css: function(e, t, n, i) {
            var o, r, s, a = fe.camelCase(t);
            return t = fe.cssProps[a] || (fe.cssProps[a] = H(a) || a),
            (s = fe.cssHooks[t] || fe.cssHooks[a]) && "get"in s && (r = s.get(e, !0, n)),
            void 0 === r && (r = ft(e, t, i)),
            "normal" === r && t in bt && (r = bt[t]),
            "" === n || n ? (o = parseFloat(r),
            !0 === n || isFinite(o) ? o || 0 : r) : r
        }
    }),
    fe.each(["height", "width"], function(e, t) {
        fe.cssHooks[t] = {
            get: function(e, n, i) {
                return n ? mt.test(fe.css(e, "display")) && 0 === e.offsetWidth ? ct(e, wt, function() {
                    return P(e, t, i)
                }) : P(e, t, i) : void 0
            },
            set: function(e, n, i) {
                var o = i && pt(e);
                return O(e, n, i ? M(e, t, i, ue.boxSizing && "border-box" === fe.css(e, "boxSizing", !1, o), o) : 0)
            }
        }
    }),
    ue.opacity || (fe.cssHooks.opacity = {
        get: function(e, t) {
            return gt.test((t && e.currentStyle ? e.currentStyle.filter : e.style.filter) || "") ? .01 * parseFloat(RegExp.$1) + "" : t ? "1" : ""
        },
        set: function(e, t) {
            var n = e.style
              , i = e.currentStyle
              , o = fe.isNumeric(t) ? "alpha(opacity=" + 100 * t + ")" : ""
              , r = i && i.filter || n.filter || "";
            n.zoom = 1,
            (t >= 1 || "" === t) && "" === fe.trim(r.replace(vt, "")) && n.removeAttribute && (n.removeAttribute("filter"),
            "" === t || i && !i.filter) || (n.filter = vt.test(r) ? r.replace(vt, o) : r + " " + o)
        }
    }),
    fe.cssHooks.marginRight = j(ue.reliableMarginRight, function(e, t) {
        return t ? ct(e, {
            display: "inline-block"
        }, ft, [e, "marginRight"]) : void 0
    }),
    fe.cssHooks.marginLeft = j(ue.reliableMarginLeft, function(e, t) {
        return t ? (parseFloat(ft(e, "marginLeft")) || (fe.contains(e.ownerDocument, e) ? e.getBoundingClientRect().left - ct(e, {
            marginLeft: 0
        }, function() {
            return e.getBoundingClientRect().left
        }) : 0)) + "px" : void 0
    }),
    fe.each({
        margin: "",
        padding: "",
        border: "Width"
    }, function(e, t) {
        fe.cssHooks[e + t] = {
            expand: function(n) {
                for (var i = 0, o = {}, r = "string" == typeof n ? n.split(" ") : [n]; 4 > i; i++)
                    o[e + Pe[i] + t] = r[i] || r[i - 2] || r[0];
                return o
            }
        },
        lt.test(e) || (fe.cssHooks[e + t].set = O)
    }),
    fe.fn.extend({
        css: function(e, t) {
            return ze(this, function(e, t, n) {
                var i, o, r = {}, s = 0;
                if (fe.isArray(t)) {
                    for (i = pt(e),
                    o = t.length; o > s; s++)
                        r[t[s]] = fe.css(e, t[s], !1, i);
                    return r
                }
                return void 0 !== n ? fe.style(e, t, n) : fe.css(e, t)
            }, e, t, arguments.length > 1)
        },
        show: function() {
            return D(this, !0)
        },
        hide: function() {
            return D(this)
        },
        toggle: function(e) {
            return "boolean" == typeof e ? e ? this.show() : this.hide() : this.each(function() {
                qe(this) ? fe(this).show() : fe(this).hide()
            })
        }
    }),
    fe.Tween = q,
    q.prototype = {
        constructor: q,
        init: function(e, t, n, i, o, r) {
            this.elem = e,
            this.prop = n,
            this.easing = o || fe.easing._default,
            this.options = t,
            this.start = this.now = this.cur(),
            this.end = i,
            this.unit = r || (fe.cssNumber[n] ? "" : "px")
        },
        cur: function() {
            var e = q.propHooks[this.prop];
            return e && e.get ? e.get(this) : q.propHooks._default.get(this)
        },
        run: function(e) {
            var t, n = q.propHooks[this.prop];
            return this.options.duration ? this.pos = t = fe.easing[this.easing](e, this.options.duration * e, 0, 1, this.options.duration) : this.pos = t = e,
            this.now = (this.end - this.start) * t + this.start,
            this.options.step && this.options.step.call(this.elem, this.now, this),
            n && n.set ? n.set(this) : q.propHooks._default.set(this),
            this
        }
    },
    q.prototype.init.prototype = q.prototype,
    q.propHooks = {
        _default: {
            get: function(e) {
                var t;
                return 1 !== e.elem.nodeType || null != e.elem[e.prop] && null == e.elem.style[e.prop] ? e.elem[e.prop] : (t = fe.css(e.elem, e.prop, "")) && "auto" !== t ? t : 0
            },
            set: function(e) {
                fe.fx.step[e.prop] ? fe.fx.step[e.prop](e) : 1 !== e.elem.nodeType || null == e.elem.style[fe.cssProps[e.prop]] && !fe.cssHooks[e.prop] ? e.elem[e.prop] = e.now : fe.style(e.elem, e.prop, e.now + e.unit)
            }
        }
    },
    q.propHooks.scrollTop = q.propHooks.scrollLeft = {
        set: function(e) {
            e.elem.nodeType && e.elem.parentNode && (e.elem[e.prop] = e.now)
        }
    },
    fe.easing = {
        linear: function(e) {
            return e
        },
        swing: function(e) {
            return .5 - Math.cos(e * Math.PI) / 2
        },
        _default: "swing"
    },
    fe.fx = q.prototype.init,
    fe.fx.step = {};
    var Tt, St, Ct = /^(?:toggle|show|hide)$/, $t = /queueHooks$/;
    fe.Animation = fe.extend(_, {
        tweeners: {
            "*": [function(e, t) {
                var n = this.createTween(e, t);
                return p(n.elem, e, Me.exec(t), n),
                n
            }
            ]
        },
        tweener: function(e, t) {
            fe.isFunction(e) ? (t = e,
            e = ["*"]) : e = e.match(Le);
            for (var n, i = 0, o = e.length; o > i; i++)
                n = e[i],
                _.tweeners[n] = _.tweeners[n] || [],
                _.tweeners[n].unshift(t)
        },
        prefilters: [R],
        prefilter: function(e, t) {
            t ? _.prefilters.unshift(e) : _.prefilters.push(e)
        }
    }),
    fe.speed = function(e, t, n) {
        var i = e && "object" == typeof e ? fe.extend({}, e) : {
            complete: n || !n && t || fe.isFunction(e) && e,
            duration: e,
            easing: n && t || t && !fe.isFunction(t) && t
        };
        return i.duration = fe.fx.off ? 0 : "number" == typeof i.duration ? i.duration : i.duration in fe.fx.speeds ? fe.fx.speeds[i.duration] : fe.fx.speeds._default,
        null != i.queue && !0 !== i.queue || (i.queue = "fx"),
        i.old = i.complete,
        i.complete = function() {
            fe.isFunction(i.old) && i.old.call(this),
            i.queue && fe.dequeue(this, i.queue)
        }
        ,
        i
    }
    ,
    fe.fn.extend({
        fadeTo: function(e, t, n, i) {
            return this.filter(qe).css("opacity", 0).show().end().animate({
                opacity: t
            }, e, n, i)
        },
        animate: function(e, t, n, i) {
            var o = fe.isEmptyObject(e)
              , r = fe.speed(t, n, i)
              , s = function() {
                var t = _(this, fe.extend({}, e), r);
                (o || fe._data(this, "finish")) && t.stop(!0)
            };
            return s.finish = s,
            o || !1 === r.queue ? this.each(s) : this.queue(r.queue, s)
        },
        stop: function(e, t, n) {
            var i = function(e) {
                var t = e.stop;
                delete e.stop,
                t(n)
            };
            return "string" != typeof e && (n = t,
            t = e,
            e = void 0),
            t && !1 !== e && this.queue(e || "fx", []),
            this.each(function() {
                var t = !0
                  , o = null != e && e + "queueHooks"
                  , r = fe.timers
                  , s = fe._data(this);
                if (o)
                    s[o] && s[o].stop && i(s[o]);
                else
                    for (o in s)
                        s[o] && s[o].stop && $t.test(o) && i(s[o]);
                for (o = r.length; o--; )
                    r[o].elem !== this || null != e && r[o].queue !== e || (r[o].anim.stop(n),
                    t = !1,
                    r.splice(o, 1));
                !t && n || fe.dequeue(this, e)
            })
        },
        finish: function(e) {
            return !1 !== e && (e = e || "fx"),
            this.each(function() {
                var t, n = fe._data(this), i = n[e + "queue"], o = n[e + "queueHooks"], r = fe.timers, s = i ? i.length : 0;
                for (n.finish = !0,
                fe.queue(this, e, []),
                o && o.stop && o.stop.call(this, !0),
                t = r.length; t--; )
                    r[t].elem === this && r[t].queue === e && (r[t].anim.stop(!0),
                    r.splice(t, 1));
                for (t = 0; s > t; t++)
                    i[t] && i[t].finish && i[t].finish.call(this);
                delete n.finish
            })
        }
    }),
    fe.each(["toggle", "show", "hide"], function(e, t) {
        var n = fe.fn[t];
        fe.fn[t] = function(e, i, o) {
            return null == e || "boolean" == typeof e ? n.apply(this, arguments) : this.animate(I(t, !0), e, i, o)
        }
    }),
    fe.each({
        slideDown: I("show"),
        slideUp: I("hide"),
        slideToggle: I("toggle"),
        fadeIn: {
            opacity: "show"
        },
        fadeOut: {
            opacity: "hide"
        },
        fadeToggle: {
            opacity: "toggle"
        }
    }, function(e, t) {
        fe.fn[e] = function(e, n, i) {
            return this.animate(t, e, n, i)
        }
    }),
    fe.timers = [],
    fe.fx.tick = function() {
        var e, t = fe.timers, n = 0;
        for (Tt = fe.now(); n < t.length; n++)
            (e = t[n])() || t[n] !== e || t.splice(n--, 1);
        t.length || fe.fx.stop(),
        Tt = void 0
    }
    ,
    fe.fx.timer = function(e) {
        fe.timers.push(e),
        e() ? fe.fx.start() : fe.timers.pop()
    }
    ,
    fe.fx.interval = 13,
    fe.fx.start = function() {
        St || (St = e.setInterval(fe.fx.tick, fe.fx.interval))
    }
    ,
    fe.fx.stop = function() {
        e.clearInterval(St),
        St = null
    }
    ,
    fe.fx.speeds = {
        slow: 600,
        fast: 200,
        _default: 400
    },
    fe.fn.delay = function(t, n) {
        return t = fe.fx && fe.fx.speeds[t] || t,
        n = n || "fx",
        this.queue(n, function(n, i) {
            var o = e.setTimeout(n, t);
            i.stop = function() {
                e.clearTimeout(o)
            }
        })
    }
    ,
    function() {
        var e, t = ie.createElement("input"), n = ie.createElement("div"), i = ie.createElement("select"), o = i.appendChild(ie.createElement("option"));
        (n = ie.createElement("div")).setAttribute("className", "t"),
        n.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",
        e = n.getElementsByTagName("a")[0],
        t.setAttribute("type", "checkbox"),
        n.appendChild(t),
        (e = n.getElementsByTagName("a")[0]).style.cssText = "top:1px",
        ue.getSetAttribute = "t" !== n.className,
        ue.style = /top/.test(e.getAttribute("style")),
        ue.hrefNormalized = "/a" === e.getAttribute("href"),
        ue.checkOn = !!t.value,
        ue.optSelected = o.selected,
        ue.enctype = !!ie.createElement("form").enctype,
        i.disabled = !0,
        ue.optDisabled = !o.disabled,
        (t = ie.createElement("input")).setAttribute("value", ""),
        ue.input = "" === t.getAttribute("value"),
        t.value = "t",
        t.setAttribute("type", "radio"),
        ue.radioValue = "t" === t.value
    }();
    var At = /\r/g
      , Et = /[\x20\t\r\n\f]+/g;
    fe.fn.extend({
        val: function(e) {
            var t, n, i, o = this[0];
            return arguments.length ? (i = fe.isFunction(e),
            this.each(function(n) {
                var o;
                1 === this.nodeType && (null == (o = i ? e.call(this, n, fe(this).val()) : e) ? o = "" : "number" == typeof o ? o += "" : fe.isArray(o) && (o = fe.map(o, function(e) {
                    return null == e ? "" : e + ""
                })),
                (t = fe.valHooks[this.type] || fe.valHooks[this.nodeName.toLowerCase()]) && "set"in t && void 0 !== t.set(this, o, "value") || (this.value = o))
            })) : o ? (t = fe.valHooks[o.type] || fe.valHooks[o.nodeName.toLowerCase()]) && "get"in t && void 0 !== (n = t.get(o, "value")) ? n : "string" == typeof (n = o.value) ? n.replace(At, "") : null == n ? "" : n : void 0
        }
    }),
    fe.extend({
        valHooks: {
            option: {
                get: function(e) {
                    var t = fe.find.attr(e, "value");
                    return null != t ? t : fe.trim(fe.text(e)).replace(Et, " ")
                }
            },
            select: {
                get: function(e) {
                    for (var t, n, i = e.options, o = e.selectedIndex, r = "select-one" === e.type || 0 > o, s = r ? null : [], a = r ? o + 1 : i.length, l = 0 > o ? a : r ? o : 0; a > l; l++)
                        if (((n = i[l]).selected || l === o) && (ue.optDisabled ? !n.disabled : null === n.getAttribute("disabled")) && (!n.parentNode.disabled || !fe.nodeName(n.parentNode, "optgroup"))) {
                            if (t = fe(n).val(),
                            r)
                                return t;
                            s.push(t)
                        }
                    return s
                },
                set: function(e, t) {
                    for (var n, i, o = e.options, r = fe.makeArray(t), s = o.length; s--; )
                        if (i = o[s],
                        fe.inArray(fe.valHooks.option.get(i), r) > -1)
                            try {
                                i.selected = n = !0
                            } catch (ae) {
                                i.scrollHeight
                            }
                        else
                            i.selected = !1;
                    return n || (e.selectedIndex = -1),
                    o
                }
            }
        }
    }),
    fe.each(["radio", "checkbox"], function() {
        fe.valHooks[this] = {
            set: function(e, t) {
                return fe.isArray(t) ? e.checked = fe.inArray(fe(e).val(), t) > -1 : void 0
            }
        },
        ue.checkOn || (fe.valHooks[this].get = function(e) {
            return null === e.getAttribute("value") ? "on" : e.value
        }
        )
    });
    var Nt, Lt, jt = fe.expr.attrHandle, Ht = /^(?:checked|selected)$/i, Dt = ue.getSetAttribute, Ot = ue.input;
    fe.fn.extend({
        attr: function(e, t) {
            return ze(this, fe.attr, e, t, arguments.length > 1)
        },
        removeAttr: function(e) {
            return this.each(function() {
                fe.removeAttr(this, e)
            })
        }
    }),
    fe.extend({
        attr: function(e, t, n) {
            var i, o, r = e.nodeType;
            if (3 !== r && 8 !== r && 2 !== r)
                return "undefined" == typeof e.getAttribute ? fe.prop(e, t, n) : (1 === r && fe.isXMLDoc(e) || (t = t.toLowerCase(),
                o = fe.attrHooks[t] || (fe.expr.match.bool.test(t) ? Lt : Nt)),
                void 0 !== n ? null === n ? void fe.removeAttr(e, t) : o && "set"in o && void 0 !== (i = o.set(e, n, t)) ? i : (e.setAttribute(t, n + ""),
                n) : o && "get"in o && null !== (i = o.get(e, t)) ? i : null == (i = fe.find.attr(e, t)) ? void 0 : i)
        },
        attrHooks: {
            type: {
                set: function(e, t) {
                    if (!ue.radioValue && "radio" === t && fe.nodeName(e, "input")) {
                        var n = e.value;
                        return e.setAttribute("type", t),
                        n && (e.value = n),
                        t
                    }
                }
            }
        },
        removeAttr: function(e, t) {
            var n, i, o = 0, r = t && t.match(Le);
            if (r && 1 === e.nodeType)
                for (; n = r[o++]; )
                    i = fe.propFix[n] || n,
                    fe.expr.match.bool.test(n) ? Ot && Dt || !Ht.test(n) ? e[i] = !1 : e[fe.camelCase("default-" + n)] = e[i] = !1 : fe.attr(e, n, ""),
                    e.removeAttribute(Dt ? n : i)
        }
    }),
    Lt = {
        set: function(e, t, n) {
            return !1 === t ? fe.removeAttr(e, n) : Ot && Dt || !Ht.test(n) ? e.setAttribute(!Dt && fe.propFix[n] || n, n) : e[fe.camelCase("default-" + n)] = e[n] = !0,
            n
        }
    },
    fe.each(fe.expr.match.bool.source.match(/\w+/g), function(e, t) {
        var n = jt[t] || fe.find.attr;
        Ot && Dt || !Ht.test(t) ? jt[t] = function(e, t, i) {
            var o, r;
            return i || (r = jt[t],
            jt[t] = o,
            o = null != n(e, t, i) ? t.toLowerCase() : null,
            jt[t] = r),
            o
        }
        : jt[t] = function(e, t, n) {
            return n ? void 0 : e[fe.camelCase("default-" + t)] ? t.toLowerCase() : null
        }
    }),
    Ot && Dt || (fe.attrHooks.value = {
        set: function(e, t, n) {
            return fe.nodeName(e, "input") ? void (e.defaultValue = t) : Nt && Nt.set(e, t, n)
        }
    }),
    Dt || (Nt = {
        set: function(e, t, n) {
            var i = e.getAttributeNode(n);
            return i || e.setAttributeNode(i = e.ownerDocument.createAttribute(n)),
            i.value = t += "",
            "value" === n || t === e.getAttribute(n) ? t : void 0
        }
    },
    jt.id = jt.name = jt.coords = function(e, t, n) {
        var i;
        return n ? void 0 : (i = e.getAttributeNode(t)) && "" !== i.value ? i.value : null
    }
    ,
    fe.valHooks.button = {
        get: function(e, t) {
            var n = e.getAttributeNode(t);
            return n && n.specified ? n.value : void 0
        },
        set: Nt.set
    },
    fe.attrHooks.contenteditable = {
        set: function(e, t, n) {
            Nt.set(e, "" !== t && t, n)
        }
    },
    fe.each(["width", "height"], function(e, t) {
        fe.attrHooks[t] = {
            set: function(e, n) {
                return "" === n ? (e.setAttribute(t, "auto"),
                n) : void 0
            }
        }
    })),
    ue.style || (fe.attrHooks.style = {
        get: function(e) {
            return e.style.cssText || void 0
        },
        set: function(e, t) {
            return e.style.cssText = t + ""
        }
    });
    var Mt = /^(?:input|select|textarea|button|object)$/i
      , Pt = /^(?:a|area)$/i;
    fe.fn.extend({
        prop: function(e, t) {
            return ze(this, fe.prop, e, t, arguments.length > 1)
        },
        removeProp: function(e) {
            return e = fe.propFix[e] || e,
            this.each(function() {
                try {
                    this[e] = void 0,
                    delete this[e]
                } catch (t) {}
            })
        }
    }),
    fe.extend({
        prop: function(e, t, n) {
            var i, o, r = e.nodeType;
            if (3 !== r && 8 !== r && 2 !== r)
                return 1 === r && fe.isXMLDoc(e) || (t = fe.propFix[t] || t,
                o = fe.propHooks[t]),
                void 0 !== n ? o && "set"in o && void 0 !== (i = o.set(e, n, t)) ? i : e[t] = n : o && "get"in o && null !== (i = o.get(e, t)) ? i : e[t]
        },
        propHooks: {
            tabIndex: {
                get: function(e) {
                    var t = fe.find.attr(e, "tabindex");
                    return t ? parseInt(t, 10) : Mt.test(e.nodeName) || Pt.test(e.nodeName) && e.href ? 0 : -1
                }
            }
        },
        propFix: {
            "for": "htmlFor",
            "class": "className"
        }
    }),
    ue.hrefNormalized || fe.each(["href", "src"], function(e, t) {
        fe.propHooks[t] = {
            get: function(e) {
                return e.getAttribute(t, 4)
            }
        }
    }),
    ue.optSelected || (fe.propHooks.selected = {
        get: function(e) {
            var t = e.parentNode;
            return t && (t.selectedIndex,
            t.parentNode && t.parentNode.selectedIndex),
            null
        },
        set: function(e) {
            var t = e.parentNode;
            t && (t.selectedIndex,
            t.parentNode && t.parentNode.selectedIndex)
        }
    }),
    fe.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function() {
        fe.propFix[this.toLowerCase()] = this
    }),
    ue.enctype || (fe.propFix.enctype = "encoding");
    var qt = /[\t\r\n\f]/g;
    fe.fn.extend({
        addClass: function(e) {
            var t, n, i, o, r, s, a, l = 0;
            if (fe.isFunction(e))
                return this.each(function(t) {
                    fe(this).addClass(e.call(this, t, B(this)))
                });
            if ("string" == typeof e && e)
                for (t = e.match(Le) || []; n = this[l++]; )
                    if (o = B(n),
                    i = 1 === n.nodeType && (" " + o + " ").replace(qt, " ")) {
                        for (s = 0; r = t[s++]; )
                            i.indexOf(" " + r + " ") < 0 && (i += r + " ");
                        o !== (a = fe.trim(i)) && fe.attr(n, "class", a)
                    }
            return this
        },
        removeClass: function(e) {
            var t, n, i, o, r, s, a, l = 0;
            if (fe.isFunction(e))
                return this.each(function(t) {
                    fe(this).removeClass(e.call(this, t, B(this)))
                });
            if (!arguments.length)
                return this.attr("class", "");
            if ("string" == typeof e && e)
                for (t = e.match(Le) || []; n = this[l++]; )
                    if (o = B(n),
                    i = 1 === n.nodeType && (" " + o + " ").replace(qt, " ")) {
                        for (s = 0; r = t[s++]; )
                            for (; i.indexOf(" " + r + " ") > -1; )
                                i = i.replace(" " + r + " ", " ");
                        o !== (a = fe.trim(i)) && fe.attr(n, "class", a)
                    }
            return this
        },
        toggleClass: function(e, t) {
            var n = typeof e;
            return "boolean" == typeof t && "string" === n ? t ? this.addClass(e) : this.removeClass(e) : fe.isFunction(e) ? this.each(function(n) {
                fe(this).toggleClass(e.call(this, n, B(this), t), t)
            }) : this.each(function() {
                var t, i, o, r;
                if ("string" === n)
                    for (i = 0,
                    o = fe(this),
                    r = e.match(Le) || []; t = r[i++]; )
                        o.hasClass(t) ? o.removeClass(t) : o.addClass(t);
                else
                    void 0 !== e && "boolean" !== n || ((t = B(this)) && fe._data(this, "__className__", t),
                    fe.attr(this, "class", t || !1 === e ? "" : fe._data(this, "__className__") || ""))
            })
        },
        hasClass: function(e) {
            var t, n, i = 0;
            for (t = " " + e + " "; n = this[i++]; )
                if (1 === n.nodeType && (" " + B(n) + " ").replace(qt, " ").indexOf(t) > -1)
                    return !0;
            return !1
        }
    }),
    fe.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "), function(e, t) {
        fe.fn[t] = function(e, n) {
            return arguments.length > 0 ? this.on(t, null, e, n) : this.trigger(t)
        }
    }),
    fe.fn.extend({
        hover: function(e, t) {
            return this.mouseenter(e).mouseleave(t || e)
        }
    });
    var zt = e.location
      , It = fe.now()
      , Ft = /\?/
      , Rt = /(,)|(\[|{)|(}|])|"(?:[^"\\\r\n]|\\["\\\/bfnrt]|\\u[\da-fA-F]{4})*"\s*:?|true|false|null|-?(?!0\d)\d+(?:\.\d+|)(?:[eE][+-]?\d+|)/g;
    fe.parseJSON = function(t) {
        if (e.JSON && e.JSON.parse)
            return e.JSON.parse(t + "");
        var n, i = null, o = fe.trim(t + "");
        return o && !fe.trim(o.replace(Rt, function(e, t, o, r) {
            return n && t && (i = 0),
            0 === i ? e : (n = o || t,
            i += !r - !o,
            "")
        })) ? Function("return " + o)() : fe.error("Invalid JSON: " + t)
    }
    ,
    fe.parseXML = function(t) {
        var n;
        if (!t || "string" != typeof t)
            return null;
        try {
            e.DOMParser ? n = (new e.DOMParser).parseFromString(t, "text/xml") : ((n = new e.ActiveXObject("Microsoft.XMLDOM")).async = "false",
            n.loadXML(t))
        } catch (oe) {
            n = void 0
        }
        return n && n.documentElement && !n.getElementsByTagName("parsererror").length || fe.error("Invalid XML: " + t),
        n
    }
    ;
    var Wt = /#.*$/
      , _t = /([?&])_=[^&]*/
      , Bt = /^(.*?):[ \t]*([^\r\n]*)\r?$/gm
      , Ut = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/
      , Xt = /^(?:GET|HEAD)$/
      , Yt = /^\/\//
      , Vt = /^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/
      , Gt = {}
      , Jt = {}
      , Qt = "*/".concat("*")
      , Kt = zt.href
      , Zt = Vt.exec(Kt.toLowerCase()) || [];
    fe.extend({
        active: 0,
        lastModified: {},
        etag: {},
        ajaxSettings: {
            url: Kt,
            type: "GET",
            isLocal: Ut.test(Zt[1]),
            global: !0,
            processData: !0,
            async: !0,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            accepts: {
                "*": Qt,
                text: "text/plain",
                html: "text/html",
                xml: "application/xml, text/xml",
                json: "application/json, text/javascript"
            },
            contents: {
                xml: /\bxml\b/,
                html: /\bhtml/,
                json: /\bjson\b/
            },
            responseFields: {
                xml: "responseXML",
                text: "responseText",
                json: "responseJSON"
            },
            converters: {
                "* text": String,
                "text html": !0,
                "text json": fe.parseJSON,
                "text xml": fe.parseXML
            },
            flatOptions: {
                url: !0,
                context: !0
            }
        },
        ajaxSetup: function(e, t) {
            return t ? Y(Y(e, fe.ajaxSettings), t) : Y(fe.ajaxSettings, e)
        },
        ajaxPrefilter: U(Gt),
        ajaxTransport: U(Jt),
        ajax: function(t, n) {
            function i(t, n, i, o) {
                var r, u, y, w, x, T = n;
                2 !== b && (b = 2,
                l && e.clearTimeout(l),
                c = void 0,
                a = o || "",
                k.readyState = t > 0 ? 4 : 0,
                r = t >= 200 && 300 > t || 304 === t,
                i && (w = V(p, k, i)),
                w = G(p, w, k, r),
                r ? (p.ifModified && ((x = k.getResponseHeader("Last-Modified")) && (fe.lastModified[s] = x),
                (x = k.getResponseHeader("etag")) && (fe.etag[s] = x)),
                204 === t || "HEAD" === p.type ? T = "nocontent" : 304 === t ? T = "notmodified" : (T = w.state,
                u = w.data,
                r = !(y = w.error))) : (y = T,
                !t && T || (T = "error",
                0 > t && (t = 0))),
                k.status = t,
                k.statusText = (n || T) + "",
                r ? v.resolveWith(f, [u, T, k]) : v.rejectWith(f, [k, T, y]),
                k.statusCode(m),
                m = void 0,
                d && h.trigger(r ? "ajaxSuccess" : "ajaxError", [k, p, r ? u : y]),
                g.fireWith(f, [k, T]),
                d && (h.trigger("ajaxComplete", [k, p]),
                --fe.active || fe.event.trigger("ajaxStop")))
            }
            "object" == typeof t && (n = t,
            t = void 0),
            n = n || {};
            var o, r, s, a, l, d, c, u, p = fe.ajaxSetup({}, n), f = p.context || p, h = p.context && (f.nodeType || f.jquery) ? fe(f) : fe.event, v = fe.Deferred(), g = fe.Callbacks("once memory"), m = p.statusCode || {}, y = {}, w = {}, b = 0, x = "canceled", k = {
                readyState: 0,
                getResponseHeader: function(e) {
                    var t;
                    if (2 === b) {
                        if (!u)
                            for (u = {}; t = Bt.exec(a); )
                                u[t[1].toLowerCase()] = t[2];
                        t = u[e.toLowerCase()]
                    }
                    return null == t ? null : t
                },
                getAllResponseHeaders: function() {
                    return 2 === b ? a : null
                },
                setRequestHeader: function(e, t) {
                    var n = e.toLowerCase();
                    return b || (e = w[n] = w[n] || e,
                    y[e] = t),
                    this
                },
                overrideMimeType: function(e) {
                    return b || (p.mimeType = e),
                    this
                },
                statusCode: function(e) {
                    var t;
                    if (e)
                        if (2 > b)
                            for (t in e)
                                m[t] = [m[t], e[t]];
                        else
                            k.always(e[k.status]);
                    return this
                },
                abort: function(e) {
                    var t = e || x;
                    return c && c.abort(t),
                    i(0, t),
                    this
                }
            };
            if (v.promise(k).complete = g.add,
            k.success = k.done,
            k.error = k.fail,
            p.url = ((t || p.url || Kt) + "").replace(Wt, "").replace(Yt, Zt[1] + "//"),
            p.type = n.method || n.type || p.method || p.type,
            p.dataTypes = fe.trim(p.dataType || "*").toLowerCase().match(Le) || [""],
            null == p.crossDomain && (o = Vt.exec(p.url.toLowerCase()),
            p.crossDomain = !(!o || o[1] === Zt[1] && o[2] === Zt[2] && (o[3] || ("http:" === o[1] ? "80" : "443")) === (Zt[3] || ("http:" === Zt[1] ? "80" : "443")))),
            p.data && p.processData && "string" != typeof p.data && (p.data = fe.param(p.data, p.traditional)),
            X(Gt, p, n, k),
            2 === b)
                return k;
            for (r in (d = fe.event && p.global) && 0 == fe.active++ && fe.event.trigger("ajaxStart"),
            p.type = p.type.toUpperCase(),
            p.hasContent = !Xt.test(p.type),
            s = p.url,
            p.hasContent || (p.data && (s = p.url += (Ft.test(s) ? "&" : "?") + p.data,
            delete p.data),
            !1 === p.cache && (p.url = _t.test(s) ? s.replace(_t, "$1_=" + It++) : s + (Ft.test(s) ? "&" : "?") + "_=" + It++)),
            p.ifModified && (fe.lastModified[s] && k.setRequestHeader("If-Modified-Since", fe.lastModified[s]),
            fe.etag[s] && k.setRequestHeader("If-None-Match", fe.etag[s])),
            (p.data && p.hasContent && !1 !== p.contentType || n.contentType) && k.setRequestHeader("Content-Type", p.contentType),
            k.setRequestHeader("Accept", p.dataTypes[0] && p.accepts[p.dataTypes[0]] ? p.accepts[p.dataTypes[0]] + ("*" !== p.dataTypes[0] ? ", " + Qt + "; q=0.01" : "") : p.accepts["*"]),
            p.headers)
                k.setRequestHeader(r, p.headers[r]);
            if (p.beforeSend && (!1 === p.beforeSend.call(f, k, p) || 2 === b))
                return k.abort();
            for (r in x = "abort",
            {
                success: 1,
                error: 1,
                complete: 1
            })
                k[r](p[r]);
            if (c = X(Jt, p, n, k)) {
                if (k.readyState = 1,
                d && h.trigger("ajaxSend", [k, p]),
                2 === b)
                    return k;
                p.async && p.timeout > 0 && (l = e.setTimeout(function() {
                    k.abort("timeout")
                }, p.timeout));
                try {
                    b = 1,
                    c.send(y, i)
                } catch (ke) {
                    if (!(2 > b))
                        throw ke;
                    i(-1, ke)
                }
            } else
                i(-1, "No Transport");
            return k
        },
        getJSON: function(e, t, n) {
            return fe.get(e, t, n, "json")
        },
        getScript: function(e, t) {
            return fe.get(e, void 0, t, "script")
        }
    }),
    fe.each(["get", "post"], function(e, t) {
        fe[t] = function(e, n, i, o) {
            return fe.isFunction(n) && (o = o || i,
            i = n,
            n = void 0),
            fe.ajax(fe.extend({
                url: e,
                type: t,
                dataType: o,
                data: n,
                success: i
            }, fe.isPlainObject(e) && e))
        }
    }),
    fe._evalUrl = function(e) {
        return fe.ajax({
            url: e,
            type: "GET",
            dataType: "script",
            cache: !0,
            async: !1,
            global: !1,
            throws: !0
        })
    }
    ,
    fe.fn.extend({
        wrapAll: function(e) {
            if (fe.isFunction(e))
                return this.each(function(t) {
                    fe(this).wrapAll(e.call(this, t))
                });
            if (this[0]) {
                var t = fe(e, this[0].ownerDocument).eq(0).clone(!0);
                this[0].parentNode && t.insertBefore(this[0]),
                t.map(function() {
                    for (var e = this; e.firstChild && 1 === e.firstChild.nodeType; )
                        e = e.firstChild;
                    return e
                }).append(this)
            }
            return this
        },
        wrapInner: function(e) {
            return fe.isFunction(e) ? this.each(function(t) {
                fe(this).wrapInner(e.call(this, t))
            }) : this.each(function() {
                var t = fe(this)
                  , n = t.contents();
                n.length ? n.wrapAll(e) : t.append(e)
            })
        },
        wrap: function(e) {
            var t = fe.isFunction(e);
            return this.each(function(n) {
                fe(this).wrapAll(t ? e.call(this, n) : e)
            })
        },
        unwrap: function() {
            return this.parent().each(function() {
                fe.nodeName(this, "body") || fe(this).replaceWith(this.childNodes)
            }).end()
        }
    }),
    fe.expr.filters.hidden = function(e) {
        return ue.reliableHiddenOffsets() ? e.offsetWidth <= 0 && e.offsetHeight <= 0 && !e.getClientRects().length : Q(e)
    }
    ,
    fe.expr.filters.visible = function(e) {
        return !fe.expr.filters.hidden(e)
    }
    ;
    var en = /%20/g
      , tn = /\[\]$/
      , nn = /\r?\n/g
      , on = /^(?:submit|button|image|reset|file)$/i
      , rn = /^(?:input|select|textarea|keygen)/i;
    fe.param = function(e, t) {
        var n, i = [], o = function(e, t) {
            t = fe.isFunction(t) ? t() : null == t ? "" : t,
            i[i.length] = encodeURIComponent(e) + "=" + encodeURIComponent(t)
        };
        if (void 0 === t && (t = fe.ajaxSettings && fe.ajaxSettings.traditional),
        fe.isArray(e) || e.jquery && !fe.isPlainObject(e))
            fe.each(e, function() {
                o(this.name, this.value)
            });
        else
            for (n in e)
                K(n, e[n], t, o);
        return i.join("&").replace(en, "+")
    }
    ,
    fe.fn.extend({
        serialize: function() {
            return fe.param(this.serializeArray())
        },
        serializeArray: function() {
            return this.map(function() {
                var e = fe.prop(this, "elements");
                return e ? fe.makeArray(e) : this
            }).filter(function() {
                var e = this.type;
                return this.name && !fe(this).is(":disabled") && rn.test(this.nodeName) && !on.test(e) && (this.checked || !Ie.test(e))
            }).map(function(e, t) {
                var n = fe(this).val();
                return null == n ? null : fe.isArray(n) ? fe.map(n, function(e) {
                    return {
                        name: t.name,
                        value: e.replace(nn, "\r\n")
                    }
                }) : {
                    name: t.name,
                    value: n.replace(nn, "\r\n")
                }
            }).get()
        }
    }),
    fe.ajaxSettings.xhr = void 0 !== e.ActiveXObject ? function() {
        return this.isLocal ? ee() : ie.documentMode > 8 ? Z() : /^(get|post|head|put|delete|options)$/i.test(this.type) && Z() || ee()
    }
    : Z;
    var sn = 0
      , an = {}
      , ln = fe.ajaxSettings.xhr();
    e.attachEvent && e.attachEvent("onunload", function() {
        for (var e in an)
            an[e](void 0, !0)
    }),
    ue.cors = !!ln && "withCredentials"in ln,
    (ln = ue.ajax = !!ln) && fe.ajaxTransport(function(t) {
        var n;
        if (!t.crossDomain || ue.cors)
            return {
                send: function(i, o) {
                    var r, s = t.xhr(), a = ++sn;
                    if (s.open(t.type, t.url, t.async, t.username, t.password),
                    t.xhrFields)
                        for (r in t.xhrFields)
                            s[r] = t.xhrFields[r];
                    for (r in t.mimeType && s.overrideMimeType && s.overrideMimeType(t.mimeType),
                    t.crossDomain || i["X-Requested-With"] || (i["X-Requested-With"] = "XMLHttpRequest"),
                    i)
                        void 0 !== i[r] && s.setRequestHeader(r, i[r] + "");
                    s.send(t.hasContent && t.data || null),
                    n = function(e, i) {
                        var r, l, d;
                        if (n && (i || 4 === s.readyState))
                            if (delete an[a],
                            n = void 0,
                            s.onreadystatechange = fe.noop,
                            i)
                                4 !== s.readyState && s.abort();
                            else {
                                d = {},
                                r = s.status,
                                "string" == typeof s.responseText && (d.text = s.responseText);
                                try {
                                    l = s.statusText
                                } catch (ce) {
                                    l = ""
                                }
                                r || !t.isLocal || t.crossDomain ? 1223 === r && (r = 204) : r = d.text ? 200 : 404
                            }
                        d && o(r, l, d, s.getAllResponseHeaders())
                    }
                    ,
                    t.async ? 4 === s.readyState ? e.setTimeout(n) : s.onreadystatechange = an[a] = n : n()
                },
                abort: function() {
                    n && n(void 0, !0)
                }
            }
    }),
    fe.ajaxSetup({
        accepts: {
            script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
        },
        contents: {
            script: /\b(?:java|ecma)script\b/
        },
        converters: {
            "text script": function(e) {
                return fe.globalEval(e),
                e
            }
        }
    }),
    fe.ajaxPrefilter("script", function(e) {
        void 0 === e.cache && (e.cache = !1),
        e.crossDomain && (e.type = "GET",
        e.global = !1)
    }),
    fe.ajaxTransport("script", function(e) {
        if (e.crossDomain) {
            var t, n = ie.head || fe("head")[0] || ie.documentElement;
            return {
                send: function(i, o) {
                    (t = ie.createElement("script")).async = !0,
                    e.scriptCharset && (t.charset = e.scriptCharset),
                    t.src = e.url,
                    t.onload = t.onreadystatechange = function(e, n) {
                        (n || !t.readyState || /loaded|complete/.test(t.readyState)) && (t.onload = t.onreadystatechange = null,
                        t.parentNode && t.parentNode.removeChild(t),
                        t = null,
                        n || o(200, "success"))
                    }
                    ,
                    n.insertBefore(t, n.firstChild)
                },
                abort: function() {
                    t && t.onload(void 0, !0)
                }
            }
        }
    });
    var dn = []
      , cn = /(=)\?(?=&|$)|\?\?/;
    fe.ajaxSetup({
        jsonp: "callback",
        jsonpCallback: function() {
            var e = dn.pop() || fe.expando + "_" + It++;
            return this[e] = !0,
            e
        }
    }),
    fe.ajaxPrefilter("json jsonp", function(t, n, i) {
        var o, r, s, a = !1 !== t.jsonp && (cn.test(t.url) ? "url" : "string" == typeof t.data && 0 === (t.contentType || "").indexOf("application/x-www-form-urlencoded") && cn.test(t.data) && "data");
        return a || "jsonp" === t.dataTypes[0] ? (o = t.jsonpCallback = fe.isFunction(t.jsonpCallback) ? t.jsonpCallback() : t.jsonpCallback,
        a ? t[a] = t[a].replace(cn, "$1" + o) : !1 !== t.jsonp && (t.url += (Ft.test(t.url) ? "&" : "?") + t.jsonp + "=" + o),
        t.converters["script json"] = function() {
            return s || fe.error(o + " was not called"),
            s[0]
        }
        ,
        t.dataTypes[0] = "json",
        r = e[o],
        e[o] = function() {
            s = arguments
        }
        ,
        i.always(function() {
            void 0 === r ? fe(e).removeProp(o) : e[o] = r,
            t[o] && (t.jsonpCallback = n.jsonpCallback,
            dn.push(o)),
            s && fe.isFunction(r) && r(s[0]),
            s = r = void 0
        }),
        "script") : void 0
    }),
    fe.parseHTML = function(e, t, n) {
        if (!e || "string" != typeof e)
            return null;
        "boolean" == typeof t && (n = t,
        t = !1),
        t = t || ie;
        var i = ke.exec(e)
          , o = !n && [];
        return i ? [t.createElement(i[1])] : (i = m([e], t, o),
        o && o.length && fe(o).remove(),
        fe.merge([], i.childNodes))
    }
    ;
    var un = fe.fn.load;
    fe.fn.load = function(e, t, n) {
        if ("string" != typeof e && un)
            return un.apply(this, arguments);
        var i, o, r, s = this, a = e.indexOf(" ");
        return a > -1 && (i = fe.trim(e.slice(a, e.length)),
        e = e.slice(0, a)),
        fe.isFunction(t) ? (n = t,
        t = void 0) : t && "object" == typeof t && (o = "POST"),
        s.length > 0 && fe.ajax({
            url: e,
            type: o || "GET",
            dataType: "html",
            data: t
        }).done(function(e) {
            r = arguments,
            s.html(i ? fe("<div>").append(fe.parseHTML(e)).find(i) : e)
        }).always(n && function(e, t) {
            s.each(function() {
                n.apply(this, r || [e.responseText, t, e])
            })
        }
        ),
        this
    }
    ,
    fe.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function(e, t) {
        fe.fn[t] = function(e) {
            return this.on(t, e)
        }
    }),
    fe.expr.filters.animated = function(e) {
        return fe.grep(fe.timers, function(t) {
            return e === t.elem
        }).length
    }
    ,
    fe.offset = {
        setOffset: function(e, t, n) {
            var i, o, r, s, a, l, d = fe.css(e, "position"), c = fe(e), u = {};
            "static" === d && (e.style.position = "relative"),
            a = c.offset(),
            r = fe.css(e, "top"),
            l = fe.css(e, "left"),
            ("absolute" === d || "fixed" === d) && fe.inArray("auto", [r, l]) > -1 ? (s = (i = c.position()).top,
            o = i.left) : (s = parseFloat(r) || 0,
            o = parseFloat(l) || 0),
            fe.isFunction(t) && (t = t.call(e, n, fe.extend({}, a))),
            null != t.top && (u.top = t.top - a.top + s),
            null != t.left && (u.left = t.left - a.left + o),
            "using"in t ? t.using.call(e, u) : c.css(u)
        }
    },
    fe.fn.extend({
        offset: function(e) {
            if (arguments.length)
                return void 0 === e ? this : this.each(function(t) {
                    fe.offset.setOffset(this, e, t)
                });
            var t, n, i = {
                top: 0,
                left: 0
            }, o = this[0], r = o && o.ownerDocument;
            return r ? (t = r.documentElement,
            fe.contains(t, o) ? ("undefined" != typeof o.getBoundingClientRect && (i = o.getBoundingClientRect()),
            n = te(r),
            {
                top: i.top + (n.pageYOffset || t.scrollTop) - (t.clientTop || 0),
                left: i.left + (n.pageXOffset || t.scrollLeft) - (t.clientLeft || 0)
            }) : i) : void 0
        },
        position: function() {
            if (this[0]) {
                var e, t, n = {
                    top: 0,
                    left: 0
                }, i = this[0];
                return "fixed" === fe.css(i, "position") ? t = i.getBoundingClientRect() : (e = this.offsetParent(),
                t = this.offset(),
                fe.nodeName(e[0], "html") || (n = e.offset()),
                n.top += fe.css(e[0], "borderTopWidth", !0),
                n.left += fe.css(e[0], "borderLeftWidth", !0)),
                {
                    top: t.top - n.top - fe.css(i, "marginTop", !0),
                    left: t.left - n.left - fe.css(i, "marginLeft", !0)
                }
            }
        },
        offsetParent: function() {
            return this.map(function() {
                for (var e = this.offsetParent; e && !fe.nodeName(e, "html") && "static" === fe.css(e, "position"); )
                    e = e.offsetParent;
                return e || ut
            })
        }
    }),
    fe.each({
        scrollLeft: "pageXOffset",
        scrollTop: "pageYOffset"
    }, function(e, t) {
        var n = /Y/.test(t);
        fe.fn[e] = function(i) {
            return ze(this, function(e, i, o) {
                var r = te(e);
                return void 0 === o ? r ? t in r ? r[t] : r.document.documentElement[i] : e[i] : void (r ? r.scrollTo(n ? fe(r).scrollLeft() : o, n ? o : fe(r).scrollTop()) : e[i] = o)
            }, e, i, arguments.length, null)
        }
    }),
    fe.each(["top", "left"], function(e, t) {
        fe.cssHooks[t] = j(ue.pixelPosition, function(e, n) {
            return n ? (n = ft(e, t),
            dt.test(n) ? fe(e).position()[t] + "px" : n) : void 0
        })
    }),
    fe.each({
        Height: "height",
        Width: "width"
    }, function(e, t) {
        fe.each({
            padding: "inner" + e,
            content: t,
            "": "outer" + e
        }, function(n, i) {
            fe.fn[i] = function(i, o) {
                var r = arguments.length && (n || "boolean" != typeof i)
                  , s = n || (!0 === i || !0 === o ? "margin" : "border");
                return ze(this, function(t, n, i) {
                    var o;
                    return fe.isWindow(t) ? t.document.documentElement["client" + e] : 9 === t.nodeType ? (o = t.documentElement,
                    Math.max(t.body["scroll" + e], o["scroll" + e], t.body["offset" + e], o["offset" + e], o["client" + e])) : void 0 === i ? fe.css(t, n, s) : fe.style(t, n, i, s)
                }, t, r ? i : void 0, r, null)
            }
        })
    }),
    fe.fn.extend({
        bind: function(e, t, n) {
            return this.on(e, null, t, n)
        },
        unbind: function(e, t) {
            return this.off(e, null, t)
        },
        delegate: function(e, t, n, i) {
            return this.on(t, e, n, i)
        },
        undelegate: function(e, t, n) {
            return 1 === arguments.length ? this.off(e, "**") : this.off(t, e || "**", n)
        }
    }),
    fe.fn.size = function() {
        return this.length
    }
    ,
    fe.fn.andSelf = fe.fn.addBack,
    "function" == typeof define && define.amd && define("jquery", [], function() {
        return fe
    });
    var pn = e.jQuery
      , fn = e.$;
    return fe.noConflict = function(t) {
        return e.$ === fe && (e.$ = fn),
        t && e.jQuery === fe && (e.jQuery = pn),
        fe
    }
    ,
    t || (e.jQuery = e.$ = fe),
    fe
}),
function(e) {
    "use strict";
    function t(e) {
        var t = {}
          , n = e ? e.split(/\.|-|_/) : ["0", "0", "0"];
        return t.info = n.join("."),
        t.major = n[0] || "0",
        t.minor = n[1] || "0",
        t.patch = n[2] || "0",
        t
    }
    Array.isArray || (Array.isArray = function(e) {
        return "[object Array]" === Object.prototype.toString.call(e)
    }
    );
    var n = ["crios", "fxios", "daumapps"]
      , i = e.userAgent = function(e, i) {
        var o = function(e) {
            return e ? e.toLowerCase() : "undefined" != typeof window && window.navigator && "string" == typeof window.navigator.userAgent ? window.navigator.userAgent.toLowerCase() : ""
        }(e);
        return {
            ua: o,
            browser: function(e) {
                var n = {}
                  , i = /(dolfin)[ \/]([\w.]+)/.exec(e) || /(edge)[ \/]([\w.]+)/.exec(e) || /(chrome)[ \/]([\w.]+)/.exec(e) || /(tizen)[ \/]([\w.]+)/.exec(e) || /(opera)(?:.*version)?[ \/]([\w.]+)/.exec(e) || /(webkit)(?:.*version)?[ \/]([\w.]+)/.exec(e) || /(msie) ([\w.]+)/.exec(e) || e.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+))?/.exec(e) || ["", "unknown"];
                return "webkit" === i[1] ? i = /(iphone|ipad|ipod)[\S\s]*os ([\w._\-]+) like/.exec(e) || /(android)[ \/]([\w._\-]+);/.exec(e) || [i[0], "safari", i[2]] : "mozilla" === i[1] ? /trident/.test(e) ? i[1] = "msie" : i[1] = "firefox" : /polaris|natebrowser|([010|011|016|017|018|019]{3}\d{3,4}\d{4}$)/.test(e) && (i[1] = "polaris"),
                n[i[1]] = !0,
                n.name = i[1],
                n.version = t(i[2]),
                n
            }(o),
            platform: function(e) {
                return function(e) {
                    return !(!e.match(/linux|windows (nt|98)|macintosh|cros/) || e.match(/android|mobile|polaris|lgtelecom|uzard|natebrowser|ktf;|skt;/))
                }(e) ? "pc" : function(e) {
                    return !!(e.match(/ipad/) || e.match(/android/) && !e.match(/mobi|mini|fennec/))
                }(e) ? "tablet" : function(e) {
                    return !!e.match(/ip(hone|od)|android.+mobile|windows (ce|phone)|blackberry|bb10|symbian|webos|firefox.+fennec|opera m(ob|in)i|tizen.+mobile|polaris|iemobile|lgtelecom|nokia|sonyericsson|dolfin|uzard|natebrowser|ktf;|skt;/)
                }(e) ? "mobile" : ""
            }(o),
            os: function(e) {
                var n = {}
                  , i = /(iphone|ipad|ipod)[\S\s]*os ([\w._\-]+) like/.exec(e) || !!/polaris|natebrowser|([010|011|016|017|018|019]{3}\d{3,4}\d{4}$)/.test(e) && ["", "polaris", "0.0.0"] || /(windows)(?: nt | phone(?: os){0,1} | )([\w._\-]+)/.exec(e) || /(android)[ \/]([\w._\-]+);/.exec(e) || !!/android/.test(e) && ["", "android", "0.0.0"] || !!/(windows)/.test(e) && ["", "windows", "0.0.0"] || /(mac) os x ([\w._\-]+)/.exec(e) || /(tizen)[ \/]([\w._\-]+);/.exec(e) || !!/(linux)/.test(e) && ["", "linux", "0.0.0"] || !!/webos/.test(e) && ["", "webos", "0.0.0"] || /(cros)(?:\s[\w]+\s)([\d._\-]+)/.exec(e) || /(bada)[ \/]([\w._\-]+)/.exec(e) || !!/bada/.test(e) && ["", "bada", "0.0.0"] || !!/(rim|blackberry|bb10)/.test(e) && ["", "blackberry", "0.0.0"] || ["", "unknown", "0.0.0"];
                return "iphone" === i[1] || "ipad" === i[1] || "ipod" === i[1] ? i[1] = "ios" : "windows" === i[1] && "98" === i[2] && (i[2] = "0.98.0"),
                "cros" === i[1] && (i[1] = "chrome"),
                n[i[1]] = !0,
                n.name = i[1],
                n.version = t(i[2]),
                n
            }(o),
            app: function(e, i) {
                var o = {}
                  , r = null
                  , s = n;
                Array.isArray(i) ? s = n.concat(i) : "string" == typeof i && (s = n.concat([i]));
                for (var a = 0, l = s.length; a < l; a += 1) {
                    var d = s[a];
                    if (r = new RegExp("(" + d + ")[ \\/]([\\w._\\-]+)").exec(e))
                        break
                }
                return (r = r || ["", ""])[1] ? (o.isApp = !0,
                o.name = r[1],
                o.version = t(r[2])) : o.isApp = !1,
                o
            }(o, i)
        }
    }
    ;
    "object" == typeof window && window.navigator.userAgent && (window.ua_result = i(window.navigator.userAgent) || null)
}("object" == typeof exports ? (exports.daumtools = exports,
exports.util = exports,
exports) : "object" == typeof window ? (window.daumtools = void 0 === window.daumtools ? {} : window.daumtools,
window.util = void 0 === window.util ? window.daumtools : window.util,
window.daumtools) : "object" == typeof self ? (self.daumtools = void 0 === self.daumtools ? {} : self.daumtools,
self.util = void 0 === self.util ? self.daumtools : self.util,
self) : void 0),
function(e) {
    "use strict";
    function t(e) {
        top.window.location.href = e
    }
    function n(e, t, n) {
        var o = (new Date).getTime();
        return setTimeout(function() {
            var r = (new Date).getTime();
            i() && r - o < e + a && n(t)
        }, e)
    }
    function i() {
        for (var e = ["hidden", "webkitHidden"], t = 0, n = e.length; t < n; t++)
            if (void 0 !== document[e[t]])
                return !document[e[t]];
        return !0
    }
    function o(e) {
        setTimeout(function() {
            ((function(e) {
                var t = document.createElement("iframe");
                return t.id = e,
                t.style.border = "none",
                t.style.width = "0",
                t.style.height = "0",
                t.style.display = "none",
                t.style.overflow = "hidden",
                document.body.appendChild(t),
                t
            }
            )("appLauncher")).src = e
        }, 100)
    }
    var r, s, a, l, d, c;
    e.web2app = (r = 2e3,
    s = 300,
    a = 100,
    l = e.userAgent(),
    d = l.os,
    c = ["firefox", "opr/"],
    function(e) {
        var a = "function" == typeof e.willInvokeApp ? e.willInvokeApp : function() {}
          , u = "function" == typeof e.onAppMissing ? e.onAppMissing : t
          , p = "function" == typeof e.onUnsupportedEnvironment ? e.onUnsupportedEnvironment : function() {}
        ;
        a(),
        d.android ? function() {
            var e = l.browser.chrome && 25 <= +l.browser.version.major
              , t = new RegExp(c.join("|"),"i");
            return e && !t.test(l.ua)
        }() && e.intentURI && !e.useUrlScheme ? function(e) {
            function t() {
                top.window.location.href = e
            }
            l.browser.chrome ? t() : setTimeout(t, 100)
        }(e.intentURI) : e.storeURL && function(e, t, i) {
            n(s, t, i),
            o(e)
        }(e.urlScheme, e.storeURL, u) : d.ios && e.storeURL ? function(e, t, s, a) {
            var d = n(r, t, s);
            parseInt(l.os.version.major, 10) < 8 ? function(e) {
                window.addEventListener("pagehide", function t() {
                    i() && (clearTimeout(e),
                    window.removeEventListener("pagehide", t))
                })
            }(d) : function(e) {
                document.addEventListener("visibilitychange", function t() {
                    i() && (clearTimeout(e),
                    document.removeEventListener("visibilitychange", t))
                })
            }(d),
            8 < parseInt(l.os.version.major, 10) && l.os.ios ? (void 0 === a ? a = e : clearTimeout(d),
            function(e) {
                top.window.location.href = e
            }(a)) : o(e)
        }(e.urlScheme, e.storeURL, u, e.universalLink) : setTimeout(function() {
            p()
        }, 100)
    }
    )
}("object" == typeof exports ? (exports.daumtools = exports,
exports) : "object" == typeof window ? (window.daumtools = void 0 === window.daumtools ? {} : window.daumtools,
window.daumtools) : void 0),
function(e) {
    "use strict";
    e.daumtools = void 0 === e.daumtools ? {} : e.daumtools,
    void 0 !== e.daumtools.web2app && (e.daumtools.web2app.version = "1.1.1")
}(window),
$(function() {
    $("a.ga-click").click(function() {
        var e = $(this).data("event-category")
          , t = $(this).data("event-action")
          , n = $(this).data("event-label") || null;
        ga("send", "event", {
            eventCategory: e,
            eventAction: t,
            eventLabel: n,
            transport: "beacon"
        })
    })
}),
$(document).ready(function() {
    var e = $("#header-message").height();
    null == e && $("#fixed-bar").addClass("fixed-bar-box-shadow"),
    $(window).scroll(function() {
        $(window).scrollTop() >= e ? $("#fixed-bar").addClass("fixed-bar-box-shadow") : $("#fixed-bar").removeClass("fixed-bar-box-shadow")
    }),
    $("#header-search-input").focus(function() {
        $(".search-keyword-wrap").show()
    });
    var t = $("#fixed-bar-search");
    $(this).mousedown(function(e) {
        0 == t.has(e.target).length && $(".search-keyword-wrap").hide()
    }),
    $("#header-search-input").keypress(function(e) {
        "13" == e.keyCode && (e.preventDefault(),
        $("#header-search-button").click())
    }),
    $("#header-search-button").click(function() {
        var e = $("#header-search-input").val();
        (e = e.replace(/[^(\uac00-\ud7a3\u3131-\u314e\u314f-\u3163a-zA-Z0-9.&\s)]/gi, "")).trim() ? (e = encodeURIComponent(e),
        window.location.href = window.location.origin + "/search/" + e) : $("#header-search-input").focus()
    }),
    $("#hot-articles-more").removeAttr("href"),
    $("#hot-articles-more").click(function(e) {
        facebookClickEventWithPageMove("ViewContent", {}, window.location.origin + e.currentTarget.dataset.url)
    })
}),
function(e) {
    "use strict";
    "function" == typeof define && define.amd ? define(["jquery"], e) : "undefined" != typeof exports ? module.exports = e(require("jquery")) : e(jQuery)
}(function(e) {
    "use strict";
    var t = window.Slick || {};
    (t = function() {
        function t(t, i) {
            var o, r = this;
            r.defaults = {
                accessibility: !0,
                adaptiveHeight: !1,
                appendArrows: e(t),
                appendDots: e(t),
                arrows: !0,
                asNavFor: null,
                prevArrow: '<button class="slick-prev" aria-label="Previous" type="button">Previous</button>',
                nextArrow: '<button class="slick-next" aria-label="Next" type="button">Next</button>',
                autoplay: !1,
                autoplaySpeed: 3e3,
                centerMode: !1,
                centerPadding: "50px",
                cssEase: "ease",
                customPaging: function(t, n) {
                    return e('<button type="button" />').text(n + 1)
                },
                dots: !1,
                dotsClass: "slick-dots",
                draggable: !0,
                easing: "linear",
                edgeFriction: .35,
                fade: !1,
                focusOnSelect: !1,
                focusOnChange: !1,
                infinite: !0,
                initialSlide: 0,
                lazyLoad: "ondemand",
                mobileFirst: !1,
                pauseOnHover: !0,
                pauseOnFocus: !0,
                pauseOnDotsHover: !1,
                respondTo: "window",
                responsive: null,
                rows: 1,
                rtl: !1,
                slide: "",
                slidesPerRow: 1,
                slidesToShow: 1,
                slidesToScroll: 1,
                speed: 500,
                swipe: !0,
                swipeToSlide: !1,
                touchMove: !0,
                touchThreshold: 5,
                useCSS: !0,
                useTransform: !0,
                variableWidth: !1,
                vertical: !1,
                verticalSwiping: !1,
                waitForAnimate: !0,
                zIndex: 1e3
            },
            r.initials = {
                animating: !1,
                dragging: !1,
                autoPlayTimer: null,
                currentDirection: 0,
                currentLeft: null,
                currentSlide: 0,
                direction: 1,
                $dots: null,
                listWidth: null,
                listHeight: null,
                loadIndex: 0,
                $nextArrow: null,
                $prevArrow: null,
                scrolling: !1,
                slideCount: null,
                slideWidth: null,
                $slideTrack: null,
                $slides: null,
                sliding: !1,
                slideOffset: 0,
                swipeLeft: null,
                swiping: !1,
                $list: null,
                touchObject: {},
                transformsEnabled: !1,
                unslicked: !1
            },
            e.extend(r, r.initials),
            r.activeBreakpoint = null,
            r.animType = null,
            r.animProp = null,
            r.breakpoints = [],
            r.breakpointSettings = [],
            r.cssTransitions = !1,
            r.focussed = !1,
            r.interrupted = !1,
            r.hidden = "hidden",
            r.paused = !0,
            r.positionProp = null,
            r.respondTo = null,
            r.rowCount = 1,
            r.shouldClick = !0,
            r.$slider = e(t),
            r.$slidesCache = null,
            r.transformType = null,
            r.transitionType = null,
            r.visibilityChange = "visibilitychange",
            r.windowWidth = 0,
            r.windowTimer = null,
            o = e(t).data("slick") || {},
            r.options = e.extend({}, r.defaults, i, o),
            r.currentSlide = r.options.initialSlide,
            r.originalSettings = r.options,
            "undefined" != typeof document.mozHidden ? (r.hidden = "mozHidden",
            r.visibilityChange = "mozvisibilitychange") : "undefined" != typeof document.webkitHidden && (r.hidden = "webkitHidden",
            r.visibilityChange = "webkitvisibilitychange"),
            r.autoPlay = e.proxy(r.autoPlay, r),
            r.autoPlayClear = e.proxy(r.autoPlayClear, r),
            r.autoPlayIterator = e.proxy(r.autoPlayIterator, r),
            r.changeSlide = e.proxy(r.changeSlide, r),
            r.clickHandler = e.proxy(r.clickHandler, r),
            r.selectHandler = e.proxy(r.selectHandler, r),
            r.setPosition = e.proxy(r.setPosition, r),
            r.swipeHandler = e.proxy(r.swipeHandler, r),
            r.dragHandler = e.proxy(r.dragHandler, r),
            r.keyHandler = e.proxy(r.keyHandler, r),
            r.instanceUid = n++,
            r.htmlExpr = /^(?:\s*(<[\w\W]+>)[^>]*)$/,
            r.registerBreakpoints(),
            r.init(!0)
        }
        var n = 0;
        return t
    }()).prototype.activateADA = function() {
        this.$slideTrack.find(".slick-active").attr({
            "aria-hidden": "false"
        }).find("a, input, button, select").attr({
            tabindex: "0"
        })
    }
    ,
    t.prototype.addSlide = t.prototype.slickAdd = function(t, n, i) {
        var o = this;
        if ("boolean" == typeof n)
            i = n,
            n = null;
        else if (n < 0 || n >= o.slideCount)
            return !1;
        o.unload(),
        "number" == typeof n ? 0 === n && 0 === o.$slides.length ? e(t).appendTo(o.$slideTrack) : i ? e(t).insertBefore(o.$slides.eq(n)) : e(t).insertAfter(o.$slides.eq(n)) : !0 === i ? e(t).prependTo(o.$slideTrack) : e(t).appendTo(o.$slideTrack),
        o.$slides = o.$slideTrack.children(this.options.slide),
        o.$slideTrack.children(this.options.slide).detach(),
        o.$slideTrack.append(o.$slides),
        o.$slides.each(function(t, n) {
            e(n).attr("data-slick-index", t)
        }),
        o.$slidesCache = o.$slides,
        o.reinit()
    }
    ,
    t.prototype.animateHeight = function() {
        var e = this;
        if (1 === e.options.slidesToShow && !0 === e.options.adaptiveHeight && !1 === e.options.vertical) {
            var t = e.$slides.eq(e.currentSlide).outerHeight(!0);
            e.$list.animate({
                height: t
            }, e.options.speed)
        }
    }
    ,
    t.prototype.animateSlide = function(t, n) {
        var i = {}
          , o = this;
        o.animateHeight(),
        !0 === o.options.rtl && !1 === o.options.vertical && (t = -t),
        !1 === o.transformsEnabled ? !1 === o.options.vertical ? o.$slideTrack.animate({
            left: t
        }, o.options.speed, o.options.easing, n) : o.$slideTrack.animate({
            top: t
        }, o.options.speed, o.options.easing, n) : !1 === o.cssTransitions ? (!0 === o.options.rtl && (o.currentLeft = -o.currentLeft),
        e({
            animStart: o.currentLeft
        }).animate({
            animStart: t
        }, {
            duration: o.options.speed,
            easing: o.options.easing,
            step: function(e) {
                e = Math.ceil(e),
                !1 === o.options.vertical ? (i[o.animType] = "translate(" + e + "px, 0px)",
                o.$slideTrack.css(i)) : (i[o.animType] = "translate(0px," + e + "px)",
                o.$slideTrack.css(i))
            },
            complete: function() {
                n && n.call()
            }
        })) : (o.applyTransition(),
        t = Math.ceil(t),
        !1 === o.options.vertical ? i[o.animType] = "translate3d(" + t + "px, 0px, 0px)" : i[o.animType] = "translate3d(0px," + t + "px, 0px)",
        o.$slideTrack.css(i),
        n && setTimeout(function() {
            o.disableTransition(),
            n.call()
        }, o.options.speed))
    }
    ,
    t.prototype.getNavTarget = function() {
        var t = this
          , n = t.options.asNavFor;
        return n && null !== n && (n = e(n).not(t.$slider)),
        n
    }
    ,
    t.prototype.asNavFor = function(t) {
        var n = this.getNavTarget();
        null !== n && "object" == typeof n && n.each(function() {
            var n = e(this).slick("getSlick");
            n.unslicked || n.slideHandler(t, !0)
        })
    }
    ,
    t.prototype.applyTransition = function(e) {
        var t = this
          , n = {};
        !1 === t.options.fade ? n[t.transitionType] = t.transformType + " " + t.options.speed + "ms " + t.options.cssEase : n[t.transitionType] = "opacity " + t.options.speed + "ms " + t.options.cssEase,
        !1 === t.options.fade ? t.$slideTrack.css(n) : t.$slides.eq(e).css(n)
    }
    ,
    t.prototype.autoPlay = function() {
        var e = this;
        e.autoPlayClear(),
        e.slideCount > e.options.slidesToShow && (e.autoPlayTimer = setInterval(e.autoPlayIterator, e.options.autoplaySpeed))
    }
    ,
    t.prototype.autoPlayClear = function() {
        var e = this;
        e.autoPlayTimer && clearInterval(e.autoPlayTimer)
    }
    ,
    t.prototype.autoPlayIterator = function() {
        var e = this
          , t = e.currentSlide + e.options.slidesToScroll;
        e.paused || e.interrupted || e.focussed || (!1 === e.options.infinite && (1 === e.direction && e.currentSlide + 1 === e.slideCount - 1 ? e.direction = 0 : 0 === e.direction && (t = e.currentSlide - e.options.slidesToScroll,
        e.currentSlide - 1 == 0 && (e.direction = 1))),
        e.slideHandler(t))
    }
    ,
    t.prototype.buildArrows = function() {
        var t = this;
        !0 === t.options.arrows && (t.$prevArrow = e(t.options.prevArrow).addClass("slick-arrow"),
        t.$nextArrow = e(t.options.nextArrow).addClass("slick-arrow"),
        t.slideCount > t.options.slidesToShow ? (t.$prevArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"),
        t.$nextArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"),
        t.htmlExpr.test(t.options.prevArrow) && t.$prevArrow.prependTo(t.options.appendArrows),
        t.htmlExpr.test(t.options.nextArrow) && t.$nextArrow.appendTo(t.options.appendArrows),
        !0 !== t.options.infinite && t.$prevArrow.addClass("slick-disabled").attr("aria-disabled", "true")) : t.$prevArrow.add(t.$nextArrow).addClass("slick-hidden").attr({
            "aria-disabled": "true",
            tabindex: "-1"
        }))
    }
    ,
    t.prototype.buildDots = function() {
        var t, n, i = this;
        if (!0 === i.options.dots && i.slideCount > i.options.slidesToShow) {
            for (i.$slider.addClass("slick-dotted"),
            n = e("<ul />").addClass(i.options.dotsClass),
            t = 0; t <= i.getDotCount(); t += 1)
                n.append(e("<li />").append(i.options.customPaging.call(this, i, t)));
            i.$dots = n.appendTo(i.options.appendDots),
            i.$dots.find("li").first().addClass("slick-active")
        }
    }
    ,
    t.prototype.buildOut = function() {
        var t = this;
        t.$slides = t.$slider.children(t.options.slide + ":not(.slick-cloned)").addClass("slick-slide"),
        t.slideCount = t.$slides.length,
        t.$slides.each(function(t, n) {
            e(n).attr("data-slick-index", t).data("originalStyling", e(n).attr("style") || "")
        }),
        t.$slider.addClass("slick-slider"),
        t.$slideTrack = 0 === t.slideCount ? e('<div class="slick-track"/>').appendTo(t.$slider) : t.$slides.wrapAll('<div class="slick-track"/>').parent(),
        t.$list = t.$slideTrack.wrap('<div class="slick-list"/>').parent(),
        t.$slideTrack.css("opacity", 0),
        !0 !== t.options.centerMode && !0 !== t.options.swipeToSlide || (t.options.slidesToScroll = 1),
        e("img[data-lazy]", t.$slider).not("[src]").addClass("slick-loading"),
        t.setupInfinite(),
        t.buildArrows(),
        t.buildDots(),
        t.updateDots(),
        t.setSlideClasses("number" == typeof t.currentSlide ? t.currentSlide : 0),
        !0 === t.options.draggable && t.$list.addClass("draggable")
    }
    ,
    t.prototype.buildRows = function() {
        var e, t, n, i, o, r, s, a = this;
        if (i = document.createDocumentFragment(),
        r = a.$slider.children(),
        a.options.rows > 0) {
            for (s = a.options.slidesPerRow * a.options.rows,
            o = Math.ceil(r.length / s),
            e = 0; e < o; e++) {
                var l = document.createElement("div");
                for (t = 0; t < a.options.rows; t++) {
                    var d = document.createElement("div");
                    for (n = 0; n < a.options.slidesPerRow; n++) {
                        var c = e * s + (t * a.options.slidesPerRow + n);
                        r.get(c) && d.appendChild(r.get(c))
                    }
                    l.appendChild(d)
                }
                i.appendChild(l)
            }
            a.$slider.empty().append(i),
            a.$slider.children().children().children().css({
                width: 100 / a.options.slidesPerRow + "%",
                display: "inline-block"
            })
        }
    }
    ,
    t.prototype.checkResponsive = function(t, n) {
        var i, o, r, s = this, a = !1, l = s.$slider.width(), d = window.innerWidth || e(window).width();
        if ("window" === s.respondTo ? r = d : "slider" === s.respondTo ? r = l : "min" === s.respondTo && (r = Math.min(d, l)),
        s.options.responsive && s.options.responsive.length && null !== s.options.responsive) {
            for (i in o = null,
            s.breakpoints)
                s.breakpoints.hasOwnProperty(i) && (!1 === s.originalSettings.mobileFirst ? r < s.breakpoints[i] && (o = s.breakpoints[i]) : r > s.breakpoints[i] && (o = s.breakpoints[i]));
            null !== o ? null !== s.activeBreakpoint ? (o !== s.activeBreakpoint || n) && (s.activeBreakpoint = o,
            "unslick" === s.breakpointSettings[o] ? s.unslick(o) : (s.options = e.extend({}, s.originalSettings, s.breakpointSettings[o]),
            !0 === t && (s.currentSlide = s.options.initialSlide),
            s.refresh(t)),
            a = o) : (s.activeBreakpoint = o,
            "unslick" === s.breakpointSettings[o] ? s.unslick(o) : (s.options = e.extend({}, s.originalSettings, s.breakpointSettings[o]),
            !0 === t && (s.currentSlide = s.options.initialSlide),
            s.refresh(t)),
            a = o) : null !== s.activeBreakpoint && (s.activeBreakpoint = null,
            s.options = s.originalSettings,
            !0 === t && (s.currentSlide = s.options.initialSlide),
            s.refresh(t),
            a = o),
            t || !1 === a || s.$slider.trigger("breakpoint", [s, a])
        }
    }
    ,
    t.prototype.changeSlide = function(t, n) {
        var i, o, r = this, s = e(t.currentTarget);
        switch (s.is("a") && t.preventDefault(),
        s.is("li") || (s = s.closest("li")),
        i = r.slideCount % r.options.slidesToScroll != 0 ? 0 : (r.slideCount - r.currentSlide) % r.options.slidesToScroll,
        t.data.message) {
        case "previous":
            o = 0 === i ? r.options.slidesToScroll : r.options.slidesToShow - i,
            r.slideCount > r.options.slidesToShow && r.slideHandler(r.currentSlide - o, !1, n);
            break;
        case "next":
            o = 0 === i ? r.options.slidesToScroll : i,
            r.slideCount > r.options.slidesToShow && r.slideHandler(r.currentSlide + o, !1, n);
            break;
        case "index":
            var a = 0 === t.data.index ? 0 : t.data.index || s.index() * r.options.slidesToScroll;
            r.slideHandler(r.checkNavigable(a), !1, n),
            s.children().trigger("focus");
            break;
        default:
            return
        }
    }
    ,
    t.prototype.checkNavigable = function(e) {
        var t, n;
        if (n = 0,
        e > (t = this.getNavigableIndexes())[t.length - 1])
            e = t[t.length - 1];
        else
            for (var i in t) {
                if (e < t[i]) {
                    e = n;
                    break
                }
                n = t[i]
            }
        return e
    }
    ,
    t.prototype.cleanUpEvents = function() {
        var t = this;
        t.options.dots && null !== t.$dots && (e("li", t.$dots).off("click.slick", t.changeSlide).off("mouseenter.slick", e.proxy(t.interrupt, t, !0)).off("mouseleave.slick", e.proxy(t.interrupt, t, !1)),
        !0 === t.options.accessibility && t.$dots.off("keydown.slick", t.keyHandler)),
        t.$slider.off("focus.slick blur.slick"),
        !0 === t.options.arrows && t.slideCount > t.options.slidesToShow && (t.$prevArrow && t.$prevArrow.off("click.slick", t.changeSlide),
        t.$nextArrow && t.$nextArrow.off("click.slick", t.changeSlide),
        !0 === t.options.accessibility && (t.$prevArrow && t.$prevArrow.off("keydown.slick", t.keyHandler),
        t.$nextArrow && t.$nextArrow.off("keydown.slick", t.keyHandler))),
        t.$list.off("touchstart.slick mousedown.slick", t.swipeHandler),
        t.$list.off("touchmove.slick mousemove.slick", t.swipeHandler),
        t.$list.off("touchend.slick mouseup.slick", t.swipeHandler),
        t.$list.off("touchcancel.slick mouseleave.slick", t.swipeHandler),
        t.$list.off("click.slick", t.clickHandler),
        e(document).off(t.visibilityChange, t.visibility),
        t.cleanUpSlideEvents(),
        !0 === t.options.accessibility && t.$list.off("keydown.slick", t.keyHandler),
        !0 === t.options.focusOnSelect && e(t.$slideTrack).children().off("click.slick", t.selectHandler),
        e(window).off("orientationchange.slick.slick-" + t.instanceUid, t.orientationChange),
        e(window).off("resize.slick.slick-" + t.instanceUid, t.resize),
        e("[draggable!=true]", t.$slideTrack).off("dragstart", t.preventDefault),
        e(window).off("load.slick.slick-" + t.instanceUid, t.setPosition)
    }
    ,
    t.prototype.cleanUpSlideEvents = function() {
        var t = this;
        t.$list.off("mouseenter.slick", e.proxy(t.interrupt, t, !0)),
        t.$list.off("mouseleave.slick", e.proxy(t.interrupt, t, !1))
    }
    ,
    t.prototype.cleanUpRows = function() {
        var e, t = this;
        t.options.rows > 0 && ((e = t.$slides.children().children()).removeAttr("style"),
        t.$slider.empty().append(e))
    }
    ,
    t.prototype.clickHandler = function(e) {
        !1 === this.shouldClick && (e.stopImmediatePropagation(),
        e.stopPropagation(),
        e.preventDefault())
    }
    ,
    t.prototype.destroy = function(t) {
        var n = this;
        n.autoPlayClear(),
        n.touchObject = {},
        n.cleanUpEvents(),
        e(".slick-cloned", n.$slider).detach(),
        n.$dots && n.$dots.remove(),
        n.$prevArrow && n.$prevArrow.length && (n.$prevArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display", ""),
        n.htmlExpr.test(n.options.prevArrow) && n.$prevArrow.remove()),
        n.$nextArrow && n.$nextArrow.length && (n.$nextArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display", ""),
        n.htmlExpr.test(n.options.nextArrow) && n.$nextArrow.remove()),
        n.$slides && (n.$slides.removeClass("slick-slide slick-active slick-center slick-visible slick-current").removeAttr("aria-hidden").removeAttr("data-slick-index").each(function() {
            e(this).attr("style", e(this).data("originalStyling"))
        }),
        n.$slideTrack.children(this.options.slide).detach(),
        n.$slideTrack.detach(),
        n.$list.detach(),
        n.$slider.append(n.$slides)),
        n.cleanUpRows(),
        n.$slider.removeClass("slick-slider"),
        n.$slider.removeClass("slick-initialized"),
        n.$slider.removeClass("slick-dotted"),
        n.unslicked = !0,
        t || n.$slider.trigger("destroy", [n])
    }
    ,
    t.prototype.disableTransition = function(e) {
        var t = this
          , n = {};
        n[t.transitionType] = "",
        !1 === t.options.fade ? t.$slideTrack.css(n) : t.$slides.eq(e).css(n)
    }
    ,
    t.prototype.fadeSlide = function(e, t) {
        var n = this;
        !1 === n.cssTransitions ? (n.$slides.eq(e).css({
            zIndex: n.options.zIndex
        }),
        n.$slides.eq(e).animate({
            opacity: 1
        }, n.options.speed, n.options.easing, t)) : (n.applyTransition(e),
        n.$slides.eq(e).css({
            opacity: 1,
            zIndex: n.options.zIndex
        }),
        t && setTimeout(function() {
            n.disableTransition(e),
            t.call()
        }, n.options.speed))
    }
    ,
    t.prototype.fadeSlideOut = function(e) {
        var t = this;
        !1 === t.cssTransitions ? t.$slides.eq(e).animate({
            opacity: 0,
            zIndex: t.options.zIndex - 2
        }, t.options.speed, t.options.easing) : (t.applyTransition(e),
        t.$slides.eq(e).css({
            opacity: 0,
            zIndex: t.options.zIndex - 2
        }))
    }
    ,
    t.prototype.filterSlides = t.prototype.slickFilter = function(e) {
        var t = this;
        null !== e && (t.$slidesCache = t.$slides,
        t.unload(),
        t.$slideTrack.children(this.options.slide).detach(),
        t.$slidesCache.filter(e).appendTo(t.$slideTrack),
        t.reinit())
    }
    ,
    t.prototype.focusHandler = function() {
        var t = this;
        t.$slider.off("focus.slick blur.slick").on("focus.slick", "*", function() {
            var n = e(this);
            setTimeout(function() {
                t.options.pauseOnFocus && n.is(":focus") && (t.focussed = !0,
                t.autoPlay())
            }, 0)
        }).on("blur.slick", "*", function() {
            e(this);
            t.options.pauseOnFocus && (t.focussed = !1,
            t.autoPlay())
        })
    }
    ,
    t.prototype.getCurrent = t.prototype.slickCurrentSlide = function() {
        return this.currentSlide
    }
    ,
    t.prototype.getDotCount = function() {
        var e = this
          , t = 0
          , n = 0
          , i = 0;
        if (!0 === e.options.infinite)
            if (e.slideCount <= e.options.slidesToShow)
                ++i;
            else
                for (; t < e.slideCount; )
                    ++i,
                    t = n + e.options.slidesToScroll,
                    n += e.options.slidesToScroll <= e.options.slidesToShow ? e.options.slidesToScroll : e.options.slidesToShow;
        else if (!0 === e.options.centerMode)
            i = e.slideCount;
        else if (e.options.asNavFor)
            for (; t < e.slideCount; )
                ++i,
                t = n + e.options.slidesToScroll,
                n += e.options.slidesToScroll <= e.options.slidesToShow ? e.options.slidesToScroll : e.options.slidesToShow;
        else
            i = 1 + Math.ceil((e.slideCount - e.options.slidesToShow) / e.options.slidesToScroll);
        return i - 1
    }
    ,
    t.prototype.getLeft = function(e) {
        var t, n, i, o, r = this, s = 0;
        return r.slideOffset = 0,
        n = r.$slides.first().outerHeight(!0),
        !0 === r.options.infinite ? (r.slideCount > r.options.slidesToShow && (r.slideOffset = r.slideWidth * r.options.slidesToShow * -1,
        o = -1,
        !0 === r.options.vertical && !0 === r.options.centerMode && (2 === r.options.slidesToShow ? o = -1.5 : 1 === r.options.slidesToShow && (o = -2)),
        s = n * r.options.slidesToShow * o),
        r.slideCount % r.options.slidesToScroll != 0 && e + r.options.slidesToScroll > r.slideCount && r.slideCount > r.options.slidesToShow && (e > r.slideCount ? (r.slideOffset = (r.options.slidesToShow - (e - r.slideCount)) * r.slideWidth * -1,
        s = (r.options.slidesToShow - (e - r.slideCount)) * n * -1) : (r.slideOffset = r.slideCount % r.options.slidesToScroll * r.slideWidth * -1,
        s = r.slideCount % r.options.slidesToScroll * n * -1))) : e + r.options.slidesToShow > r.slideCount && (r.slideOffset = (e + r.options.slidesToShow - r.slideCount) * r.slideWidth,
        s = (e + r.options.slidesToShow - r.slideCount) * n),
        r.slideCount <= r.options.slidesToShow && (r.slideOffset = 0,
        s = 0),
        !0 === r.options.centerMode && r.slideCount <= r.options.slidesToShow ? r.slideOffset = r.slideWidth * Math.floor(r.options.slidesToShow) / 2 - r.slideWidth * r.slideCount / 2 : !0 === r.options.centerMode && !0 === r.options.infinite ? r.slideOffset += r.slideWidth * Math.floor(r.options.slidesToShow / 2) - r.slideWidth : !0 === r.options.centerMode && (r.slideOffset = 0,
        r.slideOffset += r.slideWidth * Math.floor(r.options.slidesToShow / 2)),
        t = !1 === r.options.vertical ? e * r.slideWidth * -1 + r.slideOffset : e * n * -1 + s,
        !0 === r.options.variableWidth && (i = r.slideCount <= r.options.slidesToShow || !1 === r.options.infinite ? r.$slideTrack.children(".slick-slide").eq(e) : r.$slideTrack.children(".slick-slide").eq(e + r.options.slidesToShow),
        t = !0 === r.options.rtl ? i[0] ? -1 * (r.$slideTrack.width() - i[0].offsetLeft - i.width()) : 0 : i[0] ? -1 * i[0].offsetLeft : 0,
        !0 === r.options.centerMode && (i = r.slideCount <= r.options.slidesToShow || !1 === r.options.infinite ? r.$slideTrack.children(".slick-slide").eq(e) : r.$slideTrack.children(".slick-slide").eq(e + r.options.slidesToShow + 1),
        t = !0 === r.options.rtl ? i[0] ? -1 * (r.$slideTrack.width() - i[0].offsetLeft - i.width()) : 0 : i[0] ? -1 * i[0].offsetLeft : 0,
        t += (r.$list.width() - i.outerWidth()) / 2)),
        t
    }
    ,
    t.prototype.getOption = t.prototype.slickGetOption = function(e) {
        return this.options[e]
    }
    ,
    t.prototype.getNavigableIndexes = function() {
        var e, t = this, n = 0, i = 0, o = [];
        for (!1 === t.options.infinite ? e = t.slideCount : (n = -1 * t.options.slidesToScroll,
        i = -1 * t.options.slidesToScroll,
        e = 2 * t.slideCount); n < e; )
            o.push(n),
            n = i + t.options.slidesToScroll,
            i += t.options.slidesToScroll <= t.options.slidesToShow ? t.options.slidesToScroll : t.options.slidesToShow;
        return o
    }
    ,
    t.prototype.getSlick = function() {
        return this
    }
    ,
    t.prototype.getSlideCount = function() {
        var t, n, i, o = this;
        return i = !0 === o.options.centerMode ? Math.floor(o.$list.width() / 2) : 0,
        n = -1 * o.swipeLeft + i,
        !0 === o.options.swipeToSlide ? (o.$slideTrack.find(".slick-slide").each(function(i, r) {
            var s, a;
            if (s = e(r).outerWidth(),
            a = r.offsetLeft,
            !0 !== o.options.centerMode && (a += s / 2),
            n < a + s)
                return t = r,
                !1
        }),
        Math.abs(e(t).attr("data-slick-index") - o.currentSlide) || 1) : o.options.slidesToScroll
    }
    ,
    t.prototype.goTo = t.prototype.slickGoTo = function(e, t) {
        this.changeSlide({
            data: {
                message: "index",
                index: parseInt(e)
            }
        }, t)
    }
    ,
    t.prototype.init = function(t) {
        var n = this;
        e(n.$slider).hasClass("slick-initialized") || (e(n.$slider).addClass("slick-initialized"),
        n.buildRows(),
        n.buildOut(),
        n.setProps(),
        n.startLoad(),
        n.loadSlider(),
        n.initializeEvents(),
        n.updateArrows(),
        n.updateDots(),
        n.checkResponsive(!0),
        n.focusHandler()),
        t && n.$slider.trigger("init", [n]),
        !0 === n.options.accessibility && n.initADA(),
        n.options.autoplay && (n.paused = !1,
        n.autoPlay())
    }
    ,
    t.prototype.initADA = function() {
        var t = this
          , n = Math.ceil(t.slideCount / t.options.slidesToShow)
          , i = t.getNavigableIndexes().filter(function(e) {
            return e >= 0 && e < t.slideCount
        });
        t.$slides.add(t.$slideTrack.find(".slick-cloned")).attr({
            "aria-hidden": "true",
            tabindex: "-1"
        }).find("a, input, button, select").attr({
            tabindex: "-1"
        }),
        null !== t.$dots && (t.$slides.not(t.$slideTrack.find(".slick-cloned")).each(function(n) {
            var o = i.indexOf(n);
            if (e(this).attr({
                role: "tabpanel",
                id: "slick-slide" + t.instanceUid + n,
                tabindex: -1
            }),
            -1 !== o) {
                var r = "slick-slide-control" + t.instanceUid + o;
                e("#" + r).length && e(this).attr({
                    "aria-describedby": r
                })
            }
        }),
        t.$dots.attr("role", "tablist").find("li").each(function(o) {
            var r = i[o];
            e(this).attr({
                role: "presentation"
            }),
            e(this).find("button").first().attr({
                role: "tab",
                id: "slick-slide-control" + t.instanceUid + o,
                "aria-controls": "slick-slide" + t.instanceUid + r,
                "aria-label": o + 1 + " of " + n,
                "aria-selected": null,
                tabindex: "-1"
            })
        }).eq(t.currentSlide).find("button").attr({
            "aria-selected": "true",
            tabindex: "0"
        }).end());
        for (var o = t.currentSlide, r = o + t.options.slidesToShow; o < r; o++)
            t.options.focusOnChange ? t.$slides.eq(o).attr({
                tabindex: "0"
            }) : t.$slides.eq(o).removeAttr("tabindex");
        t.activateADA()
    }
    ,
    t.prototype.initArrowEvents = function() {
        var e = this;
        !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && (e.$prevArrow.off("click.slick").on("click.slick", {
            message: "previous"
        }, e.changeSlide),
        e.$nextArrow.off("click.slick").on("click.slick", {
            message: "next"
        }, e.changeSlide),
        !0 === e.options.accessibility && (e.$prevArrow.on("keydown.slick", e.keyHandler),
        e.$nextArrow.on("keydown.slick", e.keyHandler)))
    }
    ,
    t.prototype.initDotEvents = function() {
        var t = this;
        !0 === t.options.dots && t.slideCount > t.options.slidesToShow && (e("li", t.$dots).on("click.slick", {
            message: "index"
        }, t.changeSlide),
        !0 === t.options.accessibility && t.$dots.on("keydown.slick", t.keyHandler)),
        !0 === t.options.dots && !0 === t.options.pauseOnDotsHover && t.slideCount > t.options.slidesToShow && e("li", t.$dots).on("mouseenter.slick", e.proxy(t.interrupt, t, !0)).on("mouseleave.slick", e.proxy(t.interrupt, t, !1))
    }
    ,
    t.prototype.initSlideEvents = function() {
        var t = this;
        t.options.pauseOnHover && (t.$list.on("mouseenter.slick", e.proxy(t.interrupt, t, !0)),
        t.$list.on("mouseleave.slick", e.proxy(t.interrupt, t, !1)))
    }
    ,
    t.prototype.initializeEvents = function() {
        var t = this;
        t.initArrowEvents(),
        t.initDotEvents(),
        t.initSlideEvents(),
        t.$list.on("touchstart.slick mousedown.slick", {
            action: "start"
        }, t.swipeHandler),
        t.$list.on("touchmove.slick mousemove.slick", {
            action: "move"
        }, t.swipeHandler),
        t.$list.on("touchend.slick mouseup.slick", {
            action: "end"
        }, t.swipeHandler),
        t.$list.on("touchcancel.slick mouseleave.slick", {
            action: "end"
        }, t.swipeHandler),
        t.$list.on("click.slick", t.clickHandler),
        e(document).on(t.visibilityChange, e.proxy(t.visibility, t)),
        !0 === t.options.accessibility && t.$list.on("keydown.slick", t.keyHandler),
        !0 === t.options.focusOnSelect && e(t.$slideTrack).children().on("click.slick", t.selectHandler),
        e(window).on("orientationchange.slick.slick-" + t.instanceUid, e.proxy(t.orientationChange, t)),
        e(window).on("resize.slick.slick-" + t.instanceUid, e.proxy(t.resize, t)),
        e("[draggable!=true]", t.$slideTrack).on("dragstart", t.preventDefault),
        e(window).on("load.slick.slick-" + t.instanceUid, t.setPosition),
        e(t.setPosition)
    }
    ,
    t.prototype.initUI = function() {
        var e = this;
        !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && (e.$prevArrow.show(),
        e.$nextArrow.show()),
        !0 === e.options.dots && e.slideCount > e.options.slidesToShow && e.$dots.show()
    }
    ,
    t.prototype.keyHandler = function(e) {
        var t = this;
        e.target.tagName.match("TEXTAREA|INPUT|SELECT") || (37 === e.keyCode && !0 === t.options.accessibility ? t.changeSlide({
            data: {
                message: !0 === t.options.rtl ? "next" : "previous"
            }
        }) : 39 === e.keyCode && !0 === t.options.accessibility && t.changeSlide({
            data: {
                message: !0 === t.options.rtl ? "previous" : "next"
            }
        }))
    }
    ,
    t.prototype.lazyLoad = function() {
        function t(t) {
            e("img[data-lazy]", t).each(function() {
                var t = e(this)
                  , n = e(this).attr("data-lazy")
                  , i = e(this).attr("data-srcset")
                  , o = e(this).attr("data-sizes") || r.$slider.attr("data-sizes")
                  , s = document.createElement("img");
                s.onload = function() {
                    t.animate({
                        opacity: 0
                    }, 100, function() {
                        i && (t.attr("srcset", i),
                        o && t.attr("sizes", o)),
                        t.attr("src", n).animate({
                            opacity: 1
                        }, 200, function() {
                            t.removeAttr("data-lazy data-srcset data-sizes").removeClass("slick-loading")
                        }),
                        r.$slider.trigger("lazyLoaded", [r, t, n])
                    })
                }
                ,
                s.onerror = function() {
                    t.removeAttr("data-lazy").removeClass("slick-loading").addClass("slick-lazyload-error"),
                    r.$slider.trigger("lazyLoadError", [r, t, n])
                }
                ,
                s.src = n
            })
        }
        var n, i, o, r = this;
        if (!0 === r.options.centerMode ? !0 === r.options.infinite ? o = (i = r.currentSlide + (r.options.slidesToShow / 2 + 1)) + r.options.slidesToShow + 2 : (i = Math.max(0, r.currentSlide - (r.options.slidesToShow / 2 + 1)),
        o = r.options.slidesToShow / 2 + 1 + 2 + r.currentSlide) : (i = r.options.infinite ? r.options.slidesToShow + r.currentSlide : r.currentSlide,
        o = Math.ceil(i + r.options.slidesToShow),
        !0 === r.options.fade && (i > 0 && i--,
        o <= r.slideCount && o++)),
        n = r.$slider.find(".slick-slide").slice(i, o),
        "anticipated" === r.options.lazyLoad)
            for (var s = i - 1, a = o, l = r.$slider.find(".slick-slide"), d = 0; d < r.options.slidesToScroll; d++)
                s < 0 && (s = r.slideCount - 1),
                n = (n = n.add(l.eq(s))).add(l.eq(a)),
                s--,
                a++;
        t(n),
        r.slideCount <= r.options.slidesToShow ? t(r.$slider.find(".slick-slide")) : r.currentSlide >= r.slideCount - r.options.slidesToShow ? t(r.$slider.find(".slick-cloned").slice(0, r.options.slidesToShow)) : 0 === r.currentSlide && t(r.$slider.find(".slick-cloned").slice(-1 * r.options.slidesToShow))
    }
    ,
    t.prototype.loadSlider = function() {
        var e = this;
        e.setPosition(),
        e.$slideTrack.css({
            opacity: 1
        }),
        e.$slider.removeClass("slick-loading"),
        e.initUI(),
        "progressive" === e.options.lazyLoad && e.progressiveLazyLoad()
    }
    ,
    t.prototype.next = t.prototype.slickNext = function() {
        this.changeSlide({
            data: {
                message: "next"
            }
        })
    }
    ,
    t.prototype.orientationChange = function() {
        var e = this;
        e.checkResponsive(),
        e.setPosition()
    }
    ,
    t.prototype.pause = t.prototype.slickPause = function() {
        var e = this;
        e.autoPlayClear(),
        e.paused = !0
    }
    ,
    t.prototype.play = t.prototype.slickPlay = function() {
        var e = this;
        e.autoPlay(),
        e.options.autoplay = !0,
        e.paused = !1,
        e.focussed = !1,
        e.interrupted = !1
    }
    ,
    t.prototype.postSlide = function(t) {
        var n = this;
        n.unslicked || (n.$slider.trigger("afterChange", [n, t]),
        n.animating = !1,
        n.slideCount > n.options.slidesToShow && n.setPosition(),
        n.swipeLeft = null,
        n.options.autoplay && n.autoPlay(),
        !0 === n.options.accessibility && (n.initADA(),
        n.options.focusOnChange && e(n.$slides.get(n.currentSlide)).attr("tabindex", 0).focus()))
    }
    ,
    t.prototype.prev = t.prototype.slickPrev = function() {
        this.changeSlide({
            data: {
                message: "previous"
            }
        })
    }
    ,
    t.prototype.preventDefault = function(e) {
        e.preventDefault()
    }
    ,
    t.prototype.progressiveLazyLoad = function(t) {
        t = t || 1;
        var n, i, o, r, s, a = this, l = e("img[data-lazy]", a.$slider);
        l.length ? (n = l.first(),
        i = n.attr("data-lazy"),
        o = n.attr("data-srcset"),
        r = n.attr("data-sizes") || a.$slider.attr("data-sizes"),
        (s = document.createElement("img")).onload = function() {
            o && (n.attr("srcset", o),
            r && n.attr("sizes", r)),
            n.attr("src", i).removeAttr("data-lazy data-srcset data-sizes").removeClass("slick-loading"),
            !0 === a.options.adaptiveHeight && a.setPosition(),
            a.$slider.trigger("lazyLoaded", [a, n, i]),
            a.progressiveLazyLoad()
        }
        ,
        s.onerror = function() {
            t < 3 ? setTimeout(function() {
                a.progressiveLazyLoad(t + 1)
            }, 500) : (n.removeAttr("data-lazy").removeClass("slick-loading").addClass("slick-lazyload-error"),
            a.$slider.trigger("lazyLoadError", [a, n, i]),
            a.progressiveLazyLoad())
        }
        ,
        s.src = i) : a.$slider.trigger("allImagesLoaded", [a])
    }
    ,
    t.prototype.refresh = function(t) {
        var n, i, o = this;
        i = o.slideCount - o.options.slidesToShow,
        !o.options.infinite && o.currentSlide > i && (o.currentSlide = i),
        o.slideCount <= o.options.slidesToShow && (o.currentSlide = 0),
        n = o.currentSlide,
        o.destroy(!0),
        e.extend(o, o.initials, {
            currentSlide: n
        }),
        o.init(),
        t || o.changeSlide({
            data: {
                message: "index",
                index: n
            }
        }, !1)
    }
    ,
    t.prototype.registerBreakpoints = function() {
        var t, n, i, o = this, r = o.options.responsive || null;
        if ("array" === e.type(r) && r.length) {
            for (t in o.respondTo = o.options.respondTo || "window",
            r)
                if (i = o.breakpoints.length - 1,
                r.hasOwnProperty(t)) {
                    for (n = r[t].breakpoint; i >= 0; )
                        o.breakpoints[i] && o.breakpoints[i] === n && o.breakpoints.splice(i, 1),
                        i--;
                    o.breakpoints.push(n),
                    o.breakpointSettings[n] = r[t].settings
                }
            o.breakpoints.sort(function(e, t) {
                return o.options.mobileFirst ? e - t : t - e
            })
        }
    }
    ,
    t.prototype.reinit = function() {
        var t = this;
        t.$slides = t.$slideTrack.children(t.options.slide).addClass("slick-slide"),
        t.slideCount = t.$slides.length,
        t.currentSlide >= t.slideCount && 0 !== t.currentSlide && (t.currentSlide = t.currentSlide - t.options.slidesToScroll),
        t.slideCount <= t.options.slidesToShow && (t.currentSlide = 0),
        t.registerBreakpoints(),
        t.setProps(),
        t.setupInfinite(),
        t.buildArrows(),
        t.updateArrows(),
        t.initArrowEvents(),
        t.buildDots(),
        t.updateDots(),
        t.initDotEvents(),
        t.cleanUpSlideEvents(),
        t.initSlideEvents(),
        t.checkResponsive(!1, !0),
        !0 === t.options.focusOnSelect && e(t.$slideTrack).children().on("click.slick", t.selectHandler),
        t.setSlideClasses("number" == typeof t.currentSlide ? t.currentSlide : 0),
        t.setPosition(),
        t.focusHandler(),
        t.paused = !t.options.autoplay,
        t.autoPlay(),
        t.$slider.trigger("reInit", [t])
    }
    ,
    t.prototype.resize = function() {
        var t = this;
        e(window).width() !== t.windowWidth && (clearTimeout(t.windowDelay),
        t.windowDelay = window.setTimeout(function() {
            t.windowWidth = e(window).width(),
            t.checkResponsive(),
            t.unslicked || t.setPosition()
        }, 50))
    }
    ,
    t.prototype.removeSlide = t.prototype.slickRemove = function(e, t, n) {
        var i = this;
        if (e = "boolean" == typeof e ? !0 === (t = e) ? 0 : i.slideCount - 1 : !0 === t ? --e : e,
        i.slideCount < 1 || e < 0 || e > i.slideCount - 1)
            return !1;
        i.unload(),
        !0 === n ? i.$slideTrack.children().remove() : i.$slideTrack.children(this.options.slide).eq(e).remove(),
        i.$slides = i.$slideTrack.children(this.options.slide),
        i.$slideTrack.children(this.options.slide).detach(),
        i.$slideTrack.append(i.$slides),
        i.$slidesCache = i.$slides,
        i.reinit()
    }
    ,
    t.prototype.setCSS = function(e) {
        var t, n, i = this, o = {};
        !0 === i.options.rtl && (e = -e),
        t = "left" == i.positionProp ? Math.ceil(e) + "px" : "0px",
        n = "top" == i.positionProp ? Math.ceil(e) + "px" : "0px",
        o[i.positionProp] = e,
        !1 === i.transformsEnabled ? i.$slideTrack.css(o) : (o = {},
        !1 === i.cssTransitions ? (o[i.animType] = "translate(" + t + ", " + n + ")",
        i.$slideTrack.css(o)) : (o[i.animType] = "translate3d(" + t + ", " + n + ", 0px)",
        i.$slideTrack.css(o)))
    }
    ,
    t.prototype.setDimensions = function() {
        var e = this;
        !1 === e.options.vertical ? !0 === e.options.centerMode && e.$list.css({
            padding: "0px " + e.options.centerPadding
        }) : (e.$list.height(e.$slides.first().outerHeight(!0) * e.options.slidesToShow),
        !0 === e.options.centerMode && e.$list.css({
            padding: e.options.centerPadding + " 0px"
        })),
        e.listWidth = e.$list.width(),
        e.listHeight = e.$list.height(),
        !1 === e.options.vertical && !1 === e.options.variableWidth ? (e.slideWidth = Math.ceil(e.listWidth / e.options.slidesToShow),
        e.$slideTrack.width(Math.ceil(e.slideWidth * e.$slideTrack.children(".slick-slide").length))) : !0 === e.options.variableWidth ? e.$slideTrack.width(5e3 * e.slideCount) : (e.slideWidth = Math.ceil(e.listWidth),
        e.$slideTrack.height(Math.ceil(e.$slides.first().outerHeight(!0) * e.$slideTrack.children(".slick-slide").length)));
        var t = e.$slides.first().outerWidth(!0) - e.$slides.first().width();
        !1 === e.options.variableWidth && e.$slideTrack.children(".slick-slide").width(e.slideWidth - t)
    }
    ,
    t.prototype.setFade = function() {
        var t, n = this;
        n.$slides.each(function(i, o) {
            t = n.slideWidth * i * -1,
            !0 === n.options.rtl ? e(o).css({
                position: "relative",
                right: t,
                top: 0,
                zIndex: n.options.zIndex - 2,
                opacity: 0
            }) : e(o).css({
                position: "relative",
                left: t,
                top: 0,
                zIndex: n.options.zIndex - 2,
                opacity: 0
            })
        }),
        n.$slides.eq(n.currentSlide).css({
            zIndex: n.options.zIndex - 1,
            opacity: 1
        })
    }
    ,
    t.prototype.setHeight = function() {
        var e = this;
        if (1 === e.options.slidesToShow && !0 === e.options.adaptiveHeight && !1 === e.options.vertical) {
            var t = e.$slides.eq(e.currentSlide).outerHeight(!0);
            e.$list.css("height", t)
        }
    }
    ,
    t.prototype.setOption = t.prototype.slickSetOption = function() {
        var t, n, i, o, r, s = this, a = !1;
        if ("object" === e.type(arguments[0]) ? (i = arguments[0],
        a = arguments[1],
        r = "multiple") : "string" === e.type(arguments[0]) && (i = arguments[0],
        o = arguments[1],
        a = arguments[2],
        "responsive" === arguments[0] && "array" === e.type(arguments[1]) ? r = "responsive" : "undefined" != typeof arguments[1] && (r = "single")),
        "single" === r)
            s.options[i] = o;
        else if ("multiple" === r)
            e.each(i, function(e, t) {
                s.options[e] = t
            });
        else if ("responsive" === r)
            for (n in o)
                if ("array" !== e.type(s.options.responsive))
                    s.options.responsive = [o[n]];
                else {
                    for (t = s.options.responsive.length - 1; t >= 0; )
                        s.options.responsive[t].breakpoint === o[n].breakpoint && s.options.responsive.splice(t, 1),
                        t--;
                    s.options.responsive.push(o[n])
                }
        a && (s.unload(),
        s.reinit())
    }
    ,
    t.prototype.setPosition = function() {
        var e = this;
        e.setDimensions(),
        e.setHeight(),
        !1 === e.options.fade ? e.setCSS(e.getLeft(e.currentSlide)) : e.setFade(),
        e.$slider.trigger("setPosition", [e])
    }
    ,
    t.prototype.setProps = function() {
        var e = this
          , t = document.body.style;
        e.positionProp = !0 === e.options.vertical ? "top" : "left",
        "top" === e.positionProp ? e.$slider.addClass("slick-vertical") : e.$slider.removeClass("slick-vertical"),
        t.WebkitTransition === undefined && t.MozTransition === undefined && t.msTransition === undefined || !0 === e.options.useCSS && (e.cssTransitions = !0),
        e.options.fade && ("number" == typeof e.options.zIndex ? e.options.zIndex < 3 && (e.options.zIndex = 3) : e.options.zIndex = e.defaults.zIndex),
        t.OTransform !== undefined && (e.animType = "OTransform",
        e.transformType = "-o-transform",
        e.transitionType = "OTransition",
        t.perspectiveProperty === undefined && t.webkitPerspective === undefined && (e.animType = !1)),
        t.MozTransform !== undefined && (e.animType = "MozTransform",
        e.transformType = "-moz-transform",
        e.transitionType = "MozTransition",
        t.perspectiveProperty === undefined && t.MozPerspective === undefined && (e.animType = !1)),
        t.webkitTransform !== undefined && (e.animType = "webkitTransform",
        e.transformType = "-webkit-transform",
        e.transitionType = "webkitTransition",
        t.perspectiveProperty === undefined && t.webkitPerspective === undefined && (e.animType = !1)),
        t.msTransform !== undefined && (e.animType = "msTransform",
        e.transformType = "-ms-transform",
        e.transitionType = "msTransition",
        t.msTransform === undefined && (e.animType = !1)),
        t.transform !== undefined && !1 !== e.animType && (e.animType = "transform",
        e.transformType = "transform",
        e.transitionType = "transition"),
        e.transformsEnabled = e.options.useTransform && null !== e.animType && !1 !== e.animType
    }
    ,
    t.prototype.setSlideClasses = function(e) {
        var t, n, i, o, r = this;
        if (n = r.$slider.find(".slick-slide").removeClass("slick-active slick-center slick-current").attr("aria-hidden", "true"),
        r.$slides.eq(e).addClass("slick-current"),
        !0 === r.options.centerMode) {
            var s = r.options.slidesToShow % 2 == 0 ? 1 : 0;
            t = Math.floor(r.options.slidesToShow / 2),
            !0 === r.options.infinite && (e >= t && e <= r.slideCount - 1 - t ? r.$slides.slice(e - t + s, e + t + 1).addClass("slick-active").attr("aria-hidden", "false") : (i = r.options.slidesToShow + e,
            n.slice(i - t + 1 + s, i + t + 2).addClass("slick-active").attr("aria-hidden", "false")),
            0 === e ? n.eq(n.length - 1 - r.options.slidesToShow).addClass("slick-center") : e === r.slideCount - 1 && n.eq(r.options.slidesToShow).addClass("slick-center")),
            r.$slides.eq(e).addClass("slick-center")
        } else
            e >= 0 && e <= r.slideCount - r.options.slidesToShow ? r.$slides.slice(e, e + r.options.slidesToShow).addClass("slick-active").attr("aria-hidden", "false") : n.length <= r.options.slidesToShow ? n.addClass("slick-active").attr("aria-hidden", "false") : (o = r.slideCount % r.options.slidesToShow,
            i = !0 === r.options.infinite ? r.options.slidesToShow + e : e,
            r.options.slidesToShow == r.options.slidesToScroll && r.slideCount - e < r.options.slidesToShow ? n.slice(i - (r.options.slidesToShow - o), i + o).addClass("slick-active").attr("aria-hidden", "false") : n.slice(i, i + r.options.slidesToShow).addClass("slick-active").attr("aria-hidden", "false"));
        "ondemand" !== r.options.lazyLoad && "anticipated" !== r.options.lazyLoad || r.lazyLoad()
    }
    ,
    t.prototype.setupInfinite = function() {
        var t, n, i, o = this;
        if (!0 === o.options.fade && (o.options.centerMode = !1),
        !0 === o.options.infinite && !1 === o.options.fade && (n = null,
        o.slideCount > o.options.slidesToShow)) {
            for (i = !0 === o.options.centerMode ? o.options.slidesToShow + 1 : o.options.slidesToShow,
            t = o.slideCount; t > o.slideCount - i; t -= 1)
                n = t - 1,
                e(o.$slides[n]).clone(!0).attr("id", "").attr("data-slick-index", n - o.slideCount).prependTo(o.$slideTrack).addClass("slick-cloned");
            for (t = 0; t < i + o.slideCount; t += 1)
                n = t,
                e(o.$slides[n]).clone(!0).attr("id", "").attr("data-slick-index", n + o.slideCount).appendTo(o.$slideTrack).addClass("slick-cloned");
            o.$slideTrack.find(".slick-cloned").find("[id]").each(function() {
                e(this).attr("id", "")
            })
        }
    }
    ,
    t.prototype.interrupt = function(e) {
        var t = this;
        e || t.autoPlay(),
        t.interrupted = e
    }
    ,
    t.prototype.selectHandler = function(t) {
        var n = this
          , i = e(t.target).is(".slick-slide") ? e(t.target) : e(t.target).parents(".slick-slide")
          , o = parseInt(i.attr("data-slick-index"));
        o || (o = 0),
        n.slideCount <= n.options.slidesToShow ? n.slideHandler(o, !1, !0) : n.slideHandler(o)
    }
    ,
    t.prototype.slideHandler = function(e, t, n) {
        var i, o, r, s, a, l = null, d = this;
        if (t = t || !1,
        !(!0 === d.animating && !0 === d.options.waitForAnimate || !0 === d.options.fade && d.currentSlide === e))
            if (!1 === t && d.asNavFor(e),
            i = e,
            l = d.getLeft(i),
            s = d.getLeft(d.currentSlide),
            d.currentLeft = null === d.swipeLeft ? s : d.swipeLeft,
            !1 === d.options.infinite && !1 === d.options.centerMode && (e < 0 || e > d.getDotCount() * d.options.slidesToScroll))
                !1 === d.options.fade && (i = d.currentSlide,
                !0 !== n && d.slideCount > d.options.slidesToShow ? d.animateSlide(s, function() {
                    d.postSlide(i)
                }) : d.postSlide(i));
            else if (!1 === d.options.infinite && !0 === d.options.centerMode && (e < 0 || e > d.slideCount - d.options.slidesToScroll))
                !1 === d.options.fade && (i = d.currentSlide,
                !0 !== n && d.slideCount > d.options.slidesToShow ? d.animateSlide(s, function() {
                    d.postSlide(i)
                }) : d.postSlide(i));
            else {
                if (d.options.autoplay && clearInterval(d.autoPlayTimer),
                o = i < 0 ? d.slideCount % d.options.slidesToScroll != 0 ? d.slideCount - d.slideCount % d.options.slidesToScroll : d.slideCount + i : i >= d.slideCount ? d.slideCount % d.options.slidesToScroll != 0 ? 0 : i - d.slideCount : i,
                d.animating = !0,
                d.$slider.trigger("beforeChange", [d, d.currentSlide, o]),
                r = d.currentSlide,
                d.currentSlide = o,
                d.setSlideClasses(d.currentSlide),
                d.options.asNavFor && (a = (a = d.getNavTarget()).slick("getSlick")).slideCount <= a.options.slidesToShow && a.setSlideClasses(d.currentSlide),
                d.updateDots(),
                d.updateArrows(),
                !0 === d.options.fade)
                    return !0 !== n ? (d.fadeSlideOut(r),
                    d.fadeSlide(o, function() {
                        d.postSlide(o)
                    })) : d.postSlide(o),
                    void d.animateHeight();
                !0 !== n && d.slideCount > d.options.slidesToShow ? d.animateSlide(l, function() {
                    d.postSlide(o)
                }) : d.postSlide(o)
            }
    }
    ,
    t.prototype.startLoad = function() {
        var e = this;
        !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && (e.$prevArrow.hide(),
        e.$nextArrow.hide()),
        !0 === e.options.dots && e.slideCount > e.options.slidesToShow && e.$dots.hide(),
        e.$slider.addClass("slick-loading")
    }
    ,
    t.prototype.swipeDirection = function() {
        var e, t, n, i, o = this;
        return e = o.touchObject.startX - o.touchObject.curX,
        t = o.touchObject.startY - o.touchObject.curY,
        n = Math.atan2(t, e),
        (i = Math.round(180 * n / Math.PI)) < 0 && (i = 360 - Math.abs(i)),
        i <= 45 && i >= 0 ? !1 === o.options.rtl ? "left" : "right" : i <= 360 && i >= 315 ? !1 === o.options.rtl ? "left" : "right" : i >= 135 && i <= 225 ? !1 === o.options.rtl ? "right" : "left" : !0 === o.options.verticalSwiping ? i >= 35 && i <= 135 ? "down" : "up" : "vertical"
    }
    ,
    t.prototype.swipeEnd = function() {
        var e, t, n = this;
        if (n.dragging = !1,
        n.swiping = !1,
        n.scrolling)
            return n.scrolling = !1,
            !1;
        if (n.interrupted = !1,
        n.shouldClick = !(n.touchObject.swipeLength > 10),
        n.touchObject.curX === undefined)
            return !1;
        if (!0 === n.touchObject.edgeHit && n.$slider.trigger("edge", [n, n.swipeDirection()]),
        n.touchObject.swipeLength >= n.touchObject.minSwipe) {
            switch (t = n.swipeDirection()) {
            case "left":
            case "down":
                e = n.options.swipeToSlide ? n.checkNavigable(n.currentSlide + n.getSlideCount()) : n.currentSlide + n.getSlideCount(),
                n.currentDirection = 0;
                break;
            case "right":
            case "up":
                e = n.options.swipeToSlide ? n.checkNavigable(n.currentSlide - n.getSlideCount()) : n.currentSlide - n.getSlideCount(),
                n.currentDirection = 1
            }
            "vertical" != t && (n.slideHandler(e),
            n.touchObject = {},
            n.$slider.trigger("swipe", [n, t]))
        } else
            n.touchObject.startX !== n.touchObject.curX && (n.slideHandler(n.currentSlide),
            n.touchObject = {})
    }
    ,
    t.prototype.swipeHandler = function(e) {
        var t = this;
        if (!(!1 === t.options.swipe || "ontouchend"in document && !1 === t.options.swipe || !1 === t.options.draggable && -1 !== e.type.indexOf("mouse")))
            switch (t.touchObject.fingerCount = e.originalEvent && e.originalEvent.touches !== undefined ? e.originalEvent.touches.length : 1,
            t.touchObject.minSwipe = t.listWidth / t.options.touchThreshold,
            !0 === t.options.verticalSwiping && (t.touchObject.minSwipe = t.listHeight / t.options.touchThreshold),
            e.data.action) {
            case "start":
                t.swipeStart(e);
                break;
            case "move":
                t.swipeMove(e);
                break;
            case "end":
                t.swipeEnd(e)
            }
    }
    ,
    t.prototype.swipeMove = function(e) {
        var t, n, i, o, r, s, a = this;
        return r = e.originalEvent !== undefined ? e.originalEvent.touches : null,
        !(!a.dragging || a.scrolling || r && 1 !== r.length) && (t = a.getLeft(a.currentSlide),
        a.touchObject.curX = r !== undefined ? r[0].pageX : e.clientX,
        a.touchObject.curY = r !== undefined ? r[0].pageY : e.clientY,
        a.touchObject.swipeLength = Math.round(Math.sqrt(Math.pow(a.touchObject.curX - a.touchObject.startX, 2))),
        s = Math.round(Math.sqrt(Math.pow(a.touchObject.curY - a.touchObject.startY, 2))),
        !a.options.verticalSwiping && !a.swiping && s > 4 ? (a.scrolling = !0,
        !1) : (!0 === a.options.verticalSwiping && (a.touchObject.swipeLength = s),
        n = a.swipeDirection(),
        e.originalEvent !== undefined && a.touchObject.swipeLength > 4 && (a.swiping = !0,
        e.preventDefault()),
        o = (!1 === a.options.rtl ? 1 : -1) * (a.touchObject.curX > a.touchObject.startX ? 1 : -1),
        !0 === a.options.verticalSwiping && (o = a.touchObject.curY > a.touchObject.startY ? 1 : -1),
        i = a.touchObject.swipeLength,
        a.touchObject.edgeHit = !1,
        !1 === a.options.infinite && (0 === a.currentSlide && "right" === n || a.currentSlide >= a.getDotCount() && "left" === n) && (i = a.touchObject.swipeLength * a.options.edgeFriction,
        a.touchObject.edgeHit = !0),
        !1 === a.options.vertical ? a.swipeLeft = t + i * o : a.swipeLeft = t + i * (a.$list.height() / a.listWidth) * o,
        !0 === a.options.verticalSwiping && (a.swipeLeft = t + i * o),
        !0 !== a.options.fade && !1 !== a.options.touchMove && (!0 === a.animating ? (a.swipeLeft = null,
        !1) : void a.setCSS(a.swipeLeft))))
    }
    ,
    t.prototype.swipeStart = function(e) {
        var t, n = this;
        if (n.interrupted = !0,
        1 !== n.touchObject.fingerCount || n.slideCount <= n.options.slidesToShow)
            return n.touchObject = {},
            !1;
        e.originalEvent !== undefined && e.originalEvent.touches !== undefined && (t = e.originalEvent.touches[0]),
        n.touchObject.startX = n.touchObject.curX = t !== undefined ? t.pageX : e.clientX,
        n.touchObject.startY = n.touchObject.curY = t !== undefined ? t.pageY : e.clientY,
        n.dragging = !0
    }
    ,
    t.prototype.unfilterSlides = t.prototype.slickUnfilter = function() {
        var e = this;
        null !== e.$slidesCache && (e.unload(),
        e.$slideTrack.children(this.options.slide).detach(),
        e.$slidesCache.appendTo(e.$slideTrack),
        e.reinit())
    }
    ,
    t.prototype.unload = function() {
        var t = this;
        e(".slick-cloned", t.$slider).remove(),
        t.$dots && t.$dots.remove(),
        t.$prevArrow && t.htmlExpr.test(t.options.prevArrow) && t.$prevArrow.remove(),
        t.$nextArrow && t.htmlExpr.test(t.options.nextArrow) && t.$nextArrow.remove(),
        t.$slides.removeClass("slick-slide slick-active slick-visible slick-current").attr("aria-hidden", "true").css("width", "")
    }
    ,
    t.prototype.unslick = function(e) {
        var t = this;
        t.$slider.trigger("unslick", [t, e]),
        t.destroy()
    }
    ,
    t.prototype.updateArrows = function() {
        var e = this;
        Math.floor(e.options.slidesToShow / 2),
        !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && !e.options.infinite && (e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false"),
        e.$nextArrow.removeClass("slick-disabled").attr("aria-disabled", "false"),
        0 === e.currentSlide ? (e.$prevArrow.addClass("slick-disabled").attr("aria-disabled", "true"),
        e.$nextArrow.removeClass("slick-disabled").attr("aria-disabled", "false")) : e.currentSlide >= e.slideCount - e.options.slidesToShow && !1 === e.options.centerMode ? (e.$nextArrow.addClass("slick-disabled").attr("aria-disabled", "true"),
        e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false")) : e.currentSlide >= e.slideCount - 1 && !0 === e.options.centerMode && (e.$nextArrow.addClass("slick-disabled").attr("aria-disabled", "true"),
        e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false")))
    }
    ,
    t.prototype.updateDots = function() {
        var e = this;
        null !== e.$dots && (e.$dots.find("li").removeClass("slick-active").end(),
        e.$dots.find("li").eq(Math.floor(e.currentSlide / e.options.slidesToScroll)).addClass("slick-active"))
    }
    ,
    t.prototype.visibility = function() {
        var e = this;
        e.options.autoplay && (document[e.hidden] ? e.interrupted = !0 : e.interrupted = !1)
    }
    ,
    e.fn.slick = function() {
        var e, n, i = this, o = arguments[0], r = Array.prototype.slice.call(arguments, 1), s = i.length;
        for (e = 0; e < s; e++)
            if ("object" == typeof o || void 0 === o ? i[e].slick = new t(i[e],o) : n = i[e].slick[o].apply(i[e].slick, r),
            void 0 !== n)
                return n;
        return i
    }
}),
$(document).ready(function() {
    $(".slider").slick({
        lazyLoad: "ondemand",
        infinite: !0,
        slidesToShow: 1,
        dots: !0
    }).on("beforeChange", function() {
        $(".slick-prev").blur(),
        $(".slick-next").blur()
    }),
    $("#btn-global-article-detail").click(function() {
        $("body").css("overflow", "hidden"),
        $("#article-detail-modal-background").show()
    }),
    $("#app-download #btn-close").click(function() {
        $("#article-detail-modal-background").hide(),
        $("body").css("overflow", "scroll")
    })
});

    // 모달 닫힐 때 입력 필드 초기화
    $('#exampleModal').on('hidden.bs.modal', function () {
        // 입력 필드 초기화
        $('#exampleModal input[name="name"]').val('');
        $('#exampleModal input[name="pId"]').val('');
        $('#exampleModal input[name="hostId"]').val('');
    });
	// 드롭다운 메뉴 항목을 클릭했을 때 호출되는 함수
	document.querySelectorAll('.dropdown-item').forEach(item => {
	    item.addEventListener('click', event => {
	        const selectedReason = event.target.getAttribute('data-value');
	        document.getElementById('selectedReason').innerText = selectedReason;
	    });
	});
	// 모달이 닫힐 때 초기화하는 함수
	function resetModal() {
	    document.getElementById('selectedReason').innerText = '';
	    document.getElementById('additionalReason').value = '';
	}
	document.getElementById('reportModal').addEventListener('hidden.bs.modal', function () {
	    resetModal();
	});
    // textarea에 작성된 내용도 reason으로 설정
    $("#additionalReason").on("input", function() {
        var additionalReason = $(this).val();
        $("#reasonInput").val(additionalReason);
    });
    	// 페이지 로딩 후 실행되는 함수
	document.addEventListener("DOMContentLoaded", function() {
		const createAtElement = document.getElementById('createAt');
		const createAt = createAtElement.textContent.trim();
		const createdAt = new Date(createAt.replace(/-/g, '/')); // '-'를 '/'로 대체하여 형식 변환
		createAtElement.textContent = formatDate(createdAt);
		displayTemplate();
	});

	function formatDate(createdAt) {
		const now = new Date();
		const diffInMs = now - createdAt;
		const diffInHours = Math.floor(diffInMs / (1000 * 60 * 60));
		console.log(diffInMs);
		console.log(diffInHours);
		console.log(now);
		console.log(createAt);
		if (diffInHours < 1) {
			return "방금 전";
		} else if (diffInHours < 24) {
			return diffInHours + "시간 전";
		} else if (diffInHours < 24 * 7) {
			const diffInDays = Math.floor(diffInHours / 24);
			return diffInDays + "일 전";
		} else {
			return createdAt.toLocaleDateString(); // 7일을 넘어가면 그냥 날짜를 반환
		}
	}