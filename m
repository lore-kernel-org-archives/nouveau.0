From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25677] New: Rotation is broken on 2009-12-15 build
Date: Wed, 16 Dec 2009 11:00:28 -0800 (PST)
Message-ID: <bug-25677-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=25677

           Summary: Rotation is broken on 2009-12-15 build
           Product: xorg
           Version: 7.4
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: luizluca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hello,

I used to build from git but now I'm using openSuse Build Service binaries
from:
http://download.opensuse.org/repositories/home:/jobermayr/openSUSE_11.2/

Packages: 

Mesa-nouveau3d-32bit-7.7.99_20091215-1.1.x86_64
xorg-x11-driver-video-nouveau-0.0.10_20091214-1.1.x86_64
xorg-x11-driver-video-nouveau-debuginfo-0.0.10_20091214-1.1.x86_64
xorg-x11-driver-video-nouveau-32bit-0.0.10_20091214-1.1.x86_64
Mesa-nouveau3d-7.7.99_20091215-1.1.x86_64

With the 20091214 build, my xorg begin to crash on rotation. This is BT:

...
2: /lib64/libc.so.6 [0x7ff692720560]
3: /usr/lib64/xorg/modules//libexa.so(exaGetPixmapDriverPrivate+0x17)
[0x7ff68ee4e807]
4: /usr/lib64/xorg/modules//drivers/nouveau_drv.so [0x7ff6908f50c3]
5: /usr/lib64/xorg/modules//drivers/nouveau_drv.so [0x7ff6908f514f]
...

My Xorg.log is attached. I installed xorg-x11-driver-video-nouveau-debuginfo
but it didn't help with stack info.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
