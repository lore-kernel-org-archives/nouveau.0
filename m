From: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] nv50/ir: Preapre for running Opts inside a
	loop
Date: Mon,  3 Apr 2017 17:55:50 +0200
Message-ID: <20170403155553.996-1-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

U2xvd2x5IHdlIGFyZSBnZXR0aW5nIHRvIHRoZSBwb2ludCwgdGhhdCB3ZSBtaXNzIGVub3VnaCBv
cHRpbWl6YXRpb24Kb3Bwb3J0dW5pdGllcyBhcyB0aGUgcmVzdWx0IG9mIG91ciBvd24gcGFzc2Vz
LgoKRm9yIHRoaXMgd2UgbmVlZCB0byBmaXggQWxnZWJyYWljT3B0IHRvIGJlIGFibGUgdG8gaGFu
ZGxlIG1vZHMgb24gc291cmNlcwp3aXRob3V0IGNyZWF0aW5nIG5ldyBpc3N1ZXMuCgpUaGUgbGFz
dCBwYXRjaCBlbmFibGVzIGxvb3Bpbmcgb3B0cy4KCkthcm9sIEhlcmJzdCAoMyk6CiAgbnY1MC9p
cjogZml4IEFsZ2VicmFpY09wdCBmb3Igc2xjdHMgd2l0aCBtb2RzCiAgbnY1MC9pcjogaGFuZGxl
IGxvZ29wcyB3aXRoIE5PVCBpbiBBbGdlYnJhaWNPcHQKICBudjUwL2lyOiBydW4gc29tZSBwYXNz
ZXMgbXVsdGlwbGUgdGltZXMKCiAuLi4vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9w
ZWVwaG9sZS5jcHAgICB8IDI5ICsrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTIuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
