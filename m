From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31676] garbled text after loading nouveau module on
 EFI boot; X driver thinks there are no connected outputs
Date: Sun,  5 Dec 2010 13:49:42 -0800 (PST)
Message-ID: <20101205214942.5E81E13004D@annarchy.freedesktop.org>
References: <bug-31676-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31676-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31676

--- Comment #8 from mike dentifrice <fluor-WY42bBC+8W1AfugRpC6u6w@public.gmane.org> 2010-12-05 13:49:41 PST ---
(In reply to comment #7)

> > [drm] nouveau 0000:02:00.0: expected bit 16 == 0, got 0x01114000
> > No connectors reported connected with modes
> > 
> > Uh oh.  This appears to be from nouveau_dp_auxch(). Unfortunately I'm not sure
> > I can puzzle out what all this is doing.  Presumably it's trying to query stuff
> > on the eDP port/connector, but that's failing...?
> 
> It's failing for some reason yes, I'd need to look in more detail to figure out
> why however.

Any progress on that?

FYI, Nouveau also fails to work when booting the MacBookAir3,1 (there's a few
variants, and I tried it on a 1,6ghz C2D processor, 4gb RAM, 128gb SSD) in BIOS
emulation mode. 

One gets a garbled output, both during the text boot sequence and when xorg
starts (with considerable color distortion). Consequently, one has to add the
"nomodeset" kernel option in order to boot.

The proprietary NVIDIA driver does work, however.

Shall I open a separate bug report for the 320M card failing to work on the MBA
31 in bios emulation mode? Which debug logs shall I provide, if any?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
