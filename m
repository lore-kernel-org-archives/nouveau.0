From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71438] [NV10/nouveau_vieux] Application Konqueror
 crashes when connecting to asus.com
Date: Sat, 09 Nov 2013 23:06:13 +0000
Message-ID: <bug-71438-8800-zeI2YtocTU@http.bugs.freedesktop.org/>
References: <bug-71438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1678692048=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1678692048==
Content-Type: multipart/alternative; boundary="1384038373.0EcabAC1.29197"; charset="us-ascii"


--1384038373.0EcabAC1.29197
Date: Sat, 9 Nov 2013 23:06:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71438

--- Comment #3 from B Kaye <bdk-kQW2Dzt44JA@public.gmane.org> ---
1. Dmesg output attached.

2. Kernel is :kernel-PAE.i686 3.11.6

3. Display resolution is 1920x1200

4. Video card : IBM Intellistation Graphics Card FRU IBM 25P6684 NVIDIA Quadro4
200NVS 64MB

5. xorg-x11-drv-nouveau.i686        1:1.0.9-1.fc19

6. mesa-dri-drivers.i686                 9.2-1.20130919.fc19
   mesa-filesystem.i686                  9.2-1.20130919.fc19
   mesa-libEGL.i686                       9.2-1.20130919.fc19
   mesa-libGL.i686                         9.2-1.20130919.fc19
   mesa-libGLU.i686                      9.0.0-2.fc19
   mesa-libgbm.i686                        9.2-1.20130919.fc19
   mesa-libglapi.i686                       9.2-1.20130919.fc19
   mesa-libwayland-egl.i686           9.2-1.20130919.fc19
   mesa-libxatracker.i686                9.2-1.20130919.fc19

7. OS  is Linux Fedora 19

8. System has 4GB memory.


________________________________
From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Sent: November-09-13 17:40
To: Brian Kaye
Subject: [Bug 71438] [NV10/nouveau_vieux] Application Konqueror crashes when
connecting to asus.com

