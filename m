From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91570] Upgrading mesa to 10.6 causes segfault in
 OpenGL applications with GeForce4 MX 440 / AGP 8X
Date: Thu, 06 Aug 2015 08:51:44 +0000
Message-ID: <bug-91570-8800-dxnVDmkk5m@http.bugs.freedesktop.org/>
References: <bug-91570-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2091193680=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91570-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2091193680==
Content-Type: multipart/alternative; boundary="1438851104.b71E2D240.25911"; charset="UTF-8"


--1438851104.b71E2D240.25911
Date: Thu, 6 Aug 2015 08:51:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91570

--- Comment #11 from omelette <omelette-kcyQbWKpldg@public.gmane.org> ---
Here's the backtrace from glxgears


(gdb) bt full
#0  0xb74eabc3 in _tnl_InvalidateState (ctx=0xb7fb7008, new_state=4294967295)
at tnl/t_context.c:195
        scale = {0, 0, 0.5}
        translate = {0, 0, 0.5}
        tnl = 0x80c1bd8
        vp = 0x0
        fp = 0x0
        i = 2
#1  0xb74eac26 in _tnl_wakeup (ctx=0xb7fb7008) at tnl/t_context.c:205
No locals.
#2  0xb7810015 in nv10_swtnl_init (ctx=0xb7fb7008) at nouveau_swtnl_t.c:341
        tnl = 0x80c1bd8
#3  0xb780d0d5 in nv10_context_create (screen=0x8065b18, api=API_OPENGL_COMPAT,
visual=0x80704a8, share_ctx=0x0) at nv10_context.c:487
        nctx = 0xb7fb7008
        ctx = 0xb7fb7008
        celsius_class = 153
        ret = 0
#4  0xb78000ed in nouveau_context_create (api=API_OPENGL_COMPAT,
visual=0x80704a8, dri_ctx=0x805acd0, major_version=1, minor_version=0, flags=0,
notify_reset=false, 
    error=0xbffff4d8, share_ctx=0x0) at nouveau_context.c:76
        dri_screen = 0x8065a20
        screen = 0x8065b18
        nctx = 0xb7c288cf <calloc+191>
        ctx = 0x80796b8
#5  0xb76acf37 in driCreateContextAttribs (screen=0x8065a20, api=0,
config=0x80704a8, shared=0x0, num_attribs=0, attribs=0x0, error=0xbffff4d8,
data=0x805abe8) at dri_util.c:433
        context = 0x805acd0
        modes = 0x80704a8
        shareCtx = 0x0
        mesa_api = API_OPENGL_COMPAT
        major_version = 1
        minor_version = 0
        flags = 0
        notify_reset = false
        allowed_flags = 7
#6  0xb76ad025 in driCreateNewContextForAPI (screen=0x8065a20, api=0,
config=0x80704a8, shared=0x0, data=0x805abe8) at dri_util.c:462
        error = 96584
#7  0xb76ad061 in driCreateNewContext (screen=0x8065a20, config=0x80704a8,
shared=0x0, data=0x805abe8) at dri_util.c:470
No locals.
#8  0xb7f5792e in dri2_create_context (base=0x805ab58, config_base=0x8077788,
shareList=0x0, renderType=32788) at dri2_glx.c:223
        pcp = 0x805abe8
        pcp_shared = 0xb7f1112c
        psc = 0x805ab58
        config = 0x8077788
        shared = 0x0
#9  0xb7f1d5cd in CreateContext (dpy=0x804e008, generic_id=225,
config=0x8077788, shareList_user=0x0, allowDirect=1, code=3, renderType=32788,
screen=0) at glxcmds.c:299
        gc = 0x0
        psc = 0x805ab58
        shareList = 0x0
#10 0xb7f1d9ef in glXCreateContext (dpy=0x804e008, vis=0x805af98,
shareList=0x0, allowDirect=1) at glxcmds.c:430
        config = 0x8077788
        renderType = 32788
        psc = 0x805ab58
