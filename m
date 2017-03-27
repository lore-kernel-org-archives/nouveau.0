From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
Date: Mon, 27 Mar 2017 17:21:53 +0000
Message-ID: <bug-98386-8800-0fwLIl0mjM@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0169372071=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0169372071==
Content-Type: multipart/alternative; boundary="14906353130.842D.4801";
 charset="UTF-8"


--14906353130.842D.4801
Date: Mon, 27 Mar 2017 17:21:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #5 from Bob Bugzilla <bugzilla-QDUPAvFnyULR7s880joybQ@public.gmane.org> ---
Created attachment 130485
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130485&action=3Dedit
dmesg output

[  383.017431] nouveau 0000:02:00.0: DRM: evicting buffers...
[  383.017436] nouveau 0000:02:00.0: DRM: waiting for kernel channels to go
idle...
[  383.017485] nouveau 0000:02:00.0: DRM: suspending client object trees...
[  383.023473] nouveau 0000:02:00.0: DRM: suspending kernel object tree...
[  467.070587] nouveau 0000:02:00.0: DRM: resuming kernel object tree...
[  467.386991] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[  467.408872] nouveau 0000:02:00.0: DRM: resuming client object trees...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14906353130.842D.4801
Date: Mon, 27 Mar 2017 17:21:53 +0000
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
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bugzilla&#64;scrunch.net" title=3D"Bob Bugzilla &lt;bugzilla&#64;scrunch.ne=
t&gt;"> <span class=3D"fn">Bob Bugzilla</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130485=
" name=3D"attach_130485" title=3D"dmesg output">attachment 130485</a> <a hr=
ef=3D"attachment.cgi?id=3D130485&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

[  383.017431] nouveau 0000:02:00.0: DRM: evicting buffers...
[  383.017436] nouveau 0000:02:00.0: DRM: waiting for kernel channels to go
idle...
[  383.017485] nouveau 0000:02:00.0: DRM: suspending client object trees...
[  383.023473] nouveau 0000:02:00.0: DRM: suspending kernel object tree...
[  467.070587] nouveau 0000:02:00.0: DRM: resuming kernel object tree...
[  467.386991] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[  467.408872] nouveau 0000:02:00.0: DRM: resuming client object trees...</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14906353130.842D.4801--

--===============0169372071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0169372071==--
