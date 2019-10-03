From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Thu, 03 Oct 2019 03:50:22 +0000
Message-ID: <bug-75985-8800-VEAw0s3vYA@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1410856130=="
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


--===============1410856130==
Content-Type: multipart/alternative; boundary="15700746225.16AE8b.18746"
Content-Transfer-Encoding: 7bit


--15700746225.16AE8b.18746
Date: Thu, 3 Oct 2019 03:50:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #102 from Daniel Drake <dan-LrsmPHowOvpd3aXB8m+yKQ@public.gmane.org> ---
Thanks. azx_runtime_idle() is returning EBUSY because
azx_bus(chip)->codec_powered=3D0xf.

codec_powered is set during initialization via snd_hdac_bus_add_device(),
presumably to reflect that the device is definitely powered up at
initialization time.

It's unset during hdac_hdmi_runtime_suspend() (and/or during
hda_codec_runtime_suspend()) via the call to snd_hdac_codec_link_down().

I guess this implies that the HDA codec (hdac_hdmi.c) is expected to be ful=
ly
runtime suspended before the controller (hda_intel.c) runtime idle check is
executed, and that this is not happening.


Under /sys/bus/pci/devices/0000:01:00.1 you should see some subdirectories =
that
are named hdaudioC?D?. Those subdirectories in turn have power subdirectori=
es
for runtime pm control.

In addition to the steps already taken, please could you set all the hdaudi=
o*
subdevices power/control to auto too, then use grep to dump the power/
directory contents for all of the hdaudio* devices there and the controller.
And let us know if this has any effect on the issue at hand.

I did try 4 Asus products we currently have in the Endless lab but none of =
them
have a nvidia HDMI controller that can be exposed via the magic bit (and th=
eir
HDMI audio functionality does go through the integrated intel gpu).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15700746225.16AE8b.18746
Date: Thu, 3 Oct 2019 03:50:22 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c102">Comme=
nt # 102</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;reactivated.net" title=3D"Daniel Drake &lt;dan&#64;reactivated.net&=
gt;"> <span class=3D"fn">Daniel Drake</span></a>
</span></b>
        <pre>Thanks. azx_runtime_idle() is returning EBUSY because
azx_bus(chip)-&gt;codec_powered=3D0xf.

codec_powered is set during initialization via snd_hdac_bus_add_device(),
presumably to reflect that the device is definitely powered up at
initialization time.

It's unset during hdac_hdmi_runtime_suspend() (and/or during
hda_codec_runtime_suspend()) via the call to snd_hdac_codec_link_down().

I guess this implies that the HDA codec (hdac_hdmi.c) is expected to be ful=
ly
runtime suspended before the controller (hda_intel.c) runtime idle check is
executed, and that this is not happening.


Under /sys/bus/pci/devices/0000:01:00.1 you should see some subdirectories =
that
are named hdaudioC?D?. Those subdirectories in turn have power subdirectori=
es
for runtime pm control.

In addition to the steps already taken, please could you set all the hdaudi=
o*
subdevices power/control to auto too, then use grep to dump the power/
directory contents for all of the hdaudio* devices there and the controller.
And let us know if this has any effect on the issue at hand.

I did try 4 Asus products we currently have in the Endless lab but none of =
them
have a nvidia HDMI controller that can be exposed via the magic bit (and th=
eir
HDMI audio functionality does go through the integrated intel gpu).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15700746225.16AE8b.18746--

--===============1410856130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1410856130==--
