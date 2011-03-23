From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35267] nouveau fails to load BIOS on EFI boot.
Date: Wed, 23 Mar 2011 15:51:36 -0700 (PDT)
Message-ID: <20110323225136.A768713004F@annarchy.freedesktop.org>
References: <bug-35267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35267-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35267

--- Comment #4 from bugzilla-zXQU9YWDTqjmlV4oE/1sFAC/G2K4zDHf@public.gmane.org 2011-03-23 15:51:36 PDT ---
I have the exact same problem, except in this case Fedora 14 with Linux
2.6.35.11-83.fc14.x86_64. But same hardware, Macbook Pro 4,1.

I have succesfully gotten this hardware to boot Fedora 14/Linux 2.6.35-11+
using rEFIt + Grub 0.97 (with GPT + MBR syncd using rEFIt). This is almost
certainly using BIOS emulation.

This web site indicates that native EFI boot is possible with this hardware.
http://grub.enbug.org/TestingOnMacbook

I have not been able to reproduce these results. There are three anomalies on
this web site under "Tested configurations" that I haven't done regression
against.


a.) Kernel: I did not test with this listed kernel.

b.) Video driver: nvidia-260.19.06-0ubuntu1 is not one I'm familiar with how to
install on Fedora. So I have been unable to test this.

c.) Grub: All models are listed with grub-efi64 *except* this Macbook 4,1
model. Earlier it says to check EFI using: 
ioreg -l -p IODeviceTree | grep firmware-abi
which reports back:
    | |   "firmware-abi" = <"EFI64">

So it seems I should built Grub 1.99 as x86_64, which I did. I have not tried
recompiling for i686.

d.) Extra steps says "Model details of "drivers/video/efifb.c" were wrong and
needed patching/recompiling" 

This may mean Grub 1.99 is not passing the correct video information to the
kernel.

Otherwise I have tried with and without the BIOS capture steps and it will will
not boot. So I think there's either something with 32-bit EFI, or altering
efifb.c. If efifb.c needs to be modified for this to work, it needs to be
reported to Grub devel me thinks.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
