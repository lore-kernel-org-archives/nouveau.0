From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99354] [G71] "Assertion `bkref' failed" reproducible
 with glmark2
Date: Tue, 10 Jan 2017 22:44:56 +0000
Message-ID: <bug-99354-8800-wb4TwI7kvQ@http.bugs.freedesktop.org/>
References: <bug-99354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1945958390=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1945958390==
Content-Type: multipart/alternative; boundary="14840882960.4CAD.2231";
 charset="UTF-8"


--14840882960.4CAD.2231
Date: Tue, 10 Jan 2017 22:44:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99354

--- Comment #3 from Michele Ballabio <barra_cuda-KK0ffGbhmjU@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #2)
> Does running the apitrace in question cause the assert to happen?

Yes it does:

apitrace replay apitrace.out

[...]

glretrace: pushbuf.c:238: pushbuf_krel: Assertion `bkref' failed.
apitrace: warning: caught signal 6
16922: error: caught an unhandled exception
glretrace+0x2b391d
glretrace+0x2b3116
glretrace+0x2b132c
linux-gate.so.1+0xb3b
/lib/libc.so.6: gsignal+0xbd
/lib/libc.so.6: abort+0x16c
/lib/libc.so.6+0x27eb4
/lib/libc.so.6: __assert_fail+0x57
/usr/lib/libdrm_nouveau.so.2: pushbuf_krel+0x3ce3:
/tmp/libdrm-2.4.74/nouveau/pushbuf.c:238
/usr/lib/libdrm_nouveau.so.2: nouveau_pushbuf_reloc+0x44:
/tmp/libdrm-2.4.74/nouveau/pushbuf.c:746
/usr/lib/xorg/modules/dri/nouveau_dri.so: PUSH_RELOC+0x541f38:
./nv30/nv30_winsys.h:26
/usr/lib/xorg/modules/dri/nouveau_dri.so: nv30_transfer_copy_data+0x544701:
nv30/nv30_transfer.c:740
/usr/lib/xorg/modules/dri/nouveau_dri.so: nouveau_transfer_write+0x528d0c:
/tmp/mesa-13.0.3/src/gallium/drivers/nouveau/nouveau_buffer.c:211
/usr/lib/xorg/modules/dri/nouveau_dri.so:
nouveau_buffer_transfer_unmap+0x52976e:
/tmp/mesa-13.0.3/src/gallium/drivers/nouveau/nouveau_buffer.c:544
/usr/lib/xorg/modules/dri/nouveau_dri.so: u_transfer_unmap_vtbl+0x4526ad:
util/u_transfer.c:154
/usr/lib/xorg/modules/dri/nouveau_dri.so: pipe_transfer_unmap+0x452321:
./util/u_inlines.h:457
/usr/lib/xorg/modules/dri/nouveau_dri.so: u_default_buffer_subdata+0x4523eb:
util/u_transfer.c:35
/usr/lib/xorg/modules/dri/nouveau_dri.so: pipe_buffer_write+0x235686:
../../src/gallium/auxiliary/util/u_inlines.h:345
/usr/lib/xorg/modules/dri/nouveau_dri.so: st_bufferobj_subdata+0x235836:
state_tracker/st_cb_bufferobjects.c:132
/usr/lib/xorg/modules/dri/nouveau_dri.so: _mesa_buffer_sub_data+0x5ff8d:
main/bufferobj.c:1804
/usr/lib/xorg/modules/dri/nouveau_dri.so: _mesa_BufferSubData+0x60015:
main/bufferobj.c:1818
glretrace+0x142273
glretrace+0x93096
glretrace+0x84afc
glretrace+0x86cfc
glretrace+0x86c6f
glretrace+0x84e46
glretrace+0x85013
glretrace+0x85a7f
/lib/libc.so.6: __libc_start_main+0x106
glretrace+0x81ba0: ../sysdeps/i386/start.S:115
apitrace: info: taking default action for signal 6

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14840882960.4CAD.2231
Date: Tue, 10 Jan 2017 22:44:56 +0000
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
   title=3D"NEW - [G71] &quot;Assertion `bkref' failed&quot; reproducible w=
