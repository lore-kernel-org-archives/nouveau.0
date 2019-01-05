From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103721] [GM107] Frequent freezes with nouveau on
 Thinkpad P50
Date: Sat, 05 Jan 2019 23:41:00 +0000
Message-ID: <bug-103721-8800-RrgvhRKYxw@http.bugs.freedesktop.org/>
References: <bug-103721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0529810992=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103721-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0529810992==
Content-Type: multipart/alternative; boundary="15467316604.DaFBaB.21573"
Content-Transfer-Encoding: 7bit


--15467316604.DaFBaB.21573
Date: Sat, 5 Jan 2019 23:41:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103721

--- Comment #14 from kenorb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Pasting relevant info from freeze-20180116-drm.debug.log, so it's easier to
find.

[drm:drm_mode_addfb2 [drm]] [FB:90]
00a0 2 nv50_base_ntfy_set
        00000120
        f0000000
0084 1 nv50_base_image_set
        00000010
00c0 1 nv50_base_image_set
        fb0000fe
0400 5 nv50_base_image_set
        000f6c00
        00000000
        04380780
        00007804
        0000cf00
0080 1 nv50_base_update
        00000000
nouveau 0000:01:00.0: fifo: read fault at aa8e32b000 engine 00 [GR] client =
0d
[GPC0/GCC] reason 00 [PDE] on channel 6 [007f287000 Xorg[2795]]
nouveau 0000:01:00.0: fifo: channel 6: killed
nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:01:00.0: Xorg[2795]: channel 6 killed!
[drm:drm_mode_addfb2 [drm]] [FB:93]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15467316604.DaFBaB.21573
Date: Sat, 5 Jan 2019 23:41:00 +0000
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
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721">bug 10372=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kenorb&#64;gmail.com" title=3D"kenorb&#64;gmail.com">kenorb&#64;gmail.com</=
a>
</span></b>
        <pre>Pasting relevant info from freeze-20180116-drm.debug.log, so i=
t's easier to
find.

[drm:drm_mode_addfb2 [drm]] [FB:90]
00a0 2 nv50_base_ntfy_set
        00000120
        f0000000
0084 1 nv50_base_image_set
        00000010
00c0 1 nv50_base_image_set
        fb0000fe
0400 5 nv50_base_image_set
        000f6c00
        00000000
        04380780
        00007804
        0000cf00
0080 1 nv50_base_update
        00000000
nouveau 0000:01:00.0: fifo: read fault at aa8e32b000 engine 00 [GR] client =
0d
[GPC0/GCC] reason 00 [PDE] on channel 6 [007f287000 Xorg[2795]]
nouveau 0000:01:00.0: fifo: channel 6: killed
nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:01:00.0: Xorg[2795]: channel 6 killed!
[drm:drm_mode_addfb2 [drm]] [FB:93]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15467316604.DaFBaB.21573--

--===============0529810992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0529810992==--
