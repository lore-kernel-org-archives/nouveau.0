From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Wed, 07 Mar 2018 12:04:38 +0000
Message-ID: <bug-75985-8800-gvEcFhF9Zs@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0644496379=="
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


--===============0644496379==
Content-Type: multipart/alternative; boundary="15204242774.88bbAF5b.13321"
Content-Transfer-Encoding: 7bit


--15204242774.88bbAF5b.13321
Date: Wed, 7 Mar 2018 12:04:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #59 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
(In reply to Lukas Wunner from comment #51)
> On my GK107 I do not see any change in power consumption regardless wheth=
er
> bit 25 at config space offset 0x488 is set or cleared, which is somewhat
> disappointing. I also do not see a change in power consumption between PCI
> power state D0 and D3hot.

Was this your macbook or a regular laptop? The Kepler family still used an =
ACPI
_DSM method to remove power, setting the PM bit in the PCI config space did=
 not
do anything (this was at least true for my older Fermi card).


Possibly relevant for this bug: I tested Lukas devlink_v2 patches but found
some issues when the HDMI/DP cable was disconnected on a GTX 965M (where by
default the audio function would not be visible):
https://lists.freedesktop.org/archives/nouveau/2018-March/029988.html

Do you also experience issues after these steps:
1. remove+rescan to make audio function appear
2. remove GPU power (runtime PM or system sleep)
3. remove HDMI/DP cable
4. restore power
5. check dmesg or try to access audio function (e.g. read PCI regs)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15204242774.88bbAF5b.13321
Date: Wed, 7 Mar 2018 12:04:37 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c59">Commen=
t # 59</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>(In reply to Lukas Wunner from <a href=3D"show_bug.cgi?id=3D75=
985#c51">comment #51</a>)
<span class=3D"quote">&gt; On my GK107 I do not see any change in power con=
sumption regardless whether
&gt; bit 25 at config space offset 0x488 is set or cleared, which is somewh=
at
&gt; disappointing. I also do not see a change in power consumption between=
 PCI
&gt; power state D0 and D3hot.</span >

Was this your macbook or a regular laptop? The Kepler family still used an =
ACPI
_DSM method to remove power, setting the PM bit in the PCI config space did=
 not
do anything (this was at least true for my older Fermi card).


Possibly relevant for this bug: I tested Lukas devlink_v2 patches but found
some issues when the HDMI/DP cable was disconnected on a GTX 965M (where by
default the audio function would not be visible):
<a href=3D"https://lists.freedesktop.org/archives/nouveau/2018-March/029988=
.html">https://lists.freedesktop.org/archives/nouveau/2018-March/029988.htm=
l</a>

Do you also experience issues after these steps:
1. remove+rescan to make audio function appear
2. remove GPU power (runtime PM or system sleep)
3. remove HDMI/DP cable
4. restore power
5. check dmesg or try to access audio function (e.g. read PCI regs)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15204242774.88bbAF5b.13321--

--===============0644496379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0644496379==--
