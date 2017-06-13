From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Mesa-dev] [RFC 0/9] Add precise/invariant semantics
	to TGSI
Date: Mon, 12 Jun 2017 20:05:18 -0400
Message-ID: <CAKb7UviKiLbRG+z4paq8=-6epuWtKSxty2DHw6SQ1LZ+ULQgmw@mail.gmail.com>
References: <20170611184239.7204-1-karolherbst@gmail.com>
 <6f999a01-c3db-0a38-a04c-bbb138eef46b@gmail.com>
 <8a99cdc6-c415-1423-dd1b-13a09f902288@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8a99cdc6-c415-1423-dd1b-13a09f902288-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Roland Scheidegger <sroland-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, =?UTF-8?Q?Nicolai_H=C3=A4hnle?= <nhaehnle-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBKdW4gMTIsIDIwMTcgYXQgNzo1NyBQTSwgUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9s
YW5kQHZtd2FyZS5jb20+IHdyb3RlOgo+IEZXSVcgc3VyZWx5IG9uIG52NTAgeW91IGNvdWxkIGtl
ZXAgYSBzaW5nbGUgbWFkIGluc3RydWN0aW9uIGZvciB1bWFkCj4gKHNhZCBtYXliZSB0b28/KS4g
KEknbSBhY3R1YWxseSB3b25kZXJpbmcgaWYgdGhlIGh3IHJlYWxseSBjYW4ndCBkbwo+IHVuZnVz
ZWQgZmxvYXQgbXVsdGlwbHkrYWRkIGFzIGEgc2luZ2xlIGluc3RydWN0aW9uIGJ1dCBJIGtub3cg
bmV4dCB0bwo+IG5vdGhpbmcgYWJvdXQgbnZpZGlhIGh3Li4uKQoKVGhlIGNvbXBpbGVyIHNob3Vs
ZCByZWFzc29jaWF0ZSBhIG11bCArIGFkZCBpbnRvIGEgbWFkIHdoZXJlIHBvc3NpYmxlLgpJbiBh
Y3R1YWxpdHksIElNQUQgaXMgYWN0dWFsbHkgc3VwZXItc2xvdy4uLiBhbGxlZ2VkbHkgc2xvd2Vy
IHRoYW4KSU1VTCArIElBREQuIE5vdCBzdXJlIHdoeS4gTWF4d2VsbCBhZGRlZCBhIFhNQUQgb3Bl
cmF0aW9uIHdoaWNoIGlzCmZhc3RlciBidXQgd2UgaGF2ZW4ndCBmaWd1cmVkIG91dCBob3cgdG8g
b3BlcmF0ZSBpdCB5ZXQuIEknbSBub3QgYXdhcmUKb2YgYSBtdWxhZGQgdmVyc2lvbiBvZiBmbWEg
b24gZmVybWkgYW5kIG5ld2VyIChHTCA0LjApLiBUaGUgdGVzbGEKc2VyaWVzIGRvZXMgaGF2ZSBh
IGZsb2F0aW5nIHBvaW50IG11bCthZGQgKGJ1dCBubyBmbWEpLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
