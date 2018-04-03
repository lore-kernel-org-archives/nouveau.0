From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100446] Backlight control not working on Pascal /
 GP106 using nouveau drivers
Date: Tue, 03 Apr 2018 00:01:50 +0000
Message-ID: <bug-100446-8800-6anxJBD2iq@http.bugs.freedesktop.org/>
References: <bug-100446-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0179009457=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100446-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0179009457==
Content-Type: multipart/alternative; boundary="15227137090.1f3E9F.28912"
Content-Transfer-Encoding: 7bit


--15227137090.1f3E9F.28912
Date: Tue, 3 Apr 2018 00:01:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100446

--- Comment #8 from Pedro Albuquerque Santos <petersaints-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have the same problem on an ASUS GL502VM with a GTX 1060 6GB. UNFORTUNATE=
LY
this laptop shipped with G-SYNC enabled, which means that the Intel GPU is
completely disabled and everything goes through/is controlled by the NVIDIA
GPU. I would rather have no G-SYNC but having the Intel GPU driving the dis=
play
output and backlight. I'm sure that it would be a much less painful experie=
nce.

Well... Enough with ranting! Since you suggested that this may have been fi=
xed
by a recent kernel update, I have tested a Fedora 28 Workstation Live Image
that comes with the 4.16rc6 kernel. But the problem persists.

From what I could understand, even if the 4.16 corrects the underlying issu=
e,
the nouveau driver still needs to be changed and manually recompiled as
suggested by the OP because backlight support for Pascal-based cards is not
enabled by that switch statement. The "NV_DEVICE_INFO_V0_PASCAL" clause is
missing in the "nvidia_backlight.c" file. Is this assessment correct?

Also, feel free to ask me for any further information that may help you to
fully support backlight control for Pascal GPUs. I may need some instructio=
ns
on how to gather some lower level information, but I'll gladly do it if you
think that it may help.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15227137090.1f3E9F.28912
Date: Tue, 3 Apr 2018 00:01:49 +0000
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
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446">bug 10044=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
petersaints&#64;gmail.com" title=3D"Pedro Albuquerque Santos &lt;petersaint=
s&#64;gmail.com&gt;"> <span class=3D"fn">Pedro Albuquerque Santos</span></a>
</span></b>
        <pre>I have the same problem on an ASUS GL502VM with a GTX 1060 6GB=
. UNFORTUNATELY
this laptop shipped with G-SYNC enabled, which means that the Intel GPU is
completely disabled and everything goes through/is controlled by the NVIDIA
GPU. I would rather have no G-SYNC but having the Intel GPU driving the dis=
play
output and backlight. I'm sure that it would be a much less painful experie=
nce.

Well... Enough with ranting! Since you suggested that this may have been fi=
xed
by a recent kernel update, I have tested a Fedora 28 Workstation Live Image
that comes with the 4.16rc6 kernel. But the problem persists.

From what I could understand, even if the 4.16 corrects the underlying issu=
e,
the nouveau driver still needs to be changed and manually recompiled as
suggested by the OP because backlight support for Pascal-based cards is not
enabled by that switch statement. The &quot;NV_DEVICE_INFO_V0_PASCAL&quot; =
clause is
missing in the &quot;nvidia_backlight.c&quot; file. Is this assessment corr=
ect?

Also, feel free to ask me for any further information that may help you to
fully support backlight control for Pascal GPUs. I may need some instructio=
ns
on how to gather some lower level information, but I'll gladly do it if you
think that it may help.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15227137090.1f3E9F.28912--

--===============0179009457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0179009457==--
