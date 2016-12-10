From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98039] KMail crash on starting (nouveau-related)
Date: Sat, 10 Dec 2016 15:27:28 +0000
Message-ID: <bug-98039-8800-pQDsjcBHUs@http.bugs.freedesktop.org/>
References: <bug-98039-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1686572384=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98039-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1686572384==
Content-Type: multipart/alternative; boundary="14813836482.c44Af35.31033";
 charset="UTF-8"


--14813836482.c44Af35.31033
Date: Sat, 10 Dec 2016 15:27:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98039

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |NEW
           Severity|critical                    |normal
           Priority|high                        |medium
           Assignee|imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org        |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |                            |rg

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Tomasz Pawe=C5=82 Gajc from comment #4)
> Ilia any chance you can merge these locking patches into main mesa tree ?
>=20
> Things are getting worse...

Nope - none. Those patches are broken-by-design for the general case. Either
don't use nouveau_dri.so or don't use [recent versions of] KDE.

I've heard some rumors that there's some sort of env var that'll disable GL=
 use
by KDE. Or maybe tell it not to run when it detects nouveau. I don't know t=
he
details.

I believe there's an effort underway to address this, but not from me.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14813836482.c44Af35.31033
Date: Sat, 10 Dec 2016 15:27:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">bug 98039<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>ASSIGNED
           </td>
           <td>NEW
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Severity</td>
           <td>critical
           </td>
           <td>normal
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>high
           </td>
           <td>medium
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>imirkin&#64;alum.mit.edu
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">bug 98039<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Tomasz Pawe=C5=82 Gajc from <a href=3D"show_bug.c=
gi?id=3D98039#c4">comment #4</a>)
<span class=3D"quote">&gt; Ilia any chance you can merge these locking patc=
hes into main mesa tree ?
&gt;=20
&gt; Things are getting worse...</span >

Nope - none. Those patches are broken-by-design for the general case. Either
don't use nouveau_dri.so or don't use [recent versions of] KDE.

I've heard some rumors that there's some sort of env var that'll disable GL=
 use
by KDE. Or maybe tell it not to run when it detects nouveau. I don't know t=
he
details.

I believe there's an effort underway to address this, but not from me.</pre>
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

--14813836482.c44Af35.31033--

--===============1686572384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1686572384==--
