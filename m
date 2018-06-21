From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106994] [PATCH] Fix null pointer dereference in
 drmmode_output_dpms
Date: Thu, 21 Jun 2018 14:55:59 +0000
Message-ID: <bug-106994-8800-OtnKJxAaAT@http.bugs.freedesktop.org/>
References: <bug-106994-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2039681574=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-106994-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2039681574==
Content-Type: multipart/alternative; boundary="15295929580.B0D8Ff3bd.671"
Content-Transfer-Encoding: 7bit


--15295929580.B0D8Ff3bd.671
Date: Thu, 21 Jun 2018 14:55:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106994

--- Comment #1 from John Lindgren <john-ytntcHzVV1kcWVvVuXF20w@public.gmane.org> ---
Full backtrace:

Thread 1 "Xorg" received signal SIGSEGV, Segmentation fault.
drmmode_output_dpms (output=3D0x558b2dab8ee0, mode=3D3) at
../../src/drmmode_display.c:921
921     ../../src/drmmode_display.c: No such file or directory.
#0  0x00007f386322a759 in drmmode_output_dpms (output=3D0x558b2dab8ee0, mod=
e=3D3)
at ../../src/drmmode_display.c:921
        drmmode_output =3D 0x558b2dab8cc0
        koutput =3D 0x0
        props =3D <optimized out>
        drmmode =3D 0x558b2dab5200
        mode_id =3D -1
        i =3D 0
#1  0x0000558b2ba39223 in xf86DisableUnusedFunctions (pScrn=3D0x558b2dab493=
0) at
../../../../../../hw/xfree86/modes/xf86Crtc.c:3000
        output =3D <optimized out>
        xf86_config =3D 0x558b2dab56e0
        o =3D 6
        c =3D <optimized out>
#2  0x0000558b2ba40ef0 in xf86RandR12CrtcSet (pScreen=3D<optimized out>,
randr_crtc=3D0x558b2daf51f0, randr_mode=3D0x0, x=3D0, y=3D0, rotation=3D<op=
timized out>,
num_randr_outputs=3D0, randr_outputs=3D0x0)
    at ../../../../../../hw/xfree86/modes/xf86RandR12.c:1245
        pScrn =3D 0x558b2dab4930
        config =3D <optimized out>
        crtc =3D 0x558b2dab9ec0
        transform =3D 0x0
        changed =3D <optimized out>
        o =3D <optimized out>
        ro =3D <optimized out>
        save_crtcs =3D 0x558b2debcc50
        save_enabled =3D <optimized out>
#3  0x0000558b2ba84a32 in RRCrtcSet (crtc=3D<optimized out>, mode=3D0x0, x=
=3D0, y=3D0,
rotation=3Drotation@entry=3D1, numOutputs=3DnumOutputs@entry=3D0, outputs=
=3D0x0) at
../../../../randr/rrcrtc.c:768
        pScreen =3D 0x558b2daacb80
        ret =3D <optimized out>
        crtcChanged =3D <optimized out>
        o =3D <optimized out>
#4  0x0000558b2ba862b3 in ProcRRSetCrtcConfig (client=3D0x558b2de43170) at
../../../../randr/rrcrtc.c:1366
        stuff =3D <optimized out>
        rep =3D {type =3D 0 '\000', status =3D 0 '\000', sequenceNumber =3D=
 0, length =3D
0, newTimestamp =3D 766260624, pad1 =3D 21899, pad2 =3D 735925696, pad3 =3D=
 21899, pad4
=3D 1660946009, pad5 =3D 32568}
        pScreen =3D <optimized out>
        crtc =3D 0x558b2daf51f0
        mode =3D 0x0
        numOutputs =3D 0
        outputs =3D <optimized out>
        time =3D <optimized out>
        rotation =3D 1
        ret =3D <optimized out>
        i =3D <optimized out>
        j =3D <optimized out>
        status =3D <optimized out>
#5  0x0000558b2b9c0e98 in Dispatch () at ../../../../dix/dispatch.c:479
        result =3D <optimized out>
        start_tick =3D 930
#6  0x0000558b2b9c4ee0 in dix_main (argc=3D3, argv=3D0x7ffdc0d05ac8,
envp=3D<optimized out>) at ../../../../dix/main.c:287
        i =3D <optimized out>
        alwaysCheckForInput =3D {0, 1}
#7  0x00007f3865d7db97 in __libc_start_main (main=3D0x558b2b9aeb50 <main>,
argc=3D3, argv=3D0x7ffdc0d05ac8, init=3D<optimized out>, fini=3D<optimized =
out>,
rtld_fini=3D<optimized out>, stack_end=3D0x7ffdc0d05ab8) at ../csu/libc-sta=
rt.c:310
        result =3D <optimized out>
        unwind_buf =3D=20
              {cancel_jmp_buf =3D {{jmp_buf =3D {0, 837132253956422676,
94056220388192, 140727838333632, 0, 0, 6878053941391146004,
6843373089882258452}, mask_was_saved =3D 0}}, priv =3D {pad =3D {0x0, 0x0,
0x7f3868887733 <_dl_init+259>, 0x7f3868875438}, data =3D {prev =3D 0x0, cle=
anup =3D
0x0, canceltype =3D 1753773875}}}
        not_first_call =3D <optimized out>
