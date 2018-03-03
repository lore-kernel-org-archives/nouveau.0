From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sat, 03 Mar 2018 17:54:23 +0000
Message-ID: <bug-75985-8800-Xe9pLYeIyt@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0216696826=="
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


--===============0216696826==
Content-Type: multipart/alternative; boundary="15200996621.EfFA0.9405"
Content-Transfer-Encoding: 7bit


--15200996621.EfFA0.9405
Date: Sat, 3 Mar 2018 17:54:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #44 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Maik Freudenberg from comment #42)
> The hda devices on 3D controller are existing but not completely configur=
ed
> by vendors leading to errors like
> [ 4790.121207] pci 0000:07:00.1: [10de:0e0f] type 00 class 0x040300
> [ 4790.121253] pci 0000:07:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
> [ 4790.121610] pci 0000:07:00.1: BAR 0: no space for [mem size 0x00004000]
> [ 4790.121613] pci 0000:07:00.1: BAR 0: failed to assign [mem size
> 0x00004000]
> [ 4790.121900] snd_hda_intel 0000:07:00.1: Disabling MSI
> [ 4790.122493] snd_hda_intel 0000:07:00.1: can't ioremap BAR 0: [???
> 0x00000000 flags 0x0]
> [ 5661.858112] snd_hda_intel 0000:07:00.1: ioremap error
>=20
> AFAIK, 3D class is used by nvidia to specifically mark the adapters witho=
ut
> display engines, like Teslas or some Optimus dGPUs. So excluding them sho=
uld
> be safe.

Sadly no. This was true for a time, but is unfortunately not accurate across
all devices. One can check if the DCB table has any outputs, and only do st=
uff
if there are none.This tends to be representative of whether there are actu=
al
outputs on a laptop connected to the GPU. (The DISPLAY block can also be fu=
sed
off, which can also be checked.)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15200996621.EfFA0.9405
Date: Sat, 3 Mar 2018 17:54:22 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c44">Commen=
t # 44</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Maik Freudenberg from <a href=3D"show_bug.cgi?id=
=3D75985#c42">comment #42</a>)
<span class=3D"quote">&gt; The hda devices on 3D controller are existing bu=
t not completely configured
&gt; by vendors leading to errors like
&gt; [ 4790.121207] pci 0000:07:00.1: [10de:0e0f] type 00 class 0x040300
&gt; [ 4790.121253] pci 0000:07:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
&gt; [ 4790.121610] pci 0000:07:00.1: BAR 0: no space for [mem size 0x00004=
000]
&gt; [ 4790.121613] pci 0000:07:00.1: BAR 0: failed to assign [mem size
&gt; 0x00004000]
&gt; [ 4790.121900] snd_hda_intel 0000:07:00.1: Disabling MSI
&gt; [ 4790.122493] snd_hda_intel 0000:07:00.1: can't ioremap BAR 0: [???
&gt; 0x00000000 flags 0x0]
&gt; [ 5661.858112] snd_hda_intel 0000:07:00.1: ioremap error
&gt;=20
&gt; AFAIK, 3D class is used by nvidia to specifically mark the adapters wi=
thout
&gt; display engines, like Teslas or some Optimus dGPUs. So excluding them =
should
&gt; be safe.</span >

Sadly no. This was true for a time, but is unfortunately not accurate across
all devices. One can check if the DCB table has any outputs, and only do st=
uff
if there are none.This tends to be representative of whether there are actu=
al
outputs on a laptop connected to the GPU. (The DISPLAY block can also be fu=
sed
off, which can also be checked.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15200996621.EfFA0.9405--

--===============0216696826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0216696826==--
