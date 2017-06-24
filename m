From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101573] GP107 crash with no HDMI connected on
	4.12.rc6
Date: Sat, 24 Jun 2017 15:55:01 +0000
Message-ID: <bug-101573-8800-2s0Fyywaid@http.bugs.freedesktop.org/>
References: <bug-101573-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1423156558=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101573-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1423156558==
Content-Type: multipart/alternative; boundary="14983197011.8ff7A.14728";
 charset="UTF-8"


--14983197011.8ff7A.14728
Date: Sat, 24 Jun 2017 15:55:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101573

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to harry_x from comment #5)
> But if there is anything how can I help with
> debugging of this problem, I would be happy to help.

Join us in #nouveau on irc.freenode.net. Unfortunately with these newer boa=
rds,
we understand very little about their initialization, esp wrt secboot.

> I am not sure it is the same issue regarding PCI bus, I can see the device
> normally in lspci -vv, but I don't know if that means anything...

Yeah, it's clearly a different issue. Just seemed a little reminiscent --
without HDMI plugged in, gr init times out because it feels like the GPU is
semi-off.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14983197011.8ff7A.14728
Date: Sat, 24 Jun 2017 15:55:01 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - GP107 crash with no HDMI connected on 4.12=
.rc6"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101573#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - GP107 crash with no HDMI connected on 4.12=
.rc6"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101573">bug 10157=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to harry_x from <a href=3D"show_bug.cgi?id=3D101573#=
c5">comment #5</a>)
<span class=3D"quote">&gt; But if there is anything how can I help with
&gt; debugging of this problem, I would be happy to help.</span >

Join us in #nouveau on irc.freenode.net. Unfortunately with these newer boa=
rds,
we understand very little about their initialization, esp wrt secboot.

<span class=3D"quote">&gt; I am not sure it is the same issue regarding PCI=
 bus, I can see the device
&gt; normally in lspci -vv, but I don't know if that means anything...</spa=
n >

Yeah, it's clearly a different issue. Just seemed a little reminiscent --
without HDMI plugged in, gr init times out because it feels like the GPU is
semi-off.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14983197011.8ff7A.14728--

--===============1423156558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1423156558==--
