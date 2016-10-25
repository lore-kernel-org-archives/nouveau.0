From: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] subdev/iccsense: Parse max and crit power
	level
Date: Tue, 25 Oct 2016 08:06:35 +0200
Message-ID: <18959030-9FA9-42E4-9EC8-548DA3E75CBA@gmail.com>
References: <20161024211113.5876-1-karolherbst@gmail.com>
 <20161024211113.5876-3-karolherbst@gmail.com>
 <e62aa5a5-d856-4e6c-7fba-d56043ba498f@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <e62aa5a5-d856-4e6c-7fba-d56043ba498f-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

CgpPbiAyNSBPY3RvYmVyIDIwMTYgNzoyODoxMCBhLm0uIEdNVCswMjowMCwgTWFydGluIFBlcmVz
IDxtYXJ0aW4ucGVyZXNAZnJlZS5mcj4gd3JvdGU6Cj5PbiAyNS8xMC8xNiAwMDoxMSwgS2Fyb2wg
SGVyYnN0IHdyb3RlOgo+PiBTaWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3QgPGthcm9saGVyYnN0
QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBkcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2lj
Y3NlbnNlLmggfCAgMyArKysKPj4gIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L2ljY3NlbnNlL2Jh
c2UuYyAgICB8IDEzICsrKysrKysrKysrKy0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj5XaGF0IGlzIHRoZSBwb2ludCBvZiBkdXBsaWNhdGlu
ZyB2YWx1ZXMgaGVyZT8gSnVzdCBzdG9yZSB0aGUgcGFyc2VkCj5iaW9zIAo+dGFibGUsIGxpa2Ug
d2UgZG8gZm9yIGZhbiBtYW5hZ2VtZW50LgoKd2lsbCBoYXZlIGEgbG9vay4gSSB3YXMganVzdCB0
aGlua2luZyB0aGF0IHRoaXNlIGZpZWxkcyBtYXkgbWVhbiBzb21ldGhpbmcgZWxzZSBkZXBlbmRp
bmcgb24gdGhlIGNvbnRleHQuIFRoZXJlIGFyZSBhbHJlYWR5IHNvbWUgd2VpcmQgdGhpbmdzLCBs
aWtlIHdlIG9ubHkgZ2V0IG9uZSB2YWx1ZSBmb3IgdmVyeSBzaG9ydCBlbnRyaWVzLgoKQnV0IEkg
Z3Vlc3MgaXQgbWFrZXMgc2Vuc2UgdG8ga2VlcCBpdCBzaW1wbGUgZm9yIG5vdy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
