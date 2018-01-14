From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104621] Nouveau prevents booting on Pascal Gpu
Date: Sun, 14 Jan 2018 14:52:34 +0000
Message-ID: <bug-104621-8800-DhXQX8nmnc@http.bugs.freedesktop.org/>
References: <bug-104621-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0691161187=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104621-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0691161187==
Content-Type: multipart/alternative; boundary="15159415552.74c5cba8.16572"
Content-Transfer-Encoding: 7bit


--15159415552.74c5cba8.16572
Date: Sun, 14 Jan 2018 14:52:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104621

Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                   |rg                          |
           See Also|                            |https://bugs.freedesktop.or
                   |                            |g/show_bug.cgi?id=3D100228,
                   |                            |https://bugs.freedesktop.or
                   |                            |g/show_bug.cgi?id=3D101665,
                   |                            |https://bugs.freedesktop.or
                   |                            |g/show_bug.cgi?id=3D101220,
                   |                            |https://bugs.freedesktop.or
                   |                            |g/show_bug.cgi?id=3D104421
            Product|Mesa                        |xorg
          Component|Drivers/DRI/nouveau         |Driver/nouveau
            Version|17.3                        |unspecified

--- Comment #1 from Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This initially sounds similar to other reports of Pascal-family GPU issues,=
 for
example:

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228
https://bugs.freedesktop.org/show_bug.cgi?id=3D101665
https://bugs.freedesktop.org/show_bug.cgi?id=3D101220
https://bugs.freedesktop.org/show_bug.cgi?id=3D104421


What version of the kernel are you using? Upstream v4.14 (and soon to be
released v4.15) have some improvements that should benefit you. Can you also
provide the exact error text that you see.

You do mention that "setting nomodeset" doesn't improve things. This is
interesting as it does indicate you may be seeing a different issue here.

Can you try with "nouveau.runpm=3D0" as a diagnostic step. This may let you=
 boot,
although power usage would be increased.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15159415552.74c5cba8.16572
Date: Sun, 14 Jan 2018 14:52:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:rhyskidd&=
#64;gmail.com" title=3D"Rhys Kidd &lt;rhyskidd&#64;gmail.com&gt;"> <span cl=
ass=3D"fn">Rhys Kidd</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau prevents booting on Pascal Gpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104621">bug 10462=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>xorg-team&#64;lists.x.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">See Also</td>
           <td>
               &nbsp;
           </td>
           <td>https://bugs.freedesktop.org/show_bug.cgi?id=3D100228, https=
://bugs.freedesktop.org/show_bug.cgi?id=3D101665, https://bugs.freedesktop.=
org/show_bug.cgi?id=3D101220, https://bugs.freedesktop.org/show_bug.cgi?id=
=3D104421
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Product</td>
           <td>Mesa
           </td>
           <td>xorg
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Drivers/DRI/nouveau
           </td>
           <td>Driver/nouveau
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Version</td>
           <td>17.3
           </td>
           <td>unspecified
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau prevents booting on Pascal Gpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104621#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau prevents booting on Pascal Gpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104621">bug 10462=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rhyskidd&#64;gmail.com" title=3D"Rhys Kidd &lt;rhyskidd&#64;gmail.com&gt;">=
 <span class=3D"fn">Rhys Kidd</span></a>
</span></b>
        <pre>This initially sounds similar to other reports of Pascal-famil=
y GPU issues, for
example:

<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"show_bug.cgi?id=3D100228">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D100228</a>
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - lspci blocks forever with a GP107M"
   href=3D"show_bug.cgi?id=3D101665">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D101665</a>
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137/GP107] xorg-server-1.19.3 crashes when trying to e=
nable HDMI output"
   href=3D"show_bug.cgi?id=3D101220">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D101220</a>
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107)"
   href=3D"show_bug.cgi?id=3D104421">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D104421</a>


What version of the kernel are you using? Upstream v4.14 (and soon to be
released v4.15) have some improvements that should benefit you. Can you also
provide the exact error text that you see.

You do mention that &quot;setting nomodeset&quot; doesn't improve things. T=
his is
interesting as it does indicate you may be seeing a different issue here.

Can you try with &quot;nouveau.runpm=3D0&quot; as a diagnostic step. This m=
ay let you boot,
although power usage would be increased.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15159415552.74c5cba8.16572--

--===============0691161187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0691161187==--
