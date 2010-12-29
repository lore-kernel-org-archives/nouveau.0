From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: Re: CRTC video scanout position for high precision vblank
 timestamping?
Date: Wed, 29 Dec 2010 11:31:15 +0100
Message-ID: <4D1B0DF3.304@tuebingen.mpg.de>
References: <4D1AF8F4.6020707@tuebingen.mpg.de>
	<AANLkTi=9FagJJYP148Zsc26mm+BCvRCNTqD4jsLT7os6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTi=9FagJJYP148Zsc26mm+BCvRCNTqD4jsLT7os6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 12/29/2010 10:35 AM, Maarten Maathuis wrote:
> I found these by simply dumping the entire range modesetting related
> registers. At the time they didn't help me (the issue of swapbuffers
> remains unsolved on this generation of hardware, it didn't interest me
> *that* much). I don't know what exactly you are doing, but a lot of
> stuff is done through pushbuffers (even modesetting) so there are no
> "instant" registers that i know of.
>

Oh, it's about precisely timestamping when a scanout starts (at end of 
vblank) and when exactly a bufferswap completed - when the post-swap 
frontbuffer starts to scan out. This commit gives the background info:

<http://git.kernel.org/?p=linux/kernel/git/airlied/drm-2.6.git;a=commit;h=27641c3f003e7f3b6585c01d8a788883603eb262>

This is what it looks like in the i915 kms, to be implemented very 
similar in nouveau kms:

<http://git.kernel.org/?p=linux/kernel/git/airlied/drm-2.6.git;a=commit;h=0af7e4dff50454905092d468e91c1ef92e10e6b4>

-mario
