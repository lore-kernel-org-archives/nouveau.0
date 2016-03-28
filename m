From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 20/22] clk: add nvkm_clk_reclock function
Date: Tue, 29 Mar 2016 01:34:58 +0300
Message-ID: <56F9B192.8060308@free.fr>
References: <1458577000-6615-1-git-send-email-nouveau@karolherbst.de>
 <1458577000-6615-21-git-send-email-nouveau@karolherbst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1458577000-6615-21-git-send-email-nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

T24gMjEvMDMvMTYgMTg6MTYsIEthcm9sIEhlcmJzdCB3cm90ZToKPiB0aGlzIGZ1bmN0aW9uIGp1
c3QgZm9yY2VzIGEgcmVjbG9jay4gVGhpcyBtYWtlcyBzZW5zZSBpZiBzb21lIGNzdGF0ZXMgZ2V0
ICh1bilhdmFpbGFibGUgYW5kIHdlIGhhdmUgdG8gYWRqdXN0IHRvIHRoYXQuCj4KPiBUaGlzIGNh
biBoYXBwZW4gZm9yIHZhcmlvdXMgcmVhc29uczoKPiAgICogdGVtcGVyYXR1cmUgY2hhbmdlcwo+
ICAgKiB1c2VyIGNoYW5nZXMgYm9vc3QgbW9kZQo+Cj4gU2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVy
YnN0IDxub3V2ZWF1QGthcm9saGVyYnN0LmRlPgpZb3UgY2FuIGFsc28gYWRkIG9uZSBldmVudDoK
ICAqIFRoZSBsb2FkIGNoYW5nZXMKCkluIHRoZSBlbmQsIHRoZSBkeW4uIHJlY2xvY2tpbmcgd2ls
bCBnZW5lcmF0ZSBhIHRhcmdldCBwc3RhdGUvY3N0YXRlIAp3aGljaCB3aWxsIGJlIGFwcGxpZWQg
YXMgd2VsbCBhcyBwb3NzaWJsZS4gV2l0aCB0aGlzIGluIG1pbmQsIHdlIGNvdWxkIApyZW5hbWUg
dGhpcyBmdW5jdGlvbiBudmttX2Nsa191cGRhdGUoPG5vIHBhcmFtPikuIFJlY2xvY2sgaXMgYSB3
ZWlyZCAKbmFtZSwgYnV0IHNvIGlzIHVwZGF0ZS4KClBpY2sgd2hhdGV2ZXIgeW91IHdhbnQhCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFp
bGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
