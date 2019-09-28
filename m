From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sat, 28 Sep 2019 10:08:49 +0000
Message-ID: <bug-75985-8800-f1WFOlJ6N3@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2072200910=="
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


--===============2072200910==
Content-Type: multipart/alternative; boundary="156966532910.EBeebDE.6154"
Content-Transfer-Encoding: 7bit


--156966532910.EBeebDE.6154
Date: Sat, 28 Sep 2019 10:08:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #82 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Przemys=C5=82aw Kopa from comment #81)
> (In reply to Daniel Drake from comment #80)
> > A patch titled "PCI: Enable NVIDIA HDA controllers" (effecively attachm=
ent
> > #137939 [details] [review]) is headed into linux-next and potentially L=
inux
> > 5.3. Testing appreciated!
>=20
> Hello there! This commit prevents vga_switcheroo from turning off dGPU
> (Geforce 540m) on my optimus machine as described here:
> https://bbs.archlinux.org/viewtopic.php?pid=3D1865512#p1865512. I never h=
ad
> problems with HDMI audio on this system - I think all connectors are
> connected to the Intel GPU, yet NVIDIA HDA is still enabled by this patch.

If the HDA is kept runtime resumed, e.g. if it is accessed by a user space
application, then the GPU is kept runtime resumed as well.

Check the runtime PM status of the HDA:
grep . /sys/bus/pci/devices/0000:01:00.1/power/*

Check if user space applications have opened the HDA:
lsof /dev/snd/controlC1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--156966532910.EBeebDE.6154
Date: Sat, 28 Sep 2019 10:08:49 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c82">Commen=
t # 82</a>
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
?id=3D75985#c81">comment #81</a>)
<span class=3D"quote">&gt; (In reply to Daniel Drake from <a href=3D"show_b=
ug.cgi?id=3D75985#c80">comment #80</a>)
&gt; &gt; A patch titled &quot;PCI: Enable NVIDIA HDA controllers&quot; (ef=
fecively attachment
&gt; &gt; #137939 [details] [review]) is headed into linux-next and potenti=
ally Linux
&gt; &gt; 5.3. Testing appreciated!
&gt;=20
&gt; Hello there! This commit prevents vga_switcheroo from turning off dGPU
&gt; (Geforce 540m) on my optimus machine as described here:
&gt; <a href=3D"https://bbs.archlinux.org/viewtopic.php?pid=3D1865512#p1865=
512">https://bbs.archlinux.org/viewtopic.php?pid=3D1865512#p1865512</a>. I =
never had
&gt; problems with HDMI audio on this system - I think all connectors are
&gt; connected to the Intel GPU, yet NVIDIA HDA is still enabled by this pa=
tch.</span >

If the HDA is kept runtime resumed, e.g. if it is accessed by a user space
application, then the GPU is kept runtime resumed as well.

Check the runtime PM status of the HDA:
grep . /sys/bus/pci/devices/0000:01:00.1/power/*

Check if user space applications have opened the HDA:
lsof /dev/snd/controlC1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--156966532910.EBeebDE.6154--

--===============2072200910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2072200910==--
