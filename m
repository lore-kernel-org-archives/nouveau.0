From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Dealing with opencl kernel parameters in nouveau now
 that RES support is gone
Date: Mon, 22 Feb 2016 15:17:20 +0100
Message-ID: <56CB1870.4030606@redhat.com>
References: <56C5D8F9.6030408@redhat.com>
 <CAKb7UvidnYPcG4w=R=1CKhc0AFmSKzmdgYA9XAKT3sBHwnpGcw@mail.gmail.com>
 <56C6F031.6060308@redhat.com>
 <CAKb7UvgzKeOCm3Xh+j4=E_ru5_F_xGnx9NHkVT9sJoDw17OhVg@mail.gmail.com>
 <56CAF059.3090608@redhat.com> <56CB01EB.9040705@gmail.com>
 <56CB0340.3010403@redhat.com> <56CB074B.9070406@gmail.com>
 <56CB0865.7070108@redhat.com>
 <CAKb7UvgZoRLeLhnqa-H6bLG+gyLRYj+arCNQP39Q8zPR6Gu4jA@mail.gmail.com>
 <CAKb7UviPZtExOcgUDxuxyhGf6C0QL+apn6ZjJEdJ8DhM_sfChw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviPZtExOcgUDxuxyhGf6C0QL+apn6ZjJEdJ8DhM_sfChw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

SGksCgpPbiAyMi0wMi0xNiAxNDo0NywgSWxpYSBNaXJraW4gd3JvdGU6Cj4gT24gTW9uLCBGZWIg
MjIsIDIwMTYgYXQgODo0NSBBTSwgSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PiB3
cm90ZToKPj4gSU5QVVQgaXMgZm9yIHNoYWRlciBpbnB1dHMgd2hpY2ggY29tZSBmcm9tIGZpeGVk
IGZ1bmN0aW9uIGxvYWRlcnMuCj4+IFRoaXMgaXMgbm90IHdoYXQgeW91IHdhbnQuIFlvdSB3YW50
IENPTlNULiBTdGljayB0aGUgaW5wdXQgcGFyYW1zIGludG8KPj4gYSBjb25zdGJ1ZiwgYW5kIHlv
dSdyZSBkb25lLgo+Cj4gT2gsIGFuZCBpbiBjYXNlIGl0J3Mgbm90IGNsZWFyLCBJIHRoaW5rIHRo
aXMgc2hvdWxkIGJlIGRvbmUgYnkgdGhlIHN0LAo+IG5vdCBieSB0aGUgZHJpdmVyLiBOb3QgYSBi
aWcgZmFuIG9mIHRoZSBjdXJyZW50IGludGVyZmFjZSB3aGVyZSB0aGUKPiBkcml2ZXIgaXMgcmVz
cG9uc2libGUgZm9yIHVwbG9hZGluZyB0aGUga2VybmVsIGlucHV0IHBhcmFtZXRlcnMuCgpNb3Zp
bmcgdGhpcyB0byB0aGUgc3RhdGUtdHJhY2tlciB3aWxsIGxpa2VseSBicmVhayBjbG92ZXIgZm9y
IGFtZApjYXJkcywgYWxzbyB3aGF0IGlzIHRoZSByaWdodCBwbGFjZSB0byBzdGljayB0aGUgaW5w
dXQgcGFyYW1zIG15CmRpZmZlciBmcm9tIG9uZSBncHUgdG8gdGhlIG90aGVyLCBhbHNvIHRoZSBv
cGVuY2wgLT4gdGdzaSBjb21waWxlcgp3aWxsIG5lZWQgdG8ga25vdyBob3cgdG8gImFkZHJlc3Mi
IGlucHV0IHBhcmFtcyB3aXRob3V0IGl0IG5lZWRpbmcgdG8Ka25vdyB0b28gbXVjaCBkZXRhaWxz
IG9mIHRoZSB0YXJnZXR0ZWQgZ3B1LiBTbyBvZiBJTlBVVCBpcyBub3Qgc3VpdGFibGUsCnRoZW4g
SSB0aGluayB3ZSBhcmUgZ29pbmcgdG8gbmVlZCBNRU1PUllbI10sIElOUFVUIGZvciB0aGlzLCB3
aGljaApub3V2ZWF1IGNhbiB0aGVuIGp1c3QgdHJlYXQgYXMgQ09OU1QuCgpSZWdhcmRzLAoKSGFu
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
