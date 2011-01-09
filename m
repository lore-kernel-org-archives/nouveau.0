From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Latest Git still freezes AGP [GeForce 7600 GS]
Date: Sun, 9 Jan 2011 02:49:34 -0900
Message-ID: <20110109114934.GA4538@localhost2.local>
References: <20110108234155.GC4575@localhost2.local>
	<20110109012747.GA4523@localhost2.local>
	<20110109102004.GA4537@localhost2.local>
	<20110109104426.GA4538@localhost2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110109104426.GA4538-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org>
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

On Sun, Jan 09, 2011 at 01:44:26AM -0900, Roger wrote:
>>On Sun, Jan 09, 2011 at 01:20:04AM -0900, Roger wrote:
>>On Sat, Jan 08, 2011 at 04:27:47PM -0900, rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>On Sat, Jan 08, 2011 at 02:41:55PM -0900, Roger wrote:
>>>>
>>>>Just a ping here concerning the "nVidia Corporation G73 [GeForce 7600 GS]" and
>>>>AGP issues.
>>>>
>...snip...
>>>>
>>>Seems like this bug is halfway worked out?
>>
>>I've gone back to recent stable kernel release 2.6.37 that I just installed,
>>and verify that compiling the in-kernel nouveau as module does allow AGP mode
>>to work.  I do believe however, 2.6.37 statically linked nouveau driver will
>>freeze framebuffer when trying to use AGP mode.
>>
>>To me, this is really starting to sound more like a timing issue between the
>>"Host bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX Host bridge" and
>>nouveau?
>>
>>(FYI: drm is still being compiled statically. Just nouveau requires to be
>>compiled as module to evade AGP issues.)
>
>Dropping back to recent kernel 2.6.37, with nouveau as module, with AGP
>enabled, I just started noticing kernel freezes (without panics -- sorry, still
>no real success using KDUMP here). The freezes would occur approximately within
>5 minutes of using the system (using only framebuffer console, no X).
>
>I'm now back to recent 2.6.37-rc3-g036b465 git nouveau version here and things
>appear more stable.  No freezes with AGP *yet*, but still only with nouveau as
>modules (not statically linked).
>
>So far, looking good. I do believe I had this version of git nouveau kernel up
>yesterday for a while without seeing those previous freezes.

It took a lot longer, about an hour or so until another kernel freeze (w/o
kernel panic logging) to occur when using latest git nouveau kernel with AGP
enabled here.

I shall now return to using disabled AGP for this card.  My other nvidia cards
also using the 440BX chipset/mainboard do not display this severe freezing I'm
seeing with this tyan 1832dl board.  So it would seem, this is either specific
to the video card, or the code has issues with SMP... might spend some time in
uniprocessor mode next.

-- 
Roger
http://rogerx.freeshell.org/
