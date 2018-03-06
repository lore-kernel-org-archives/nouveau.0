From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Tue, 06 Mar 2018 19:57:28 +0000
Message-ID: <bug-75985-8800-B31cfzI4of@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2002875976=="
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


--===============2002875976==
Content-Type: multipart/alternative; boundary="15203662486.59dEdBE.8267"
Content-Transfer-Encoding: 7bit


--15203662486.59dEdBE.8267
Date: Tue, 6 Mar 2018 19:57:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #56 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #53)
> (In reply to Lukas Wunner from comment #52)
> > Ilia, do you have definitive knowledge of GPUs which
> > a) have a different class than PCI_CLASS_DISPLAY_VGA and
> > b) have working DP/HDMI outputs and
> > c) have an integrated HDA controller?
> >=20
> > I'm asking because get_bound_vga() in sound/pci/hda/hda_intel.c specifi=
cally
> > matches against PCI_CLASS_DISPLAY_VGA only. In other words, if a GPU wi=
th
> > the three above-listed properties exists and is built into a hybrid gra=
phics
> > laptop, it is currently not registered with vga_switcheroo, which would=
 be
> > wrong.
>=20
> I can say with some certainty that there are laptops running around, esp
> GM107's, whose pci class is 3D, and that have attached DP/HDMI outputs.
>=20
> I don't think the users in question ever asked about audio, so I don't kn=
ow
> about the last bit. However I can't imagine that it wouldn't be there (esp
> once all the proper enablement is done).

In the meantime I've done extensive googling for dmesg output of a laptop t=
hat
satisfies all three conditions listed above, but I come back empty-handed. I
did find machines with a PCI_CLASS_DISPLAY_3D Nvidia card and an HDA device=
 on
function 1, but those weren't laptops. So it looks to me like we're good ri=
ght
now but we'll definitely need to amend hda_intel.c if we expose the HDA dev=
ice
on all modern cards.

> Is hda_intel only for intel?

No, that file contains the driver for all PCI HDA devices, its name is a
historic artifact.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15203662486.59dEdBE.8267
Date: Tue, 6 Mar 2018 19:57:28 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c56">Commen=
t # 56</a>
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
85#c53">comment #53</a>)
<span class=3D"quote">&gt; (In reply to Lukas Wunner from <a href=3D"show_b=
ug.cgi?id=3D75985#c52">comment #52</a>)
&gt; &gt; Ilia, do you have definitive knowledge of GPUs which
&gt; &gt; a) have a different class than PCI_CLASS_DISPLAY_VGA and
&gt; &gt; b) have working DP/HDMI outputs and
&gt; &gt; c) have an integrated HDA controller?
&gt; &gt;=20
&gt; &gt; I'm asking because get_bound_vga() in sound/pci/hda/hda_intel.c s=
pecifically
&gt; &gt; matches against PCI_CLASS_DISPLAY_VGA only. In other words, if a =
GPU with
&gt; &gt; the three above-listed properties exists and is built into a hybr=
id graphics
&gt; &gt; laptop, it is currently not registered with vga_switcheroo, which=
 would be
&gt; &gt; wrong.
&gt;=20
&gt; I can say with some certainty that there are laptops running around, e=
sp
&gt; GM107's, whose pci class is 3D, and that have attached DP/HDMI outputs.
&gt;=20
&gt; I don't think the users in question ever asked about audio, so I don't=
 know
&gt; about the last bit. However I can't imagine that it wouldn't be there =
(esp
&gt; once all the proper enablement is done).</span >

In the meantime I've done extensive googling for dmesg output of a laptop t=
hat
satisfies all three conditions listed above, but I come back empty-handed. I
did find machines with a PCI_CLASS_DISPLAY_3D Nvidia card and an HDA device=
 on
function 1, but those weren't laptops. So it looks to me like we're good ri=
ght
now but we'll definitely need to amend hda_intel.c if we expose the HDA dev=
ice
on all modern cards.

<span class=3D"quote">&gt; Is hda_intel only for intel?</span >

No, that file contains the driver for all PCI HDA devices, its name is a
historic artifact.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15203662486.59dEdBE.8267--

--===============2002875976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2002875976==--
