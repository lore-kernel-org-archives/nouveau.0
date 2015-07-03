From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91170] World of Zoo (in Wine) has rendering issues
Date: Fri, 03 Jul 2015 03:04:22 +0000
Message-ID: <bug-91170-8800-rnm8GSkznA@http.bugs.freedesktop.org/>
References: <bug-91170-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1956733088=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91170-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1956733088==
Content-Type: multipart/alternative; boundary="1435892662.73AABc0.21833"; charset="UTF-8"


--1435892662.73AABc0.21833
Date: Fri, 3 Jul 2015 03:04:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91170

--- Comment #5 from B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)
> Created attachment 116899 [details] [review]
> bs fix
>=20
> Ugh, the buffer-update-is-in-progress issue strikes again! I fixed this a=
ges
> ago, but it's back. [The first hunk of this patch is unrelated, but it al=
so
> won't hurt.]
>=20
> So now to figure out why it's not fencing properly.

The patch fixes the problem here as well.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435892662.73AABc0.21833
Date: Fri, 3 Jul 2015 03:04:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - World of Zoo (in Wine) has rendering issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91170#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - World of Zoo (in Wine) has rendering issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91170">bug 91170<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gyebro69&#64;gmail.com" title=3D"B=C3=A9la Gyebr=C3=B3szki &lt;gyebro69&#64=
;gmail.com&gt;"> <span class=3D"fn">B=C3=A9la Gyebr=C3=B3szki</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D911=
70#c4">comment #4</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D116899" name=3D"attach_116899" title=3D"bs fix">attachment 116899</=
a> <a href=3D"attachment.cgi?id=3D116899&amp;action=3Dedit" title=3D"bs fix=
">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D911=
70&amp;attachment=3D116899'>[review]</a> [review]
&gt; bs fix
&gt;=20
&gt; Ugh, the buffer-update-is-in-progress issue strikes again! I fixed thi=
s ages
&gt; ago, but it's back. [The first hunk of this patch is unrelated, but it=
 also
&gt; won't hurt.]
&gt;=20
&gt; So now to figure out why it's not fencing properly.</span >

The patch fixes the problem here as well.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435892662.73AABc0.21833--

--===============1956733088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1956733088==--
