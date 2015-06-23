From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
Subject: Re: [Mesa-dev] [RFC PATCH 5/8] nv50: prevent NULL pointer
 dereference with pipe_query functions
Date: Tue, 23 Jun 2015 15:57:57 +0900
Message-ID: <55890375.10901@daenzer.net>
References: <1435006399-2088-1-git-send-email-samuel.pitoiset@gmail.com>
 <1435006399-2088-6-git-send-email-samuel.pitoiset@gmail.com>
 <CAKb7UvjfuOu6hAhB7ywQsMc6OXcjF-cn_5UC_O5oUKt4HzgZnQ@mail.gmail.com>
 <558877D9.8040501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <558877D9.8040501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMjMuMDYuMjAxNSAwNjowMiwgU2FtdWVsIFBpdG9pc2V0IHdyb3RlOgo+IAo+IAo+IE9uIDA2
LzIyLzIwMTUgMTA6NTIgUE0sIElsaWEgTWlya2luIHdyb3RlOgo+PiBJZiBxdWVyeV9jcmVhdGUg
ZmFpbHMsIHdoeSB3b3VsZCBhbnkgb2YgdGhlc2UgZnVuY3Rpb25zIGdldCBjYWxsZWQ/Cj4gCj4g
QmVjYXVzZSB0aGUgSFVEIGRvZXNuJ3QgY2hlY2sgaWYgcXVlcnlfY3JlYXRlKCkgZmFpbHMgYW5k
IGl0IGNhbGxzIG90aGVyCj4gcGlwZV9xdWVyeSBmdW5jdGlvbnMgd2l0aCBOVUxMIHBvaW50ZXIg
aW5zdGVhZCBvZiBhIHZhbGlkIHF1ZXJ5IG9iamVjdC4KCkNvdWxkIHRoZSBIVUQgY29kZSBiZSBm
aXhlZCBpbnN0ZWFkPwoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAg
ICB8ICAgICAgICAgICAgICAgaHR0cDovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1
c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