ith glmark2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99354#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [G71] &quot;Assertion `bkref' failed&quot; reproducible w=
ith glmark2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99354">bug 99354<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
barra_cuda&#64;gmx.com" title=3D"Michele Ballabio &lt;barra_cuda&#64;gmx.co=
m&gt;"> <span class=3D"fn">Michele Ballabio</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D993=
54#c2">comment #2</a>)
<span class=3D"quote">&gt; Does running the apitrace in question cause the =
assert to happen?</span >

Yes it does:

apitrace replay apitrace.out

[...]

glretrace: pushbuf.c:238: pushbuf_krel: Assertion `bkref' failed.
apitrace: warning: caught signal 6
16922: error: caught an unhandled exception
glretrace+0x2b391d
glretrace+0x2b3116
glretrace+0x2b132c
linux-gate.so.1+0xb3b
/lib/libc.so.6: gsignal+0xbd
/lib/libc.so.6: abort+0x16c
/lib/libc.so.6+0x27eb4
/lib/libc.so.6: __assert_fail+0x57
/usr/lib/libdrm_nouveau.so.2: pushbuf_krel+0x3ce3:
/tmp/libdrm-2.4.74/nouveau/pushbuf.c:238
/usr/lib/libdrm_nouveau.so.2: nouveau_pushbuf_reloc+0x44:
/tmp/libdrm-2.4.74/nouveau/pushbuf.c:746
/usr/lib/xorg/modules/dri/nouveau_dri.so: PUSH_RELOC+0x541f38:
./nv30/nv30_winsys.h:26
/usr/lib/xorg/modules/dri/nouveau_dri.so: nv30_transfer_copy_data+0x544701:
nv30/nv30_transfer.c:740
/usr/lib/xorg/modules/dri/nouveau_dri.so: nouveau_transfer_write+0x528d0c:
/tmp/mesa-13.0.3/src/gallium/drivers/nouveau/nouveau_buffer.c:211
/usr/lib/xorg/modules/dri/nouveau_dri.so:
nouveau_buffer_transfer_unmap+0x52976e:
/tmp/mesa-13.0.3/src/gallium/drivers/nouveau/nouveau_buffer.c:544
/usr/lib/xorg/modules/dri/nouveau_dri.so: u_transfer_unmap_vtbl+0x4526ad:
util/u_transfer.c:154
/usr/lib/xorg/modules/dri/nouveau_dri.so: pipe_transfer_unmap+0x452321:
./util/u_inlines.h:457
/usr/lib/xorg/modules/dri/nouveau_dri.so: u_default_buffer_subdata+0x4523eb:
util/u_transfer.c:35
/usr/lib/xorg/modules/dri/nouveau_dri.so: pipe_buffer_write+0x235686:
../../src/gallium/auxiliary/util/u_inlines.h:345
/usr/lib/xorg/modules/dri/nouveau_dri.so: st_bufferobj_subdata+0x235836:
state_tracker/st_cb_bufferobjects.c:132
/usr/lib/xorg/modules/dri/nouveau_dri.so: _mesa_buffer_sub_data+0x5ff8d:
main/bufferobj.c:1804
/usr/lib/xorg/modules/dri/nouveau_dri.so: _mesa_BufferSubData+0x60015:
main/bufferobj.c:1818
glretrace+0x142273
glretrace+0x93096
glretrace+0x84afc
glretrace+0x86cfc
glretrace+0x86c6f
glretrace+0x84e46
glretrace+0x85013
glretrace+0x85a7f
/lib/libc.so.6: __libc_start_main+0x106
glretrace+0x81ba0: ../sysdeps/i386/start.S:115
apitrace: info: taking default action for signal 6</pre>
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

--14840882960.4CAD.2231--

--===============1945958390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1945958390==--