#8  0x0000558b2b9aeb8a in _start ()

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15295929580.B0D8Ff3bd.671
Date: Thu, 21 Jun 2018 14:55:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [PATCH] Fix null pointer dereference in drmmode_output_dp=
ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106994#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [PATCH] Fix null pointer dereference in drmmode_output_dp=
ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106994">bug 10699=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
john&#64;jlindgren.net" title=3D"John Lindgren &lt;john&#64;jlindgren.net&g=
t;"> <span class=3D"fn">John Lindgren</span></a>
</span></b>
        <pre>Full backtrace:

Thread 1 &quot;Xorg&quot; received signal SIGSEGV, Segmentation fault.
drmmode_output_dpms (output=3D0x558b2dab8ee0, mode=3D3) at
../../src/drmmode_display.c:921
921     ../../src/drmmode_display.c: No such file or directory.
#0  0x00007f386322a759 in drmmode_output_dpms (output=3D0x558b2dab8ee0, mod=
e=3D3)
at ../../src/drmmode_display.c:921
        drmmode_output =3D 0x558b2dab8cc0
        koutput =3D 0x0
        props =3D &lt;optimized out&gt;
        drmmode =3D 0x558b2dab5200
        mode_id =3D -1
        i =3D 0
#1  0x0000558b2ba39223 in xf86DisableUnusedFunctions (pScrn=3D0x558b2dab493=
0) at
../../../../../../hw/xfree86/modes/xf86Crtc.c:3000
        output =3D &lt;optimized out&gt;
        xf86_config =3D 0x558b2dab56e0
        o =3D 6
        c =3D &lt;optimized out&gt;
#2  0x0000558b2ba40ef0 in xf86RandR12CrtcSet (pScreen=3D&lt;optimized out&g=
t;,
randr_crtc=3D0x558b2daf51f0, randr_mode=3D0x0, x=3D0, y=3D0, rotation=3D&lt=
;optimized out&gt;,
num_randr_outputs=3D0, randr_outputs=3D0x0)
    at ../../../../../../hw/xfree86/modes/xf86RandR12.c:1245
        pScrn =3D 0x558b2dab4930
        config =3D &lt;optimized out&gt;
        crtc =3D 0x558b2dab9ec0
        transform =3D 0x0
        changed =3D &lt;optimized out&gt;
        o =3D &lt;optimized out&gt;
        ro =3D &lt;optimized out&gt;
        save_crtcs =3D 0x558b2debcc50
        save_enabled =3D &lt;optimized out&gt;
#3  0x0000558b2ba84a32 in RRCrtcSet (crtc=3D&lt;optimized out&gt;, mode=3D0=
x0, x=3D0, y=3D0,
rotation=3Drotation&#64;entry=3D1, numOutputs=3DnumOutputs&#64;entry=3D0, o=
utputs=3D0x0) at
../../../../randr/rrcrtc.c:768
        pScreen =3D 0x558b2daacb80
        ret =3D &lt;optimized out&gt;
        crtcChanged =3D &lt;optimized out&gt;
        o =3D &lt;optimized out&gt;
#4  0x0000558b2ba862b3 in ProcRRSetCrtcConfig (client=3D0x558b2de43170) at
../../../../randr/rrcrtc.c:1366
        stuff =3D &lt;optimized out&gt;
        rep =3D {type =3D 0 '\000', status =3D 0 '\000', sequenceNumber =3D=
 0, length =3D
0, newTimestamp =3D 766260624, pad1 =3D 21899, pad2 =3D 735925696, pad3 =3D=
 21899, pad4
=3D 1660946009, pad5 =3D 32568}
        pScreen =3D &lt;optimized out&gt;
        crtc =3D 0x558b2daf51f0
        mode =3D 0x0
        numOutputs =3D 0
        outputs =3D &lt;optimized out&gt;
        time =3D &lt;optimized out&gt;
        rotation =3D 1
        ret =3D &lt;optimized out&gt;
        i =3D &lt;optimized out&gt;
        j =3D &lt;optimized out&gt;
        status =3D &lt;optimized out&gt;
#5  0x0000558b2b9c0e98 in Dispatch () at ../../../../dix/dispatch.c:479
        result =3D &lt;optimized out&gt;
        start_tick =3D 930
#6  0x0000558b2b9c4ee0 in dix_main (argc=3D3, argv=3D0x7ffdc0d05ac8,
envp=3D&lt;optimized out&gt;) at ../../../../dix/main.c:287
        i =3D &lt;optimized out&gt;
        alwaysCheckForInput =3D {0, 1}
#7  0x00007f3865d7db97 in __libc_start_main (main=3D0x558b2b9aeb50 &lt;main=
&gt;,
argc=3D3, argv=3D0x7ffdc0d05ac8, init=3D&lt;optimized out&gt;, fini=3D&lt;o=
ptimized out&gt;,
rtld_fini=3D&lt;optimized out&gt;, stack_end=3D0x7ffdc0d05ab8) at ../csu/li=
bc-start.c:310
        result =3D &lt;optimized out&gt;
        unwind_buf =3D=20
              {cancel_jmp_buf =3D {{jmp_buf =3D {0, 837132253956422676,
94056220388192, 140727838333632, 0, 0, 6878053941391146004,
6843373089882258452}, mask_was_saved =3D 0}}, priv =3D {pad =3D {0x0, 0x0,
0x7f3868887733 &lt;_dl_init+259&gt;, 0x7f3868875438}, data =3D {prev =3D 0x=
0, cleanup =3D
0x0, canceltype =3D 1753773875}}}
        not_first_call =3D &lt;optimized out&gt;
#8  0x0000558b2b9aeb8a in _start ()</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15295929580.B0D8Ff3bd.671--

--===============2039681574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2039681574==--
