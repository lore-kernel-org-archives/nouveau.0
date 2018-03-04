From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sun, 04 Mar 2018 12:47:50 +0000
Message-ID: <bug-75985-8800-lnvyi2jMTM@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1846922786=="
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


--===============1846922786==
Content-Type: multipart/alternative; boundary="15201676712.CA3dD.22057"
Content-Transfer-Encoding: 7bit


--15201676712.CA3dD.22057
Date: Sun, 4 Mar 2018 12:47:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #52 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #49)
> (In reply to Maik Freudenberg from comment #47)
> > There's of course the possibility that some braindead vendor would ship=
 a 3D
> > class tagged device actually having outputs.
>=20
> This happens. A lot.

Ilia, do you have definitive knowledge of GPUs which
a) have a different class than PCI_CLASS_DISPLAY_VGA and
b) have working DP/HDMI outputs and
c) have an integrated HDA controller?

I'm asking because get_bound_vga() in sound/pci/hda/hda_intel.c specifically
matches against PCI_CLASS_DISPLAY_VGA only. In other words, if a GPU with t=
he
three above-listed properties exists and is built into a hybrid graphics
laptop, it is currently not registered with vga_switcheroo, which would be
wrong.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15201676712.CA3dD.22057
Date: Sun, 4 Mar 2018 12:47:51 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c52">Commen=
t # 52</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D759=
85#c49">comment #49</a>)
<span class=3D"quote">&gt; (In reply to Maik Freudenberg from <a href=3D"sh=
ow_bug.cgi?id=3D75985#c47">comment #47</a>)
&gt; &gt; There's of course the possibility that some braindead vendor woul=
d ship a 3D
&gt; &gt; class tagged device actually having outputs.
&gt;=20
&gt; This happens. A lot.</span >

Ilia, do you have definitive knowledge of GPUs which
a) have a different class than PCI_CLASS_DISPLAY_VGA and
b) have working DP/HDMI outputs and
c) have an integrated HDA controller?

I'm asking because get_bound_vga() in sound/pci/hda/hda_intel.c specifically
matches against PCI_CLASS_DISPLAY_VGA only. In other words, if a GPU with t=
he
three above-listed properties exists and is built into a hybrid graphics
laptop, it is currently not registered with vga_switcheroo, which would be
wrong.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15201676712.CA3dD.22057--

--===============1846922786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1846922786==--
