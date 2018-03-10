From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sat, 10 Mar 2018 06:36:40 +0000
Message-ID: <bug-75985-8800-2k7eQM0Cme@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1410697481=="
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


--===============1410697481==
Content-Type: multipart/alternative; boundary="15206638064.Cd86dbB5b.10419"
Content-Transfer-Encoding: 7bit


--15206638064.Cd86dbB5b.10419
Date: Sat, 10 Mar 2018 06:36:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #64 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Maik Freudenberg from comment #57)
> (In reply to Ilia Mirkin from comment #55)
> > What's the downside for doing this always btw=20
> By 'this', you mean, always turning it on?
> This generates the errors from comment #42 since those devices are not
> configured resource-wise, all zeros.

I would assume the BAR is all zeroes because there was insufficient space to
accommodate the additional 4K for it. AFAIUI, the kernel assigns only the
minimal amount of space to the bridge window that is necessary to accomodate
the devices below. Hence, if a device is added after the fact below the bri=
dge,
there may not be sufficient space available for it. I'd expect the situatio=
n to
be different if the device is already present on enumeration, as is done by=
 the
"header" PCI quirk. Then the bridge window can be sized appropriately. Could
you verify that on the machine in question?

It occurred to me that we could at least check presence of the Optimus _DSM=
 in
the PCI quirk. That would be sufficiently small for a quirk. That way it wo=
uld
be constrained to Optimus laptops, but sadly we'd still expose an audio
function if the GPU has no outputs at all. However I notice that
drivers/gpu/drm/nouveau/nouveau_acpi.c defines a OPTIMUS_HDA_CODEC_MASK mac=
ro
("hda bios codec supported"). Would that be of any use? Or can we query via=
 the
_DSM whether the GPU has any outputs?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15206638064.Cd86dbB5b.10419
Date: Sat, 10 Mar 2018 06:36:46 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c64">Commen=
t # 64</a>
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
=3D75985#c57">comment #57</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D75985#c55">comment #55</a>)
&gt; &gt; What's the downside for doing this always btw=20
&gt; By 'this', you mean, always turning it on?
&gt; This generates the errors from <a href=3D"show_bug.cgi?id=3D75985#c42"=
>comment #42</a> since those devices are not
&gt; configured resource-wise, all zeros.</span >

I would assume the BAR is all zeroes because there was insufficient space to
accommodate the additional 4K for it. AFAIUI, the kernel assigns only the
minimal amount of space to the bridge window that is necessary to accomodate
the devices below. Hence, if a device is added after the fact below the bri=
dge,
there may not be sufficient space available for it. I'd expect the situatio=
n to
be different if the device is already present on enumeration, as is done by=
 the
&quot;header&quot; PCI quirk. Then the bridge window can be sized appropria=
tely. Could
you verify that on the machine in question?

It occurred to me that we could at least check presence of the Optimus _DSM=
 in
the PCI quirk. That would be sufficiently small for a quirk. That way it wo=
uld
be constrained to Optimus laptops, but sadly we'd still expose an audio
function if the GPU has no outputs at all. However I notice that
drivers/gpu/drm/nouveau/nouveau_acpi.c defines a OPTIMUS_HDA_CODEC_MASK mac=
ro
(&quot;hda bios codec supported&quot;). Would that be of any use? Or can we=
 query via the
_DSM whether the GPU has any outputs?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15206638064.Cd86dbB5b.10419--

--===============1410697481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1410697481==--