Ilia Mirkin<mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed bug
71438<https://bugs.freedesktop.org/show_bug.cgi?id=71438>
What    Removed Added
Summary Application Konqueror crashes when connecting to asus.com      
[NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com

Comment # 1<https://bugs.freedesktop.org/show_bug.cgi?id=71438#c1> on bug
71438<https://bugs.freedesktop.org/show_bug.cgi?id=71438> from Ilia
Mirkin<mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

The relevant bit of the stacktrace:

#10 0x42834a87 in __assert_fail () from /lib/libc.so.6
#11 0xaf348070 in nouveau_scratch_init () from
/usr/lib/dri/nouveau_vieux_dri.so
#12 0xaf3436ed in nouveau_context_init () from
/usr/lib/dri/nouveau_vieux_dri.so
#13 0xaf34d811 in nv10_context_create () from /usr/lib/dri/nouveau_vieux_dri.so
#14 0xaf343abd in nouveau_context_create () from
/usr/lib/dri/nouveau_vieux_dri.so
#15 0xaf36045f in dri2CreateContextAttribs () from
/usr/lib/dri/nouveau_vieux_dri.so
#16 0xaf360638 in dri2CreateNewContext () from
/usr/lib/dri/nouveau_vieux_dri.so
#17 0xb4032024 in dri2_create_context () from /lib/libGL.so.1
#18 0xb400824a in CreateContext () from /lib/libGL.so.1
#19 0xb4008541 in glXCreateContext () from /lib/libGL.so.1

And the code in nouveau_scratch_init:

    for (i = 0; i < NOUVEAU_SCRATCH_COUNT; i++) {
        ret = nouveau_bo_new(context_dev(ctx), NOUVEAU_BO_GART |
                     NOUVEAU_BO_MAP, 0, NOUVEAU_SCRATCH_SIZE,
                     NULL, &scratch->bo[i]);
        assert(!ret);

Looks like it's trying to get 2 3MB bo's, but it can't. Unfortunately error
handling is often done rather poorly in the nouveau_vieux driver (via asserts
rather than returning error codes).

What card are you using? How much VRAM does it have? What resolution are you
running your screen at? What kernel are you on? What version of
xf86-video-nouveau and mesa are you using?

________________________________
You are receiving this mail because:

  *   You reported the bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384038373.0EcabAC1.29197
Date: Sat, 9 Nov 2013 23:06:13 +0000
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
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71438#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71438">bug 71438</a>
              from <span class="vcard"><a class="email" href="mailto:bdk&#64;unb.ca" title="B Kaye &lt;bdk&#64;unb.ca&gt;"> <span class="fn">B Kaye</span></a>
</span></b>
        <pre>1. Dmesg output attached.

2. Kernel is :kernel-PAE.i686 3.11.6

3. Display resolution is 1920x1200

4. Video card : IBM Intellistation Graphics Card FRU IBM 25P6684 NVIDIA Quadro4
200NVS 64MB

5. xorg-x11-drv-nouveau.i686        1:1.0.9-1.fc19

6. mesa-dri-drivers.i686                 9.2-1.20130919.fc19
   mesa-filesystem.i686                  9.2-1.20130919.fc19
   mesa-libEGL.i686                       9.2-1.20130919.fc19
   mesa-libGL.i686                         9.2-1.20130919.fc19
   mesa-libGLU.i686                      9.0.0-2.fc19
   mesa-libgbm.i686                        9.2-1.20130919.fc19
   mesa-libglapi.i686                       9.2-1.20130919.fc19
   mesa-libwayland-egl.i686           9.2-1.20130919.fc19
   mesa-libxatracker.i686                9.2-1.20130919.fc19

7. OS  is Linux Fedora 19

8. System has 4GB memory.


________________________________
From: <a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a> &lt;<a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt;
Sent: November-09-13 17:40
To: Brian Kaye
Subject: [<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="show_bug.cgi?id=71438">Bug 71438</a>] [NV10/nouveau_vieux] Application Konqueror crashes when
connecting to asus.com

Ilia Mirkin&lt;<a href="mailto:imirkin&#64;alum.mit.edu">mailto:imirkin&#64;alum.mit.edu</a>&gt; changed <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="show_bug.cgi?id=71438">bug
71438</a>&lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="show_bug.cgi?id=71438">https://bugs.freedesktop.org/show_bug.cgi?id=71438</a>&gt;
What    Removed Added
Summary Application Konqueror crashes when connecting to asus.com      
[NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com

<a href="show_bug.cgi?id=71438#c1">Comment # 1</a>&lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="show_bug.cgi?id=71438#c1">https://bugs.freedesktop.org/show_bug.cgi?id=71438#c1</a>&gt; on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="show_bug.cgi?id=71438">bug
71438</a>&lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="show_bug.cgi?id=71438">https://bugs.freedesktop.org/show_bug.cgi?id=71438</a>&gt; from Ilia
Mirkin&lt;<a href="mailto:imirkin&#64;alum.mit.edu">mailto:imirkin&#64;alum.mit.edu</a>&gt;

The relevant bit of the stacktrace:

#10 0x42834a87 in __assert_fail () from /lib/libc.so.6
#11 0xaf348070 in nouveau_scratch_init () from
/usr/lib/dri/nouveau_vieux_dri.so
#12 0xaf3436ed in nouveau_context_init () from
/usr/lib/dri/nouveau_vieux_dri.so
#13 0xaf34d811 in nv10_context_create () from /usr/lib/dri/nouveau_vieux_dri.so
#14 0xaf343abd in nouveau_context_create () from
/usr/lib/dri/nouveau_vieux_dri.so
#15 0xaf36045f in dri2CreateContextAttribs () from
/usr/lib/dri/nouveau_vieux_dri.so
#16 0xaf360638 in dri2CreateNewContext () from
/usr/lib/dri/nouveau_vieux_dri.so
#17 0xb4032024 in dri2_create_context () from /lib/libGL.so.1
#18 0xb400824a in CreateContext () from /lib/libGL.so.1
#19 0xb4008541 in glXCreateContext () from /lib/libGL.so.1

And the code in nouveau_scratch_init:

    for (i = 0; i &lt; NOUVEAU_SCRATCH_COUNT; i++) {
        ret = nouveau_bo_new(context_dev(ctx), NOUVEAU_BO_GART |
                     NOUVEAU_BO_MAP, 0, NOUVEAU_SCRATCH_SIZE,
                     NULL, &amp;scratch-&gt;bo[i]);
        assert(!ret);

Looks like it's trying to get 2 3MB bo's, but it can't. Unfortunately error
handling is often done rather poorly in the nouveau_vieux driver (via asserts
rather than returning error codes).

What card are you using? How much VRAM does it have? What resolution are you
running your screen at? What kernel are you on? What version of
xf86-video-nouveau and mesa are you using?

________________________________
You are receiving this mail because:

  *   You reported the bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384038373.0EcabAC1.29197--

--===============1678692048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1678692048==--
