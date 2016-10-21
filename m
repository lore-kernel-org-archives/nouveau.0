From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96737] G98: DRM: GPU lockup ...
Date: Fri, 21 Oct 2016 19:17:53 +0000
Message-ID: <bug-96737-8800-wv2QYQhFtH@http.bugs.freedesktop.org/>
References: <bug-96737-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2142735753=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96737-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2142735753==
Content-Type: multipart/alternative; boundary="14770774730.51eAb5a27.714";
 charset="UTF-8"


--14770774730.51eAb5a27.714
Date: Fri, 21 Oct 2016 19:17:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96737

--- Comment #17 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
DRM: GPU lockup ...

=3D HW:
G98

=3D SW:
Linux 4.8.2
libdrm 2.4.71
X.Org X Server 1.18.4
lightdm 1.20.0
lightdm-gtk-greeter 2.0.2
xfce4-session 4.12.1-20160822git7c13689
xfwm4 4.12.3-20160823git2b08627

This is so far the worst outcome using nouveau,
after this system is practically unusable as Desktop,
hardware reset is required after the first Log Out.

=3D dmesg:
nouveau 0000:02:00.0: disp: ERROR 5 [INVALID_STATE] 0b [] chid 1 mthd 0080 =
data
00000000
nouveau 0000:02:00.0: disp: Base 1:
nouveau 0000:02:00.0: disp:     0084: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0088: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     008c: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0090: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0094: 00000000 -> f0000000
nouveau 0000:02:00.0: disp:     00a0: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00a4: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00c0: 00000000 -> ffff0000
nouveau 0000:02:00.0: disp:     00c4: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00c8: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00cc: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00e0: 40000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00e4: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00e8: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00ec: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00fc: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0100: fffe0000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0104: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0110: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0114: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp: Base 1 - Image 0:
nouveau 0000:02:00.0: disp:     0800: 0002e200 -> 00000500
nouveau 0000:02:00.0: disp:     0804: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0808: 04380780 -> 03000400
nouveau 0000:02:00.0: disp:     080c: 00007804 -> 00100800
nouveau 0000:02:00.0: disp:     0810: 0000cf00 -> 0000e800
nouveau 0000:02:00.0: disp: Base 1 - Image 1:
nouveau 0000:02:00.0: disp:     0c00: 0002e200 -> 00000500
nouveau 0000:02:00.0: disp:     0c04: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0c08: 04380780 -> 03000400
nouveau 0000:02:00.0: disp:     0c0c: 00007804 -> 00100800
nouveau 0000:02:00.0: disp:     0c10: 0000cf00 -> 0000e800
nouveau: evo channel stalled
nouveau 0000:02:00.0: DRM: GPU lockup - switching to software fbcon


