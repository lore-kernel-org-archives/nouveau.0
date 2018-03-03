From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sat, 03 Mar 2018 15:28:53 +0000
Message-ID: <bug-75985-8800-smrDdfbpSS@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0678483776=="
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


--===============0678483776==
Content-Type: multipart/alternative; boundary="15200909335.8CaCac9.20373"
Content-Transfer-Encoding: 7bit


--15200909335.8CaCac9.20373
Date: Sat, 3 Mar 2018 15:28:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #42 from Maik Freudenberg <hhfeuer-Mmb7MZpHnFY@public.gmane.org> ---
The hda devices on 3D controller are existing but not completely configured=
 by
vendors leading to errors like
[ 4790.121207] pci 0000:07:00.1: [10de:0e0f] type 00 class 0x040300
[ 4790.121253] pci 0000:07:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
[ 4790.121610] pci 0000:07:00.1: BAR 0: no space for [mem size 0x00004000]
[ 4790.121613] pci 0000:07:00.1: BAR 0: failed to assign [mem size 0x000040=
00]
[ 4790.121900] snd_hda_intel 0000:07:00.1: Disabling MSI
[ 4790.122493] snd_hda_intel 0000:07:00.1: can't ioremap BAR 0: [??? 0x0000=
0000
flags 0x0]
[ 5661.858112] snd_hda_intel 0000:07:00.1: ioremap error

AFAIK, 3D class is used by nvidia to specifically mark the adapters without
display engines, like Teslas or some Optimus dGPUs. So excluding them shoul=
d be
safe.
One thing that I don't know about but always had in the back of my mind are
Tegras, how those are handled or react.
Looking at the vgaswitcheroo patches, these look like a really fine way to
handle pm on these hda devices.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15200909335.8CaCac9.20373
Date: Sat, 3 Mar 2018 15:28:53 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c42">Commen=
t # 42</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hhfeuer&#64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> =
<span class=3D"fn">Maik Freudenberg</span></a>
</span></b>
        <pre>The hda devices on 3D controller are existing but not complete=
ly configured by
vendors leading to errors like
[ 4790.121207] pci 0000:07:00.1: [10de:0e0f] type 00 class 0x040300
[ 4790.121253] pci 0000:07:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
[ 4790.121610] pci 0000:07:00.1: BAR 0: no space for [mem size 0x00004000]
[ 4790.121613] pci 0000:07:00.1: BAR 0: failed to assign [mem size 0x000040=
00]
[ 4790.121900] snd_hda_intel 0000:07:00.1: Disabling MSI
[ 4790.122493] snd_hda_intel 0000:07:00.1: can't ioremap BAR 0: [??? 0x0000=
0000
flags 0x0]
[ 5661.858112] snd_hda_intel 0000:07:00.1: ioremap error

AFAIK, 3D class is used by nvidia to specifically mark the adapters without
display engines, like Teslas or some Optimus dGPUs. So excluding them shoul=
d be
safe.
One thing that I don't know about but always had in the back of my mind are
Tegras, how those are handled or react.
Looking at the vgaswitcheroo patches, these look like a really fine way to
handle pm on these hda devices.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15200909335.8CaCac9.20373--

--===============0678483776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0678483776==--
