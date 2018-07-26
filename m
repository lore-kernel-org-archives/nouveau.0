From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107381] [NV117] Hang with 'fifo: write fault' and
 thousands of 'TRAP UNHANDLED 00000020'
Date: Thu, 26 Jul 2018 03:01:52 +0000
Message-ID: <bug-107381-8800-Dn08GAfk4e@http.bugs.freedesktop.org/>
References: <bug-107381-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0457585557=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107381-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0457585557==
Content-Type: multipart/alternative; boundary="15325741111.bF0C56.23314"
Content-Transfer-Encoding: 7bit


--15325741111.bF0C56.23314
Date: Thu, 26 Jul 2018 03:01:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107381

--- Comment #1 from Andrew <awillia2-1iWHkkKxmXRZroRs9YW3xA@public.gmane.org> ---
Created attachment 140816
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D140816&action=3Dedit
/var/log/syslog contents, edited to remove some duplicate messages

/var/log/syslog output.  To see the lines directly related to the issue, st=
art
from the bottom and scroll up

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15325741111.bF0C56.23314
Date: Thu, 26 Jul 2018 03:01:51 +0000
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
   title=3D"NEW - [NV117] Hang with 'fifo: write fault' and thousands of 'T=
RAP UNHANDLED 00000020'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107381#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV117] Hang with 'fifo: write fault' and thousands of 'T=
RAP UNHANDLED 00000020'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107381">bug 10738=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
awillia2&#64;sourcefire.com" title=3D"Andrew &lt;awillia2&#64;sourcefire.co=
m&gt;"> <span class=3D"fn">Andrew</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D140816=
" name=3D"attach_140816" title=3D"/var/log/syslog contents, edited to remov=
e some duplicate messages">attachment 140816</a> <a href=3D"attachment.cgi?=
id=3D140816&amp;action=3Dedit" title=3D"/var/log/syslog contents, edited to=
 remove some duplicate messages">[details]</a></span>
/var/log/syslog contents, edited to remove some duplicate messages

/var/log/syslog output.  To see the lines directly related to the issue, st=
art
from the bottom and scroll up</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15325741111.bF0C56.23314--

--===============0457585557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0457585557==--
