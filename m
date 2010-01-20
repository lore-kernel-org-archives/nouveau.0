From: Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Wed, 20 Jan 2010 22:11:03 +0100
Message-ID: <4B577167.3010907@shipmail.org>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>	
	<4B54B949.9010906@vmware.com>	
	<ff13bc9a1001181433v1694e681l9f7ce9d880132dc3@mail.gmail.com>	
	<4B56E8EE.8090706@shipmail.org>
	<4B56F308.5090603@shipmail.org>	 <4B56F401.8070700@vmware.com>	
	<ff13bc9a1001201122y110fb003k704bc6d05d2aea07@mail.gmail.com>	
	<4B5764BA.7080801@vmware.com>	
	<ff13bc9a1001201245g6ee25219q851b7989968f4c7b@mail.gmail.com>
	<ff13bc9a1001201258i37ee7354gb305aa98afae3716@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a1001201258i37ee7354gb305aa98afae3716-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Luca Barbieri wrote:
> When designing this, we should also keep in mind that some drivers
> (e.g. nouveau) have multiple FIFO channels, and thus we would like a
> buffer to be referenced for reading by multiple channels at once (and
> be destroyed only when all fences are expired, obviously).
> Also, hardware may support on-GPU inter-channel synchronization, and
> then multiple references may be for writing too.
>   

In the context of the current code, I've been thinking of having a list 
of fences on each bo to support multiple readers, and also to try to 
deal with the problem of simultaneous GPU- and CPU readers.

But if the hardware supports on-GPU inter-channel synchronization, I 
figure the code should be smart enough to only wait on the "last" write 
fence?

/Thomas
