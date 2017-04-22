From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100758] Kernel Oops when starting X nv50_dma_push
Date: Sat, 22 Apr 2017 15:01:50 +0000
Message-ID: <bug-100758-8800-5oqP2EbYkK@http.bugs.freedesktop.org/>
References: <bug-100758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1407773379=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100758-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1407773379==
Content-Type: multipart/alternative; boundary="14928733101.d12Db8078.6492";
 charset="UTF-8"


--14928733101.d12Db8078.6492
Date: Sat, 22 Apr 2017 15:01:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100758

--- Comment #1 from Kevin Winchester <kjwinchester-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Versions:

Linux karpov 4.10.11-1-ARCH #1 SMP PREEMPT Tue Apr 18 08:39:42 CEST 2017 x8=
6_64
GNU/Linux


core/linux 4.10.11-1
extra/xorg-server 1.19.3-2
extra/xf86-video-nouveau 1.0.15-1
extra/libdrm 2.4.80-1
extra/mesa 17.0.4-2

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14928733101.d12Db8078.6492
Date: Sat, 22 Apr 2017 15:01:50 +0000
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
   title=3D"NEW - Kernel Oops when starting X nv50_dma_push"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100758#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel Oops when starting X nv50_dma_push"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100758">bug 10075=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kjwinchester&#64;gmail.com" title=3D"Kevin Winchester &lt;kjwinchester&#64;=
gmail.com&gt;"> <span class=3D"fn">Kevin Winchester</span></a>
</span></b>
        <pre>Versions:

Linux karpov 4.10.11-1-ARCH #1 SMP PREEMPT Tue Apr 18 08:39:42 CEST 2017 x8=
6_64
GNU/Linux


core/linux 4.10.11-1
extra/xorg-server 1.19.3-2
extra/xf86-video-nouveau 1.0.15-1
extra/libdrm 2.4.80-1
extra/mesa 17.0.4-2</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14928733101.d12Db8078.6492--

--===============1407773379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1407773379==--
