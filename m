From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Wed, 04 Nov 2015 00:24:14 +0000
Message-ID: <bug-70354-8800-dhBs0lW0d9@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0382458047=="
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


--===============0382458047==
Content-Type: multipart/alternative; boundary="1446596654.eF86bc1.23958"; charset="UTF-8"


--1446596654.eF86bc1.23958
Date: Wed, 4 Nov 2015 00:24:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #84 from Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I think I now why the workaround is no applied, it is because it is only for
NVE4, 6 and 7. And my GT 750M seems to be threatened as "NVC0 (GF100)    
GeForce GTX (465, 470, 480, 480M) Quadro 4000, 5000[M] (??), 6000". See
http://nouveau.freedesktop.org/wiki/CodeNames/.

Indeed it fails in gf100.c:1478/gf100_gr_init_ctxctl (i.e. GF100) instead of
going to gk104.c (i.e. NVE4 GK104, or NVE7 GK107) where the War00C800 is
handled.

Or maybe this is an expected behavior since I am not trying to use this graphic
card (GT 750M) for X11 but only for HW decoding. (the other graphic card, intel
is set to be used by the X11). 

When running LIBVA_DRIVER_NAME=gallium vainfo --display drm
It hits "case 0xe0: obj_class = NVE4_P2MF_CLASS;" in nvc0_screen_create

#0  abi16_engobj (obj=0x613d20) at abi16.c:109
#1  0x00007ffff4163165 in nouveau_object_new (parent=parent@entry=0x613750,
handle=handle@entry=3203347007, oclass=41024, 
    data=data@entry=0x0, length=8, length@entry=0, pobj=pobj@entry=0x613728) at
nouveau.c:295
#2  0x00007ffff50ab4c9 in nvc0_screen_create (dev=0x6131e0) at
nvc0/nvc0_screen.c:722
#3  0x00007ffff4fb9d59 in nouveau_drm_screen_create (fd=fd@entry=3) at
nouveau_drm_winsys.c:119
#4  0x00007ffff4e59944 in pipe_nouveau_create_screen (fd=3)
    at ../../../../src/gallium/auxiliary/target-helpers/inline_drm_helper.h:171
#5  dd_create_screen (fd=fd@entry=3) at
../../../../src/gallium/auxiliary/target-helpers/inline_drm_helper.h:392
#6  0x00007ffff4e5a71e in __vaDriverInit_0_38 (ctx=0x604030) at context.c:152
#7  0x00007ffff7bc10e8 in va_openDriver (dpy=dpy@entry=0x604220,
driver_name=<optimised out>) at va.c:296
#8  0x00007ffff7bc1fab in vaInitialize (dpy=dpy@entry=0x604220,
major_version=major_version@entry=0x7fffffffb820, 
    minor_version=minor_version@entry=0x7fffffffb824) at va.c:559
