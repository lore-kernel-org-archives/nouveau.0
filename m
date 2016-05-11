From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95334] GM107 with 2560x1440 display on HDMI selects
 suboptimal resolution 1920x1080
Date: Wed, 11 May 2016 12:41:56 +0000
Message-ID: <bug-95334-8800-wRn3eCHZ84@http.bugs.freedesktop.org/>
References: <bug-95334-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1637372208=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95334-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1637372208==
Content-Type: multipart/alternative; boundary="14629705161.53eC.30629";
 charset="UTF-8"


--14629705161.53eC.30629
Date: Wed, 11 May 2016 12:41:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95334

--- Comment #12 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
Hi,

This is likely caused by the hdmi clock restrictions in the nouveau kernel
driver, which are fixed by this commit:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=3D1a0c96c075bb4517d4ce4fb6750ee0a3cf38714c

Which is available in the 4.5 (and later) kernels, can you please upgrade y=
our
kernel to 4.5 and try again?

Regards,

Hans

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14629705161.53eC.30629
Date: Wed, 11 May 2016 12:41:56 +0000
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
   title=3D"NEW - GM107 with 2560x1440 display on HDMI selects suboptimal r=
esolution 1920x1080"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95334#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GM107 with 2560x1440 display on HDMI selects suboptimal r=
esolution 1920x1080"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95334">bug 95334<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jwrdegoede&#64;fedoraproject.org" title=3D"Hans de Goede &lt;jwrdegoede&#64=
;fedoraproject.org&gt;"> <span class=3D"fn">Hans de Goede</span></a>
</span></b>
        <pre>Hi,

This is likely caused by the hdmi clock restrictions in the nouveau kernel
driver, which are fixed by this commit:
<a href=3D"https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/=
commit/?id=3D1a0c96c075bb4517d4ce4fb6750ee0a3cf38714c">https://git.kernel.o=
rg/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3D1a0c96c075bb4517d4=
ce4fb6750ee0a3cf38714c</a>

Which is available in the 4.5 (and later) kernels, can you please upgrade y=
our
kernel to 4.5 and try again?

Regards,

Hans</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14629705161.53eC.30629--

--===============1637372208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1637372208==--
