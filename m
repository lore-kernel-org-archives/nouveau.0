From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93300] Two Worlds 2 renders water incorrectly
Date: Tue, 08 Dec 2015 20:36:02 +0000
Message-ID: <bug-93300-8800-NyGhFRv4d9@http.bugs.freedesktop.org/>
References: <bug-93300-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1718358727=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93300-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1718358727==
Content-Type: multipart/alternative; boundary="1449606962.2ac34bf2.10692"; charset="UTF-8"


--1449606962.2ac34bf2.10692
Date: Tue, 8 Dec 2015 20:36:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D93300

B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #3 from B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #1)
> Thanks for testing :) I find it difficult to believe that NV50_PROG_OPTIM=
IZE=3D0 > wouldn't fix the issue -- probably you just don't have a debug me=
sa build.

Yes indeed, disabling optimizations works around the problem with a debug b=
uild
(originally I tested with a non-debug Mesa build).

(In reply to Ilia Mirkin from comment #2)
> Created attachment 120418 [details] [review]
> potential patch
>=20
> Does the attached patch help? If so I'll put something a bit more generic
> together.

The patch fixes the problem, thank you.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1449606962.2ac34bf2.10692
Date: Tue, 8 Dec 2015 20:36:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:gyebro69&=
#64;gmail.com" title=3D"B=C3=A9la Gyebr=C3=B3szki &lt;gyebro69&#64;gmail.co=
m&gt;"> <span class=3D"fn">B=C3=A9la Gyebr=C3=B3szki</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Two Worlds 2 renders water incorrectly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93300">bug 93300<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>gyebro69&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Two Worlds 2 renders water incorrectly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93300#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Two Worlds 2 renders water incorrectly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93300">bug 93300<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gyebro69&#64;gmail.com" title=3D"B=C3=A9la Gyebr=C3=B3szki &lt;gyebro69&#64=
;gmail.com&gt;"> <span class=3D"fn">B=C3=A9la Gyebr=C3=B3szki</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D933=
00#c1">comment #1</a>)
<span class=3D"quote">&gt; Thanks for testing :) I find it difficult to bel=
ieve that NV50_PROG_OPTIMIZE=3D0 &gt; wouldn't fix the issue -- probably yo=
u just don't have a debug mesa build.</span >

Yes indeed, disabling optimizations works around the problem with a debug b=
uild
(originally I tested with a non-debug Mesa build).

(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D93300#c2">commen=
t #2</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D120418" name=3D"attach_120418" title=3D"potential patch">attachment=
 120418</a> <a href=3D"attachment.cgi?id=3D120418&amp;action=3Dedit" title=
=3D"potential patch">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter=
.html&amp;bug=3D93300&amp;attachment=3D120418'>[review]</a> [review]
&gt; potential patch
&gt;=20
&gt; Does the attached patch help? If so I'll put something a bit more gene=
ric
&gt; together.</span >

The patch fixes the problem, thank you.</pre>
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

--1449606962.2ac34bf2.10692--

--===============1718358727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1718358727==--
