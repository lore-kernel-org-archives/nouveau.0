From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 1/5] workqueue: Allow retrieval of current
 task's work struct
Date: Mon, 12 Feb 2018 09:07:47 -0800
Message-ID: <20180212170747.GX695913@devbig577.frc2.facebook.com>
References: <cover.1518338788.git.lukas@wunner.de>
 <2d8f603074131eb87e588d2b803a71765bd3a2fd.1518338788.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <2d8f603074131eb87e588d2b803a71765bd3a2fd.1518338788.git.lukas@wunner.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Pierre Moreau <pierre.morrow@free.fr>, Archit Taneja <architt@codeaurora.org>, Ismo Toijala <ismo.toijala@gmail.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Peter Wu <peter@lekensteyn.nl>
List-Id: nouveau.vger.kernel.org

SGVsbG8sCgpPbiBTdW4sIEZlYiAxMSwgMjAxOCBhdCAxMDozODoyOEFNICswMTAwLCBMdWthcyBX
dW5uZXIgd3JvdGU6Cj4gSW50cm9kdWNlIGEgaGVscGVyIHRvIHJldHJpZXZlIHRoZSBjdXJyZW50
IHRhc2sncyB3b3JrIHN0cnVjdCBpZiBpdCBpcwo+IGEgd29ya3F1ZXVlIHdvcmtlci4KPiAKPiBU
aGlzIGFsbG93cyB1cyB0byBmaXggYSBsb25nLXN0YW5kaW5nIGRlYWRsb2NrIGluIHNldmVyYWwg
RFJNIGRyaXZlcnMKPiB3aGVyZWluIHRoZSAtPnJ1bnRpbWVfc3VzcGVuZCBjYWxsYmFjayB3YWl0
cyBmb3IgYSBzcGVjaWZpYyB3b3JrZXIgdG8KPiBmaW5pc2ggYW5kIHRoYXQgd29ya2VyIGluIHR1
cm4gY2FsbHMgYSBmdW5jdGlvbiB3aGljaCB3YWl0cyBmb3IgcnVudGltZQo+IHN1c3BlbmQgdG8g
ZmluaXNoLiAgVGhhdCBmdW5jdGlvbiBpcyBpbnZva2VkIGZyb20gbXVsdGlwbGUgY2FsbCBzaXRl
cwo+IGFuZCB3YWl0aW5nIGZvciBydW50aW1lIHN1c3BlbmQgdG8gZmluaXNoIGlzIHRoZSBjb3Jy
ZWN0IHRoaW5nIHRvIGRvCj4gZXhjZXB0IGlmIGl0J3MgZXhlY3V0aW5nIGluIHRoZSBjb250ZXh0
IG9mIHRoZSB3b3JrZXIuCj4gCj4gQ2M6IFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4KPiBDYzog
TGFpIEppYW5nc2hhbiA8amlhbmdzaGFubGFpQGdtYWlsLmNvbT4KPiBDYzogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29t
Pgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+CgpJIHdvbmRlciB3aGV0aGVy
IGl0J3MgdG9vIGdlbmVyaWMgYSBuYW1lIGJ1dCB0aGVyZSBhcmUgb3RoZXIgZnVuY3Rpb25zCm5h
bWVkIGluIGEgc2ltaWxhciBmYXNoaW9uIGFuZCBBRkFJQ1MgY3VycmVudF93b3JrIGlzbid0IHVz
ZWQgYnkKYW55b25lIGluIHRoZSB0cmVlLCBzbyBpdCBzZWVtcyBva2F5LgoKQWNrZWQtYnk6IFRl
anVuIEhlbyA8dGpAa2VybmVsLm9yZz4KClBsZWFzZSBmZWVsIGZyZWUgdG8gcm91dGUgYXMgeW91
IHNlZSBmaXQuCgpUaGFua3MuCgotLSAKdGVqdW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ2Z4Cg==
