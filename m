From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: 4.9-rc7 nouveau fails on arm64 64k page kernel but
 works with 4k
Date: Wed, 7 Dec 2016 18:57:14 +0900
Message-ID: <CAAVeFuKfo3sZL84wTiR6ur=PVsPhcaU62ggTwy9r1aQEOq2HZw@mail.gmail.com>
References: <042c54f3-e52b-6658-18c7-9c19492485a4@arm.com>
 <CAKb7Uvhewyhnrnd=fw9QrdEDLecG_VMZ8Wfuh-LyCgeW6X_wCw@mail.gmail.com>
 <CAKb7UvgZLafVmC3N0R-dfm4FDtCxUO3fC-4zLwsKauAj=hx=tw@mail.gmail.com>
 <CAKb7UvgW331K53x3wub5o+6LOqeLN5PqgiiJG6WXi+WJDVDzDg@mail.gmail.com>
 <CAAVeFuJc5y8M4Koj-Ge0XpK3PXVS-fnjrpUyD13skeBM1y_K1w@mail.gmail.com>
 <d196c0c8-f429-4275-6246-a4e817b4bdf9@daenzer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <d196c0c8-f429-4275-6246-a4e817b4bdf9-otUistvHUpPR7s880joybQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
Cc: Steve Capper <Steve.Capper-5wv7dgnIgG8@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jeremy Linton <jeremy.linton-5wv7dgnIgG8@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBEZWMgNywgMjAxNiBhdCA2OjUzIFBNLCBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPiBPbiAwNy8xMi8xNiAwNjozOSBQTSwgQWxleGFuZHJlIENvdXJi
b3Qgd3JvdGU6Cj4+IE9uIEZyaSwgRGVjIDIsIDIwMTYgYXQgMTI6MjMgUE0sIElsaWEgTWlya2lu
IDxpbWlya2luQGFsdW0ubWl0LmVkdT4gd3JvdGU6Cj4+PiBUaGF0J3MgcmlnaHQgLS0gbm91dmVh
dSBjdXJyZW50bHkgcmVxdWlyZXMgNGsgcGFnZSBzaXplcyB0byB3b3JrLiBUaGlzIGlzIGEKPj4+
IHNvZnR3YXJlIGxpbWl0YXRpb24sIG5vdCBhIGhhcmR3YXJlIG9uZSB0aG91Z2guCj4+Cj4+IExv
b2tpbmcgYXQgdGhlIHRyYWNlIEkgd29uZGVyIC0gaXMgdGhlIGxpbWl0YXRpb24gaW4gTm91dmVh
dSBvciBpbiBUVE0/Cj4KPiBOb3V2ZWF1LiBOb24tNEsgcGFnZSBzaXplcyB3b3JrIGZpbmUgd2l0
aCByYWRlb24gKGFuZCBwcmVzdW1hYmx5IGFtZGdwdSkuCgpUaGFua3MgZm9yIHRoZSBwcmVjaXNp
b24uIEkgd2lsbCBjaGVjayBpZiBUZWdyYSBpR1BVcyBhcmUgYWxzbwphZmZlY3RlZCBieSB0aGlz
IC0gaWYgdGhleSBhcmUgdGhlbiBpdCBnaXZlcyBtZSBhIGdvb2QgZXhjdXNlIHRvIHRha2UKY2Fy
ZSBvZiB0aGlzIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
