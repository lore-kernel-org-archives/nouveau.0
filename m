From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48434] [NV43] X freezes with "EQ overflowing"
Date: Thu, 18 Oct 2012 08:09:21 +0000
Message-ID: <bug-48434-8800-RI2oDsZpj7@http.bugs.freedesktop.org/>
References: <bug-48434-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0454788154=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48434-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0454788154==
Content-Type: multipart/alternative; boundary="1350547761.0b8Cfe1.24521"; charset="us-ascii"


--1350547761.0b8Cfe1.24521
Date: Thu, 18 Oct 2012 08:09:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48434

--- Comment #9 from dacer <dclemen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
#dpkg -l |grep nouveau
ii  libdrm-nouveau1a:amd64                                      2.4.33-3       
                     amd64        Userspace interface to nouveau-specific
kernel DRM services -- runtime
ii  xserver-xorg-video-nouveau                                  1:1.0.1-3      
                     amd64        X.Org X server -- Nouveau display driver

#dpkg -l |grep libdrm
ii  libdrm-intel1:amd64                                         2.4.33-3       
                     amd64        Userspace interface to intel-specific kernel
DRM services -- runtime
ii  libdrm-nouveau1a:amd64                                      2.4.33-3       
                     amd64        Userspace interface to nouveau-specific
kernel DRM services -- runtime
ii  libdrm-radeon1:amd64                                        2.4.33-3       
                     amd64        Userspace interface to radeon-specific kernel
DRM services -- runtime
ii  libdrm2:amd64                                               2.4.33-3       
                     amd64        Userspace interface to kernel DRM services --
runtime

# dpkg -l |grep mesa
ii  libegl1-mesa:amd64                                          8.0.4-2        
                     amd64        free implementation of the EGL API -- runtime
ii  libegl1-mesa-drivers:amd64                                  8.0.4-2        
                     amd64        free implementation of the EGL API --
hardware drivers
ii  libgl1-mesa-dev                                             8.0.4-2        
                     amd64        free implementation of the OpenGL API -- GLX
development files
ii  libgl1-mesa-dri:amd64                                       8.0.4-2        
                     amd64        free implementation of the OpenGL API -- DRI
modules
ii  libgl1-mesa-glx:amd64                                       8.0.4-2        
                     amd64        free implementation of the OpenGL API -- GLX
runtime
ii  libglapi-mesa:amd64                                         8.0.4-2        
                     amd64        free implementation of the GL API -- shared
library
ii  libglu1-mesa:amd64                                          8.0.4-2        
                     amd64        Mesa OpenGL utility library (GLU)
ii  libglu1-mesa-dev                                            8.0.4-2        
                     amd64        Mesa OpenGL utility library -- development
files
ii  libopenvg1-mesa:amd64                                       8.0.4-2        
                     amd64        free implementation of the OpenVG API --
runtime
ii  mesa-common-dev                                             8.0.4-2        
                     amd64        Developer documentation for Mesa
ii  mesa-utils                                                  8.0.1-2+b3     
                     amd64        Miscellaneous Mesa GL utilities


Now I get a 31MB log with this lines:
#cat /var/log/syslog.1
....
Oct 18 07:04:58 dacer kernel: [120873.868801] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868813] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c00 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868819] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868825] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c04 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868831] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868836] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c08 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868842] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868848] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c0c data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868853] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868859] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c10 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868865] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868870] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c14 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868876] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868881] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c18 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868887] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868893] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c1c data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868899] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868904] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c20 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868910] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868915] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c24 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868921] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868927] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c28 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868932] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868938] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c2c data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868944] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868949] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c30 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868955] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868960] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c34 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868966] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868972] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c38 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868978] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868983] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c3c data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868989] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868994] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c40 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.869000] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.869006] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c44 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.869012] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.869017] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c48 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.869023] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.869029] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c4c data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.869733] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 1/0 Mthd 0x0184 Data 0x80000002
Oct 18 07:04:58 dacer kernel: [120873.869787] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 1/0 Mthd 0x0188 Data 0x80000003
...
This last 2 lines repeat hundred times
...
Oct 18 07:05:01 dacer kernel: [120876.898128] nouveau_ratelimit: 11372
callbacks suppressed
Oct 18 07:05:01 dacer kernel: [120876.898134] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898152] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c00 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898164] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898178] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c04 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898189] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898203] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c08 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898215] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898228] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c0c data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898240] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898253] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c10 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898265] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898278] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c14 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898290] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898303] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c18 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898315] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898328] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c1c data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898340] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898353] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c20 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898365] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898378] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c24 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898390] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898403] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c28 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898415] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898428] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c2c data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898440] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898453] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c30 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898465] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898478] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c34 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898490] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898503] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c38 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898514] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898528] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c3c data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898539] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898553] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c40 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898564] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898578] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c44 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898589] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898602] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c48 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898614] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898627] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c4c data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.899928] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 1/0 Mthd 0x0184 Data 0x80000002
Oct 18 07:05:01 dacer kernel: [120876.899994] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 1/0 Mthd 0x0188 Data 0x80000003
...
again same two lines
...
Oct 18 07:05:04 dacer kernel: [120879.906879] nouveau_ratelimit: 11244
callbacks suppressed
Oct 18 07:05:04 dacer kernel: [120879.906885] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:04 dacer kernel: [120879.906893] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c00 data 0x00000000
....
Repeat same that before.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350547761.0b8Cfe1.24521
Date: Thu, 18 Oct 2012 08:09:21 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV43] X freezes with &quot;EQ overflowing&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48434#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV43] X freezes with &quot;EQ overflowing&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48434">bug 48434</a>
              from <span class="vcard"><a class="email" href="mailto:dclemen&#64;gmail.com" title="dacer &lt;dclemen&#64;gmail.com&gt;"> <span class="fn">dacer</span></a>
