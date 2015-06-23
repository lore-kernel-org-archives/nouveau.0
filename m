From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa-dev] [RFC PATCH 5/8] nv50: prevent NULL pointer
 dereference with pipe_query functions
Date: Tue, 23 Jun 2015 09:28:50 +0200
Message-ID: <55890AB2.5000300@gmail.com>
References: <1435006399-2088-1-git-send-email-samuel.pitoiset@gmail.com>
 <1435006399-2088-6-git-send-email-samuel.pitoiset@gmail.com>
 <CAKb7UvjfuOu6hAhB7ywQsMc6OXcjF-cn_5UC_O5oUKt4HzgZnQ@mail.gmail.com>
 <558877D9.8040501@gmail.com> <55890375.10901@daenzer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <55890375.10901-otUistvHUpPR7s880joybQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

CgpPbiAwNi8yMy8yMDE1IDA4OjU3IEFNLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiBPbiAyMy4w
Ni4yMDE1IDA2OjAyLCBTYW11ZWwgUGl0b2lzZXQgd3JvdGU6Cj4+Cj4+IE9uIDA2LzIyLzIwMTUg
MTA6NTIgUE0sIElsaWEgTWlya2luIHdyb3RlOgo+Pj4gSWYgcXVlcnlfY3JlYXRlIGZhaWxzLCB3
aHkgd291bGQgYW55IG9mIHRoZXNlIGZ1bmN0aW9ucyBnZXQgY2FsbGVkPwo+PiBCZWNhdXNlIHRo
ZSBIVUQgZG9lc24ndCBjaGVjayBpZiBxdWVyeV9jcmVhdGUoKSBmYWlscyBhbmQgaXQgY2FsbHMg
b3RoZXIKPj4gcGlwZV9xdWVyeSBmdW5jdGlvbnMgd2l0aCBOVUxMIHBvaW50ZXIgaW5zdGVhZCBv
ZiBhIHZhbGlkIHF1ZXJ5IG9iamVjdC4KPiBDb3VsZCB0aGUgSFVEIGNvZGUgYmUgZml4ZWQgaW5z
dGVhZD8KSXQncyBkZWZpbml0ZWx5IHBvc3NpYmxlLCBhbmQgcHJvYmFibHkgdGhlIGJlc3Qgc29s
dXRpb24gaW5zdGVhZCBvZiAKcHJldmVudGluZyBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4g
dGhlIHVuZGVybHlpbmcgZHJpdmVycy4gSSdsbCBtYWtlIAphIHBhdGNoLgo+Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
