From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sun, 04 Mar 2018 17:28:09 +0000
Message-ID: <bug-75985-8800-F4l1Lao1bd@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0575158534=="
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


--===============0575158534==
Content-Type: multipart/alternative; boundary="15201844895.1Ddac.3250"
Content-Transfer-Encoding: 7bit


--15201844895.1Ddac.3250
Date: Sun, 4 Mar 2018 17:28:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #53 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Lukas Wunner from comment #52)
> (In reply to Ilia Mirkin from comment #49)
> > (In reply to Maik Freudenberg from comment #47)
> > > There's of course the possibility that some braindead vendor would sh=
ip a 3D
> > > class tagged device actually having outputs.
> >=20
> > This happens. A lot.
>=20
> Ilia, do you have definitive knowledge of GPUs which
> a) have a different class than PCI_CLASS_DISPLAY_VGA and
> b) have working DP/HDMI outputs and
> c) have an integrated HDA controller?
>=20
> I'm asking because get_bound_vga() in sound/pci/hda/hda_intel.c specifica=
lly
> matches against PCI_CLASS_DISPLAY_VGA only. In other words, if a GPU with
> the three above-listed properties exists and is built into a hybrid graph=
ics
> laptop, it is currently not registered with vga_switcheroo, which would be
> wrong.

I can say with some certainty that there are laptops running around, esp
GM107's, whose pci class is 3D, and that have attached DP/HDMI outputs.

I don't think the users in question ever asked about audio, so I don't know
about the last bit. However I can't imagine that it wouldn't be there (esp =
once
all the proper enablement is done).

Is hda_intel only for intel? If so, I'm pretty sure that all intel vga devi=
ces
are PCI_CLASS_DISPLAY_VGA. However if it's used for everything, then it nee=
ds
to deal with DISPLAY_3D as well.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15201844895.1Ddac.3250
Date: Sun, 4 Mar 2018 17:28:09 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c53">Commen=
t # 53</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Lukas Wunner from <a href=3D"show_bug.cgi?id=3D75=
985#c52">comment #52</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D75985#c49">comment #49</a>)
&gt; &gt; (In reply to Maik Freudenberg from <a href=3D"show_bug.cgi?id=3D7=
5985#c47">comment #47</a>)
&gt; &gt; &gt; There's of course the possibility that some braindead vendor=
 would ship a 3D
&gt; &gt; &gt; class tagged device actually having outputs.
&gt; &gt;=20
&gt; &gt; This happens. A lot.
&gt;=20
&gt; Ilia, do you have definitive knowledge of GPUs which
&gt; a) have a different class than PCI_CLASS_DISPLAY_VGA and
&gt; b) have working DP/HDMI outputs and
&gt; c) have an integrated HDA controller?
&gt;=20
&gt; I'm asking because get_bound_vga() in sound/pci/hda/hda_intel.c specif=
ically
&gt; matches against PCI_CLASS_DISPLAY_VGA only. In other words, if a GPU w=
ith
&gt; the three above-listed properties exists and is built into a hybrid gr=
aphics
&gt; laptop, it is currently not registered with vga_switcheroo, which woul=
d be
&gt; wrong.</span >

I can say with some certainty that there are laptops running around, esp
GM107's, whose pci class is 3D, and that have attached DP/HDMI outputs.

I don't think the users in question ever asked about audio, so I don't know
about the last bit. However I can't imagine that it wouldn't be there (esp =
once
all the proper enablement is done).

Is hda_intel only for intel? If so, I'm pretty sure that all intel vga devi=
ces
are PCI_CLASS_DISPLAY_VGA. However if it's used for everything, then it nee=
ds
to deal with DISPLAY_3D as well.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15201844895.1Ddac.3250--

--===============0575158534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0575158534==--
