From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25393] Repeated "EDID checksum is invalid" erros
 with varying remainders on NV43
Date: Wed, 26 May 2010 16:26:03 -0700 (PDT)
Message-ID: <20100526232603.C851813000D@annarchy.freedesktop.org>
References: <bug-25393-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25393-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=25393

--- Comment #4 from TomG <kaw550pgz-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> 2010-05-26 16:26:02 PDT ---
I have worked around the problem as follows.

Background:  The nouveau driver interferes with the probing of nvidia's driver.
 Going into init 1 or init 3 from init 5 will result in nouveau still being
loaded in the kernel.  One must boot into init 1 or init 3 before nouveau has a
chance to load for the NVIDIA installer to work correctly. 

Solution:

Restart and boot into single mode by appending the capital letter S to grub's
kernel line.

run the installer as before, ignoring the warning about potential problems with
init 1.

Verified as a solution in UBUNTU 10.04 LTS and NVIDIA x86-195-32-24.

Also, these newer (post 190) drivers have a ignore-EDID option; you can Google
the readme of the driver if need be, that should solve these problems.

--Tom G.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
