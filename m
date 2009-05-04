From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21536] New: Accelerated 2D Does Not Work On HP
 tx2000z (Geforce 6150 Go)
Date: Sun,  3 May 2009 20:33:00 -0700 (PDT)
Message-ID: <bug-21536-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21536

           Summary: Accelerated 2D Does Not Work On HP tx2000z (Geforce 6150
                    Go)
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: circular-AMv+oqoGJ4vR7s880joybQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=25407)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=25407)
Xorg.conf For Nouvea EXA

Hello,

I would love to be able to use the nouveau driver on my hp tx2000z laptop.  I
can do so today, but must explicitly configure the driver to use shadowfb.  If
I allow the driver to attempt to run using EXA one of two things happen:

1) I see a horribly corrupted X display
2) X fails to start, giving me the message "Fatal server error: Detected GPU
lockup"

I am currently running Fedora 10, with version 1.5.3 of the X-server and fairly
recent GIT builds of the nouveau driver and drm.  (I tried these thinking that
perhaps the standard F10 packages were not new enough).  Currently running
2.6.28.7 SMP 64-bit kernel, but I've tried several other variants also.

The machine is an HP Pavillion tx2000z laptop with an NV4E chipset (Geforce
6150 Go).  4GB of RAM, and an AMD Turion processor.  I am running the x86_64
version of Fedora 10.

As a longshot, I also downloaded a Fedora 11 Preview live CD, after hearing of
their successful nouveau test day.  I hoped the newer revision of the X server
included there would help.  Unfortunately, F11 also gives me the GPU lockup
message.

I am attaching X.org.log files of two startups of X (one with corruption, and
one with the gpu lockup message) and my xorg.conf file.  If I can provide you
with any other useful information (or if I've somehow missed a very obvious
configuration option), please let me know!

Thanks,
Jeremy


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
