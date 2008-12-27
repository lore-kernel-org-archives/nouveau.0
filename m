From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Does the (NV50) dma engine have trouble with "hammering"?
Date: Sat, 27 Dec 2008 02:35:17 +0100
Message-ID: <6d4bc9fc0812261735s6d03307by1575531f5cd24f83@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

I'm doing some testing/coding on the ng branches and i've run into
some problems, namely that i get PROTECTION_ERRORS after some time. It
seems most common when two two dma's happen very close together on the
same piece of memory (no hard proof to back this up, just something i
noticed). I'm using the dma engine quite heavily and i've pretty much
narrowed it down to that. I'm wondering if anyone has ever had such
problems or knows of some special sync that is needed for m2mf. I'm
doing copy, map, unmap, copy back for pretty much everything. About 10
secs of gtkperf is enough to trigger it. I've gone as far as placing
an NVSync after every dma transfer.

I'd appreciate any kind of hint.

Maarten.
