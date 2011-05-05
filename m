From: James Milne <james.milne-ee4meeAH724@public.gmane.org>
Subject: PLL programming on Fermi
Date: Thu, 05 May 2011 16:12:26 +0100
Message-ID: <A1A5ADD6-D2AB-4BAF-AE12-3CC8E46DABF1@mac.com>
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

Hi all,

I have a problem where I need to dynamically adjust the VPLL registers on a Nvidia GPU to tweak the DVI output timings.

I've written some code which can do this from user space, reading the PLL tables from ROM to find out where the VPLL registers are, and the valid ranges for the PLL coefficients, based on the code in nouveau_bios.c.

I haven't quite managed to get it to do what I want yet for Fermi.

Does the current mode setting code in Nouveau support dual-link DVI on Fermi? It looks like dual-link DVI is enabled by  nv50_display_script_select() in nv50_display.c (which is used for NV_C0).

The PLL reading code in nouveau_bios.c only pulls out the coefficients for VCO1, there is nothing in there for VCO2. I presume the Fermi only have a single-stage PLL? Looking at a dump of the BIOS, it does look like the limits for VPLL0 VCO1 are followed immediately by the limits for VPLL1 VCO1, ie there are no other coefficients, thus no second VCO.

Just wanting to check I'm not on completely the wrong track.

Regards
James Milne
