From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Thu, 21 Jan 2010 17:30:33 +0100
Message-ID: <ff13bc9a1001210830g2653f672r918f8cb90cbf6170@mail.gmail.com>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>
	<4B576FF5.9040907@shipmail.org>
	<ff13bc9a1001201949l4691f202v2a2874b9cef86f37@mail.gmail.com>
	<4B584E48.8020806@shipmail.org>
	<ff13bc9a1001210540t7dc2b7a7p38359ca82b8b3eb4@mail.gmail.com>
	<87vdeveekk.fsf@riseup.net>
	<ff13bc9a1001210617qe37ab7at949d545216693608@mail.gmail.com>
	<87pr53ecwd.fsf@riseup.net>
	<ff13bc9a1001210736k71740417r7b129c70374fece3@mail.gmail.com>
	<87y6jrbfef.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87y6jrbfef.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

> The card also keeps some internal FIFO caches, so it seems to me that
> getting that safe of races and efficient at the same time could be a bit
> non-trivial.

Are they flushable?
It seems this *might* do the job:
if (!pfifo->cache_flush(dev))
return;
pfifo->reassign(dev, false);
pfifo->cache_flush(dev);
pfifo->cache_pull(dev, false);


pfifo->cache_pull(dev, true);
pfifo->reassign(dev, true);
