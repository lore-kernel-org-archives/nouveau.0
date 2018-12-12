From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108980] GF117: MMIO write of 0000001f FAULT at
 6013d4 [ IBUS ]
Date: Wed, 12 Dec 2018 02:43:08 +0000
Message-ID: <bug-108980-8800-6RZcXRo99B@http.bugs.freedesktop.org/>
References: <bug-108980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1124652673=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1124652673==
Content-Type: multipart/alternative; boundary="15445825881.28171.28676"
Content-Transfer-Encoding: 7bit


--15445825881.28171.28676
Date: Wed, 12 Dec 2018 02:43:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108980

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 142783
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D142783&action=3Dedit
avoid touching falcon registers on fini

See what triggers this next. (Keep your lockvga patch in place too. Still
working on that one.)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15445825881.28171.28676
Date: Wed, 12 Dec 2018 02:43:08 +0000
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
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980">bug 10898=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D142783=
" name=3D"attach_142783" title=3D"avoid touching falcon registers on fini">=
attachment 142783</a> <a href=3D"attachment.cgi?id=3D142783&amp;action=3Ded=
it" title=3D"avoid touching falcon registers on fini">[details]</a></span> =
<a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D108980&amp;attachment=3D14=
2783'>[review]</a>
avoid touching falcon registers on fini

See what triggers this next. (Keep your lockvga patch in place too. Still
working on that one.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15445825881.28171.28676--

--===============1124652673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1124652673==--
