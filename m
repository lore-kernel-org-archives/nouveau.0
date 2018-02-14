From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] 4.16-rc1: UBSAN warning in
 nouveau/nvkm/subdev/therm/base.c + oops in nvkm_therm_clkgate_fini
Date: Wed, 14 Feb 2018 09:36:33 -0500
Message-ID: <CAKb7UvhRt=25J5aOUZusdE51hh1JVc45aQ8OhCVeOJwzYvLOJw@mail.gmail.com>
References: <alpine.LRH.2.21.1802132200260.24929@math.ut.ee>
 <alpine.LRH.2.21.1802141628110.25362@math.ut.ee>
 <CAKb7Uvj3MKGzNNcrc=-JA5GN4jt9+TU7ZjWDZpccmYJLDo76WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7Uvj3MKGzNNcrc=-JA5GN4jt9+TU7ZjWDZpccmYJLDo76WQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Meelis Roos <mroos@linux.ee>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBGZWIgMTQsIDIwMTggYXQgOTozNSBBTSwgSWxpYSBNaXJraW4gPGltaXJraW5AYWx1
bS5taXQuZWR1PiB3cm90ZToKPiBPbiBXZWQsIEZlYiAxNCwgMjAxOCBhdCA5OjI5IEFNLCBNZWVs
aXMgUm9vcyA8bXJvb3NAbGludXguZWU+IHdyb3RlOgo+Pj4gVGhpcyBpcyA0LjE2LXJjMSt0b2Rh
eXMgZ2l0IG9uIGEgbG93bHkgUDQgd2l0aCBOVjUsIHdvcmtlZCBmaW5lIGluIDQuMTU6Cj4+Cj4+
IE5WNSBpbiBhbm90aGVyIFBDIChzZWNvbmRhcnkgY2FyZCBpbiB4ODYtNjQpIG1hZGUgdGhlIHN5
c3RyZW0gY3Jhc2ggb24KPj4gYm9vdCwgaW4gbnZrbV90aGVybV9jbGtnYXRlX2ZpbmkuCj4KPiBN
aW5kIGJvb3Rpbmcgd2l0aCBub3V2ZWF1LmRlYnVnPXRyYWNlPyBUaGF0IHNob3VsZCBob3BlZnVs
bHkgdGVsbCB1cwo+IG1vcmUgZXhhY3RseSB3aGljaCB0aGluZyBpcyBkeWluZy4gSWYgeW91IGhh
dmUgYSBjcm9zcy1jb21waWxlL2Rpc3RjYwo+IHNldHVwIGhhbmR5LCBhIGJpc2VjdCBtYXkgYmUg
ZXZlbiBtb3JlIHVzZWZ1bC4KCkVybSwgc29ycnksIG5ldmVybWluZC4gWW91IGV2ZW4gc2FpZCBp
dCAtLSBudmttX3RoZXJtX2Nsa2dhdGVfZmluaSBpcwpzb21laG93IG1pcy1ob29rZWQgdXAgZm9y
IE5WNSBub3cuIEEgYmlzZWN0IHJlc3VsdCB3b3VsZCBzdGlsbCBtYWtlCnRoZSBjdWxwcml0IGEg
bG90IG1vcmUgb2J2aW91cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
