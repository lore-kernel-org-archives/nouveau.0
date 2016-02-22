From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Dealing with opencl kernel parameters in nouveau now
 that RES support is gone
Date: Mon, 22 Feb 2016 10:26:57 -0500
Message-ID: <CAKb7Uvi6PcAMJqR_VkYQWSW9mYEExu5ea+BgYR-oPmORw1pb3A@mail.gmail.com>
References: <56C5D8F9.6030408@redhat.com>
 <CAKb7UvidnYPcG4w=R=1CKhc0AFmSKzmdgYA9XAKT3sBHwnpGcw@mail.gmail.com>
 <56C6F031.6060308@redhat.com>
 <CAKb7UvgzKeOCm3Xh+j4=E_ru5_F_xGnx9NHkVT9sJoDw17OhVg@mail.gmail.com>
 <56CAF059.3090608@redhat.com> <56CB01EB.9040705@gmail.com>
 <56CB0340.3010403@redhat.com> <56CB074B.9070406@gmail.com>
 <56CB0865.7070108@redhat.com>
 <CAKb7UvgZoRLeLhnqa-H6bLG+gyLRYj+arCNQP39Q8zPR6Gu4jA@mail.gmail.com>
 <CAKb7UviPZtExOcgUDxuxyhGf6C0QL+apn6ZjJEdJ8DhM_sfChw@mail.gmail.com>
 <56CB1870.4030606@redhat.com>
 <CAKb7Uvg0_3=BiV0rbgxiAhiQbT-3J7wiQY9C9Yr2WSCBPQY1=g@mail.gmail.com>
 <D759423A-B76C-49C9-AB83-5B431C43ECC5@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <D759423A-B76C-49C9-AB83-5B431C43ECC5-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBGZWIgMjIsIDIwMTYgYXQgMTA6MTUgQU0sIFBpZXJyZSBNb3JlYXUgPHBpZXJyZS5t
b3Jyb3dAZnJlZS5mcj4gd3JvdGU6Cj4gQXBhcnQgZnJvbSBUZXNsYSB3aGljaCB1c2VzIHNoYXJl
ZCBtZW1vcnkgZm9yIHBhc3NpbmcgdGhlIE9wZW5DTCB1c2VyIHBhcmFtcywgRmVybWkrIHVzZSBj
b25zdCBtZW1vcnkgZm9yIHRoYXQsIGFuZCB0aGlzIGlzIHdoYXQgU2FtdWVsJ3MgcGF0Y2hlcyBh
cmUgZG9pbmcgKGF0IGxlYXN0IGZyb20gd2hhdCBJIHJlbWVtYmVyKS4KCkhtbW0uLi4uIHRoYXQg
cHV0cyBhIGJpdCBvZiBhIGhvbGUgaW4gbXkgdGhlb3J5IG9mICJsZXQncyBqdXN0IHVzZQpjb25z
dGJ1ZnMiLiBUaGF0IHNhaWQsIGNvbnN0YnVmcyAqd2lsbCogd29yayBvbiBUZXNsYSBhcyB3ZWxs
LgoKV2VsbCwgaW4gdGhhdCBjYXNlLCBwZXJoYXBzIGEgc2VwYXJhdGUgaW5wdXQgbWVtb3J5ICpp
cyogdGhlIHJpZ2h0CnRoaW5nIHRvIGRvPyBVZ2ggOiggVGhpcyBkZWZpbml0ZWx5IG5lZWRzIHRv
IGJlIGRpc2N1c3NlZCB3aXRoIHRoZQp3aWRlciBnYWxsaXVtL3Rnc2kgY29tbXVuaXR5LgoKICAt
aWxpYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
