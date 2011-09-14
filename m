From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40886] New: Improve our lockup detection,
 reporting and recovery
Date: Wed, 14 Sep 2011 12:38:55 -0700 (PDT)
Message-ID: <bug-40886-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40886

           Summary: Improve our lockup detection, reporting and recovery
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


At the moment, we only output the errors that the GPU reports in the kernel
logs. However, these are usually not helpful in any way.

To improve the quality of bug reports, it is also necessary to output
meaningful registers values and try to understand roughly were the problem is.
If possible, an error code should be generated to help merging bug reports into
a meaningful one.

This task is *very* suitable for students who want to learn about nouveau. If
you consider applying to this, please know that you will have a lot of
documentation to read and you will also be required to ask many questions to
the Nouveau developers. The actual implementation should be quite small.

The Ubuntu xorg team proposed us to improve our bug "reportability". Here is
what they have available on the intel driver that we could actually try to
copy.

# Jesse Barnes on ubuntu-devel-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org:
#   You'll get three events, one when the error is detected, one before
#   the reset and one after.  Each has a different environment variable set;
#   the initial error has ERROR=1, the pre-reset event has RESET=1 and the
#   post-reset event has ERROR=0.

# Disable freeze hook.
SUBSYSTEM=="drm", ACTION=="change", ENV{ERROR}=="1",
RUN+="/usr/share/apport/apport-gpu-error-intel.py"

The python script copies dmesg, Xorg.0.log, and
/sys/kernel/debug/dri/0/i915_error_state.  The latter is an
intel-specific error dump they use to help diagnose bugs.
We also capture a variety of other data and files, but those three seem
to be what the devs want, mostly.

We extract a couple error codes from the error_state file to use as a
way of automatically detecting dupes.

Here's a few examples of the results of all this:

  - https://bugs.freedesktop.org/show_bug.cgi?id=35854
  - https://bugs.freedesktop.org/show_bug.cgi?id=34014
  - https://bugs.freedesktop.org/show_bug.cgi?id=34307

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
