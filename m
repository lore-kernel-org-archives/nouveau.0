From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27483] New: dmesg error: [drm] nouveau 0000:02:00.0:
 EvoCh 0 Mthd 0x0000 Data 0x00000400 (0x0002 0x01)
Date: Tue,  6 Apr 2010 04:17:34 -0700 (PDT)
Message-ID: <bug-27483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27483

           Summary: dmesg error: [drm] nouveau 0000:02:00.0: EvoCh 0 Mthd
                    0x0000 Data 0x00000400 (0x0002 0x01)
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: orange.abc99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=34711)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=34711)
dmesg output, the error is near the end

The mentioned error is present in the dmesg log.

Possibly unrelated but at about the same time I was unable to switch from
console framebuffer back to Xorg VT (VT7). When I switch to X VT the system is
frozen for a few seconds (possibly just display+keyboard, dunno about I/O). No
X screen appears but the console text still visible. Then I can switch back to
the console VT. The X screen remains unaccessible but the X processes are still
running. A reboot has fixed the problem.

First few lines of xdpyinfo:

name of display:    :0.0             
version number:    11.0              
vendor string:    The X.Org Foundation
vendor release number:    10800000    
X.Org version: 1.8.0                  
maximum request size:  16777212 bytes 
motion buffer size:  256              
bitmap unit, bit order, padding:    32, LSBFirst, 32
image byte order:    LSBFirst                       
number of supported pixmap formats:    7            


System: AMD64, OpenSUSE 11.2 64bit, using HEAD kernel (for KMS support) and
newer xorg/nouveau/gallium repositories.

http://download.opensuse.org/repositories/Kernel:/HEAD/openSUSE_11.2/
http://download.opensuse.org/repositories/home:/jobermayr/openSUSE_11.2/
http://download.opensuse.org/repositories/X11:/XOrg/openSUSE_11.2/

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
