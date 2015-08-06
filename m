From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91570] Upgrading mesa to 10.6 causes segfault in
 OpenGL applications with GeForce4 MX 440 / AGP 8X
Date: Thu, 06 Aug 2015 09:09:30 +0000
Message-ID: <bug-91570-8800-FyM5yQe20x@http.bugs.freedesktop.org/>
References: <bug-91570-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1286269367=="
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


--===============1286269367==
Content-Type: multipart/alternative; boundary="1438852169.Aa1Ba02B0.3959"; charset="UTF-8"


--1438852169.Aa1Ba02B0.3959
Date: Thu, 6 Aug 2015 09:09:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91570

--- Comment #12 from omelette <omelette-kcyQbWKpldg@public.gmane.org> ---
Backtrace from urbanterror

#0  0x95151bc3 in _tnl_InvalidateState (ctx=0x95a86008, new_state=4294967295)
at tnl/t_context.c:195
        scale = {0, 0, 0.5}
        translate = {0, 0, 0.5}
        tnl = 0x8cc1e48
        vp = 0x0
        fp = 0x0
        i = 2
#1  0x95151c26 in _tnl_wakeup (ctx=0x95a86008) at tnl/t_context.c:205
No locals.
#2  0x95477015 in nv10_swtnl_init (ctx=0x95a86008) at nouveau_swtnl_t.c:341
        tnl = 0x8cc1e48
#3  0x954740d5 in nv10_context_create (screen=0x8c61998, api=API_OPENGL_COMPAT,
visual=0x8c66d58, share_ctx=0x0) at nv10_context.c:487
        nctx = 0x95a86008
        ctx = 0x95a86008
        celsius_class = 153
        ret = 0
#4  0x954670ed in nouveau_context_create (api=API_OPENGL_COMPAT,
visual=0x8c66d58, dri_ctx=0x8c64da0, major_version=1, minor_version=0, flags=0,
notify_reset=false, 
    error=0xbfffdc18, share_ctx=0x0) at nouveau_context.c:76
        dri_screen = 0x8c64dc0
        screen = 0x8c61998
        nctx = 0xb7c068cf <calloc+191>
        ctx = 0x8c78ca8
#5  0x95313f37 in driCreateContextAttribs (screen=0x8c64dc0, api=0,
config=0x8c66d58, shared=0x0, num_attribs=0, attribs=0x0, error=0xbfffdc18,
data=0x8c5b610) at dri_util.c:433
        context = 0x8c64da0
        modes = 0x8c66d58
        shareCtx = 0x0
        mesa_api = API_OPENGL_COMPAT
        major_version = 1
        minor_version = 0
        flags = 0
        notify_reset = false
        allowed_flags = 7
#6  0x95314025 in driCreateNewContextForAPI (screen=0x8c64dc0, api=0,
config=0x8c66d58, shared=0x0, data=0x8c5b610) at dri_util.c:462
        error = 107352
#7  0x95314061 in driCreateNewContext (screen=0x8c64dc0, config=0x8c66d58,
shared=0x0, data=0x8c5b610) at dri_util.c:470
No locals.
#8  0x957ed92e in dri2_create_context (base=0x8c30018, config_base=0x8c787a0,
shareList=0x0, renderType=32788) at dri2_glx.c:223
        pcp = 0x8c5b610
        pcp_shared = 0x8c17590
        psc = 0x8c30018
        config = 0x8c787a0
        shared = 0x0
#9  0x957b35cd in CreateContext (dpy=0x8c22508, generic_id=256,
config=0x8c787a0, shareList_user=0x0, allowDirect=1, code=3, renderType=32788,
screen=0) at glxcmds.c:299
        gc = 0x0
        psc = 0x8c30018
        shareList = 0x0
#10 0x957b39ef in glXCreateContext (dpy=0x8c22508, vis=0x8c5ad00,
shareList=0x0, allowDirect=1) at glxcmds.c:430
        config = 0x8c787a0
        renderType = 32788
        psc = 0x8c30018
#11 0xb7f4bb5f in X11_GL_CreateContext (this=0x8c17100) at
./src/video/x11/SDL_x11gl.c:268
No locals.
#12 0xb7f51bfd in X11_CreateWindow (this=this@entry=0x8c17100,
screen=screen@entry=0x8c32e58, w=w@entry=640, h=480, bpp=32, flags=2147483650)
at ./src/video/x11/SDL_x11video.c:1065
        i = <optimized out>
        depth = 24
        vis = <optimized out>
        vis_change = <optimized out>
        Amask = <optimized out>
#13 0xb7f521f0 in X11_SetVideoMode (this=0x8c17100, current=0x8c32e58,
width=640, height=480, bpp=32, flags=2147483650) at
./src/video/x11/SDL_x11video.c:1181
        saved_flags = 0
#14 0xb7f3ee20 in SDL_SetVideoMode (width=640, height=480, bpp=32,
flags=2147483650) at ./src/video/SDL_video.c:683
        video = <optimized out>
        this = <optimized out>
        prev_mode = 0x8c32e58
        mode = <optimized out>
        video_w = 640
        video_h = 480
        video_bpp = 32
        is_opengl = <optimized out>
