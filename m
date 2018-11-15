From: Sasha Levin <alexander.levin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Check rc from
 drm_dp_mst_topology_mgr_resume()
Date: Thu, 15 Nov 2018 18:05:33 +0000
Message-ID: <20181115180534.B57C3208E7@mail.kernel.org>
References: <20181115013954.587-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181115013954.587-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sasha Levin <alexander.levin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhIC1zdGFibGUgdGFnLgpUaGUgc3RhYmxlIHRh
ZyBpbmRpY2F0ZXMgdGhhdCBpdCdzIHJlbGV2YW50IGZvciB0aGUgZm9sbG93aW5nIHRyZWVzOiBh
bGwKClRoZSBib3QgaGFzIHRlc3RlZCB0aGUgZm9sbG93aW5nIHRyZWVzOiB2NC4xOS4yLCB2NC4x
OC4xOSwgdjQuMTQuODEsIHY0LjkuMTM3LCB2NC40LjE2MywgdjMuMTguMTI1LgoKdjQuMTkuMjog
QnVpbGQgT0shCnY0LjE4LjE5OiBCdWlsZCBPSyEKdjQuMTQuODE6IEZhaWxlZCB0byBhcHBseSEg
UG9zc2libGUgZGVwZW5kZW5jaWVzOgogICAgVW5hYmxlIHRvIGNhbGN1bGF0ZQoKdjQuOS4xMzc6
IEZhaWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5kZW5jaWVzOgogICAgZjQ3OWMwYmE0YTE3
ICgiZHJtL25vdXZlYXUva21zL252NTA6IGluaXRpYWwgc3VwcG9ydCBmb3IgRFAgMS4yIG11bHRp
LXN0cmVhbSIpCgp2NC40LjE2MzogRmFpbGVkIHRvIGFwcGx5ISBQb3NzaWJsZSBkZXBlbmRlbmNp
ZXM6CiAgICBmNDc5YzBiYTRhMTcgKCJkcm0vbm91dmVhdS9rbXMvbnY1MDogaW5pdGlhbCBzdXBw
b3J0IGZvciBEUCAxLjIgbXVsdGktc3RyZWFtIikKCnYzLjE4LjEyNTogRmFpbGVkIHRvIGFwcGx5
ISBQb3NzaWJsZSBkZXBlbmRlbmNpZXM6CiAgICBmNDc5YzBiYTRhMTcgKCJkcm0vbm91dmVhdS9r
bXMvbnY1MDogaW5pdGlhbCBzdXBwb3J0IGZvciBEUCAxLjIgbXVsdGktc3RyZWFtIikKCgotLQpU
aGFua3MsClNhc2hhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
