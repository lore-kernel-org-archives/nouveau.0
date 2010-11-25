From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31676] garbled text after loading nouveau module on
 EFI boot; X driver thinks there are no connected outputs
Date: Thu, 25 Nov 2010 03:51:19 -0800 (PST)
Message-ID: <20101125115119.9334C13004D@annarchy.freedesktop.org>
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

--- Comment #6 from Brian Tarricone <bjt23-HmMyXyqgL2CVc3sceRu5cw@public.gmane.org> 2010-11-25 03:51:19 PST ---
Hmm so based on the raw DCB:

[drm] nouveau 0000:02:00.0: Raw DCB entry 0: 040001b6 0f220010
[drm] nouveau 0000:02:00.0: Raw DCB entry 1: 020112a6 0f220010
[drm] nouveau 0000:02:00.0: Raw DCB entry 2: 02011262 00020010
[drm] nouveau 0000:02:00.0: Raw DCB entry 3: 0000000e 0000000

It looks like the card is reporting 2 DP type outputs, and 1 TMDS output.  From
the parsing of the connector table:

[drm] nouveau 0000:02:00.0:   0: 0x00002047: type 0x47 idx 0 tag 0x08
[drm] nouveau 0000:02:00.0:   1: 0x00101146: type 0x46 idx 1 tag 0x07

It looks like the TMDS output is out of there... perhaps Apple just isn't using
it.  The two left are an eDP connector and DP connector.  It seems Apple is now
using eDP for internal display connections?  Interesting.

Then later:

[drm] nouveau 0000:02:00.0: expected bit 16 == 0, got 0x01114000
No connectors reported connected with modes

Uh oh.  This appears to be from nouveau_dp_auxch(). Unfortunately I'm not sure
I can puzzle out what all this is doing.  Presumably it's trying to query stuff
on the eDP port/connector, but that's failing...?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
