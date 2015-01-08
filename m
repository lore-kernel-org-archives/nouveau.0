From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/4] clk: allow non-blocking for
	nouveau_clock_astate()
Date: Thu, 8 Jan 2015 09:55:05 +0800
Message-ID: <54ADE379.1080501@nvidia.com>
References: <1419239500-19703-1-git-send-email-vinceh@nvidia.com>
 <54ACBFDC.4000603@nvidia.com> <54AD51F6.8090001@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <54AD51F6.8090001-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Ck9uIDAxLzA3LzIwMTUgMTE6MzQgUE0sIE1hcnRpbiBQZXJlcyB3cm90ZToKPiBPbiAwNy8wMS8x
NSAwNzoxMCwgVmluY2UgSHN1IHdyb3RlOgo+PiBIZWxsbyBCZW4gYW5kIE1hcnRpbiwKPj4KPj4g
QW55IGNvbW1lbnRzIGZvciB0aGlzIHNlcmllcz8KPj4KPj4gVGhhbmtzLAo+PiBWaW5jZQo+Cj4g
SGVsbG8gVmluY2UsCj4KPiBJIGhhdmUgbm90IHJlYWxseSBzZXR0bGVkIHlldCwgc28gSSBkb24n
dCB0aGluayBJIGhhdmUgdGhlIHRpbWUgdG8gCj4gcmV2aWV3IHlvdXIgcGF0Y2hlcyByaWdodCBu
b3cgYXMgSSBoYXZlIG1vcmUgdXJnZW50IHBlcnNvbm5hbCBwcmlvcml0aWVzLgo+Cj4gU29ycnks
IGhvcGUgdG8gYmUgYXZhaWxhYmxlIHNvb24hClRoYW5rcywgTWFydGluLiBJIGhvcGUgYWxsIGlz
IHdlbGwgd2l0aCB5b3VyIG5ldyBqb3VybmV5LiA6KQoKVmluY2UKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tClRoaXMgZW1haWwgbWVzc2FnZSBpcyBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBp
bnRlbmRlZCByZWNpcGllbnQocykgYW5kIG1heSBjb250YWluCmNvbmZpZGVudGlhbCBpbmZvcm1h
dGlvbi4gIEFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCB1c2UsIGRpc2Nsb3N1cmUgb3IgZGlzdHJp
YnV0aW9uCmlzIHByb2hpYml0ZWQuICBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGJ5CnJlcGx5IGVtYWlsIGFuZCBkZXN0cm95
IGFsbCBjb3BpZXMgb2YgdGhlIG9yaWdpbmFsIG1lc3NhZ2UuCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
