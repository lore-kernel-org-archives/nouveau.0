From: David Binderman <dcb314-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: linux-4.13/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c:86: possible
 faulty logic ?
Date: Mon, 4 Sep 2017 10:00:27 +0000
Message-ID: <HE1PR0802MB233109D559396D520B66E71D9C910@HE1PR0802MB2331.eurprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

SGVsbG8gdGhlcmUsCgpbbGludXgtNC4xMy9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi90aGVybS9mYW4uYzo5M106ICh3YXJuaW5nKSBPcHBvc2l0ZSBpbm5lciAnaWYnIGNvbmRp
dGlvbiBsZWFkcyB0byBhIGRlYWQgY29kZSBibG9jay4KClNvdXJjZSBjb2RlIGlzCgogICAgaWYg
KHRhcmdldCAhPSBkdXR5KSB7CiAgICAgICAgdTE2IGJ1bXBfcGVyaW9kID0gZmFuLT5iaW9zLmJ1
bXBfcGVyaW9kOwogICAgICAgIHUxNiBzbG93X2Rvd25fcGVyaW9kID0gZmFuLT5iaW9zLnNsb3df
ZG93bl9wZXJpb2Q7CiAgICAgICAgdTY0IGRlbGF5OwoKICAgICAgICBpZiAoZHV0eSA+IHRhcmdl
dCkKICAgICAgICAgICAgZGVsYXkgPSBzbG93X2Rvd25fcGVyaW9kOwogICAgICAgIGVsc2UgaWYg
KGR1dHkgPT0gdGFyZ2V0KQogICAgICAgICAgICBkZWxheSA9IG1pbihidW1wX3BlcmlvZCwgc2xv
d19kb3duX3BlcmlvZCkgOwoKTGFzdCBpZiBjYW4gbmV2ZXIgYmUgdHJ1ZSwgc28gY2FsbCB0byBt
aW4gY2FuIG5ldmVyIGV4ZWN1dGUuIFN1Z2dlc3QgY29kZSByZXdvcmsuCgpSZWdhcmRzCgpEYXZp
ZCBCaW5kZXJtYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
