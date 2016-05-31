From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Tue, 31 May 2016 18:51:13 +0000
Message-ID: <bug-90626-8800-qmk8aaWzqo@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0139166694=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0139166694==
Content-Type: multipart/alternative; boundary="14647206732.6E39.20376";
 charset="UTF-8"


--14647206732.6E39.20376
Date: Tue, 31 May 2016 18:51:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D90626

--- Comment #50 from vdanjean-GANU6spQydw@public.gmane.org <vdanjean.ml-GANU6spQydw@public.gmane.org> ---
  Hi,

  As requested, I can confirm that upstream kernel works (in my case, these=
 are
Debian packaged kernels). I cannot tell exactly from which version it works,
but 4.4-rc3 looks possible to me. The Debian bug report
(https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D772716) marks it fixed=
 in
the 4.3.1-1 version (i.e. the patch was probably backported to the stable
series)
  Recently (kernel > 4.5.x), the nouveau kernel driver is not automatically
loaded at startup, so I need to run "modprobe nouveau" manually. But this is
another bug that I did not investigate (nor report) for now.

  For me, this bug can be closed.

  Regards,
    Vincent

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14647206732.6E39.20376
Date: Tue, 31 May 2016 18:51:13 +0000
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
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626#c50">Commen=
t # 50</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626">bug 90626<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vdanjean.ml&#64;free.fr" title=3D"vdanjean&#64;free.fr &lt;vdanjean.ml&#64;=
free.fr&gt;"> <span class=3D"fn">vdanjean&#64;free.fr</span></a>
</span></b>
        <pre>  Hi,

  As requested, I can confirm that upstream kernel works (in my case, these=
 are
Debian packaged kernels). I cannot tell exactly from which version it works,
but 4.4-rc3 looks possible to me. The Debian bug report
(<a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D772716">htt=
ps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D772716</a>) marks it fixed=
 in
the 4.3.1-1 version (i.e. the patch was probably backported to the stable
series)
  Recently (kernel &gt; 4.5.x), the nouveau kernel driver is not automatica=
lly
loaded at startup, so I need to run &quot;modprobe nouveau&quot; manually. =
But this is
another bug that I did not investigate (nor report) for now.

  For me, this bug can be closed.

  Regards,
    Vincent</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14647206732.6E39.20376--

--===============0139166694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0139166694==--
