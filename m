From: "schmidtler-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org" <schmidtler-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Subject: nouveau framebuffer sync polarity
Date: Mon, 16 Jan 2012 09:29:17 +0100
Message-ID: <1RmhwL-0t8a120@fwd23.aul.t-online.de>
Reply-To: "schmidtler-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org" <schmidtler-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


Hello everyone,
i use the noveau framebuffer device in kernel version 2.6.37.6.
my graphic adapter is a msi 9500gt, connected to a Barco CRT projector.
The Barco will only accept RGB signals with a negative sync.
Is there a kernel command line parameter to force negative sync
polarity?
Or is there a user space command to set framebuffer parameters, fbset
does'nt work with nouveau frame buffers.

Ralph
