From: Markus Elfring <Markus.Elfring-S0/GAf8tV78@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in
 gm20b_clk_new()
Date: Tue, 2 Jun 2020 13:10:34 +0200
Message-ID: <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <20200602102955.GZ30374@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200602102955.GZ30374@kadam>
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
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Kangjie Lu <kjlu-OJFnDUYgAso@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

PiBUaGUgb3JpZ2luYWwgcGF0Y2ggd2FzIGJhc2ljYWxseSBmaW5lLgoKSSBwcm9wb3NlIHRvIHJl
Y29uc2lkZXIgdGhlIGludGVycHJldGF0aW9uIG9mIHRoZSBzb2Z0d2FyZSBzaXR1YXRpb24gb25j
ZSBtb3JlLgoKKiBTaG91bGQgdGhlIGFsbG9jYXRlZCBjbG9jayBvYmplY3QgYmUga2VwdCB1c2Fi
bGUgZXZlbiBhZnRlcgogIGEgc3VjY2Vzc2Z1bCByZXR1cm4gZnJvbSB0aGlzIGZ1bmN0aW9uPwoK
KiBIb3cgbXVjaCBkbyDigJxkZXN0cnVjdG9y4oCdIGNhbGxzIG1hdHRlciBoZXJlIGZvciAoc3Vi
KWRldmljZXM/CgoKPiBKdXN0IGFkZCBhIEZpeGVzIHRhZyBhbmQgcmVzZW5kLgoKVGhpcyB0YWcg
Y2FuIGhlbHAgYWxzby4KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXUK
