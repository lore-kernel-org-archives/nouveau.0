From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 0/5] Fix deadlock on runtime suspend in DRM drivers
Date: Wed, 14 Feb 2018 10:26:35 +0100
Message-ID: <1ab1ea48-125c-a104-c11d-16d1e9d94b98@linux.intel.com>
References: <cover.1518338788.git.lukas@wunner.de>
 <20180214084636.GA28107@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180214084636.GA28107@wunner.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lukas Wunner <lukas@wunner.de>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>
Cc: Ismo Toijala <ismo.toijala@gmail.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Peter Wu <peter@lekensteyn.nl>
List-Id: nouveau.vger.kernel.org

T3AgMTQtMDItMTggb20gMDk6NDYgc2NocmVlZiBMdWthcyBXdW5uZXI6Cj4gRGVhciBkcm0tbWlz
YyBtYWludGFpbmVycywKPgo+IE9uIFN1biwgRmViIDExLCAyMDE4IGF0IDEwOjM4OjI4QU0gKzAx
MDAsIEx1a2FzIFd1bm5lciB3cm90ZToKPj4gRml4IGEgZGVhZGxvY2sgb24gaHlicmlkIGdyYXBo
aWNzIGxhcHRvcHMgdGhhdCdzIGJlZW4gcHJlc2VudCBzaW5jZSAyMDEzOgo+IFRoaXMgc2VyaWVz
IGhhcyBiZWVuIHJldmlld2VkLCBjb25zZW50IGhhcyBiZWVuIGV4cHJlc3NlZCBieSB0aGUgbW9z
dAo+IGludGVyZXN0ZWQgcGFydGllcywgcGF0Y2ggWzEvNV0gd2hpY2ggdG91Y2hlcyBmaWxlcyBv
dXRzaWRlIGRyaXZlcnMvZ3B1Cj4gaGFzIGJlZW4gYWNrZWQgYW5kIEkndmUganVzdCBvdXQgYSB2
MiBhZGRyZXNzaW5nIHRoZSBvbmx5IG9iamVjdGlvbgo+IHJhaXNlZC4gIE15IHBsYW4gaXMgdGh1
cyB0byB3YWl0IGFub3RoZXIgdHdvIGRheXMgZm9yIGNvbW1lbnRzIGFuZCwKPiBiYXJyaW5nIGZ1
cnRoZXIgb2JqZWN0aW9ucywgcHVzaCB0byBkcm0tbWlzYyB0aGlzIHdlZWtlbmQuCj4KPiBIb3dl
dmVyIEknbSBzdHJ1Z2dsaW5nIHdpdGggdGhlIGRlY2lzaW9uIHdoZXRoZXIgdG8gcHVzaCB0byBu
ZXh0IG9yCj4gZml4ZXMuICBUaGUgc2VyaWVzIGlzIG1hcmtlZCBmb3Igc3RhYmxlLCBob3dldmVy
IHRoZSBudW1iZXIgb2YKPiBhZmZlY3RlZCBtYWNoaW5lcyBpcyBsaW1pdGVkIGFuZCBmb3IgYW4g
aXNzdWUgdGhhdCdzIGJlZW4gcHJlc2VudAo+IGZvciA1IHllYXJzIGl0IHByb2JhYmx5IGRvZXNu
J3QgbWF0dGVyIGlmIGl0IHNvYWtzIGFub3RoZXIgdHdvIG1vbnRocwo+IGluIGxpbnV4LW5leHQg
YmVmb3IgaXQgZ2V0cyBiYWNrcG9ydGVkLiAgSGVuY2UgSSB0ZW5kIHRvIGVyciBvbiB0aGUKPiBz
aWRlIG9mIGNhdXRpb24gYW5kIHB1c2ggdG8gbmV4dCwgaG93ZXZlciBhIGNhc2UgY291bGQgYmUg
bWFkZSB0aGF0Cj4gZml4ZXMgaXMgbW9yZSBhcHByb3ByaWF0ZS4KPgo+IEknbSBsYWNraW5nIGV4
cGVyaWVuY2UgbWFraW5nIHN1Y2ggZGVjaXNpb25zIGFuZCB3b3VsZCBiZSBpbnRlcmVzdGVkCj4g
dG8gbGVhcm4gaG93IHlvdSdkIGhhbmRsZSB0aGlzLgo+Cj4gVGhhbmtzLAo+Cj4gTHVrYXMKCkkg
d291bGQgc2F5IGZpeGVzLCBpdCBkb2Vzbid0IGxvb2sgcGFydGljdWxhcmx5IHNjYXJ5LiA6KQoK
fk1hYXJ0ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
