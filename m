From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sun, 27 Oct 2019 18:33:24 +0000
Message-ID: <bug-75985-8800-ZDyQq6PNnA@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0125251837=="
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


--===============0125251837==
Content-Type: multipart/alternative; boundary="15722012049.0DCe675.23866"
Content-Transfer-Encoding: 7bit


--15722012049.0DCe675.23866
Date: Sun, 27 Oct 2019 18:33:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #120 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Przemys=C5=82aw Kopa from comment #118)
> (In reply to Lukas Wunner from comment #116)
> > There's one problem remaining, you shouldn't have to manually echo "aut=
o" to
> > the HDA's control file because we call pm_runtime_allow() on the HDA de=
vice
> > in drivers/pci/quirks.c:quirk_gpu_hda() -> pci_create_device_link().
> > Something must be calling pm_runtime_forbid() afterwards, perhaps this =
is
> > triggered from user space on Arch Linux. I'm attaching a little debug p=
atch
> > which logs a stacktrace to dmesg whenever pm_runtime_allow() / _forbid(=
) is
> > called for a device. Feel free to attach dmesg output with this patch
> > applied and I'll be happy to take a look at it.
>=20
> I'm attaching dmesg dump - last stack trace is generated after me echoing
> "auto" to HDA control file.

Okay the culprit is a tool called "tlp" which disables runtime PM on the HDA
controller via sysfs:

[    8.472292] snd_hda_intel 0000:01:00.1: pm_runtime_forbid
[    8.474196] CPU: 0 PID: 494 Comm: tlp Not tainted 5.4.0-rc4-mainline #1
[    8.477943] Call Trace:
[    8.477952]  dump_stack+0x5c/0x80
[    8.477957]  pm_runtime_forbid.cold+0x1b/0x38
[    8.477960]  control_store+0x78/0x80
[    8.477964]  kernfs_fop_write+0x10e/0x190

I'm not familiar with "tlp" at all but according to this page...

https://linrunner.de/en/tlp/docs/tlp-configuration.html#audio

... I suspect you may have set "SOUND_POWER_SAVE_CONTROLLER=3DN" or
"SOUND_POWER_SAVE_ON_AC=3D0" in /etc/default/tlp. If so, try if changing th=
ose
settings fixes the issue.

Some more info on "tlp" can be found here:

https://wiki.archlinux.org/index.php/TLP

Hope that helps!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15722012049.0DCe675.23866
Date: Sun, 27 Oct 2019 18:33:24 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c120">Comme=
nt # 120</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Przemys=C5=82aw Kopa from <a href=3D"show_bug.cgi=
?id=3D75985#c118">comment #118</a>)
<span class=3D"quote">&gt; (In reply to Lukas Wunner from <a href=3D"show_b=
ug.cgi?id=3D75985#c116">comment #116</a>)
&gt; &gt; There's one problem remaining, you shouldn't have to manually ech=
o &quot;auto&quot; to
&gt; &gt; the HDA's control file because we call pm_runtime_allow() on the =
HDA device
&gt; &gt; in drivers/pci/quirks.c:quirk_gpu_hda() -&gt; pci_create_device_l=
ink().
&gt; &gt; Something must be calling pm_runtime_forbid() afterwards, perhaps=
 this is
&gt; &gt; triggered from user space on Arch Linux. I'm attaching a little d=
ebug patch
&gt; &gt; which logs a stacktrace to dmesg whenever pm_runtime_allow() / _f=
orbid() is
&gt; &gt; called for a device. Feel free to attach dmesg output with this p=
atch
&gt; &gt; applied and I'll be happy to take a look at it.
&gt;=20
&gt; I'm attaching dmesg dump - last stack trace is generated after me echo=
ing
&gt; &quot;auto&quot; to HDA control file.</span >

Okay the culprit is a tool called &quot;tlp&quot; which disables runtime PM=
 on the HDA
controller via sysfs:

[    8.472292] snd_hda_intel 0000:01:00.1: pm_runtime_forbid
[    8.474196] CPU: 0 PID: 494 Comm: tlp Not tainted 5.4.0-rc4-mainline #1
[    8.477943] Call Trace:
[    8.477952]  dump_stack+0x5c/0x80
[    8.477957]  pm_runtime_forbid.cold+0x1b/0x38
[    8.477960]  control_store+0x78/0x80
[    8.477964]  kernfs_fop_write+0x10e/0x190

I'm not familiar with &quot;tlp&quot; at all but according to this page...

<a href=3D"https://linrunner.de/en/tlp/docs/tlp-configuration.html#audio">h=
ttps://linrunner.de/en/tlp/docs/tlp-configuration.html#audio</a>

... I suspect you may have set &quot;SOUND_POWER_SAVE_CONTROLLER=3DN&quot; =
or
&quot;SOUND_POWER_SAVE_ON_AC=3D0&quot; in /etc/default/tlp. If so, try if c=
hanging those
settings fixes the issue.

Some more info on &quot;tlp&quot; can be found here:

<a href=3D"https://wiki.archlinux.org/index.php/TLP">https://wiki.archlinux=
.org/index.php/TLP</a>

Hope that helps!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15722012049.0DCe675.23866--

--===============0125251837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0125251837==--
