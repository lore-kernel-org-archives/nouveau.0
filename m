From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30146] New: Horizontal Couloured Lines with Nvidia 6,
 800 GT (NV40)
Date: Sun, 12 Sep 2010 06:06:17 -0700 (PDT)
Message-ID: <bug-30146-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30146

           Summary: Horizontal Couloured Lines with Nvidia 6,800 GT (NV40)
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: STEVENWARD666-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=38646)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=38646)
Snippet of the main KDM.log

Hi to all,
         For the past week or so,I've been experiencing a major problem with my
graphics card with the nouveau driver from both the git repository and the
packaged version from Fedora.The version of Fedora I'm using is
Rawhide(Fc15)with all the latest updates installed for it. I currently compile
DRM,linux-2.6,Mesa and the xf86-video-nouveau source code from the git
repositories.They all get git pulled regularly.

The problem I'm experiencing is this. I boot into the latest kernel,I give out
the temporary workaround of init=/sbin/upstart.

I see the fedora logo building up with a lot black blocks(I see them both with
my NV11 and my NV40).

But when I get to the KDM login screen,all I see are blue,black,red,and white
horizontal lines across my screen,and X is locked up,I have to do a hard reset.

I've tried both vesa and nv in the driver section in my xorg.conf,and they work
fine,I can get to the desktop (although,I have to do a rmmod -f the nouveau.ko
module for the nv driver to work.

I have been using my Geforce MX400 (NV11)with the nouveau driver with no
problems,I get to KDM normally with that Graphics Card.

I have attached my dmesg,Xorg.0.log and a snippet of my kdm.log.
I very much hope somebody can help me with this one.it is driving me nuts!

Regards,
       STEVE555

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
