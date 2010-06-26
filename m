From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28763] New: Kernel Oops when displaying a large image
Date: Sat, 26 Jun 2010 00:59:44 -0700 (PDT)
Message-ID: <bug-28763-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28763

           Summary: Kernel Oops when displaying a large image
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: kerneis-klhGwnj84BUD5ynB6aAmlA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=36509)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=36509)
syslog-2.6.32

[This bug has initially being reported against Debian:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=587149 ; this is mostly
copy/paste of what has been told there]

Hi,

I face X crashes (bug #1) and kernel oops (bug #2) when displaying
large images.

This might be two separate bugs, but since they share a common cause
I join them in a single report.  I am not sure either whether this is
the correct package to report the bug against, please feel free to
reassign it if I am wrong.

Bug#1:

This first time it happened, I was trying to display a 2200x1200 px png
image using qiv, a few days ago.  X crashed and I got back to gdm login.

Today, I tried to display a 3000x3000 px jpg image[1] in Iceweasel.  It
first crashed as above.  I got a backtrace in Xorg.log featuring calls
to the nouveau driver, but cannot be more precise since I sadly lost the
trace in subsequent crashes (see below) and have not been able to
reproduce it since then.  dmesg did not contain anything relevant about
this crash (see /var/log/syslog below @ 12:41:31 - gdm error message).

[1]
http://geoeyemediaportal.s3.amazonaws.com/assets/images/gallery/ge1/hires/tehran_iran_02_11_10.jpg

Bug #2:

I tried to load again the above-mentioned image and got a kernel oops;
a few seconds later, a second oops occurred and froze the machine.

After a reboot, I have been able to reproduce the bug:
- load the above image in Iceweasel,
- while it is loading (it takes some time), move the Iceweasel window
  and resize it.  [I am using Xmonad, so this basically boils down to
  open new terminal windows and change the layout.]
- some parts of the image become dark, you see a kernel oops in your
  terminal window, the image continues to load slowly, the second oops
  happens and then the screen becomes black. It always takes two oops to
  freeze.

Since I have a way to reproduce the bug, I can try to get more
information if you tell me precisely what you expect (I have no
experience of any kind with kernel/X debugging).

See the attached files syslog-2.6.32 (look for "Oops") and Xorg.log (nothing
relevant I fear). 

On Fri, Jun 25, 2010 at 02:46:11PM +0100, Julien Cristau wrote:
> Is this reproducible with the kernel and X driver from experimental
> (note that you need to upgrade both as the ABI changed between 2.6.33
> and 2.6.34)?

Yes.  See the attached file syslog-2.6.34.


Note that this bug is very similar to a bug reported on the dri-devel ML:
http://www.mail-archive.com/dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org/msg46220.html
But this bug has been corrected:
http://www.mail-archive.com/dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org/msg47752.html
And the fix is included in linux-2.6_2.6.34-1~experimental where I can still
reproduce the problem, so this is likely a different issue (although similar).

You might also be interested by a similar bug reported by a Fedora user:
http://bugzilla.redhat.com/show_bug.cgi?id=595203

Regards,
Gabriel Kerneis

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
