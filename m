From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18300] NV11 Locks Up On Xorg Initialization
Date: Tue, 13 Jan 2009 15:56:02 -0800 (PST)
Message-ID: <20090113235602.A95E9130057@annarchy.freedesktop.org>
References: <bug-18300-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18300-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18300





--- Comment #11 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-01-13 15:56:02 PST ---
(--) NOUVEAU(0): VideoRAM: 8192 kBytes

and

(EE) EXA(0): ExaDriverRec::offScreenBase must be <= ExaDriverRec::memorySize

are the critical things here.  You seem to only have 8Mb VRAM, which really
isn't very much (the driver at present tends to assume more, probably a minimum
of 16Mb).  Do you know if we are detecting the correct amount?

I don't think the GeForce2 Go uses host memory, but if it does it may be worth
checking if the system bios has an option to increase the amount available to
the card.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
