From: Zack Rusin <zackr-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Date: Wed, 2 Dec 2020 15:37:00 +0000
Message-ID: <FBC4840D-C1A8-4492-9E2E-D31E00B8D61A@vmware.com>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
 <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
 <d43d06e6-d13c-ef9b-b372-8d30d9494417@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <d43d06e6-d13c-ef9b-b372-8d30d9494417-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Content-ID: <AA28D6F9E38CC942957B0E99C0C72BC1-HX+pjaQZbrqcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Roland Scheidegger <sroland-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "daniel-/w4YWyX8dFk@public.gmane.org" <daniel-/w4YWyX8dFk@public.gmane.org>, "spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

DQoNCj4gT24gRGVjIDIsIDIwMjAsIGF0IDA5OjI3LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPiBIaQ0KPiANCj4gQW0gMDIuMTIuMjAgdW0gMDk6
MDEgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4+IEhpDQo+PiBBbSAzMC4xMS4yMCB1bSAy
MTo1OSBzY2hyaWViIFphY2sgUnVzaW46DQo+Pj4gDQo+Pj4gDQo+Pj4+IE9uIE5vdiAyNCwgMjAy
MCwgYXQgMDY6MzgsIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90
ZToNCj4+Pj4gDQo+Pj4+IFVzaW5nIHN0cnVjdCBkcm1fZGV2aWNlLnBkZXYgaXMgZGVwcmVjYXRl
ZC4gQ29udmVydCB2bXdnZnggdG8gc3RydWN0DQo+Pj4+IGRybV9kZXZpY2UuZGV2LiBObyBmdW5j
dGlvbmFsIGNoYW5nZXMuDQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+Pj4gQ2M6IFJvbGFuZCBTY2hlaWRlZ2dlciA8
c3JvbGFuZEB2bXdhcmUuY29tPg0KPj4+PiAtLS0NCj4+Pj4gZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfY21kYnVmLmMgfCAgOCArKysrLS0tLQ0KPj4+PiBkcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9kcnYuYyAgICB8IDI3ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+Pj4+
IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ZiLmMgICAgIHwgIDIgKy0NCj4+PiANCj4+
PiBSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4+IENvdWxkIHlv
dSBhZGQgdGhpcyBwYXRjaCB0byB0aGUgdm13Z2Z4IHRyZWU/DQo+IA0KPiBBTUQgZGV2cyBpbmRp
Y2F0ZWQgdGhhdCB0aGV5J2QgcHJlZmVyIHRvIG1lcmdlIHRoZSBwYXRjaHNldCB0cm91Z2ggZHJt
LW1pc2MtbmV4dC4gSWYgeW91J3JlIE9LIHdpdGggdGhhdCwgSSdkIG1lcmdlIHRoZSB2bXdnZngg
cGF0Y2ggdGhyb3VnaCBkcm0tbWlzYy1uZXh0IGFzIHdlbGwuDQoNClNvdW5kcyBnb29kLiBJ4oCZ
bGwgbWFrZSBzdXJlIHRvIHJlYmFzZSBvdXIgbGF0ZXN0IHBhdGNoIHNldCBvbiB0b3Agb2YgaXQg
d2hlbiBpdOKAmXMgaW4uIFRoYW5rcyENCg0KegpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngK
