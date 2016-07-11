From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96802] Upgrading mesa from 11.0.6 -> 11.2.2 causes
 graphics deadlock
Date: Mon, 11 Jul 2016 22:21:19 +0000
Message-ID: <bug-96802-8800-HbZTpyT6sY@http.bugs.freedesktop.org/>
References: <bug-96802-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1317176150=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96802-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1317176150==
Content-Type: multipart/alternative; boundary="14682756780.5fC8Fc10A.3927";
 charset="UTF-8"


--14682756780.5fC8Fc10A.3927
Date: Mon, 11 Jul 2016 22:21:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96802

Ian Kumlien <ian.kumlien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #2 from Ian Kumlien <ian.kumlien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Just tested with 4.7-rc7 and mesa 12.0.1 - and the issue hasn't happened ye=
t -
it usually happened within seconds of logging in.

No errors reported in dmesg - I suspect that the issue is fixed now, sorry =
for
the noise.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14682756780.5fC8Fc10A.3927
Date: Mon, 11 Jul 2016 22:21:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:ian.kumli=
en&#64;gmail.com" title=3D"Ian Kumlien &lt;ian.kumlien&#64;gmail.com&gt;"> =
<span class=3D"fn">Ian Kumlien</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - Upgrading mesa from 11.0.6 -&gt; 11.2.2 c=
auses graphics deadlock"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96802">bug 96802<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>WORKSFORME
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - Upgrading mesa from 11.0.6 -&gt; 11.2.2 c=
auses graphics deadlock"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96802#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - Upgrading mesa from 11.0.6 -&gt; 11.2.2 c=
auses graphics deadlock"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96802">bug 96802<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ian.kumlien&#64;gmail.com" title=3D"Ian Kumlien &lt;ian.kumlien&#64;gmail.c=
om&gt;"> <span class=3D"fn">Ian Kumlien</span></a>
</span></b>
        <pre>Just tested with 4.7-rc7 and mesa 12.0.1 - and the issue hasn'=
t happened yet -
it usually happened within seconds of logging in.

No errors reported in dmesg - I suspect that the issue is fixed now, sorry =
for
the noise.</pre>
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

--14682756780.5fC8Fc10A.3927--

--===============1317176150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1317176150==--
