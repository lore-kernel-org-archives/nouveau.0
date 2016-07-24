From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97066] Blank screen when starting KMS on a GTX970
 for kernel 4.6 series
Date: Sun, 24 Jul 2016 18:30:39 +0000
Message-ID: <bug-97066-8800-IuZwgkO6Nm@http.bugs.freedesktop.org/>
References: <bug-97066-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1771647128=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97066-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1771647128==
Content-Type: multipart/alternative; boundary="14693850391.aAF6aBd6.14151";
 charset="UTF-8"


--14693850391.aAF6aBd6.14151
Date: Sun, 24 Jul 2016 18:30:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97066

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to smmilut from comment #5)
> Created attachment 125295 [details]
> Xorg.0.log file when trying to start Xorg after selecting nouveau.noaccel=
=3D1
> nouveau.nofbaccel=3D1

Fun. Looks like Xorg properly falls back to modesetting (yay), but then just
hangs there when trying to initialize glamor. No idea why.

I think there's some Xorg config option you can provide to avoid loading
glamor. Not sure what it is.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14693850391.aAF6aBd6.14151
Date: Sun, 24 Jul 2016 18:30:39 +0000
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
   title=3D"NEW - Blank screen when starting KMS on a GTX970 for kernel 4.6=
 series"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97066#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Blank screen when starting KMS on a GTX970 for kernel 4.6=
 series"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97066">bug 97066<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to smmilut from <a href=3D"show_bug.cgi?id=3D97066#c=
5">comment #5</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D125295" name=3D"attach_125295" title=3D"Xorg.0.log file when trying=
 to start Xorg after selecting nouveau.noaccel=3D1 nouveau.nofbaccel=3D1">a=
ttachment 125295</a> <a href=3D"attachment.cgi?id=3D125295&amp;action=3Dedi=
t" title=3D"Xorg.0.log file when trying to start Xorg after selecting nouve=
au.noaccel=3D1 nouveau.nofbaccel=3D1">[details]</a></span>
&gt; Xorg.0.log file when trying to start Xorg after selecting nouveau.noac=
cel=3D1
&gt; nouveau.nofbaccel=3D1</span >

Fun. Looks like Xorg properly falls back to modesetting (yay), but then just
hangs there when trying to initialize glamor. No idea why.

I think there's some Xorg config option you can provide to avoid loading
glamor. Not sure what it is.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14693850391.aAF6aBd6.14151--

--===============1771647128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1771647128==--
