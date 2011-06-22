From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36163] nouveau fails to render framebuffer on
	[GeForce 7300 GS]
Date: Wed, 22 Jun 2011 16:01:03 -0700 (PDT)
Message-ID: <20110622230103.7E390130051@annarchy.freedesktop.org>
References: <bug-36163-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36163-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36163

SanskritFritz <semmikozod-hRtevi7K+EU+Va1GwOuvDg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Product|xorg                        |xkeyboard-config
            Version|git                         |unspecified
          Component|Driver/nouveau              |General

--- Comment #7 from SanskritFritz <semmikozod-hRtevi7K+EU+Va1GwOuvDg@public.gmane.org> 2011-06-22 16:01:03 PDT ---
(In reply to comment #6)
> Hi SanskritFritz
> Can you try a more recent version of the kernel module (ideally nouveau-git
> [1])
> * Use "nouveau.noaccel=1" as a kernel parameter
> ** Or "noaccel=1" if you are using modprobe to load nouveau

Hi this helped, thank you. I have framebuffer working now with nouveau-git.
I'll test X later, as this is my production machine, and nouveau-git doesn't
correspond now to the kernel module. I'll experiment with it later, as I will
have to change my Compiz standalone desktop, etc.
Thanks again, things are shaping!

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
