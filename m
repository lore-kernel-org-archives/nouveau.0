From: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa-dev] [PATCH 1/2] nvc0/ir: detect AND/SHR pairs
 and convert into EXTBF
Date: Tue, 18 Aug 2015 18:57:20 -0700
Message-ID: <CAEdQ38EXBDX8On9822t7brPvr-wcYr0MADnyGpQGbfU7Tce03w@mail.gmail.com>
References: <1439948992-17738-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1439948992-17738-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

T24gVHVlLCBBdWcgMTgsIDIwMTUgYXQgNjo0OSBQTSwgSWxpYSBNaXJraW4gPGltaXJraW5AYWx1
bS5taXQuZWR1PiB3cm90ZToKPiBTb21lIHNoYWRlcnMgYXBwZWFyIHRvIGV4dHJhY3QgYml0cyB1
c2luZyBzaGlmdC9hbmQgY29tYm9zLiBEZXRlY3QKPiAoc29tZSkgb2YgdGhvc2UgYW5kIGNvbnZl
cnQgdG8gRVhUQkYgaW5zdGVhZC4KCldoYXQgaXMgRVhUQkY/IEV4dHJhY3QgYnl0ZSB0byBmbG9h
dD8KCkkgYXNrIGJlY2F1c2UgVW5pZ2luZSBIZWF2ZW4gaGFzIHNoYWRlcnMgdGhhdCBwYWNrIDN4
IGJ5dGUtaW50ZWdlcnMKaW50byBvbmUgY29tcG9uZW50IG9mIGEgdmVjNCBhbmQgZXh0cmFjdHMg
dGhlbSB3aXRoIHNoaWZ0cy9hbmRzIGFuZApjb252ZXJ0cyB0aGVtIHRvIGZsb2F0cywgYW5kIGk5
NjUgY291bGQgZG8gdGhlIGV4dHJhY3Rpb24gYW5kCmNvbnZlcnNpb24gaW4gYSBzaW5nbGUgaW5z
dHJ1Y3Rpb24uIEknbSBjdXJpb3VzIGlmIHRoaXMgaXMgdGhlIHNhbWUKdGhpbmcgeW91J3JlIG9w
dGltaXppbmcuCgpJIHRob3VnaHQgYWJvdXQgYWRkaW5nIGFuIGV4dHJhY3RfYnl0ZShzcmMsIGJ5
dGVfbnVtKSBvcGVyYXRpb24sIGJ1dAppOTY1J3MgY29weSBwcm9wYWdhdGlvbiBjYXVzZWQgbWUg
c29tZSBoZWFkYWNoZSBhbmQgSSBzaGVsdmVkIGl0LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQo=
