From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101587] [BISECTED][REGRESSION] Nouveau kernel module
 (>4.10) on NVA8 renders the system unusable
Date: Mon, 26 Jun 2017 11:21:09 +0000
Message-ID: <bug-101587-8800-z67yOXIgTy@http.bugs.freedesktop.org/>
References: <bug-101587-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1807101699=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101587-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1807101699==
Content-Type: multipart/alternative; boundary="14984760691.EfEE2.1648";
 charset="UTF-8"


--14984760691.EfEE2.1648
Date: Mon, 26 Jun 2017 11:21:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101587

Daniel Otero <otero.o.daniel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           See Also|                            |https://bugs.freedesktop.or
                   |                            |g/show_bug.cgi?id=3D101368

--- Comment #2 from Daniel Otero <otero.o.daniel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I just find out what it seems to be a previous report of this bug=20
(https://bugs.freedesktop.org/show_bug.cgi?id=3D101368).

But because it doesn't have a clear fix, I'm not sure is the same.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14984760691.EfEE2.1648
Date: Mon, 26 Jun 2017 11:21:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:otero.o.d=
aniel&#64;gmail.com" title=3D"Daniel Otero &lt;otero.o.daniel&#64;gmail.com=
&gt;"> <span class=3D"fn">Daniel Otero</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [BISECTED][REGRESSION] Nouveau kernel module (&gt;4.10) o=
n NVA8 renders the system unusable"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101587">bug 10158=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">See Also</td>
           <td>
               &nbsp;
           </td>
           <td>https://bugs.freedesktop.org/show_bug.cgi?id=3D101368
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [BISECTED][REGRESSION] Nouveau kernel module (&gt;4.10) o=
n NVA8 renders the system unusable"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101587#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [BISECTED][REGRESSION] Nouveau kernel module (&gt;4.10) o=
n NVA8 renders the system unusable"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101587">bug 10158=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
otero.o.daniel&#64;gmail.com" title=3D"Daniel Otero &lt;otero.o.daniel&#64;=
gmail.com&gt;"> <span class=3D"fn">Daniel Otero</span></a>
</span></b>
        <pre>I just find out what it seems to be a previous report of this =
bug=20
(<a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Nouveau regression GT218M in Kernel 4.11 Won't=
 Boot"
   href=3D"show_bug.cgi?id=3D101368">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D101368</a>).

But because it doesn't have a clear fix, I'm not sure is the same.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14984760691.EfEE2.1648--

--===============1807101699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1807101699==--
