From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54970] New: EOG Eye of gnome shows black stripe in
 pictures with nouveau driver
Date: Sat, 15 Sep 2012 16:08:11 +0000
Message-ID: <bug-54970-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=54970

             Bug #: 54970
           Summary: EOG Eye of gnome shows black stripe in pictures with
                    nouveau driver
    Classification: Unclassified
           Product: xorg
           Version: 7.6 (2010.12)
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: kricsek-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 67209
  --> https://bugs.freedesktop.org/attachment.cgi?id=67209
Xorg.0.log

Original bug reports:
https://bugs.launchpad.net/ubuntu/+source/eog/+bug/1005292
https://bugzilla.gnome.org/show_bug.cgi?id=676938

I'm using a freshly installed Precise on a fairly old computer.

eog: 3.4.1-0ubuntu1
xserver-xorg-video-nouveau: 1:0.0.16+git20111201+b5534a1-1build2

The problem is that eog shows a black stripe in some of my jpg pictures. I
think the position of the stripe depends on the resolution of the picture. If
the resolution is high the stripe is located close to the top, if it's medium
the stripe is in the middle. If the resolution is low then there is no black
stripe. Please take a look at the sample images.

I used the printscreen button to create the eog version of the images.
There is no problem with other image viewing tools.

Sample images:

https://bugs.launchpad.net/ubuntu/+source/eog/+bug/1005292/+attachment/3166211/+files/original.JPG

https://bugs.launchpad.net/ubuntu/+source/eog/+bug/1005292/+attachment/3166213/+files/eog-version.png

https://bugs.launchpad.net/ubuntu/+source/eog/+bug/1005292/+attachment/3166214/+files/original2.JPG

https://bugs.launchpad.net/ubuntu/+source/eog/+bug/1005292/+attachment/3166215/+files/eog-version_2.png

First I reported this as a Gnome bug on bugzilla.gnome.org but after some
investigation it turned out that this problem only occurs with the nouveau
driver. There is no problem with the official nVidia (173) driver.

dmesg: https://bugzilla.gnome.org/attachment.cgi?id=219398
sudo lspci -vvnn: https://bugzilla.gnome.org/attachment.cgi?id=219399

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
