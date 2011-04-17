From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36330] New: 2.6.38 kernel fails to boot with nouveau
 driver active
Date: Sun, 17 Apr 2011 13:28:18 -0700 (PDT)
Message-ID: <bug-36330-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36330

           Summary: 2.6.38 kernel fails to boot with nouveau driver active
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ghutzl-S0/GAf8tV78@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=45742)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=45742)
my kernel config for a 2.6.38.2 vanilla kernel

Hello!

My 2.6.38 kernel fails to boot when using the nouveau driver. See these
pictures of the kernel output while booting:

http://tinypic.com/r/xefq6e/7
http://tinypic.com/r/2w5kc8w/7
http://tinypic.com/r/30wmlmv/7

I made 3 pictures because I wanted to show the effect of the "shifted" text in
the fullscreen picture where you can barely read the text. The other two
pictures show the text.

I am running gentoo linux and I used kernel 2.6.37 for quite a while with no
problems but was not able to produce a working 2.6.38 kernel. I have tried the
gentoo-sources-2.6.38-r1 and also a vanilla 2.6.38.2 kernel and the behaviour
is the same for both. I have attached my kernel config.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
