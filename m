From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Wed, 03 Jan 2018 20:20:31 +0000
Message-ID: <bug-75985-8800-BE2AJb5evq@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0473124221=="
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


--===============0473124221==
Content-Type: multipart/alternative; boundary="15150108312.AdAa.18610";
 charset="UTF-8"


--15150108312.AdAa.18610
Date: Wed, 3 Jan 2018 20:20:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #29 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Daniel Drake from comment #22)
> Created attachment 136369 [details] [review]
> GP104: enable HDMI audio device function
>=20
> On Asus GL502VS I investigated why the gfx device must be removed before
> rescan in the above workarounds.
>=20
> The reason is that when Linux first probes the device (before you attempt
> the workaround), pci_setup_device() notes that the device is not
> multifunction capable. This causes pci_scan_slot() to not bother scanning
> the non-zero functions (per the behaviour inside next_fn()).
>=20
> I checked and I found that when the 0x488 magic bit is not set, the gfx
> device advertises as non-multifunction. After the bit is set, the device
> advertises as multi-function. So, after setting the magic bit, removing t=
he
> device will cause Linux to re-probe it during the next rescan, taking note
> at that point that it is a multi-function device, and proceeding to scan =
the
> functions, finding the audio device at function 1.
>=20
> Based on that I have a first attempt at a fix. It's not working though,
> audio output is silent (but I did have it working with the previous
> workarounds). I'll look closer next week.

I think this check against 0x134 can be something like < 0x82 instead. This
thing is there since like G82 GPUs and I am sure the HDMI audio device is
controlled like this on all those GPUs.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15150108312.AdAa.18610
Date: Wed, 3 Jan 2018 20:20:31 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c29">Commen=
t # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Daniel Drake from <a href=3D"show_bug.cgi?id=3D75=
985#c22">comment #22</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D136369" name=3D"attach_136369" title=3D"GP104: enable HDMI audio de=
vice function">attachment 136369</a> <a href=3D"attachment.cgi?id=3D136369&=
amp;action=3Dedit" title=3D"GP104: enable HDMI audio device function">[deta=
ils]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D75985&amp;=
attachment=3D136369'>[review]</a> [review]
&gt; GP104: enable HDMI audio device function
&gt;=20
&gt; On Asus GL502VS I investigated why the gfx device must be removed befo=
re
&gt; rescan in the above workarounds.
&gt;=20
&gt; The reason is that when Linux first probes the device (before you atte=
mpt
&gt; the workaround), pci_setup_device() notes that the device is not
&gt; multifunction capable. This causes pci_scan_slot() to not bother scann=
ing
&gt; the non-zero functions (per the behaviour inside next_fn()).
&gt;=20
&gt; I checked and I found that when the 0x488 magic bit is not set, the gfx
&gt; device advertises as non-multifunction. After the bit is set, the devi=
ce
&gt; advertises as multi-function. So, after setting the magic bit, removin=
g the
&gt; device will cause Linux to re-probe it during the next rescan, taking =
note
&gt; at that point that it is a multi-function device, and proceeding to sc=
an the
&gt; functions, finding the audio device at function 1.
&gt;=20
&gt; Based on that I have a first attempt at a fix. It's not working though,
&gt; audio output is silent (but I did have it working with the previous
&gt; workarounds). I'll look closer next week.</span >

I think this check against 0x134 can be something like &lt; 0x82 instead. T=
his
thing is there since like G82 GPUs and I am sure the HDMI audio device is
controlled like this on all those GPUs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15150108312.AdAa.18610--

--===============0473124221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0473124221==--