</span></b>
        <pre>#dpkg -l |grep nouveau
ii  libdrm-nouveau1a:amd64                                      2.4.33-3       
                     amd64        Userspace interface to nouveau-specific
kernel DRM services -- runtime
ii  xserver-xorg-video-nouveau                                  1:1.0.1-3      
                     amd64        X.Org X server -- Nouveau display driver

#dpkg -l |grep libdrm
ii  libdrm-intel1:amd64                                         2.4.33-3       
                     amd64        Userspace interface to intel-specific kernel
DRM services -- runtime
ii  libdrm-nouveau1a:amd64                                      2.4.33-3       
                     amd64        Userspace interface to nouveau-specific
kernel DRM services -- runtime
ii  libdrm-radeon1:amd64                                        2.4.33-3       
                     amd64        Userspace interface to radeon-specific kernel
DRM services -- runtime
ii  libdrm2:amd64                                               2.4.33-3       
                     amd64        Userspace interface to kernel DRM services --
runtime

# dpkg -l |grep mesa
ii  libegl1-mesa:amd64                                          8.0.4-2        
                     amd64        free implementation of the EGL API -- runtime
ii  libegl1-mesa-drivers:amd64                                  8.0.4-2        
                     amd64        free implementation of the EGL API --
hardware drivers
ii  libgl1-mesa-dev                                             8.0.4-2        
                     amd64        free implementation of the OpenGL API -- GLX
development files
ii  libgl1-mesa-dri:amd64                                       8.0.4-2        
                     amd64        free implementation of the OpenGL API -- DRI
modules
ii  libgl1-mesa-glx:amd64                                       8.0.4-2        
                     amd64        free implementation of the OpenGL API -- GLX
runtime
ii  libglapi-mesa:amd64                                         8.0.4-2        
                     amd64        free implementation of the GL API -- shared
library
ii  libglu1-mesa:amd64                                          8.0.4-2        
                     amd64        Mesa OpenGL utility library (GLU)
ii  libglu1-mesa-dev                                            8.0.4-2        
                     amd64        Mesa OpenGL utility library -- development
files
ii  libopenvg1-mesa:amd64                                       8.0.4-2        
                     amd64        free implementation of the OpenVG API --
runtime
ii  mesa-common-dev                                             8.0.4-2        
                     amd64        Developer documentation for Mesa
ii  mesa-utils                                                  8.0.1-2+b3     
                     amd64        Miscellaneous Mesa GL utilities


Now I get a 31MB log with this lines:
#cat /var/log/syslog.1
....
Oct 18 07:04:58 dacer kernel: [120873.868801] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868813] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c00 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868819] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868825] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c04 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868831] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868836] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c08 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868842] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868848] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c0c data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868853] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868859] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c10 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868865] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868870] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c14 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868876] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868881] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c18 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868887] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868893] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c1c data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868899] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868904] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c20 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868910] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868915] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c24 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868921] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868927] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c28 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868932] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868938] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c2c data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868944] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868949] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c30 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868955] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868960] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c34 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868966] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868972] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c38 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868978] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868983] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c3c data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.868989] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.868994] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c40 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.869000] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.869006] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c44 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.869012] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.869017] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c48 data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.869023] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:04:58 dacer kernel: [120873.869029] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c4c data 0x00000000
Oct 18 07:04:58 dacer kernel: [120873.869733] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 1/0 Mthd 0x0184 Data 0x80000002
Oct 18 07:04:58 dacer kernel: [120873.869787] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 1/0 Mthd 0x0188 Data 0x80000003
...
This last 2 lines repeat hundred times
...
Oct 18 07:05:01 dacer kernel: [120876.898128] nouveau_ratelimit: 11372
callbacks suppressed
Oct 18 07:05:01 dacer kernel: [120876.898134] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898152] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c00 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898164] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898178] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c04 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898189] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898203] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c08 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898215] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898228] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c0c data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898240] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898253] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c10 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898265] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898278] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c14 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898290] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898303] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c18 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898315] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898328] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c1c data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898340] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898353] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c20 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898365] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898378] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c24 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898390] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898403] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c28 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898415] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898428] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c2c data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898440] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898453] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c30 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898465] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898478] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c34 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898490] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898503] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c38 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898514] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898528] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c3c data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898539] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898553] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c40 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898564] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898578] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c44 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898589] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898602] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c48 data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.898614] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:01 dacer kernel: [120876.898627] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c4c data 0x00000000
Oct 18 07:05:01 dacer kernel: [120876.899928] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 1/0 Mthd 0x0184 Data 0x80000002
Oct 18 07:05:01 dacer kernel: [120876.899994] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 1/0 Mthd 0x0188 Data 0x80000003
...
again same two lines
...
Oct 18 07:05:04 dacer kernel: [120879.906879] nouveau_ratelimit: 11244
callbacks suppressed
Oct 18 07:05:04 dacer kernel: [120879.906885] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: METHOD_CNT nstatus: INVALID_STATE
Oct 18 07:05:04 dacer kernel: [120879.906893] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 1 (0x000d6000) subc 3 class 0x004a mthd 0x0c00 data 0x00000000
....
Repeat same that before.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350547761.0b8Cfe1.24521--

--===============0454788154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0454788154==--
