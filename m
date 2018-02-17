From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 0/5] Fix deadlock on runtime suspend in DRM drivers
Date: Sat, 17 Feb 2018 11:38:19 +0100
Message-ID: <20180217103819.GA23706@wunner.de>
References: <cover.1518338788.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <cover.1518338788.git.lukas@wunner.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: Ismo Toijala <ismo.toijala@gmail.com>, Lai Jiangshan <jiangshanlai@gmail.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Liviu Dudau <Liviu.Dudau@arm.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, Peter Wu <peter@lekensteyn.nl>, Dave Airlie <airlied@redhat.com>, Tejun Heo <tj@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

T24gU3VuLCBGZWIgMTEsIDIwMTggYXQgMTA6Mzg6MjhBTSArMDEwMCwgTHVrYXMgV3VubmVyIHdy
b3RlOgo+ICAgd29ya3F1ZXVlOiBBbGxvdyByZXRyaWV2YWwgb2YgY3VycmVudCB0YXNrJ3Mgd29y
ayBzdHJ1Y3QKPiAgIGRybTogQWxsb3cgZGV0ZXJtaW5pbmcgaWYgY3VycmVudCB0YXNrIGlzIG91
dHB1dCBwb2xsIHdvcmtlcgo+ICAgZHJtL25vdXZlYXU6IEZpeCBkZWFkbG9jayBvbiBydW50aW1l
IHN1c3BlbmQKPiAgIGRybS9yYWRlb246IEZpeCBkZWFkbG9jayBvbiBydW50aW1lIHN1c3BlbmQK
PiAgIGRybS9hbWRncHU6IEZpeCBkZWFkbG9jayBvbiBydW50aW1lIHN1c3BlbmQKClB1c2hlZCB0
byBkcm0tbWlzYy1maXhlcywgdGhhbmtzIGEgbG90IGV2ZXJ5b25lIGZvciB0aGUgYWNrcywKcmV2
aWV3cywgdGVzdGluZyBhbmQgY29tbWVudHMuCgpkcm0tbWlzYyBtYWludGFpbmVycywgaGVhZHMt
dXA6Cgpkcm0tbWlzYy1maXhlcyBpcyBzdGlsbCBiYXNlZCBvbiA0LjE1LXJjOC4gIFRoZSBwcmVz
ZW50IHNlcmllcwphcHBsaWVzIGNsZWFubHkgdG8gYm90aCA0LjE1IGFuZCA0LjE2LCBzbyBJIGhh
ZCBubyBuZWVkIHRvIGhhdmUKNC4xNi1yYzEgYmFja21lcmdlZCwgYnV0IHRoYXQgbWF5IGJlIG5l
Y2Vzc2FyeSBzb29uZXIgb3IgbGF0ZXIuCkkgZGlkIGEgbG9jYWwgdGVzdCBwdWxsIGludG8gZHJt
LWZpeGVzLCB0aGUgc2hvcnRsb2cgbG9va2VkIHNhbmUKYW5kIGl0IG1lcmdlZCBhbmQgY29tcGls
ZWQgY2xlYW5seS4KClBsZWFzZSBub3RlIHR3byBvdGhlciBjb21taXRzIGFyZSBzdGlsbCBwZW5k
aW5nIGluIGRybS1taXNjLWZpeGVzOgoKICAgIGNvbW1pdCA3NDVmZDUwZjNiMDQ0ZGI2YTM5MjJl
MTcxODMwNjU1NTYxMzE2NGIwCiAgICBBdXRob3I6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+CiAgICBEYXRlOiAgIFdlZCBKYW4gMzEgMTI6MDQ6NTAgMjAxOCArMDEwMAoK
ICAgIGRybS9jaXJydXM6IExvYWQgbHV0IGluIGNydGNfY29tbWl0CgpHdXN0YXZvIHNlbnQgYSBw
dWxsIHJlcXVlc3QgZm9yIHRoaXMgb25lIG9uIEphbiAzMSBidXQgZXJyb25lb3VzbHkKYmFzZWQg
aXQgb24gdGhlIHdyb25nIGNvbW1pdCBhbmQgaXQgZW5kZWQgdXAgbm90IGJlaW5nIHB1bGxlZCBi
eSBEYXZlLgoKICAgIGNvbW1pdCA1NGY4MDljZmJkNmI0YTQzOTU5MDM5ZjVkMzM1OTZlZDMyOTdj
ZTE2CiAgICBBdXRob3I6IExlbyAoU3VucGVuZykgTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KICAg
IERhdGU6ICAgV2VkIEphbiAxNyAxMjo1MTowOCAyMDE4ICswMTAwCgogICAgZHJtL2F0b21pYzog
Rml4IG1lbWxlYWsgb24gRVJFU1RBUlRTWVMgZHVyaW5nIG5vbi1ibG9ja2luZyBjb21taXRzCgpU
aGlzIG9uZSBoYXMgYWxyZWFkeSBiZWVuIHB1bGxlZCBieSBEYXZlIGludG8gZHJtLW5leHQgZm9y
IDQuMTcKYXMgY29tbWl0IDFjNmNlZWVlNmViYiBidXQgTWFhcnRlbiBzdWJzZXF1ZW50bHkgY2hl
cnJ5LXBpY2tlZAppdCBvbnRvIGRybS1taXNjLWZpeGVzLgoKTGV0IG1lIGtub3cgaWYgSSd2ZSBt
YWRlIGFueSBtaXN0YWtlcy4KClRoYW5rcywKCkx1a2FzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
