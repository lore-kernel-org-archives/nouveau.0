From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Sat, 10 Dec 2016 12:33:49 +0000
Message-ID: <bug-92077-8800-lqNIGAzSjf@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1152204555=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92077-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1152204555==
Content-Type: multipart/alternative; boundary="14813732292.2EdfEAE07.20742";
 charset="UTF-8"


--14813732292.2EdfEAE07.20742
Date: Sat, 10 Dec 2016 12:33:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92077

Tomasz Pawe=C5=82 Gajc <tpgxyz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|10.3                        |13.0

--- Comment #25 from Tomasz Pawe=C5=82 Gajc <tpgxyz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This issue still exists with latest x11-server 1.19.0 and Mesa 13.0.2 and
Plasma 5.8.4

I got this in logs:

gru 10 13:31:37 lazur kernel: nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 17
[plasmashell[8353]] get 0020117b08 put 0020129744 ib_get 00000059 ib_put
0000005a state 80007088 (err: INVALID_CMD) push 00406040
gru 10 13:31:40 lazur PackageKit[4860]: get-updates transaction /1645_dbadb=
bda
from uid 1001 finished with success after 3316ms
gru 10 13:31:41 lazur systemd-coredump[8355]: Failed to generate stack trac=
e:
(null)
gru 10 13:31:41 lazur systemd-coredump[8355]: Process 8306 (plasmashell) of
user 1001 dumped core.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14813732292.2EdfEAE07.20742
Date: Sat, 10 Dec 2016 12:33:49 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:tpgxyz&#6=
4;gmail.com" title=3D"Tomasz Pawe=C5=82 Gajc &lt;tpgxyz&#64;gmail.com&gt;">=
 <span class=3D"fn">Tomasz Pawe=C5=82 Gajc</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engi=
ne fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92077">bug 92077<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Version</td>
           <td>10.3
           </td>
           <td>13.0
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engi=
ne fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92077#c25">Commen=
t # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engi=
ne fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92077">bug 92077<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tpgxyz&#64;gmail.com" title=3D"Tomasz Pawe=C5=82 Gajc &lt;tpgxyz&#64;gmail.=
com&gt;"> <span class=3D"fn">Tomasz Pawe=C5=82 Gajc</span></a>
</span></b>
        <pre>This issue still exists with latest x11-server 1.19.0 and Mesa=
 13.0.2 and
Plasma 5.8.4

I got this in logs:

gru 10 13:31:37 lazur kernel: nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 17
[plasmashell[8353]] get 0020117b08 put 0020129744 ib_get 00000059 ib_put
0000005a state 80007088 (err: INVALID_CMD) push 00406040
gru 10 13:31:40 lazur PackageKit[4860]: get-updates transaction /1645_dbadb=
bda
from uid 1001 finished with success after 3316ms
gru 10 13:31:41 lazur systemd-coredump[8355]: Failed to generate stack trac=
e:
(null)
gru 10 13:31:41 lazur systemd-coredump[8355]: Process 8306 (plasmashell) of
user 1001 dumped core.</pre>
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

--14813732292.2EdfEAE07.20742--

--===============1152204555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1152204555==--
