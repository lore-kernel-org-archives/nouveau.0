From: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: stable? kms: take mode_config mutex in connector hotplug
	path
Date: Mon, 29 Feb 2016 16:14:35 +0100
Message-ID: <56D4605B.5040502@gmail.com>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Cmh0dHBzOi8vZ2l0aHViLmNvbS9za2VnZ3NiL25vdXZlYXUvY29tbWl0Lzk4NjJiMjEKaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0Lmdp
dC9jb21taXQvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYz9pZD0w
YTg4MmNhZAoKdGhpcyB3YXMgc2VudCB0byBAc3RhYmxlLApidXQgdGVzdCByZXN1bHQgaXM6Cgpu
b3V2ZWF1OiBVbmtub3duIHN5bWJvbCBtdXRleF9sb2NrIChlcnIgMCkKbm91dmVhdTogVW5rbm93
biBzeW1ib2wgbXV0ZXhfbG9ja19pbnRlcnJ1cHRpYmxlIChlcnIgMCkKCjQuNC4zLTIwMS5mYzIy
Lng4Nl82NCtkZWJ1ZwoKQmFja3BvcnQgZmF1eD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQo=
