From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Wed, 02 Oct 2019 10:35:18 +0000
Message-ID: <bug-75985-8800-dL4lDsKJkf@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0664669255=="
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


--===============0664669255==
Content-Type: multipart/alternative; boundary="157001251810.2D4efb1f.30715"
Content-Transfer-Encoding: 7bit


--157001251810.2D4efb1f.30715
Date: Wed, 2 Oct 2019 10:35:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #95 from Maik Freudenberg <hhfeuer-Mmb7MZpHnFY@public.gmane.org> ---
This is very fresh, about 1 month old, context is that the latest nvidia 435
driver added support for render offload and driver controlled dynamic runti=
me
pm (turing only).
So I don't expect Nvidia to talk about bugs only existing in old kernel
versions.
It seems to me that the mentioned commit from the nvidia docs breaks runtim=
e-pm
on the nvhda device but the subsequent commit refered to by Przemys=C5=82aw=
 Kopa
doesn't fix it.
As to what "ongoing works on the audio driver" means, this is out of my
knowledge, would need to poke nvidia staff about it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157001251810.2D4efb1f.30715
Date: Wed, 2 Oct 2019 10:35:18 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c95">Commen=
t # 95</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hhfeuer&#64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> =
<span class=3D"fn">Maik Freudenberg</span></a>
</span></b>
        <pre>This is very fresh, about 1 month old, context is that the lat=
est nvidia 435
driver added support for render offload and driver controlled dynamic runti=
me
pm (turing only).
So I don't expect Nvidia to talk about bugs only existing in old kernel
versions.
It seems to me that the mentioned commit from the nvidia docs breaks runtim=
e-pm
on the nvhda device but the subsequent commit refered to by Przemys=C5=82aw=
 Kopa
doesn't fix it.
As to what &quot;ongoing works on the audio driver&quot; means, this is out=
 of my
knowledge, would need to poke nvidia staff about it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157001251810.2D4efb1f.30715--

--===============0664669255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0664669255==--
