From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105884] [GP106] Firefox causes a crash / X lockup in
 the nouveau driver on GTX 1060
Date: Fri, 11 May 2018 14:24:16 +0000
Message-ID: <bug-105884-8800-rDUM0N0QWi@http.bugs.freedesktop.org/>
References: <bug-105884-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1775765447=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105884-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1775765447==
Content-Type: multipart/alternative; boundary="15260486560.e5201.26032"
Content-Transfer-Encoding: 7bit


--15260486560.e5201.26032
Date: Fri, 11 May 2018 14:24:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105884

--- Comment #8 from Artem S. Tashkinov <t.artem-VInPYn6yXxRWk0Htik3J/w@public.gmane.org> ---
This happens under 4.16 as well but a lot less frequently (maybe because I
switched to Google Chrome to watch youtube):

May 11 14:17:06 localhost kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040=
000
[PBENTRY] ch 9 [017ed17000 firefox[14167]] subc 0 mthd 0000 data 00000000
May 11 14:17:06 localhost kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040=
000
[PBENTRY] ch 9 [017ed17000 firefox[14167]] subc 0 mthd 0000 data 00000000
May 11 14:17:06 localhost kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040=
000
[PBENTRY] ch 9 [017ed17000 firefox[14167]] subc 0 mthd 0000 data 00000000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15260486560.e5201.26032
Date: Fri, 11 May 2018 14:24:16 +0000
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
   title=3D"NEW - [GP106] Firefox causes a crash / X lockup in the nouveau =
driver on GTX 1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105884#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GP106] Firefox causes a crash / X lockup in the nouveau =
driver on GTX 1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105884">bug 10588=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t.artem&#64;mailcity.com" title=3D"Artem S. Tashkinov &lt;t.artem&#64;mailc=
ity.com&gt;"> <span class=3D"fn">Artem S. Tashkinov</span></a>
</span></b>
        <pre>This happens under 4.16 as well but a lot less frequently (may=
be because I
switched to Google Chrome to watch youtube):

May 11 14:17:06 localhost kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040=
000
[PBENTRY] ch 9 [017ed17000 firefox[14167]] subc 0 mthd 0000 data 00000000
May 11 14:17:06 localhost kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040=
000
[PBENTRY] ch 9 [017ed17000 firefox[14167]] subc 0 mthd 0000 data 00000000
May 11 14:17:06 localhost kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040=
000
[PBENTRY] ch 9 [017ed17000 firefox[14167]] subc 0 mthd 0000 data 00000000</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15260486560.e5201.26032--

--===============1775765447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1775765447==--
