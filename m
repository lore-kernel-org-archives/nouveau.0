From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Thu, 03 Oct 2019 06:37:20 +0000
Message-ID: <bug-75985-8800-gvvBHvb2rX@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1114033878=="
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


--===============1114033878==
Content-Type: multipart/alternative; boundary="15700846403.dE7f5.18229"
Content-Transfer-Encoding: 7bit


--15700846403.dE7f5.18229
Date: Thu, 3 Oct 2019 06:37:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #103 from Przemys=C5=82aw Kopa <prymoo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Daniel Drake from comment #102)
> Under /sys/bus/pci/devices/0000:01:00.1 you should see some subdirectories
> that are named hdaudioC?D?. Those subdirectories in turn have power
> subdirectories for runtime pm control.
>=20
> In addition to the steps already taken, please could you set all the
> hdaudio* subdevices power/control to auto too, then use grep to dump the
> power/ directory contents for all of the hdaudio* devices there and the
> controller. And let us know if this has any effect on the issue at hand.

There are four of those - all of them were already set to "auto" on boot
(without me doing anything). HDA still stays active.

Here is the dump of "power" subdirectories:

/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/async:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/autosuspend_delay_ms:10=
00
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_active_time:226
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_status:suspended
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_suspended_time:=
117748
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_usage:0

/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/async:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/autosuspend_delay_ms:10=
00
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_active_time:242
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_status:suspended
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_suspended_time:=
117725
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_usage:0

/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/async:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/autosuspend_delay_ms:10=
00
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_active_time:275
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_status:suspended
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_suspended_time:=
117684
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_usage:0

/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/async:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/autosuspend_delay_ms:10=
00
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_active_time:264
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_status:suspended
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_suspended_time:=
117664
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_usage:0

/sys/bus/pci/devices/0000:01:00.1/power/async:enabled
grep: /sys/bus/pci/devices/0000:01:00.1/power/autosuspend_delay_ms: B=C5=82=
=C4=85d
wej=C5=9Bcia/wyj=C5=9Bcia // translates to: "Input/output error"
/sys/bus/pci/devices/0000:01:00.1/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/power/runtime_active_time:127936
/sys/bus/pci/devices/0000:01:00.1/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/power/runtime_status:active
/sys/bus/pci/devices/0000:01:00.1/power/runtime_suspended_time:5389
/sys/bus/pci/devices/0000:01:00.1/power/runtime_usage:0
/sys/bus/pci/devices/0000:01:00.1/power/wakeup:disabled

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15700846403.dE7f5.18229
Date: Thu, 3 Oct 2019 06:37:20 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c103">Comme=
nt # 103</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
prymoo&#64;gmail.com" title=3D"Przemys=C5=82aw Kopa &lt;prymoo&#64;gmail.co=
m&gt;"> <span class=3D"fn">Przemys=C5=82aw Kopa</span></a>
</span></b>
        <pre>(In reply to Daniel Drake from <a href=3D"show_bug.cgi?id=3D75=
985#c102">comment #102</a>)
<span class=3D"quote">&gt; Under /sys/bus/pci/devices/0000:01:00.1 you shou=
ld see some subdirectories
&gt; that are named hdaudioC?D?. Those subdirectories in turn have power
&gt; subdirectories for runtime pm control.
&gt;=20
&gt; In addition to the steps already taken, please could you set all the
&gt; hdaudio* subdevices power/control to auto too, then use grep to dump t=
he
&gt; power/ directory contents for all of the hdaudio* devices there and the
&gt; controller. And let us know if this has any effect on the issue at han=
d.</span >

There are four of those - all of them were already set to &quot;auto&quot; =
on boot
(without me doing anything). HDA still stays active.

Here is the dump of &quot;power&quot; subdirectories:

/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/async:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/autosuspend_delay_ms:10=
00
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_active_time:226
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_status:suspended
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_suspended_time:=
117748
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/power/runtime_usage:0

/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/async:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/autosuspend_delay_ms:10=
00
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_active_time:242
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_status:suspended
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_suspended_time:=
117725
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D1/power/runtime_usage:0

/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/async:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/autosuspend_delay_ms:10=
00
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_active_time:275
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_status:suspended
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_suspended_time:=
117684
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D2/power/runtime_usage:0

/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/async:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/autosuspend_delay_ms:10=
00
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_active_time:264
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_status:suspended
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_suspended_time:=
117664
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D3/power/runtime_usage:0

/sys/bus/pci/devices/0000:01:00.1/power/async:enabled
grep: /sys/bus/pci/devices/0000:01:00.1/power/autosuspend_delay_ms: B=C5=82=
=C4=85d
wej=C5=9Bcia/wyj=C5=9Bcia // translates to: &quot;Input/output error&quot;
/sys/bus/pci/devices/0000:01:00.1/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/power/runtime_active_time:127936
/sys/bus/pci/devices/0000:01:00.1/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/power/runtime_status:active
/sys/bus/pci/devices/0000:01:00.1/power/runtime_suspended_time:5389
/sys/bus/pci/devices/0000:01:00.1/power/runtime_usage:0
/sys/bus/pci/devices/0000:01:00.1/power/wakeup:disabled</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15700846403.dE7f5.18229--

--===============1114033878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1114033878==--
