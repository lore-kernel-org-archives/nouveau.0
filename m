From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Gart to vram/vram to gart transfers broken on NVS 140M
Date: Thu, 22 Apr 2010 12:13:13 +0200
Message-ID: <4BD02139.4090506@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Nouveau folks,

I've been encountering some corruption on pixmaps for a while now, and 
it seems like the problem comes from the DFS/UTS (Download From Screen / 
Upload To Screen).

In fact, I'm pretty sure the problem comes from there as screenshots are 
garbled and so does a few more things.

I may have time to dig this up, where should I start, is there some 
documentation on the NVS 140M ? Where is the gart2vram code located ?
Do you have any idea of where could be the problem ?

Thanks,

Martin
