From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 3/3] nv10/exa: Replace "celcius" with
 "celsius".
Date: Sun, 11 Oct 2009 11:29:48 +0300
Message-ID: <20091011112948.432d8f4d@daedalus.pq.iki.fi>
References: <1254750372-491-1-git-send-email-currojerez@riseup.net>
	<1254967812-9268-3-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1254967812-9268-3-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

I have tried these three patches on nv28:
nv10/exa: Fix PictOpAtopReverse for destination pixmaps with no alpha channel.
nv10/exa: Allow component-alpha masks.
nv10/exa: Replace "celcius" with "celsius".

I do not see any problems, before or after. Tested also
rendercheck -t composite,cacomposite -f a8,x8r8g8b8,a8r8g8b8
and all tests pass before and after.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
