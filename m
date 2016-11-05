From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93828] Xorg hangs randomly with nouveau driver
Date: Sat, 05 Nov 2016 15:52:31 +0000
Message-ID: <bug-93828-8800-eh4AaWztlq@http.bugs.freedesktop.org/>
References: <bug-93828-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2131016949=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93828-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2131016949==
Content-Type: multipart/alternative; boundary="14783611510.DD881.2969";
 charset="UTF-8"


--14783611510.DD881.2969
Date: Sat, 5 Nov 2016 15:52:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93828

--- Comment #10 from derrierdo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hi,

I've got the same issue with 4.4 (kernel) not with 4.1.15 when screensaver =
fire
up.
How can I help, with trace/logfile ?


01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (=
rev
a2)


Nov  5 08:27:01 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 11
[flux[21781]] subc 6 mthd 01c8 data beef0201
Nov  5 08:27:01 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 11
[flux[21781]] subc 6 mthd 01c4 data beef0201
Nov  5 08:27:01 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 11
[flux[21781]] subc 6 mthd 01c0 data beef0201
Nov  5 08:27:01 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 11
[flux[21781]] subc 6 mthd 01b8 data beef0201

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14783611510.DD881.2969
Date: Sat, 5 Nov 2016 15:52:31 +0000
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
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828">bug 93828<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
derrierdo&#64;gmail.com" title=3D"derrierdo&#64;gmail.com">derrierdo&#64;gm=
ail.com</a>
</span></b>
        <pre>Hi,

I've got the same issue with 4.4 (kernel) not with 4.1.15 when screensaver =
fire
up.
How can I help, with trace/logfile ?


01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (=
rev
a2)


Nov  5 08:27:01 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 11
[flux[21781]] subc 6 mthd 01c8 data beef0201
Nov  5 08:27:01 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 11
[flux[21781]] subc 6 mthd 01c4 data beef0201
Nov  5 08:27:01 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 11
[flux[21781]] subc 6 mthd 01c0 data beef0201
Nov  5 08:27:01 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 11
[flux[21781]] subc 6 mthd 01b8 data beef0201</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14783611510.DD881.2969--

--===============2131016949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2131016949==--