#9  0x00000000004015d0 in main (argc=1, argv=0x7fffffffb978) at vainfo.c:116
(gdb) n
118        dev = nouveau_object_find(obj, NOUVEAU_DEVICE_CLASS);
(gdb) n
109    {
(gdb) n
111            .channel = obj->parent->handle,
(gdb) n
110        struct drm_nouveau_grobj_alloc req = {
(gdb) n
118        dev = nouveau_object_find(obj, NOUVEAU_DEVICE_CLASS);
(gdb) n
119        ret = drmCommandWrite(dev->fd, DRM_NOUVEAU_GROBJ_ALLOC,
(gdb) n
121        if (ret)
(gdb) n
126    }
(gdb) n
nouveau_object_new (parent=parent@entry=0x613750,
handle=handle@entry=3203347007, oclass=41024, data=data@entry=0x0, 
    length=<optimised out>, length@entry=0, pobj=pobj@entry=0x613728) at
nouveau.c:296
296                break;
(gdb) n
302        if (ret) {
(gdb) n
303            free(obj);
(gdb) n
309    }
(gdb) n
304            return ret;
(gdb) n
309    }
(gdb) n
nvc0_screen_create (dev=0x6131e0) at nvc0/nvc0_screen.c:724
724       if (ret)
(gdb) n
725          FAIL_SCREEN_INIT("Error allocating PGRAPH context for M2MF: %d\n",
ret);
(gdb) 
ret is -16

Any idea ? Thx

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446596654.eF86bc1.23958
Date: Wed, 4 Nov 2015 00:24:14 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c84">Comment # 84</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:julien.isorce&#64;gmail.com" title="Julien Isorce &lt;julien.isorce&#64;gmail.com&gt;"> <span class="fn">Julien Isorce</span></a>
</span></b>
        <pre>I think I now why the workaround is no applied, it is because it is only for
NVE4, 6 and 7. And my GT 750M seems to be threatened as &quot;NVC0 (GF100)    
GeForce GTX (465, 470, 480, 480M) Quadro 4000, 5000[M] (??), 6000&quot;. See
<a href="http://nouveau.freedesktop.org/wiki/CodeNames/">http://nouveau.freedesktop.org/wiki/CodeNames/</a>.

Indeed it fails in gf100.c:1478/gf100_gr_init_ctxctl (i.e. GF100) instead of
going to gk104.c (i.e. NVE4 GK104, or NVE7 GK107) where the War00C800 is
handled.

Or maybe this is an expected behavior since I am not trying to use this graphic
card (GT 750M) for X11 but only for HW decoding. (the other graphic card, intel
is set to be used by the X11). 

When running LIBVA_DRIVER_NAME=gallium vainfo --display drm
It hits &quot;case 0xe0: obj_class = NVE4_P2MF_CLASS;&quot; in nvc0_screen_create

#0  abi16_engobj (obj=0x613d20) at abi16.c:109
#1  0x00007ffff4163165 in nouveau_object_new (parent=parent&#64;entry=0x613750,
handle=handle&#64;entry=3203347007, oclass=41024, 
    data=data&#64;entry=0x0, length=8, length&#64;entry=0, pobj=pobj&#64;entry=0x613728) at
nouveau.c:295
#2  0x00007ffff50ab4c9 in nvc0_screen_create (dev=0x6131e0) at
nvc0/nvc0_screen.c:722
#3  0x00007ffff4fb9d59 in nouveau_drm_screen_create (fd=fd&#64;entry=3) at
nouveau_drm_winsys.c:119
#4  0x00007ffff4e59944 in pipe_nouveau_create_screen (fd=3)
    at ../../../../src/gallium/auxiliary/target-helpers/inline_drm_helper.h:171
#5  dd_create_screen (fd=fd&#64;entry=3) at
../../../../src/gallium/auxiliary/target-helpers/inline_drm_helper.h:392
#6  0x00007ffff4e5a71e in __vaDriverInit_0_38 (ctx=0x604030) at context.c:152
#7  0x00007ffff7bc10e8 in va_openDriver (dpy=dpy&#64;entry=0x604220,
driver_name=&lt;optimised out&gt;) at va.c:296
#8  0x00007ffff7bc1fab in vaInitialize (dpy=dpy&#64;entry=0x604220,
major_version=major_version&#64;entry=0x7fffffffb820, 
    minor_version=minor_version&#64;entry=0x7fffffffb824) at va.c:559
#9  0x00000000004015d0 in main (argc=1, argv=0x7fffffffb978) at vainfo.c:116
(gdb) n
118        dev = nouveau_object_find(obj, NOUVEAU_DEVICE_CLASS);
(gdb) n
109    {
(gdb) n
111            .channel = obj-&gt;parent-&gt;handle,
(gdb) n
110        struct drm_nouveau_grobj_alloc req = {
(gdb) n
118        dev = nouveau_object_find(obj, NOUVEAU_DEVICE_CLASS);
(gdb) n
119        ret = drmCommandWrite(dev-&gt;fd, DRM_NOUVEAU_GROBJ_ALLOC,
(gdb) n
121        if (ret)
(gdb) n
126    }
(gdb) n
nouveau_object_new (parent=parent&#64;entry=0x613750,
handle=handle&#64;entry=3203347007, oclass=41024, data=data&#64;entry=0x0, 
    length=&lt;optimised out&gt;, length&#64;entry=0, pobj=pobj&#64;entry=0x613728) at
nouveau.c:296
296                break;
(gdb) n
302        if (ret) {
(gdb) n
303            free(obj);
(gdb) n
309    }
(gdb) n
304            return ret;
(gdb) n
309    }
(gdb) n
nvc0_screen_create (dev=0x6131e0) at nvc0/nvc0_screen.c:724
724       if (ret)
(gdb) n
725          FAIL_SCREEN_INIT(&quot;Error allocating PGRAPH context for M2MF: %d\n&quot;,
ret);
(gdb) 
ret is -16

Any idea ? Thx</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446596654.eF86bc1.23958--

--===============0382458047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0382458047==--
