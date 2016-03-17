From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC mesa] nouveau: Add support for OpenCL global
	memory buffers
Date: Thu, 17 Mar 2016 17:14:35 +0100
Message-ID: <56EAD7EB.3030803@gmail.com>
References: <1457961752-1461-1-git-send-email-hdegoede@redhat.com>
 <CAKb7UvgcDxt0_GHr6W5zNvUwEY8FJSSfPD3wEhqr4t-3i5xPLg@mail.gmail.com>
 <56E6D8B1.60604@redhat.com> <56E6DBA2.8060605@gmail.com>
 <56E71623.7040201@redhat.com> <56E72426.8070606@gmail.com>
 <56EAD653.3000209@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56EAD653.3000209-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

CgpPbiAwMy8xNy8yMDE2IDA1OjA3IFBNLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+IEhpLAo+Cj4g
T24gMTQtMDMtMTYgMjE6NTAsIFNhbXVlbCBQaXRvaXNldCB3cm90ZToKPgo+IDxzbmlwPgo+Cj4+
Pj4gQnR3LCBkbyB5b3UgbmVlZCBzb21lb25lIHdpdGggY29tbWl0IGFjY2VzcyB0byBwdXNoIHlv
dXIgcHJldmlvdXMKPj4+PiBzZXJpZXMgKHRoZSB0Z3NpIHRoaW5nKT8gSSBjYW4gZG8gdGhpcyBm
b3IgeW91Lgo+Pj4KPj4+IFRoYW5rcyBmb3IgdGhlIG9mZmVyLiBJSVJDIElsaWEgd2FudGVkIHNv
bWUgbWlub3IgZml4ZXMgdGhlcmUsIHNvCj4+PiBJJ2xsIGRvCj4+PiBhIHYyIHRvbW9ycm93LiBU
YWxraW5nIGFib3V0IGNvbW1pdCByaWdodHMsIEkgZ3Vlc3MgaXQgd291bGQgYmUKPj4+IGNvbnZl
bmllbnQgZm9yIGFsbCBpZiBJIHdvdWxkIGdldCBjb21taXQgcmlnaHRzIG15c2VsZj8gSSBwcm9t
aXNlIEkKPj4+IHdvbid0Cj4+PiBwdXNoIGFueXRoaW5ncyB3aXRob3V0IGFja3MuCj4+Cj4+IFll
cyBzdXJlLCBJIHRydXN0IHlvdSwgbm8gd29ycmllcy4gOi0pCj4+Cj4+Pgo+Pj4gSSBhbHJlYWR5
IGhhdmUgYSBmcmVlZGVza3RvcC5vcmcgYWNjb3VudCwgbXkgdXNlcm5hbWUgaXMgandyZGVnb2Vk
ZS4KPj4KPj4gUGxlYXNlIG9wZW4gYSB0aWNrZXQgb24gYnVncy5mcmVlZGVza3RvcCB0byBhc2sg
Zm9yIGNvbW1pdCByaWdodHMuCj4KPiBEb25lOgo+Cj4gaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9OTQ1OTQKPgo+IENhbiB5b3Ugb3IgSWxpYSBwbGVhc2UgYWNr
IHRoaXMgPwo+CgpEb25lLgoKPiBUaGFua3MsCj4KPiBIYW5zCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
