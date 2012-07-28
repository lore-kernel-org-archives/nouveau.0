From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47182] GeFroce 6150SE nForce 430: misaligned reg
	0x0060081D
Date: Sat, 28 Jul 2012 20:13:43 +0000
Message-ID: <bug-47182-8800-vRMbdDAUBW@http.bugs.freedesktop.org/>
References: <bug-47182-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47182-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47182

--- Comment #5 from Frank Schaefer <fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> 2012-07-28 20:13:43 UTC ---
(In reply to comment #4)
> ...
> The register mentioned is "off by one" to NV_PCRTC_GPIO_EXT (0x0060081c).
> ...
> Feel free to take a look at nouveau_bios.c: valid_reg() and bios_rd32()
> There are some hints that may help us out and get rid of those annoying
> messages

Hmmm... thanks for the pointer.

According to the comments in valid_reg() and bios_rd32(), some C51 have this
register misaligned on purpose.

There is something special about the DVI-connector of my GeForce 6150SE nForce
430 (NV4C): it is connected via a Sil1364 sDVO !
The DVI connector currently doesn't work (anyone out there with a datasheet for
the Sil1364 ? ;-) ), so I can't test it. See bug 26797 for details.
No problems with the VGA connector.

I don't know about GeForce 7025 nForce 630a, might be similar ?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
