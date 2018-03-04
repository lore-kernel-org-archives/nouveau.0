From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sun, 04 Mar 2018 10:23:38 +0000
Message-ID: <bug-75985-8800-zMjmOqPLjt@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0928086914=="
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


--===============0928086914==
Content-Type: multipart/alternative; boundary="15201590184.5E0B.32221"
Content-Transfer-Encoding: 7bit


--15201590184.5E0B.32221
Date: Sun, 4 Mar 2018 10:23:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #50 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Denis Lisov from comment #45)
> (In reply to Lukas Wunner from comment #37)
> > Related to this issue, I've just posted v2 of my patch set to use a dev=
ice
> > link for power management of GPU-integrated HDA controllers:
> > https://lists.freedesktop.org/archives/dri-devel/2018-March/168012.html
> >=20
> > It would be great if more people could test it. There's a 4.15-based br=
anch
> > available at:
> > https://github.com/l1k/linux/commits/switcheroo_devlink_v2
>=20
> Tested these patches on Lenovo Thinkpad P50. Audio works, the HDA and GPU
> suspend when unused with no errors in logs and resume when needed.
> HDA unbind/bind worked with no errors, some "Too big adjustment {128,384}"
> messages in dmesg.

Thank you, this helps greatly. I'll add your Tested-by to the commits so th=
at
you get credit for your testing efforts.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15201590184.5E0B.32221
Date: Sun, 4 Mar 2018 10:23:38 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c50">Commen=
t # 50</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Denis Lisov from <a href=3D"show_bug.cgi?id=3D759=
85#c45">comment #45</a>)
<span class=3D"quote">&gt; (In reply to Lukas Wunner from <a href=3D"show_b=
ug.cgi?id=3D75985#c37">comment #37</a>)
&gt; &gt; Related to this issue, I've just posted v2 of my patch set to use=
 a device
&gt; &gt; link for power management of GPU-integrated HDA controllers:
&gt; &gt; <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2018-=
March/168012.html">https://lists.freedesktop.org/archives/dri-devel/2018-Ma=
rch/168012.html</a>
&gt; &gt;=20
&gt; &gt; It would be great if more people could test it. There's a 4.15-ba=
sed branch
&gt; &gt; available at:
&gt; &gt; <a href=3D"https://github.com/l1k/linux/commits/switcheroo_devlin=
k_v2">https://github.com/l1k/linux/commits/switcheroo_devlink_v2</a>
&gt;=20
&gt; Tested these patches on Lenovo Thinkpad P50. Audio works, the HDA and =
GPU
&gt; suspend when unused with no errors in logs and resume when needed.
&gt; HDA unbind/bind worked with no errors, some &quot;Too big adjustment {=
128,384}&quot;
&gt; messages in dmesg.</span >

Thank you, this helps greatly. I'll add your Tested-by to the commits so th=
at
you get credit for your testing efforts.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15201590184.5E0B.32221--

--===============0928086914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0928086914==--
