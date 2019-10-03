From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Thu, 03 Oct 2019 08:22:59 +0000
Message-ID: <bug-75985-8800-KgCoUXVip4@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0266022603=="
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


--===============0266022603==
Content-Type: multipart/alternative; boundary="15700909797.E6c3.6551"
Content-Transfer-Encoding: 7bit


--15700909797.E6c3.6551
Date: Thu, 3 Oct 2019 08:22:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #104 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Daniel Drake from comment #102)
> Thanks. azx_runtime_idle() is returning EBUSY because
> azx_bus(chip)->codec_powered=3D0xf.
>=20
> codec_powered is set during initialization via snd_hdac_bus_add_device(),
> presumably to reflect that the device is definitely powered up at
> initialization time.
>=20
> It's unset during hdac_hdmi_runtime_suspend() (and/or during
> hda_codec_runtime_suspend()) via the call to snd_hdac_codec_link_down().
>=20
> I guess this implies that the HDA codec (hdac_hdmi.c) is expected to be
> fully runtime suspended before the controller (hda_intel.c) runtime idle
> check is executed, and that this is not happening.

Right. However codec_powered is a bitmask and the position in the bitmask is
the "addr" member of struct hdac_device. We can see from the dmesg output t=
hat
there are four devices C1D0 .. C1D3. So only bits 0 .. 3 in codec_powered
should ever be set. How can it be that bit 15 (0xf) is set?

I'll see to it that I prepare another debug patch today to instrument all t=
he
places where codec_powered is changed with printk's. But my suspicion is th=
at
the bit may be set differently.  E.g. codec_mask is immediately preceding
codec_powered in the struct (assuming gcc doesn't change the order of the
members). If we happen to set a bit > 64 in codec_mask, we may inadvertantly
clobber codec_powered. So I'll try to instrument changes to surrounding mem=
bers
as well.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15700909797.E6c3.6551
Date: Thu, 3 Oct 2019 08:22:59 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c104">Comme=
nt # 104</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Daniel Drake from <a href=3D"show_bug.cgi?id=3D75=
985#c102">comment #102</a>)
<span class=3D"quote">&gt; Thanks. azx_runtime_idle() is returning EBUSY be=
cause
&gt; azx_bus(chip)-&gt;codec_powered=3D0xf.
&gt;=20
&gt; codec_powered is set during initialization via snd_hdac_bus_add_device=
(),
&gt; presumably to reflect that the device is definitely powered up at
&gt; initialization time.
&gt;=20
&gt; It's unset during hdac_hdmi_runtime_suspend() (and/or during
&gt; hda_codec_runtime_suspend()) via the call to snd_hdac_codec_link_down(=
).
&gt;=20
&gt; I guess this implies that the HDA codec (hdac_hdmi.c) is expected to be
&gt; fully runtime suspended before the controller (hda_intel.c) runtime id=
le
&gt; check is executed, and that this is not happening.</span >

Right. However codec_powered is a bitmask and the position in the bitmask is
the &quot;addr&quot; member of struct hdac_device. We can see from the dmes=
g output that
there are four devices C1D0 .. C1D3. So only bits 0 .. 3 in codec_powered
should ever be set. How can it be that bit 15 (0xf) is set?

I'll see to it that I prepare another debug patch today to instrument all t=
he
places where codec_powered is changed with printk's. But my suspicion is th=
at
the bit may be set differently.  E.g. codec_mask is immediately preceding
codec_powered in the struct (assuming gcc doesn't change the order of the
members). If we happen to set a bit &gt; 64 in codec_mask, we may inadverta=
ntly
clobber codec_powered. So I'll try to instrument changes to surrounding mem=
bers
as well.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15700909797.E6c3.6551--

--===============0266022603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0266022603==--
