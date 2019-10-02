From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Wed, 02 Oct 2019 08:35:21 +0000
Message-ID: <bug-75985-8800-WaI7pFkrt1@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1841535014=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1841535014==
Content-Type: multipart/alternative; boundary="15700053224.343AA2A44.7485"
Content-Transfer-Encoding: 7bit


--15700053224.343AA2A44.7485
Date: Wed, 2 Oct 2019 08:35:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #89 from Maik Freudenberg <hhfeuer-Mmb7MZpHnFY@public.gmane.org> ---
I didn't follow all of this, but I suspect you're hitting a known bug, plea=
se
see
http://download.nvidia.com/XFree86/Linux-x86_64/435.17/README/dynamicpowerm=
anagement.html#KnownIssuesAndW6426e

> 2. There is a known issue with the audio driver due to which the audio PC=
I function remains in an active state from the kernel version 4.19 and up. =
(from commit id: 37a3a98ef601f89100e3bb657fb0e190b857028c). Upstream kernel=
 changes are being done to fix the issue. In the interim, the Audio PCI fun=
ction needs to be disabled by using the following command.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15700053224.343AA2A44.7485
Date: Wed, 2 Oct 2019 08:35:22 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c89">Commen=
t # 89</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hhfeuer&#64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> =
<span class=3D"fn">Maik Freudenberg</span></a>
</span></b>
        <pre>I didn't follow all of this, but I suspect you're hitting a kn=
own bug, please
see
<a href=3D"http://download.nvidia.com/XFree86/Linux-x86_64/435.17/README/dy=
namicpowermanagement.html#KnownIssuesAndW6426e">http://download.nvidia.com/=
XFree86/Linux-x86_64/435.17/README/dynamicpowermanagement.html#KnownIssuesA=
ndW6426e</a>

<span class=3D"quote">&gt; 2. There is a known issue with the audio driver =
due to which the audio PCI function remains in an active state from the ker=
nel version 4.19 and up. (from commit id: 37a3a98ef601f89100e3bb657fb0e190b=
857028c). Upstream kernel changes are being done to fix the issue. In the i=
nterim, the Audio PCI function needs to be disabled by using the following =
command.</span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15700053224.343AA2A44.7485--

--===============1841535014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1841535014==--