=3D Xorg.log:
(EE) [mi] EQ overflowing.  Additional events will be discarded until existi=
ng
events are processed.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/libexec/Xorg (mieqEnqueue+0x253) [0x57cd33]
(EE) 1: /usr/libexec/Xorg (QueueKeyboardEvents+0x52) [0x44f2c2]
(EE) 2: /usr/libexec/Xorg (xf86PostKeyboardEvent+0x3b) [0x488a8b]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x2fb0)
[0x7fe3135e4a20]
(EE) 4: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x3695)
[0x7fe3135e5d15]
(EE) 5: /usr/libexec/Xorg (DPMSSupported+0xe8) [0x478d98]
(EE) 6: /usr/libexec/Xorg (xf86SerialModemClearBits+0x2b2) [0x49e0b2]
(EE) 7: /lib64/libc.so.6 (__restore_rt+0x0) [0x7fe31ed2276f]
(EE) 8: /lib64/libc.so.6 (ioctl+0x5) [0x7fe31ede6b65]
(EE) 9: /lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fe3200cf2b8]
(EE) 10: /lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fe3200d1e2b]
(EE) 11: /lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xc2) [0x7fe3198b31f2]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x20faa)
[0x7fe319aff17a]
(EE) 13: /usr/libexec/Xorg (xf86DetachAllCrtc+0xb3b) [0x4b21fb]
(EE) 14: /usr/libexec/Xorg (xf86DestroyCursorInfoRec+0xb6a) [0x4bc99a]
(EE) 15: /usr/libexec/Xorg (RamDacHandleColormaps+0x83a) [0x4bb1ea]
(EE) 16: /usr/libexec/Xorg (miPointerUpdateSprite+0x26b) [0x5862db]
(EE) 17: /usr/libexec/Xorg (miPointerUpdateSprite+0x4ba) [0x58697a]
(EE) 18: /usr/libexec/Xorg
(CompositeRegisterImplicitRedirectionException+0x42b9) [0x4cd289]
(EE) 19: /usr/libexec/Xorg (AddTraps+0x7810) [0x5205c0]
(EE) 20: /usr/libexec/Xorg (ConfineToShape+0x9a8) [0x440578]
(EE) 21: /usr/libexec/Xorg (WindowHasNewCursor+0x37) [0x441067]
(EE) 22: /usr/libexec/Xorg
(CompositeRegisterImplicitRedirectionException+0x3f20) [0x4ccc60]
(EE) 23: /usr/libexec/Xorg
(CompositeRegisterImplicitRedirectionException+0x4eda) [0x4cebda]
(EE) 24: /usr/libexec/Xorg (SendErrorToClient+0x2df) [0x436e2f]
(EE) 25: /usr/libexec/Xorg (remove_fs_handlers+0x463) [0x43ae63]
(EE) 26: /lib64/libc.so.6 (__libc_start_main+0xf1) [0x7fe31ed0e731]
(EE) 27: /usr/libexec/Xorg (_start+0x29) [0x424d59]
(EE) 28: ? (?+0x29) [0x29]
(EE)=20
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14770774730.51eAb5a27.714
Date: Fri, 21 Oct 2016 19:17:53 +0000
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
   title=3D"NEW - G98: DRM: GPU lockup ..."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96737#c17">Commen=
t # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - G98: DRM: GPU lockup ..."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96737">bug 96737<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pomidorabelisima&#64;gmail.com" title=3D"poma &lt;pomidorabelisima&#64;gmai=
l.com&gt;"> <span class=3D"fn">poma</span></a>
</span></b>
        <pre>DRM: GPU lockup ...

=3D HW:
G98

=3D SW:
Linux 4.8.2
libdrm 2.4.71
X.Org X Server 1.18.4
lightdm 1.20.0
lightdm-gtk-greeter 2.0.2
xfce4-session 4.12.1-20160822git7c13689
xfwm4 4.12.3-20160823git2b08627

This is so far the worst outcome using nouveau,
after this system is practically unusable as Desktop,
hardware reset is required after the first Log Out.

=3D dmesg:
nouveau 0000:02:00.0: disp: ERROR 5 [INVALID_STATE] 0b [] chid 1 mthd 0080 =
data
00000000
nouveau 0000:02:00.0: disp: Base 1:
nouveau 0000:02:00.0: disp:     0084: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0088: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     008c: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0090: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0094: 00000000 -&gt; f0000000
nouveau 0000:02:00.0: disp:     00a0: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00a4: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00c0: 00000000 -&gt; ffff0000
nouveau 0000:02:00.0: disp:     00c4: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00c8: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00cc: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00e0: 40000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00e4: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00e8: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00ec: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     00fc: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0100: fffe0000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0104: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0110: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0114: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp: Base 1 - Image 0:
nouveau 0000:02:00.0: disp:     0800: 0002e200 -&gt; 00000500
nouveau 0000:02:00.0: disp:     0804: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0808: 04380780 -&gt; 03000400
nouveau 0000:02:00.0: disp:     080c: 00007804 -&gt; 00100800
nouveau 0000:02:00.0: disp:     0810: 0000cf00 -&gt; 0000e800
nouveau 0000:02:00.0: disp: Base 1 - Image 1:
nouveau 0000:02:00.0: disp:     0c00: 0002e200 -&gt; 00000500
nouveau 0000:02:00.0: disp:     0c04: 00000000=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
nouveau 0000:02:00.0: disp:     0c08: 04380780 -&gt; 03000400
nouveau 0000:02:00.0: disp:     0c0c: 00007804 -&gt; 00100800
nouveau 0000:02:00.0: disp:     0c10: 0000cf00 -&gt; 0000e800
nouveau: evo channel stalled
nouveau 0000:02:00.0: DRM: GPU lockup - switching to software fbcon