#15 0x0819cec4 in GLW_StartDriverAndSetMode ()
No symbol table info available.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1438852169.Aa1Ba02B0.3959
Date: Thu, 6 Aug 2015 09:09:29 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91570#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Upgrading mesa to 10.6 causes segfault in OpenGL applications with GeForce4 MX 440 / AGP 8X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91570">bug 91570</a>
              from <span class="vcard"><a class="email" href="mailto:omelette&#64;cock.li" title="omelette &lt;omelette&#64;cock.li&gt;"> <span class="fn">omelette</span></a>
</span></b>
        <pre>Backtrace from urbanterror

#0  0x95151bc3 in _tnl_InvalidateState (ctx=0x95a86008, new_state=4294967295)
at tnl/t_context.c:195
        scale = {0, 0, 0.5}
        translate = {0, 0, 0.5}
        tnl = 0x8cc1e48
        vp = 0x0
        fp = 0x0
        i = 2
#1  0x95151c26 in _tnl_wakeup (ctx=0x95a86008) at tnl/t_context.c:205
No locals.
#2  0x95477015 in nv10_swtnl_init (ctx=0x95a86008) at nouveau_swtnl_t.c:341
        tnl = 0x8cc1e48
#3  0x954740d5 in nv10_context_create (screen=0x8c61998, api=API_OPENGL_COMPAT,
visual=0x8c66d58, share_ctx=0x0) at nv10_context.c:487
        nctx = 0x95a86008
        ctx = 0x95a86008
        celsius_class = 153
        ret = 0
#4  0x954670ed in nouveau_context_create (api=API_OPENGL_COMPAT,
visual=0x8c66d58, dri_ctx=0x8c64da0, major_version=1, minor_version=0, flags=0,
notify_reset=false, 
    error=0xbfffdc18, share_ctx=0x0) at nouveau_context.c:76
        dri_screen = 0x8c64dc0
        screen = 0x8c61998
        nctx = 0xb7c068cf &lt;calloc+191&gt;
        ctx = 0x8c78ca8
#5  0x95313f37 in driCreateContextAttribs (screen=0x8c64dc0, api=0,
config=0x8c66d58, shared=0x0, num_attribs=0, attribs=0x0, error=0xbfffdc18,
data=0x8c5b610) at dri_util.c:433
        context = 0x8c64da0
        modes = 0x8c66d58
        shareCtx = 0x0
        mesa_api = API_OPENGL_COMPAT
        major_version = 1
        minor_version = 0
        flags = 0
        notify_reset = false
        allowed_flags = 7
#6  0x95314025 in driCreateNewContextForAPI (screen=0x8c64dc0, api=0,
config=0x8c66d58, shared=0x0, data=0x8c5b610) at dri_util.c:462
        error = 107352
#7  0x95314061 in driCreateNewContext (screen=0x8c64dc0, config=0x8c66d58,
shared=0x0, data=0x8c5b610) at dri_util.c:470
No locals.
#8  0x957ed92e in dri2_create_context (base=0x8c30018, config_base=0x8c787a0,
shareList=0x0, renderType=32788) at dri2_glx.c:223
        pcp = 0x8c5b610
        pcp_shared = 0x8c17590
        psc = 0x8c30018
        config = 0x8c787a0
        shared = 0x0
#9  0x957b35cd in CreateContext (dpy=0x8c22508, generic_id=256,
config=0x8c787a0, shareList_user=0x0, allowDirect=1, code=3, renderType=32788,
screen=0) at glxcmds.c:299
        gc = 0x0
        psc = 0x8c30018
        shareList = 0x0
#10 0x957b39ef in glXCreateContext (dpy=0x8c22508, vis=0x8c5ad00,
shareList=0x0, allowDirect=1) at glxcmds.c:430
        config = 0x8c787a0
        renderType = 32788
        psc = 0x8c30018
#11 0xb7f4bb5f in X11_GL_CreateContext (this=0x8c17100) at
./src/video/x11/SDL_x11gl.c:268
No locals.
#12 0xb7f51bfd in X11_CreateWindow (this=this&#64;entry=0x8c17100,
screen=screen&#64;entry=0x8c32e58, w=w&#64;entry=640, h=480, bpp=32, flags=2147483650)
at ./src/video/x11/SDL_x11video.c:1065
        i = &lt;optimized out&gt;
        depth = 24
        vis = &lt;optimized out&gt;
        vis_change = &lt;optimized out&gt;
        Amask = &lt;optimized out&gt;
#13 0xb7f521f0 in X11_SetVideoMode (this=0x8c17100, current=0x8c32e58,
width=640, height=480, bpp=32, flags=2147483650) at
./src/video/x11/SDL_x11video.c:1181
        saved_flags = 0
#14 0xb7f3ee20 in SDL_SetVideoMode (width=640, height=480, bpp=32,
flags=2147483650) at ./src/video/SDL_video.c:683
        video = &lt;optimized out&gt;
        this = &lt;optimized out&gt;
        prev_mode = 0x8c32e58
        mode = &lt;optimized out&gt;
        video_w = 640
        video_h = 480
        video_bpp = 32
        is_opengl = &lt;optimized out&gt;
#15 0x0819cec4 in GLW_StartDriverAndSetMode ()
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

--1438852169.Aa1Ba02B0.3959--

--===============1286269367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1286269367==--
