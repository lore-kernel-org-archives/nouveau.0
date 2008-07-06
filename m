From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16624] New: invalid pointer past to
	RRChangeOutputProperty
Date: Sat,  5 Jul 2008 22:43:23 -0700 (PDT)
Message-ID: <bug-16624-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16624

           Summary: invalid pointer past to RRChangeOutputProperty
           Product: xorg
           Version: git
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: obiwan-ajv+KCCKUOlAfugRpC6u6w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                CC: keithp-aN4HjG94KOLQT0dZR+AlfA@public.gmane.org


Created an attachment (id=17547)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=17547)
proposed patch for the issue

In nv_output:

error = RRChangeOutputProperty(output->randr_output, dithering_atom,
                                        XA_INTEGER, 32, PropModeReplace, 1,
&nv_output->dithering,FALSE, FALSE);

&nv_output->dithering is a Boolean, but the property is set up as int32. On big
endian systems, this results in the property set being 0x1000000 instead of
0x1. This currently fails the range check (it can only be 1 or 0). Leading to
an error returned above which made me notice the issue.

Actually I think it may be an idea if X would check the type of the pointer
passed to RRChangeOutputProperty and return a better error if it is not equal
to the type (this problem would go unnoticed without the range check in
nv_output's set_property function), thus I add a cc to keithp about that.

To fix the problem in nouveau, either the property should be set up as Bool, or
we need to do an explicit cast. I provide a patch for the latter (because I am
not sure if we want more than 2 states for this property in the future). Let me
know if the former is preferred.


Cheers,

danny


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
