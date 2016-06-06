From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96411] [NVA8] reclocking not working. screen
	glitches.
Date: Mon, 06 Jun 2016 17:32:54 +0000
Message-ID: <bug-96411-8800-p8tLP4pWbL@http.bugs.freedesktop.org/>
References: <bug-96411-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1296520851=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96411-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1296520851==
Content-Type: multipart/alternative; boundary="14652343740.A7C1d.29338";
 charset="UTF-8"


--14652343740.A7C1d.29338
Date: Mon, 6 Jun 2016 17:32:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96411

--- Comment #2 from J. Neto <josenetodino+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 124371
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124371&action=3Dedit
mmio trace

in: uname -a
out: Linux t410 4.4.9-300.fc23.x86_64 #1 SMP Mon Feb 1 03:18:41 UTC 2016 x8=
6_64
x86_64 x86_64 GNU/Linux

in: ???
out: nvidia-340xx-340.96

I've followed this guide: https://wiki.ubuntu.com/X/MMIOTracing

And during the tracing I've run: xinit -e sh -c "glxgears & sleep 10"

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14652343740.A7C1d.29338
Date: Mon, 6 Jun 2016 17:32:54 +0000
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
   title=3D"NEW - [NVA8] reclocking not working. screen glitches."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96411#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVA8] reclocking not working. screen glitches."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96411">bug 96411<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
josenetodino+freedesktop&#64;gmail.com" title=3D"J. Neto &lt;josenetodino+f=
reedesktop&#64;gmail.com&gt;"> <span class=3D"fn">J. Neto</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124371=
" name=3D"attach_124371" title=3D"mmio trace">attachment 124371</a> <a href=
=3D"attachment.cgi?id=3D124371&amp;action=3Dedit" title=3D"mmio trace">[det=
ails]</a></span>
mmio trace

in: uname -a
out: Linux t410 4.4.9-300.fc23.x86_64 #1 SMP Mon Feb 1 03:18:41 UTC 2016 x8=
6_64
x86_64 x86_64 GNU/Linux

in: ???
out: nvidia-340xx-340.96

I've followed this guide: <a href=3D"https://wiki.ubuntu.com/X/MMIOTracing"=
>https://wiki.ubuntu.com/X/MMIOTracing</a>

And during the tracing I've run: xinit -e sh -c &quot;glxgears &amp; sleep =
10&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14652343740.A7C1d.29338--

--===============1296520851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1296520851==--
