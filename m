From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Sun, 18 Oct 2015 23:27:13 +0000
Message-ID: <bug-70354-8800-zfRJaxUuAB@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1338366611=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1338366611==
Content-Type: multipart/alternative; boundary="1445210833.D4Af1.8233"; charset="UTF-8"


--1445210833.D4Af1.8233
Date: Sun, 18 Oct 2015 23:27:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #66 from Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi, I have a laptop with 2 graphics cards, one intel and one GeForce GT 750 M.
My gnome desktop use the former by default. And when trying to use nouveau I
got the same problem exposed in this bug.
Actually I am interesting in using the nouveau driver for HW decoding.

With the nouveau branch in darktama repo I could have it working with headless
display (using DRM). Though it looks not stable in the sense it sometimes works
after loading the kernel module nouveau.ko freshly built. And sometimes not.
And it seems not robust to init/deinit several times.
But better than nothing so it is still great !

I have noticed this error in kern.log:
t 19 00:05:02 nb-716 kernel: [  737.034566] nouveau 0000:01:00.0: DRM: resuming
kernel object tree...
Oct 19 00:05:02 nb-716 kernel: [  737.111653] nouveau 0000:01:00.0: bus: MMIO
read of 00000000 FAULT at 085048 [ IBUS ]
Oct 19 00:05:03 nb-716 kernel: [  737.177696] nouveau 0000:01:00.0: DRM:
resuming client object trees...
Oct 19 00:05:05 nb-716 kernel: [  739.336600] nouveau 0000:01:00.0: timeout at
/home/julien/gst/master/nouveau/drm/nouveau/nvkm/engine/gr/gf100.c:1479/gf100_gr_init_ctxctl()!
Oct 19 00:05:05 nb-716 kernel: [  739.336608] nouveau 0000:01:00.0: gr: 409000
- done 00000220
Oct 19 00:05:05 nb-716 kernel: [  739.336619] nouveau 0000:01:00.0: gr: 409000
- stat 00000000 00000000 00000000 00000000
Oct 19 00:05:05 nb-716 kernel: [  739.336629] nouveau 0000:01:00.0: gr: 409000
- stat 00000000 00000000 00000006 00000001
Oct 19 00:05:05 nb-716 kernel: [  739.336633] nouveau 0000:01:00.0: gr: 502000
- done 00000300
Oct 19 00:05:05 nb-716 kernel: [  739.336638] nouveau 0000:01:00.0: gr: 502000
- stat 00000000 00008c00 00000000 00000000
Oct 19 00:05:05 nb-716 kernel: [  739.336643] nouveau 0000:01:00.0: gr: 502000
- stat 00000000 00000000 00000000 00000000
Oct 19 00:05:05 nb-716 kernel: [  739.336645] nouveau 0000:01:00.0: gr: init
failed, -16
Oct 19 00:05:07 nb-716 kernel: [  741.514997] nouveau 0000:01:00.0: timeout at
/home/julien/gst/master/nouveau/drm/nouveau/nvkm/engine/gr/gf100.c:1479/gf100_gr_init_ctxctl()!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445210833.D4Af1.8233
Date: Sun, 18 Oct 2015 23:27:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c66">Comment # 66</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:julien.isorce&#64;gmail.com" title="Julien Isorce &lt;julien.isorce&#64;gmail.com&gt;"> <span class="fn">Julien Isorce</span></a>
</span></b>
        <pre>Hi, I have a laptop with 2 graphics cards, one intel and one GeForce GT 750 M.
My gnome desktop use the former by default. And when trying to use nouveau I
got the same problem exposed in this bug.
Actually I am interesting in using the nouveau driver for HW decoding.

With the nouveau branch in darktama repo I could have it working with headless
display (using DRM). Though it looks not stable in the sense it sometimes works
after loading the kernel module nouveau.ko freshly built. And sometimes not.
And it seems not robust to init/deinit several times.
But better than nothing so it is still great !

I have noticed this error in kern.log:
t 19 00:05:02 nb-716 kernel: [  737.034566] nouveau 0000:01:00.0: DRM: resuming
kernel object tree...
Oct 19 00:05:02 nb-716 kernel: [  737.111653] nouveau 0000:01:00.0: bus: MMIO
read of 00000000 FAULT at 085048 [ IBUS ]
Oct 19 00:05:03 nb-716 kernel: [  737.177696] nouveau 0000:01:00.0: DRM:
resuming client object trees...
Oct 19 00:05:05 nb-716 kernel: [  739.336600] nouveau 0000:01:00.0: timeout at
/home/julien/gst/master/nouveau/drm/nouveau/nvkm/engine/gr/gf100.c:1479/gf100_gr_init_ctxctl()!
Oct 19 00:05:05 nb-716 kernel: [  739.336608] nouveau 0000:01:00.0: gr: 409000
- done 00000220
Oct 19 00:05:05 nb-716 kernel: [  739.336619] nouveau 0000:01:00.0: gr: 409000
- stat 00000000 00000000 00000000 00000000
Oct 19 00:05:05 nb-716 kernel: [  739.336629] nouveau 0000:01:00.0: gr: 409000
- stat 00000000 00000000 00000006 00000001
Oct 19 00:05:05 nb-716 kernel: [  739.336633] nouveau 0000:01:00.0: gr: 502000
- done 00000300
Oct 19 00:05:05 nb-716 kernel: [  739.336638] nouveau 0000:01:00.0: gr: 502000
- stat 00000000 00008c00 00000000 00000000
Oct 19 00:05:05 nb-716 kernel: [  739.336643] nouveau 0000:01:00.0: gr: 502000
- stat 00000000 00000000 00000000 00000000
Oct 19 00:05:05 nb-716 kernel: [  739.336645] nouveau 0000:01:00.0: gr: init
failed, -16
Oct 19 00:05:07 nb-716 kernel: [  741.514997] nouveau 0000:01:00.0: timeout at
/home/julien/gst/master/nouveau/drm/nouveau/nvkm/engine/gr/gf100.c:1479/gf100_gr_init_ctxctl()!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445210833.D4Af1.8233--

--===============1338366611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1338366611==--
