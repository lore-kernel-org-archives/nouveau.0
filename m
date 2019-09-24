From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Is Nouveau really using the io_reserve_lru?
Date: Tue, 24 Sep 2019 14:19:41 +0200
Message-ID: <ec6739a5-af3a-0aeb-fdae-dd11d6b2ec1f@gmail.com>
Reply-To: christian.koenig-5C7GfCeVMHo@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

SGkgZ3V5cywKCndoaWxlIHdvcmtpbmcgdGhyb3VnaCBtb3JlIG9sZCBUVE0gZnVuY3Rpb25hbGl0
eSBJIHN0dW1ibGVkIG92ZXIgdGhlIAppb19yZXNlcnZlX2xydS4KCkJhc2ljIGlkZWEgaXMgdGhh
dCB3aGVuIHRoaXMgZmxhZyBpcyBzZXQgdGhlIGRyaXZlci0+aW9fbWVtX3Jlc2VydmUoKSAKY2Fs
bGJhY2sgY2FuIHJldHVybiAtRUFHQUlOIHJlc3VsdGluZyBpbiB1bm1hcHBpbmcgb2Ygb3RoZXIg
Qk9zLgoKQnV0IE5vdXZlYXUgZG9lc24ndCBzZWVtIHRvIHJldHVybiAtRUFHQUlOIGluIHRoZSBj
YWxsIHBhdGggb2YgCmlvX21lbV9yZXNlcnZlIGFueXdoZXJlLgoKU28gaXMgdGhpcyB1bnVzZWQg
b3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KClJlZ2FyZHMsCkNocmlzdGlhbi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
