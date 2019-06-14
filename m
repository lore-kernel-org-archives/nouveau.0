From: Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau: DRM: GPU lockup - switching to software fbcon
Date: Fri, 14 Jun 2019 11:49:57 +0900
Message-ID: <20190614024957.GA9645@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

NS4yLjAtcmM0LW5leHQtMjAxOTA2MTMKCmRtZXNnCgogbm91dmVhdSAwMDAwOjAxOjAwLjA6IERS
TTogR1BVIGxvY2t1cCAtIHN3aXRjaGluZyB0byBzb2Z0d2FyZSBmYmNvbgogbm91dmVhdSAwMDAw
OjAxOjAwLjA6IGZpZm86IFNDSEVEX0VSUk9SIDBhIFtDVFhTV19USU1FT1VUXQogbm91dmVhdSAw
MDAwOjAxOjAwLjA6IGZpZm86IHJ1bmxpc3QgMDogc2NoZWR1bGVkIGZvciByZWNvdmVyeQogbm91
dmVhdSAwMDAwOjAxOjAwLjA6IGZpZm86IGNoYW5uZWwgNToga2lsbGVkCiBub3V2ZWF1IDAwMDA6
MDE6MDAuMDogZmlmbzogZW5naW5lIDY6IHNjaGVkdWxlZCBmb3IgcmVjb3ZlcnkKIG5vdXZlYXUg
MDAwMDowMTowMC4wOiBmaWZvOiBlbmdpbmUgMDogc2NoZWR1bGVkIGZvciByZWNvdmVyeQogbm91
dmVhdSAwMDAwOjAxOjAwLjA6IGZpcmVmb3hbNDc2XTogY2hhbm5lbCA1IGtpbGxlZCEKIG5vdXZl
YXUgMDAwMDowMTowMC4wOiBmaXJlZm94WzQ3Nl06IGZhaWxlZCB0byBpZGxlIGNoYW5uZWwgNSBb
ZmlyZWZveFs0NzZdXQoKSXQgbG9ja3VwcyBzZXZlcmFsIHRpbWVzIGEgZGF5LiBUd2ljZSBpbiBq
dXN0IG9uZSBob3VyIHRvZGF5LgpDYW4gd2UgZml4IHRoaXM/CgoJLXNzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
