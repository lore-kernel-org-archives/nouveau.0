From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104222] GNOME/Wayland desktop freezes when resizing
 Firefox window
Date: Sun, 31 Dec 2017 23:31:07 +0000
Message-ID: <bug-104222-8800-u6z34faTt1@http.bugs.freedesktop.org/>
References: <bug-104222-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0765135163=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104222-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0765135163==
Content-Type: multipart/alternative; boundary="15147630673.0ec3BEC.24052";
 charset="UTF-8"


--15147630673.0ec3BEC.24052
Date: Sun, 31 Dec 2017 23:31:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104222

Alyosha Poroshnko <alyosha1-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 OS|All                         |Linux (All)
           Hardware|Other                       |x86-64 (AMD64)

--- Comment #5 from Alyosha Poroshnko <alyosha1-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org> ---
Always fails (EVERY SINGLE TIME window is resized):

journalctrl log of nouveau failure on resize FireFox window:

Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: Xwayland[5190=
]:
channel 20 killed!
Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: fifo: gr engi=
ne
fault on channel 20, recovering...
Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: fifo: read fa=
ult
at 0002727000 engine 00 [PGRAPH] client 04 [GPC0/] reason 02 [PAGE_NOT_PRES=
ENT]
on channel 20 [003f3aa000 Xwayland[5190]]
Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: gr:
GPC0/TPC1/TEX: 80000049
Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: gr:
GPC0/TPC0/TEX: 80000049
Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: gr: TRAP ch 20
[003f3aa000 Xwayland[5190]]
D

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15147630673.0ec3BEC.24052
Date: Sun, 31 Dec 2017 23:31:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:alyosha1&=
#64;protonmail.com" title=3D"Alyosha Poroshnko &lt;alyosha1&#64;protonmail.=
com&gt;"> <span class=3D"fn">Alyosha Poroshnko</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GNOME/Wayland desktop freezes when resizing Firefox windo=
w"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104222">bug 10422=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">OS</td>
           <td>All
           </td>
           <td>Linux (All)
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Hardware</td>
           <td>Other
           </td>
           <td>x86-64 (AMD64)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GNOME/Wayland desktop freezes when resizing Firefox windo=
w"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104222#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GNOME/Wayland desktop freezes when resizing Firefox windo=
w"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104222">bug 10422=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alyosha1&#64;protonmail.com" title=3D"Alyosha Poroshnko &lt;alyosha1&#64;pr=
otonmail.com&gt;"> <span class=3D"fn">Alyosha Poroshnko</span></a>
</span></b>
        <pre>Always fails (EVERY SINGLE TIME window is resized):

journalctrl log of nouveau failure on resize FireFox window:

Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: Xwayland[5190=
]:
channel 20 killed!
Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: fifo: gr engi=
ne
fault on channel 20, recovering...
Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: fifo: read fa=
ult
at 0002727000 engine 00 [PGRAPH] client 04 [GPC0/] reason 02 [PAGE_NOT_PRES=
ENT]
on channel 20 [003f3aa000 Xwayland[5190]]
Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: gr:
GPC0/TPC1/TEX: 80000049
Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: gr:
GPC0/TPC0/TEX: 80000049
Dec 31 08:16:06 US-D001.att.net kernel: nouveau 0000:03:00.0: gr: TRAP ch 20
[003f3aa000 Xwayland[5190]]
D</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15147630673.0ec3BEC.24052--

--===============0765135163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0765135163==--
