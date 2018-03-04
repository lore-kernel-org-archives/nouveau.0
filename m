From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sun, 04 Mar 2018 10:39:05 +0000
Message-ID: <bug-75985-8800-6K2DvjDrkd@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2082286120=="
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


--===============2082286120==
Content-Type: multipart/alternative; boundary="15201599463.681eC7E3b.2571"
Content-Transfer-Encoding: 7bit


--15201599463.681eC7E3b.2571
Date: Sun, 4 Mar 2018 10:39:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #51 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Maik Freudenberg from comment #31)
> As a sidenote: another user reported 5 Watts additional power draw when
> enabling the audio function. Regardless of this being accurate it should =
be
> taken into account to not enable it unconditionally since these are mobile
> devices.

On my GK107 I do not see any change in power consumption regardless whether=
 bit
25 at config space offset 0x488 is set or cleared, which is somewhat
disappointing. I also do not see a change in power consumption between PCI
power state D0 and D3hot.

So if it's true that enabling the HDA increases power consumption, that wou=
ld
seem to only apply to newer cards.

Could somebody verify this: Do you see a consistent drop or increase in pow=
er
consumption when enabling/disabling the HDA?

setpci -s 01:00.0 0x488.l=3D0x0000000:0x2000000    # disable
setpci -s 01:00.0 0x488.l=3D0x2000000:0x2000000    # enable

Try this a couple of times and see if powertop shows a consistent differenc=
e in
power consumption. (The laptop needs to run on battery for this to work, so
disconnect the charger.)

If you *do* see a difference, double-check whether runtime suspending the H=
DA
to D3hot (using my above-linked switcheroo_devlink_v2 patch set) also shows=
 a
difference. You can force the HDA into D0 or let it autosuspend to D3hot li=
ke
this:

echo on   > /sys/bus/pci/devices/0000:01:00.1/power/control    # disable
echo auto > /sys/bus/pci/devices/0000:01:00.1/power/control    # enable

If the reduction in power consumption turns out to be the same in D3hot ver=
sus
disabling via bit 25, there's no point in adding D3cold support to hda_inte=
l.c.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15201599463.681eC7E3b.2571
Date: Sun, 4 Mar 2018 10:39:06 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c51">Commen=
t # 51</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Maik Freudenberg from <a href=3D"show_bug.cgi?id=
=3D75985#c31">comment #31</a>)
<span class=3D"quote">&gt; As a sidenote: another user reported 5 Watts add=
itional power draw when
&gt; enabling the audio function. Regardless of this being accurate it shou=
ld be
&gt; taken into account to not enable it unconditionally since these are mo=
bile
&gt; devices.</span >

On my GK107 I do not see any change in power consumption regardless whether=
 bit
25 at config space offset 0x488 is set or cleared, which is somewhat
disappointing. I also do not see a change in power consumption between PCI
power state D0 and D3hot.

So if it's true that enabling the HDA increases power consumption, that wou=
ld
seem to only apply to newer cards.

Could somebody verify this: Do you see a consistent drop or increase in pow=
er
consumption when enabling/disabling the HDA?

setpci -s 01:00.0 0x488.l=3D0x0000000:0x2000000    # disable
setpci -s 01:00.0 0x488.l=3D0x2000000:0x2000000    # enable

Try this a couple of times and see if powertop shows a consistent differenc=
e in
power consumption. (The laptop needs to run on battery for this to work, so
disconnect the charger.)

If you *do* see a difference, double-check whether runtime suspending the H=
DA
to D3hot (using my above-linked switcheroo_devlink_v2 patch set) also shows=
 a
difference. You can force the HDA into D0 or let it autosuspend to D3hot li=
ke
this:

echo on   &gt; /sys/bus/pci/devices/0000:01:00.1/power/control    # disable
echo auto &gt; /sys/bus/pci/devices/0000:01:00.1/power/control    # enable

If the reduction in power consumption turns out to be the same in D3hot ver=
sus
disabling via bit 25, there's no point in adding D3cold support to hda_inte=
l.c.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15201599463.681eC7E3b.2571--

--===============2082286120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2082286120==--
