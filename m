From: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Subject: Re: nouveau kms causing hibernation problems
Date: Wed, 24 Feb 2010 11:43:38 +0100
Message-ID: <20100224104338.6A39C93D331@tippex.mynet.homeunix.org>
References: <20100219102550.5D39C33C7EC@tippex.mynet.homeunix.org>
	<201002191223.58921.koriakin@0x04.net>
	<20100219132317.172EA33C794@tippex.mynet.homeunix.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-reply-to: <20100219132317.172EA33C794-ZOnKU5P2/IUVO05zmlNvLXEk6Bp1+KyB2LY78lusg7I@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin =?utf-8?q?Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


Hi Marcin,

Is this a known situation about to be addressed? Is there anything I can do to
fix it?

aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org said:
> koriakin-mP9o5jsk0RY@public.gmane.org said:
>> There are not that many users of NV04/NV05.... 
>
> I'm starting to feel unique. Have to keep the museum running...
>
>> This may be a result of a known bug in our BIOS script interpreter. Go to
>> your  kernel tree, drivers/gpu/drm/nouveau/nouveau_bios.c, go to
>> init_compute_mem  function, and try commenting out the "bios_wr32(bios,
>> NV_PFB_REFCTRL,  NV_PFB_REFCTRL_VALID_1);" line.
>
> Removing that line sure changed things. The monitor still looses signal
> early, but the HD led flashes on and eventually it hibernates ok.
>
> Upon resume, I get to the reloading-from-suspend progress bar in fbcon, but
> after that the screen goes black and the thing freezes. The keyboard's leads
> are dead too. 

/Anders
