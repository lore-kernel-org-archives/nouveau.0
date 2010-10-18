From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30975] New: A Question about the linux-2.6
 kernel-modules for nouveau
Date: Mon, 18 Oct 2010 16:12:32 -0700 (PDT)
Message-ID: <bug-30975-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30975

           Summary: A Question about the linux-2.6 kernel-modules for
                    nouveau
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: trivial
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: STEVENWARD666-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi to all,
         I have a question about building my own custom kernel using the
rpm-tools. I can build the kernel modules using the out-of-tree build against
my latest kernel from Fedora Rawhide with no problems. I have bult my own
custom kernel using make xconfig,make clean, make modules, make
modules_install,and finally, dracut -f /boot/initramfs <kernel version>.img
<kernel version>

My only bug-bear by doing the make modules method is that it took a total of 5
1/2 hours with my Athlon XP 3,000 machine.So I looked at building the nouveau
kernel faster using the rpm-tools methodHere is the link
http://fedoraproject.org/wiki/PackageMaintainers/CreatingPackageHowTo

I have built a skeleton spec file using rpm-spec, and filled in the details
from the kernel section of Fedora Koji,and the Fedora rpm-tools howto.
http://fedoraproject.org/wiki/PackageMaintainers/CreatingPackageHowTo

I've ran rpmlint -i linux-2.6.36-nouveau.i686.spec to test my spec file,but I
keep getting this error:

linux-2.6.36-nouveau.i686.spec: W: invalid-url Source0:
/root/opt/linux-2.6/linux-2.6.36-nouveau.tar.gz
The value should be a valid, public HTTP, HTTPS, or FTP URL.

I've tried both url's for the linux-2.6 git repository,and also linus's url for
the kernel,but I still keep getting the same error.

I have attached the spec file I've been using to see where I've been going
wrong.

Any help would be greatly appreciated.

Regards,
       STEVE555

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
