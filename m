From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21536] Accelerated 2D Does Not Work On HP tx2000z
 (Geforce 6150 Go)
Date: Mon, 28 Dec 2009 16:13:01 -0800 (PST)
Message-ID: <20091229001301.2FB071300BE@annarchy.freedesktop.org>
References: <bug-21536-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21536-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


Jeremy Uchitel <circular-AMv+oqoGJ4vR7s880joybQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #25409|0                           |1
        is obsolete|                            |




--- Comment #4 from Jeremy Uchitel <circular-AMv+oqoGJ4vR7s880joybQ@public.gmane.org>  2009-12-28 16:13:00 PST ---
Created an attachment (id=32337)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32337)
Xorg.log from F12 still shows lockup problem

Hello All,

I decided it was time to upgrade to Fedora 12, and again would really like to
use nouveau so that I don't have to do the nvidia compile (and maybe download)
dance whenever I update my OS kernel... and, because I hear such good things
about nouveau.  The nvidia driver worked for me under F10, and if I must, I'll
go back to it, but that just seems so WRONG!

Anyway, 7 months since my last attempt and I'm still getting the GPU lockup
error, both from X and from the KMS driver.  Right now, I've disabled kernel
modesetting, and I'm using nouveau with the shadowfb.  Please help!  I'll
gather whatever info you might need to help diagnose/fix the bug, but here's
where I'm at now:

Still an HP tx2000z laptop with an NV4E... here's what lspci -vnn says about
it:

00:05.0 VGA compatible controller [0300]: nVidia Corporation C51 [Geforce 6150
Go] [10de:0244] (rev a2) (prog-if 00 [VGA controller])                          
        Subsystem: Hewlett-Packard Company Device [103c:30e5]                   
        Flags: bus master, 66MHz, fast devsel, latency 0, IRQ 18                
        Memory at c2000000 (32-bit, non-prefetchable) [size=16M]                
        Memory at d0000000 (64-bit, prefetchable) [size=256M]                   
        Memory at c1000000 (64-bit, non-prefetchable) [size=16M]                
        [virtual] Expansion ROM at c0020000 [disabled] [size=128K]              
        Capabilities: [48] Power Management version 2                           
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+              
        Kernel modules: nouveau, nvidiafb

I'm running F12 x86_64 with kernel kernel-2.6.31.9-174.fc12 and nouveau rpm:
xorg-x11-drv-nouveau-0.0.15-18.20091105gite1c2efd.fc12.

I've double-checked, and though it's listed as available, I'm not loading the
nvidiafb module. Please let me know what information will be helpful to you in
diagnosing the issue, and I will try to provide it ASAP.

Thank you!
Jeremy


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
