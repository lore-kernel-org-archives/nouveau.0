From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20612] New: nouveau xv crash with BadMatch ( invalid
 parameter attributes)
Date: Wed, 11 Mar 2009 16:25:49 -0700 (PDT)
Message-ID: <bug-20612-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20612

           Summary: nouveau xv crash with BadMatch (invalid parameter
                    attributes)
           Product: xorg
           Version: 7.4
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=23772)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=23772)
xorg log

Using nouveau drm and xorg driver from git 20090303,
with GeForce 8600M GT card (in a laptop).

I cannot play anything using the xv driver.

With mplayer, it loops and I get no image :
X11 error: BadMatch (invalid parameter attributes)?% ??% ??,?% 0 0 
X11 error: BadMatch (invalid parameter attributes)?% ??% ??,?% 0 0 
X11 error: BadMatch (invalid parameter attributes)?% ??% ??,?% 0 0 
X11 error: BadMatch (invalid parameter attributes)?% ??% ??,?% 0 0 
X11 error: BadMatch (invalid parameter attributes)?% ??% ??,?% 0 0 
X11 error: BadMatch (invalid parameter attributes)?% ??% ??,?% 0 0 
...

With xine, it just crashes :
X Error of failed request:  BadMatch (invalid parameter attributes)
  Major opcode of failed request:  132 (XVideo)
  Minor opcode of failed request:  19 ()
  Serial number of failed request:  2021
  Current serial number in output stream:  2022

xvinfo output :
X-Video Extension version 2.2
screen #0
  Adaptor #0: "Nouveau GeForce 8/9 Textured Video"
    number of ports: 32
    port base: 63
    operations supported: PutImage 
    supported visuals:
      depth 24, visualID 0x21
      depth 24, visualID 0x22
    no port attributes defined
    maximum XvImage size: 4096 x 4096
    Number of image formats: 3
      id: 0x32315659 (YV12)
        guid: 59563132-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x30323449 (I420)
        guid: 49343230-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x32595559 (YUY2)
        guid: 59555932-0000-0010-8000-00aa00389b71
        bits per pixel: 16
        number of planes: 1
        type: YUV (packed)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