=3D Xorg.log:
(EE) [mi] EQ overflowing.  Additional events will be discarded until existi=
ng
events are processed.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/libexec/Xorg (mieqEnqueue+0x253) [0x57cd33]
(EE) 1: /usr/libexec/Xorg (QueueKeyboardEvents+0x52) [0x44f2c2]
(EE) 2: /usr/libexec/Xorg (xf86PostKeyboardEvent+0x3b) [0x488a8b]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x2fb0)
[0x7fe3135e4a20]
(EE) 4: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x3695)
[0x7fe3135e5d15]
(EE) 5: /usr/libexec/Xorg (DPMSSupported+0xe8) [0x478d98]
(EE) 6: /usr/libexec/Xorg (xf86SerialModemClearBits+0x2b2) [0x49e0b2]
(EE) 7: /lib64/libc.so.6 (__restore_rt+0x0) [0x7fe31ed2276f]
(EE) 8: /lib64/libc.so.6 (ioctl+0x5) [0x7fe31ede6b65]
(EE) 9: /lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fe3200cf2b8]
(EE) 10: /lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fe3200d1e2b]
(EE) 11: /lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xc2) [0x7fe3198b31f2]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x20faa)
[0x7fe319aff17a]
(EE) 13: /usr/libexec/Xorg (xf86DetachAllCrtc+0xb3b) [0x4b21fb]
(EE) 14: /usr/libexec/Xorg (xf86DestroyCursorInfoRec+0xb6a) [0x4bc99a]
(EE) 15: /usr/libexec/Xorg (RamDacHandleColormaps+0x83a) [0x4bb1ea]
(EE) 16: /usr/libexec/Xorg (miPointerUpdateSprite+0x26b) [0x5862db]
(EE) 17: /usr/libexec/Xorg (miPointerUpdateSprite+0x4ba) [0x58697a]
(EE) 18: /usr/libexec/Xorg
(CompositeRegisterImplicitRedirectionException+0x42b9) [0x4cd289]
(EE) 19: /usr/libexec/Xorg (AddTraps+0x7810) [0x5205c0]
(EE) 20: /usr/libexec/Xorg (ConfineToShape+0x9a8) [0x440578]
(EE) 21: /usr/libexec/Xorg (WindowHasNewCursor+0x37) [0x441067]
(EE) 22: /usr/libexec/Xorg
(CompositeRegisterImplicitRedirectionException+0x3f20) [0x4ccc60]
(EE) 23: /usr/libexec/Xorg
(CompositeRegisterImplicitRedirectionException+0x4eda) [0x4cebda]
(EE) 24: /usr/libexec/Xorg (SendErrorToClient+0x2df) [0x436e2f]
(EE) 25: /usr/libexec/Xorg (remove_fs_handlers+0x463) [0x43ae63]
(EE) 26: /lib64/libc.so.6 (__libc_start_main+0xf1) [0x7fe31ed0e731]
(EE) 27: /usr/libexec/Xorg (_start+0x29) [0x424d59]
(EE) 28: ? (?+0x29) [0x29]
(EE)=20
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14770774730.51eAb5a27.714--

--===============2142735753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2142735753==--
