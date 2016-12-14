From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99068] Screen hangs when running a 3D app. GTX 660
Date: Wed, 14 Dec 2016 21:45:39 +0000
Message-ID: <bug-99068-8800-rLiVcUU3hP@http.bugs.freedesktop.org/>
References: <bug-99068-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0731460565=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99068-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0731460565==
Content-Type: multipart/alternative; boundary="14817519390.dFA0d7ee6.32446";
 charset="UTF-8"


--14817519390.dFA0d7ee6.32446
Date: Wed, 14 Dec 2016 21:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99068

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Nicol=C3=A1s Luciano B=C3=A9rtolo from comment #5)
> I ran the mmiotrace, extracted the files using the script provided, renam=
ed
> them to their correct name and rebuilt the initramfs.
>=20
> I can't get it to load the firmware. This is the error message I get:
>=20
> [    4.908199] fb: switching to nouveaufb from EFI VGA
> [    4.908585] nouveau 0000:01:00.0: NVIDIA GK106 (0e6000a1)
> [    5.042663] nouveau 0000:01:00.0: bios: version 80.06.10.00.3d
> [    5.043341] nouveau 0000:01:00.0: loading
> /lib/firmware/nvidia/gk106/fecs_inst.bin failed with error -22
> [    5.043342] nouveau 0000:01:00.0: Direct firmware load for
> nvidia/gk106/fecs_inst.bin failed with error -22

The file isn't there. Make sure that it is. (At the time the nouveau module
loads. So if e.g. nouveau loads from the initrd, it needs to be in the init=
rd.
If it's built-in, it needs to be in the kernel's extra firmware list.)

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14817519390.dFA0d7ee6.32446
Date: Wed, 14 Dec 2016 21:45:39 +0000
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
   title=3D"NEW - Screen hangs when running a 3D app. GTX 660"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99068#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen hangs when running a 3D app. GTX 660"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99068">bug 99068<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Nicol=C3=A1s Luciano B=C3=A9rtolo from <a href=3D=
"show_bug.cgi?id=3D99068#c5">comment #5</a>)
<span class=3D"quote">&gt; I ran the mmiotrace, extracted the files using t=
he script provided, renamed
&gt; them to their correct name and rebuilt the initramfs.
&gt;=20
&gt; I can't get it to load the firmware. This is the error message I get:
&gt;=20
&gt; [    4.908199] fb: switching to nouveaufb from EFI VGA
&gt; [    4.908585] nouveau 0000:01:00.0: NVIDIA GK106 (0e6000a1)
&gt; [    5.042663] nouveau 0000:01:00.0: bios: version 80.06.10.00.3d
&gt; [    5.043341] nouveau 0000:01:00.0: loading
&gt; /lib/firmware/nvidia/gk106/fecs_inst.bin failed with error -22
&gt; [    5.043342] nouveau 0000:01:00.0: Direct firmware load for
&gt; nvidia/gk106/fecs_inst.bin failed with error -22</span >

The file isn't there. Make sure that it is. (At the time the nouveau module
loads. So if e.g. nouveau loads from the initrd, it needs to be in the init=
rd.
If it's built-in, it needs to be in the kernel's extra firmware list.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14817519390.dFA0d7ee6.32446--

--===============0731460565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0731460565==--
