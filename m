From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Thu, 04 Jan 2018 11:18:15 +0000
Message-ID: <bug-75985-8800-Ec633sC3yQ@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0417317987=="
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


--===============0417317987==
Content-Type: multipart/alternative; boundary="15150646950.2C2D.5088";
 charset="UTF-8"


--15150646950.2C2D.5088
Date: Thu, 4 Jan 2018 11:18:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #33 from spamas-HPQIj1OAFZMvJsYlp49lxw@public.gmane.org ---
My system specs:
i7-7700HQ + GTX 1060 6GB
Linux kernel version: 4.10.0-42-generic
Nvidia driver Version: 384.90
OS: Linux Mint 18.2

I can confirm that kernel module, posted by Maik Freudenberg [Comment 27], =
is
working fine on my system. Thank you for the fix. The HDMI audio device now
works as it should.

The steps I did to enable HDMI audio device:
1. Download and extract the file nvhda.tar.xz.
2. Run commands in terminal:
   make
   sudo make install
   echo nvhda | sudo tee -a /etc/initramfs-tools/modules
   echo "options nvhda load_state=3D1" | sudo tee /etc/modprobe.d/nvhda.conf
   sudo update-initramfs -u
3. Reboot.

With this fix, I did not notice any problems with power management or system
stability. HDMI audio works at system startup, after resume from sleep, aft=
er
plugging/unplugging HDMI cable.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15150646950.2C2D.5088
Date: Thu, 4 Jan 2018 11:18:15 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c33">Commen=
t # 33</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
spamas&#64;rambler.ru" title=3D"spamas&#64;rambler.ru">spamas&#64;rambler.r=
u</a>
</span></b>
        <pre>My system specs:
i7-7700HQ + GTX 1060 6GB
Linux kernel version: 4.10.0-42-generic
Nvidia driver Version: 384.90
OS: Linux Mint 18.2

I can confirm that kernel module, posted by Maik Freudenberg [<a href=3D"sh=
ow_bug.cgi?id=3D75985#c27">Comment 27</a>], is
working fine on my system. Thank you for the fix. The HDMI audio device now
works as it should.

The steps I did to enable HDMI audio device:
1. Download and extract the file nvhda.tar.xz.
2. Run commands in terminal:
   make
   sudo make install
   echo nvhda | sudo tee -a /etc/initramfs-tools/modules
   echo &quot;options nvhda load_state=3D1&quot; | sudo tee /etc/modprobe.d=
/nvhda.conf
   sudo update-initramfs -u
3. Reboot.

With this fix, I did not notice any problems with power management or system
stability. HDMI audio works at system startup, after resume from sleep, aft=
er
plugging/unplugging HDMI cable.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15150646950.2C2D.5088--

--===============0417317987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0417317987==--
