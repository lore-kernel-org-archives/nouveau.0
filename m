From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108857] display becomes unresponsive and keyboard
 input fails
Date: Thu, 29 Nov 2018 16:43:20 +0000
Message-ID: <bug-108857-8800-L2OwcyXbBL@http.bugs.freedesktop.org/>
References: <bug-108857-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0901851494=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108857-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0901851494==
Content-Type: multipart/alternative; boundary="15435098000.8e59d57f.25291"
Content-Transfer-Encoding: 7bit


--15435098000.8e59d57f.25291
Date: Thu, 29 Nov 2018 16:43:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108857

--- Comment #5 from tla2k20-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Switched to the nvidia drivers today and no issues, so looks like it is
probably nouveau related?

sudo dnf config-manager
--add-repo=3Dhttps://negativo17.org/repos/fedora-nvidia.repo
sudo dnf -y remove \*nvidia\*
sudo dnf -y install nvidia-driver nvidia-settings kernel-devel
nvidia-driver-libs.i686
# wait for the kernel driver to build in the background (top) then...
sudo reboot

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15435098000.8e59d57f.25291
Date: Thu, 29 Nov 2018 16:43:20 +0000
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
   title=3D"NEW - display becomes unresponsive and keyboard input fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108857#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - display becomes unresponsive and keyboard input fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108857">bug 10885=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tla2k20&#64;gmail.com" title=3D"tla2k20&#64;gmail.com">tla2k20&#64;gmail.co=
m</a>
</span></b>
        <pre>Switched to the nvidia drivers today and no issues, so looks l=
ike it is
probably nouveau related?

sudo dnf config-manager
--add-repo=3D<a href=3D"https://negativo17.org/repos/fedora-nvidia.repo">ht=
tps://negativo17.org/repos/fedora-nvidia.repo</a>
sudo dnf -y remove \*nvidia\*
sudo dnf -y install nvidia-driver nvidia-settings kernel-devel
nvidia-driver-libs.i686
# wait for the kernel driver to build in the background (top) then...
sudo reboot</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15435098000.8e59d57f.25291--

--===============0901851494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0901851494==--
