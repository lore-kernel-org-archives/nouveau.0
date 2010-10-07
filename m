From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Add pause/unpause methods for PFIFO & PGRAPH. Use
 them to get stable clock changes
Date: Thu, 07 Oct 2010 03:33:55 +0200
Message-ID: <4CAD2383.50907@free.fr>
References: <4CA3223F.9030503@free.fr> <4CA4C57E.5090400@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CA4C57E.5090400-GANU6spQydw@public.gmane.org>
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

  Hi,

Here is an updated version, all in one patch. When we agree on the code, 
I'll split it into 3 patches.

The new code is way better. As suggested on IRC, I also disable IRQs and 
PFIFO cache pull and push.

Please have a look and test it. This patch needs to get upstream as it 
gives a reliable way to change the clock even in the middle of a game.

It is not perfect yet, changing the clocks too often (like several 
thousand of times) lead to an hung card :)

Regards,

Martin
