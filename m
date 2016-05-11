From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95351] lockup on kde startup
Date: Wed, 11 May 2016 14:11:26 +0000
Message-ID: <bug-95351-8800-zuo8no1S3S@http.bugs.freedesktop.org/>
References: <bug-95351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1216972730=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95351-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1216972730==
Content-Type: multipart/alternative; boundary="14629758860.0EA2.23811";
 charset="UTF-8"


--14629758860.0EA2.23811
Date: Wed, 11 May 2016 14:11:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95351

--- Comment #2 from Roy <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org> ---
(In reply to Martin Bednar from comment #1)
> Created attachment 123620 [details]
> dmesg grepped for nouveau on kernel 4.5.2
>=20
> Tried newer kernel (4.5.2), still happens.

Would you mind posting the full log rather than filtering/grepping through?
Some of the backtrace has gone missing, and it'd be good to see other event=
s in
the system just for reference.
Thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14629758860.0EA2.23811
Date: Wed, 11 May 2016 14:11:26 +0000
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
   title=3D"NEW - lockup on kde startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95351#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - lockup on kde startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95351">bug 95351<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rspliet&#64;eclipso.eu" title=3D"Roy &lt;rspliet&#64;eclipso.eu&gt;"> <span=
 class=3D"fn">Roy</span></a>
</span></b>
        <pre>(In reply to Martin Bednar from <a href=3D"show_bug.cgi?id=3D9=
5351#c1">comment #1</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D123620" name=3D"attach_123620" title=3D"dmesg grepped for nouveau o=
n kernel 4.5.2">attachment 123620</a> <a href=3D"attachment.cgi?id=3D123620=
&amp;action=3Dedit" title=3D"dmesg grepped for nouveau on kernel 4.5.2">[de=
tails]</a></span>
&gt; dmesg grepped for nouveau on kernel 4.5.2
&gt;=20
&gt; Tried newer kernel (4.5.2), still happens.</span >

Would you mind posting the full log rather than filtering/grepping through?
Some of the backtrace has gone missing, and it'd be good to see other event=
s in
the system just for reference.
Thanks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14629758860.0EA2.23811--

--===============1216972730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1216972730==--
