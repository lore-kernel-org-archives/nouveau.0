From: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 09/35] x86: Convert remaining uses of
 pr_warning to pr_warn
Date: Fri, 17 Feb 2017 10:01:13 -0500
Message-ID: <20170217100113.5bb7bb73@gandalf.local.home>
References: <cover.1487314666.git.joe@perches.com>
 <be5fd9c52a11473a52e317b28cc32d2845def094.1487314667.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <be5fd9c52a11473a52e317b28cc32d2845def094.1487314667.git.joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Juergen Gross <jgross-IBi9RG/b67k@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ning Sun <ning.sun-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tboot-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, oprofile-list-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org, "H.
 Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Boris Ostrovsky <boris.ostrovsky-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, sfi-devel-yLnuTTp1/kvcsJTPyzm5gB2eb7JE58TQ@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCAxNiBGZWIgMjAxNyAyMzoxMToyMiAtMDgwMApKb2UgUGVyY2hlcyA8am9lQHBlcmNo
ZXMuY29tPiB3cm90ZToKCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL3Rlc3RtbWlvdHJhY2Uu
YyBiL2FyY2gveDg2L21tL3Rlc3RtbWlvdHJhY2UuYwo+IGluZGV4IDM4ODY4YWRmMDdlYS4uNGE1
NWU0NTMyOTZkIDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L21tL3Rlc3RtbWlvdHJhY2UuYwo+ICsr
KyBiL2FyY2gveDg2L21tL3Rlc3RtbWlvdHJhY2UuYwo+IEBAIC0xMjEsOSArMTIxLDggQEAgc3Rh
dGljIGludCBfX2luaXQgaW5pdCh2b2lkKQo+ICAJCXJldHVybiAtRU5YSU87Cj4gIAl9Cj4gIAo+
IC0JcHJfd2FybmluZygiV0FSTklORzogbWFwcGluZyAlbHUga0IgQCAweCUwOGx4IGluIFBDSSBh
ZGRyZXNzIHNwYWNlLCAiCj4gLQkJICAgImFuZCB3cml0aW5nIDE2IGtCIG9mIHJ1YmJpc2ggaW4g
dGhlcmUuXG4iLAo+IC0JCSAgIHNpemUgPj4gMTAsIG1taW9fYWRkcmVzcyk7Cj4gKwlwcl93YXJu
KCJXQVJOSU5HOiBtYXBwaW5nICVsdSBrQiBAIDB4JTA4bHggaW4gUENJIGFkZHJlc3Mgc3BhY2Us
IGFuZCB3cml0aW5nIDE2IGtCIG9mIHJ1YmJpc2ggaW4gdGhlcmVcbiIsCj4gKwkJc2l6ZSA+PiAx
MCwgbW1pb19hZGRyZXNzKTsKPiAgCWRvX3Rlc3Qoc2l6ZSk7Cj4gIAlkb190ZXN0X2J1bGtfaW9y
ZW1hcHBpbmcoKTsKPiAgCXByX2luZm8oIkFsbCBkb25lLlxuIik7CgpBY2tlZC1ieTogU3RldmVu
IFJvc3RlZHQgKFZNd2FyZSkgPHJvc3RlZHRAZ29vZG1pcy5vcmc+CgotLSBTdGV2ZQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
