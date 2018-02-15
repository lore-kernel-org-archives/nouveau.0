From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105117] desktop freeze playing video nouveau:
 DATA_ERROR INVALID_BITFIELD
Date: Thu, 15 Feb 2018 16:05:39 +0000
Message-ID: <bug-105117-8800-TH39QOnT1d@http.bugs.freedesktop.org/>
References: <bug-105117-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1761741750=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105117-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1761741750==
Content-Type: multipart/alternative; boundary="15187107380.bF3fDB2.17823"
Content-Transfer-Encoding: 7bit


--15187107380.bF3fDB2.17823
Date: Thu, 15 Feb 2018 16:05:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105117

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to rcoe from comment #0)
> [  852.947765] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
> [INVALID_BITFIELD] ch 11 [003f7f0000 WebKitWebProces[8594
> ]] subc 0 class 9197 mthd 0808 data 200203fd
> [  852.947775] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 11
> [003f7f0000 WebKitWebProces[8594]] subc 0 mthd 23
> 90 data 3f000000

Feels like a multithreading issue. 808 is RT[0].HORIZ, however the value,
200203fd feels like a pushbuf command. This can happen if the application t=
ries
to invoke gl* calls from multiple threads.

[This is a long-standing issue in nouveau, and not one that's going to be
addressed anytime soon.]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15187107380.bF3fDB2.17823
Date: Thu, 15 Feb 2018 16:05:38 +0000
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
   title=3D"NEW - desktop freeze playing video nouveau: DATA_ERROR INVALID_=
BITFIELD"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105117#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - desktop freeze playing video nouveau: DATA_ERROR INVALID_=
BITFIELD"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105117">bug 10511=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to rcoe from <a href=3D"show_bug.cgi?id=3D105117#c0"=
>comment #0</a>)
<span class=3D"quote">&gt; [  852.947765] nouveau 0000:01:00.0: gr: DATA_ER=
ROR 0000000c
&gt; [INVALID_BITFIELD] ch 11 [003f7f0000 WebKitWebProces[8594
&gt; ]] subc 0 class 9197 mthd 0808 data 200203fd
&gt; [  852.947775] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 11
&gt; [003f7f0000 WebKitWebProces[8594]] subc 0 mthd 23
&gt; 90 data 3f000000</span >

Feels like a multithreading issue. 808 is RT[0].HORIZ, however the value,
200203fd feels like a pushbuf command. This can happen if the application t=
ries
to invoke gl* calls from multiple threads.

[This is a long-standing issue in nouveau, and not one that's going to be
addressed anytime soon.]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15187107380.bF3fDB2.17823--

--===============1761741750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1761741750==--
