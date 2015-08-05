From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91570] Upgrading mesa to 10.6 causes segfault in
 OpenGL applications with GeForce4 MX 440 / AGP 8X
Date: Wed, 05 Aug 2015 21:54:32 +0000
Message-ID: <bug-91570-8800-yfQM8YRfiR@http.bugs.freedesktop.org/>
References: <bug-91570-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1830084495=="
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


--===============1830084495==
Content-Type: multipart/alternative; boundary="1438811671.4275B0.9388"; charset="UTF-8"


--1438811671.4275B0.9388
Date: Wed, 5 Aug 2015 21:54:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91570

--- Comment #8 from omelette <omelette-kcyQbWKpldg@public.gmane.org> ---
UrbanTerror also fails and I assume other applications requiring hardware
accelleration.

>$ glxinfo
>name of display: :0
>Segmentation fault (core dumped)

>$ glxgears
>Segmentation fault (core dumped)

>Can you get backtraces from gdb?

#0  0x951bec92 in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#1  0x951bed7e in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#2  0x95457134 in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#3  0x954539b2 in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#4  0x9544a2fc in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#5  0x95316bf3 in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#6  0x95316d5f in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#7  0x957ec4ae in ?? () from /usr/lib/libGL.so.1
No symbol table info available.
#8  0x957c1578 in ?? () from /usr/lib/libGL.so.1
No symbol table info available.
#9  0x957c183e in glXCreateContext () from /usr/lib/libGL.so.1
No symbol table info available.
#10 0xb7f4bf3f in ?? () from /usr/lib/libSDL-1.2.so.0
No symbol table info available.
#11 0xb7f51a01 in ?? () from /usr/lib/libSDL-1.2.so.0
No symbol table info available.
#12 0xb7f51fbd in ?? () from /usr/lib/libSDL-1.2.so.0
No symbol table info available.
#13 0xb7f3f3bf in SDL_SetVideoMode () from /usr/lib/libSDL-1.2.so.0
No symbol table info available.
#14 0x0819cec4 in GLW_StartDriverAndSetMode ()
No symbol table info available.

this is the backtrace I get when trying to run urbanterror

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1438811671.4275B0.9388
Date: Wed, 5 Aug 2015 21:54:31 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91570#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Upgrading mesa to 10.6 causes segfault in OpenGL applications with GeForce4 MX 440 / AGP 8X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91570">bug 91570</a>
              from <span class="vcard"><a class="email" href="mailto:omelette&#64;cock.li" title="omelette &lt;omelette&#64;cock.li&gt;"> <span class="fn">omelette</span></a>
</span></b>
        <pre>UrbanTerror also fails and I assume other applications requiring hardware
accelleration.

<span class="quote">&gt;$ glxinfo
&gt;name of display: :0
&gt;Segmentation fault (core dumped)</span >

<span class="quote">&gt;$ glxgears
&gt;Segmentation fault (core dumped)</span >

<span class="quote">&gt;Can you get backtraces from gdb?</span >

#0  0x951bec92 in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#1  0x951bed7e in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#2  0x95457134 in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#3  0x954539b2 in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#4  0x9544a2fc in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#5  0x95316bf3 in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#6  0x95316d5f in ?? () from /usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
No symbol table info available.
#7  0x957ec4ae in ?? () from /usr/lib/libGL.so.1
No symbol table info available.
#8  0x957c1578 in ?? () from /usr/lib/libGL.so.1
No symbol table info available.
#9  0x957c183e in glXCreateContext () from /usr/lib/libGL.so.1
No symbol table info available.
#10 0xb7f4bf3f in ?? () from /usr/lib/libSDL-1.2.so.0
No symbol table info available.
#11 0xb7f51a01 in ?? () from /usr/lib/libSDL-1.2.so.0
No symbol table info available.
#12 0xb7f51fbd in ?? () from /usr/lib/libSDL-1.2.so.0
No symbol table info available.
#13 0xb7f3f3bf in SDL_SetVideoMode () from /usr/lib/libSDL-1.2.so.0
No symbol table info available.
#14 0x0819cec4 in GLW_StartDriverAndSetMode ()
No symbol table info available.

this is the backtrace I get when trying to run urbanterror</pre>
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

--1438811671.4275B0.9388--

--===============1830084495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1830084495==--
