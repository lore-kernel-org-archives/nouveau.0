From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100760] Rapid flickering when an app is placed on
 the second Nouveau ZaphodHeads display
Date: Thu, 01 Jun 2017 02:50:56 +0000
Message-ID: <bug-100760-8800-7NNCN2aLyt@http.bugs.freedesktop.org/>
References: <bug-100760-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1727183580=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100760-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1727183580==
Content-Type: multipart/alternative; boundary="14962854560.174E64.14149";
 charset="UTF-8"


--14962854560.174E64.14149
Date: Thu, 1 Jun 2017 02:50:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100760

--- Comment #5 from mrj-ejQy8aU/RJumpXlQD71PVDSf8X3wrgjD@public.gmane.org ---
Thanks Ilia. I haven't done the ssh test yet, but I've got further data on =
the
problem:

Under Nouveau my computer started crashing about once a day. (The screens
suddenly go black, and trying to play audio from a known open terminal fail=
s,
so X was probably crashing, and a hardware reset is required, after which t=
he
logs often showed Cron processes doing stuff after the crash, so the Kernel
wasn't crashing.)

A 304xx proprietary Nvidia driver that works on the latest X had since been
released, so I tried that.

Results:

1. My computer is no longer crashing. A potential cause of the crashes under
Nouveau is high GPU idle usage -- the GPU temp is permanently at least 20
degrees C lower under the proprietary driver. My card is a mid-range card w=
ith
extensive passive cooling, so fan speed control by Nouveau is no help.

https://forums.opensuse.org/showthread.php/456958-Nouveau-driver-and-GPU-te=
mperature
http://www.phoronix.com/scan.php?page=3Darticle&item=3Dnouveau_comp_2011&nu=
m=3D19
https://forums.gentoo.org/viewtopic-t-837855-start-0.html

2. The proprietary driver has "Separate X Screen" and "TwinView" modes.
"Separate X Screen" was what I had been using, and this no longer works on =
the
latest X (the second screen is black, only the pointer appears). So, as
suspected, the loss of "Zaphod" is an X issue rather than a Nouveau issue.
There's no flickering in Mate however, so this _is_ a Nouveau issue.

So I'm currently using TwinView, which is the same as the XRandR Nouveau mo=
de.
I'm still adapting to the loss of separate sets of virtual desktops.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14962854560.174E64.14149
Date: Thu, 1 Jun 2017 02:50:56 +0000
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
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760">bug 10076=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mrj&#64;advancedcontrols.com.au" title=3D"mrj&#64;advancedcontrols.com.au">=
mrj&#64;advancedcontrols.com.au</a>
</span></b>
        <pre>Thanks Ilia. I haven't done the ssh test yet, but I've got fur=
ther data on the
problem:

Under Nouveau my computer started crashing about once a day. (The screens
suddenly go black, and trying to play audio from a known open terminal fail=
s,
so X was probably crashing, and a hardware reset is required, after which t=
he
logs often showed Cron processes doing stuff after the crash, so the Kernel
wasn't crashing.)

A 304xx proprietary Nvidia driver that works on the latest X had since been
released, so I tried that.

Results:

1. My computer is no longer crashing. A potential cause of the crashes under
Nouveau is high GPU idle usage -- the GPU temp is permanently at least 20
degrees C lower under the proprietary driver. My card is a mid-range card w=
ith
extensive passive cooling, so fan speed control by Nouveau is no help.

<a href=3D"https://forums.opensuse.org/showthread.php/456958-Nouveau-driver=
-and-GPU-temperature">https://forums.opensuse.org/showthread.php/456958-Nou=
veau-driver-and-GPU-temperature</a>
<a href=3D"http://www.phoronix.com/scan.php?page=3Darticle&amp;item=3Dnouve=
au_comp_2011&amp;num=3D19">http://www.phoronix.com/scan.php?page=3Darticle&=
amp;item=3Dnouveau_comp_2011&amp;num=3D19</a>
<a href=3D"https://forums.gentoo.org/viewtopic-t-837855-start-0.html">https=
://forums.gentoo.org/viewtopic-t-837855-start-0.html</a>

2. The proprietary driver has &quot;Separate X Screen&quot; and &quot;TwinV=
iew&quot; modes.
&quot;Separate X Screen&quot; was what I had been using, and this no longer=
 works on the
latest X (the second screen is black, only the pointer appears). So, as
suspected, the loss of &quot;Zaphod&quot; is an X issue rather than a Nouve=
au issue.
There's no flickering in Mate however, so this _is_ a Nouveau issue.

So I'm currently using TwinView, which is the same as the XRandR Nouveau mo=
de.
I'm still adapting to the loss of separate sets of virtual desktops.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14962854560.174E64.14149--

--===============1727183580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1727183580==--