#11 0x0804b19c in ?? ()
No symbol table info available.
#12 0x0804936e in ?? ()
No symbol table info available.
#13 0xb7bcd637 in __libc_start_main () from /usr/lib/libc.so.6
No symbol table info available.
#14 0x08049cf3 in ?? ()
No symbol table info available.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1438851104.b71E2D240.25911
Date: Thu, 6 Aug 2015 08:51:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Upgrading mesa to 10.6 causes segfault in OpenGL applications with GeForce4 MX 440 / AGP 8X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91570#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Upgrading mesa to 10.6 causes segfault in OpenGL applications with GeForce4 MX 440 / AGP 8X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91570">bug 91570</a>
              from <span class="vcard"><a class="email" href="mailto:omelette&#64;cock.li" title="omelette &lt;omelette&#64;cock.li&gt;"> <span class="fn">omelette</span></a>
</span></b>
        <pre>Here's the backtrace from glxgears


(gdb) bt full
#0  0xb74eabc3 in _tnl_InvalidateState (ctx=0xb7fb7008, new_state=4294967295)
at tnl/t_context.c:195
        scale = {0, 0, 0.5}
        translate = {0, 0, 0.5}
        tnl = 0x80c1bd8
        vp = 0x0
        fp = 0x0
        i = 2
#1  0xb74eac26 in _tnl_wakeup (ctx=0xb7fb7008) at tnl/t_context.c:205
No locals.
#2  0xb7810015 in nv10_swtnl_init (ctx=0xb7fb7008) at nouveau_swtnl_t.c:341
        tnl = 0x80c1bd8
#3  0xb780d0d5 in nv10_context_create (screen=0x8065b18, api=API_OPENGL_COMPAT,
visual=0x80704a8, share_ctx=0x0) at nv10_context.c:487
        nctx = 0xb7fb7008
        ctx = 0xb7fb7008
        celsius_class = 153
        ret = 0
#4  0xb78000ed in nouveau_context_create (api=API_OPENGL_COMPAT,
visual=0x80704a8, dri_ctx=0x805acd0, major_version=1, minor_version=0, flags=0,
notify_reset=false, 
    error=0xbffff4d8, share_ctx=0x0) at nouveau_context.c:76
        dri_screen = 0x8065a20
        screen = 0x8065b18
        nctx = 0xb7c288cf &lt;calloc+191&gt;
        ctx = 0x80796b8
#5  0xb76acf37 in driCreateContextAttribs (screen=0x8065a20, api=0,
config=0x80704a8, shared=0x0, num_attribs=0, attribs=0x0, error=0xbffff4d8,
data=0x805abe8) at dri_util.c:433
        context = 0x805acd0
        modes = 0x80704a8
        shareCtx = 0x0
        mesa_api = API_OPENGL_COMPAT
        major_version = 1
        minor_version = 0
        flags = 0
        notify_reset = false
        allowed_flags = 7
#6  0xb76ad025 in driCreateNewContextForAPI (screen=0x8065a20, api=0,
config=0x80704a8, shared=0x0, data=0x805abe8) at dri_util.c:462
        error = 96584
#7  0xb76ad061 in driCreateNewContext (screen=0x8065a20, config=0x80704a8,
shared=0x0, data=0x805abe8) at dri_util.c:470
No locals.
#8  0xb7f5792e in dri2_create_context (base=0x805ab58, config_base=0x8077788,
shareList=0x0, renderType=32788) at dri2_glx.c:223
        pcp = 0x805abe8
        pcp_shared = 0xb7f1112c
        psc = 0x805ab58
        config = 0x8077788
        shared = 0x0
#9  0xb7f1d5cd in CreateContext (dpy=0x804e008, generic_id=225,
config=0x8077788, shareList_user=0x0, allowDirect=1, code=3, renderType=32788,
screen=0) at glxcmds.c:299
        gc = 0x0
        psc = 0x805ab58
        shareList = 0x0
#10 0xb7f1d9ef in glXCreateContext (dpy=0x804e008, vis=0x805af98,
shareList=0x0, allowDirect=1) at glxcmds.c:430
        config = 0x8077788
        renderType = 32788
        psc = 0x805ab58
#11 0x0804b19c in ?? ()
No symbol table info available.
#12 0x0804936e in ?? ()
No symbol table info available.
#13 0xb7bcd637 in __libc_start_main () from /usr/lib/libc.so.6
No symbol table info available.
#14 0x08049cf3 in ?? ()
No symbol table info available.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1438851104.b71E2D240.25911--

--===============2091193680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2091193680==--
