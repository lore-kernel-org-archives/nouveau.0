From: =?UTF-8?B?0JzQsNC60YHQuNC8INCk0L7QvNC40L0=?= <maxim-lwv6yGCE/feU31i11zIn4w@public.gmane.org>
Subject: nvidia BIOS loaing policy (nouveau kernel driver)
Date: Thu, 8 Sep 2011 20:50:52 +0400
Message-ID: <CAHFj7GdqkYUqumFRHy3LDC7o0bGVZQ5HoQq8D1AXdsBf_i3+DQ@mail.gmail.com>
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

Hello.

As far I understand from driver file "nouveau_bios.c", it may be
loaded from pramin, prom, pcirom or acpi. However, it isn't clear, why
they are arranged in that order.
The question comes from seeing each time on boot "Invalid ROM
contents" message on attepmt to load bios from pcirom. Actually, I
find similar problem in google so, I suspect that my card isn't
broken.

I don't know where nvidia likely to place bios, but, according to my
experience and what I found from google, it is better to place acpi in
"nouveau_bios.c" at first (or at least place pcirom at the end):

static struct methods shadow_methods[] = {
{ "ACPI", load_vbios_acpi, true },
{ "PRAMIN", load_vbios_pramin, true },
{ "PROM", load_vbios_prom, false },
{ "PCIROM", load_vbios_pci, true },
};

   Maxim
