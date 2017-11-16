From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80675] [NVAA] Nouveau KMS framebuffer hand-over:
 no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB
 graphics RAM, X11 ok
Date: Thu, 16 Nov 2017 23:45:16 +0000
Message-ID: <bug-80675-8800-2VauaAi37V@http.bugs.freedesktop.org/>
References: <bug-80675-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0945784630=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80675-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0945784630==
Content-Type: multipart/alternative; boundary="15108759161.c2A95939.18453";
 charset="UTF-8"


--15108759161.c2A95939.18453
Date: Thu, 16 Nov 2017 23:45:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D80675

--- Comment #10 from Ondrej Zary <linux-ZCIryABCsrmttCpgsWEBFmD2FQJk+8+b@public.gmane.org> ---
This bug is still present in 4.14 kernel at least on MCP79 (ION). Bisected =
it
to:

4f6029da58ba9204c98e33f4f3737fe085c87a6f is the first bad commit
commit 4f6029da58ba9204c98e33f4f3737fe085c87a6f
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Fri Nov 16 11:54:31 2012 +1000

    drm/nv50-nvc0: switch to common disp impl, removing previous version

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

But it's a huge patch :(

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15108759161.c2A95939.18453
Date: Thu, 16 Nov 2017 23:45:16 +0000
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
   title=3D"NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black consol=
e on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11=
 ok"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80675#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black consol=
e on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11=
 ok"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80675">bug 80675<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
linux&#64;rainbow-software.org" title=3D"Ondrej Zary &lt;linux&#64;rainbow-=
software.org&gt;"> <span class=3D"fn">Ondrej Zary</span></a>
</span></b>
        <pre>This bug is still present in 4.14 kernel at least on MCP79 (IO=
N). Bisected it
to:

4f6029da58ba9204c98e33f4f3737fe085c87a6f is the first bad commit
commit 4f6029da58ba9204c98e33f4f3737fe085c87a6f
Author: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com">bskeggs&#6=
4;redhat.com</a>&gt;
Date:   Fri Nov 16 11:54:31 2012 +1000

    drm/nv50-nvc0: switch to common disp impl, removing previous version

    Signed-off-by: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com"=
>bskeggs&#64;redhat.com</a>&gt;

But it's a huge patch :(</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15108759161.c2A95939.18453--

--===============0945784630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0945784630==--
