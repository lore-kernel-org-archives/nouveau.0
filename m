From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH mesa 3/3] nouveau: Add support for clover /
 OpenCL kernel input parameters
Date: Thu, 10 Mar 2016 11:06:56 -0500
Message-ID: <CAKb7Uvin=tZkU9r0YY_4YxCVqMzWnnaacP5bVd6bx2DDon2zyQ@mail.gmail.com>
References: <1457622887-19328-1-git-send-email-hdegoede@redhat.com>
 <1457622887-19328-4-git-send-email-hdegoede@redhat.com>
 <CAKb7UvhNCiRQ6XXfVNzS3WkE+Bf4x4w-Bv2JfYm5-owUrEKoLw@mail.gmail.com>
 <56E19271.7070704@gmail.com> <20160310160301.GA1073@pmoreau.org>
 <56E19B67.3030306@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56E19B67.3030306-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBNYXIgMTAsIDIwMTYgYXQgMTE6MDUgQU0sIFNhbXVlbCBQaXRvaXNldAo8c2FtdWVs
LnBpdG9pc2V0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHks
IHRoZSBnb2FsIGlzIHRvIGhhdmUgdXNlciBpbnB1dHMgaW4gYQo+PiBgc2NyZWVuLT51bmlmb3Jt
X2JvYCwgYW5kIHNvIGZvciBhbGwgZ2VuZXJhdGlvbnM/Cj4KPiBTdXJlIGZvciBmZXJtaSwgYW5k
IHByb2JhYmx5IGZvciBUZXNsYS4KCkkgdGhpbmsgY29udGludWluZyB0byB1c2UgdGhlIFVTRVJf
UEFSQU1TIG9yIHdoYXRldmVyIG1lY2hhbmlzbSBvbgp0ZWxzYSBtYWtlcyBzZW5zZS4gVGhhdCdz
IHdoeSBJIGFncmVlZCB0byBrZWVwIHRoZSBNRU1PUlksIElOUFVUCmNvbmNlcHQuCgogIC1pbGlh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
