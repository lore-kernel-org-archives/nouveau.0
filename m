From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] avoid build fail without COMPOSITE
Date: Sat, 18 Jul 2015 15:42:05 +0100
Message-ID: <CACvgo51dyrGXKtBdGHaqw5QPg3hTML90DaVzothyFa85VPz5qw@mail.gmail.com>
References: <1436908642-20721-1-git-send-email-imirkin@alum.mit.edu>
 <CACvgo52=umZCKu-wk7nJovVMb-N7iy8JtSx5LcZpguGhPrPz5g@mail.gmail.com>
 <CAKb7UvjPT3QE9mBHZr3GcKc_s_FdU53sjHLwaqrn=hOX8xK_eQ@mail.gmail.com>
 <CACvgo500K-66hEN0OKNioy7s-WaTRM81LvAqQyFmXxN5E1cqhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACvgo500K-66hEN0OKNioy7s-WaTRM81LvAqQyFmXxN5E1cqhA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMTUgSnVseSAyMDE1IGF0IDE0OjEyLCBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdt
YWlsLmNvbT4gd3JvdGU6Cj4gVXBvbiBjbG9zZXIgbG9vayBpdCBzZWVtIHRoYXQgSSB3YXMgYSBi
aXQgb2ZmIC0gdGhlIGF0aS9pbnRlbCBkZHggZG9lcwo+IG5vdCBzZXQgb2ZmX3gveSB0byB6ZXJv
IHdoZW4gYnVpbHQgd2l0aG91dCBjb21wb3NpdGUqLgo+Cj4gLi4uIGluIGNvcHlfcmVnaW9uMiwg
dGhleSBkbyBzbyB3aGVuIHdvcmtpbmcgd2l0aCB2aWRlbyAtCj4gWHZBZGFwdG9yUHRyOjpkZFB1
dEltYWdlL1hGODZWaWRlb0FkYXB0b3JQdHI6OlB1dEltYWdlLgo+Cj4gRG9lcyB0aGlzIG1lYW4g
dGhhdCB0aGV5IG5lZWQgYSBzaW1pbGFyIHVwZGF0ZSA/IFdoYXQgYXJlIHRoZSBzeW1wdG9tcwo+
IG9mIHRoZSBpc3N1ZSA/Cj4KQ2FuIGFueW9uZSBnaXZlIHNvbWUgcm91Z2ggcG9pbnRlcnMgdG8g
dGhlIGFwcHJvcHJpYXRlIHJlYWRpbmcKbWF0ZXJpYWwgPyBBcyBtZW50aW9uZWQgbmVpdGhlciBh
dGkgbm9yIHRoZSBpbnRlbCBkZHggZm9sbG93IHRoaXMKYXBwcm9hY2ggc28gSSdtIGEgYml0IHB1
enpsZWQuIEZyb20gYSBxdWljayB0ZXN0IHRoZXJlIGlzIG5vICJidWlsZApmYWlsIiBpZiB3aGVu
IENPTVBPU0lURSBpcyBtaXNzaW5nLiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nCm9idmlvdXMvdHJp
dmlhbCA/CgpUaGFua3MKRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQo=
